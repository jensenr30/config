// ==UserScript==
// @name         YouTube download buttons
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  add download buttons to YouTube
// @author       Ryan Jensen & Josh Pohl
// @match        https://*.youtube.com/*
// @icon         data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==
// @grant        GM_xmlhttpRequest
// @connect      *
// @noframes
// ==/UserScript==


(function () {
    'use strict';
    var mobile = false;
    if(window.location.href[8] == 'm') {
        mobile = true;
        console.log("running on mobile website");
    } else {
        console.log("running on desktop website");
    }


    let checkAudioCallback = false;
    let checkVideoCallback = false;

    var createAudioButton = (element) => {
        var button = document.createElement('button');
        button.id = 'audio';
        button.innerText = 'audio';
        colorButtonServerDown(button);
        button.onclick = () => {
            GM_xmlhttpRequest({
                url: "http://server:8080/add_audio",
                method: "POST",
                data: window.location.href,
                onload: () => {
                    console.log("sent request to server to download audio");
                    colorButtonServerResponded(button);
                    checkAudioCallback = setInterval(checkIfServerDownloadedAudio, 1500);
                },
                onerror: (err) => {
                    console.log("ERROR: Download Buttons failed to send audio to server", err);
                    colorButtonError(button);
                },
            });
        };
        console.log("audio download button created")
        return button;
    }


    var createVideoButton = (element) => {
        var button = document.createElement('button');
        button.id = 'video';
        button.innerText = 'video';
        colorButtonServerDown(button);
        button.onclick = () => {
            GM_xmlhttpRequest({
                url: "http://server:8080/add_video",
                method: "POST",
                data: window.location.href,
                onload: () => {
                    console.log("sent request to server to download video");
                    colorButtonServerResponded(button);
                    checkVideoCallback = setInterval(checkIfServerDownloadedVideo, 1500);
                },
                onerror: (err) => {
                    console.log("ERROR: Download Buttons failed to request server download audio", err);
                    colorButtonError(button);
                },
            });
        };
        console.log("video download button created")
        return button;
    }


    var checkIfServerDownloadComplete = (button, interval) => {
        if(!button) {
            if(!interval) {
                clearInterval(interval);
            }
        }
        console.log("download buttons checking if server downloaded " + button.id);
        GM_xmlhttpRequest({
            url: "http://server:8080/check_" + button.id,
            method: "POST",
            data: window.location.href,
            onload: (resp) => {
                let response = resp.response;
                console.log("Server response:" + response);
                if(response == "DOWNLOAD COMPLETE") {
                    colorButtonSuccess(button);
                    if(interval) {
                        clearInterval(interval);
                    }
                } else if(response == "DOWNLOAD IN PROGRESS") {
                    colorButtonDownloadInProgress(button);
                } else if(response == "NO HISTORY") {
                    colorButtonServerAvailable(button);
                } else {
                    console.log("ERROR: unexpected response from server");
                    colorButtonError(button);
                }
            },
            onerror: (err) => {
                colorButtonServerDown(button);
                console.log("ERROR: server connection error");
                console.log(err);
            },
        });
    }

    var setButtonStyle = (button, background, text) => {
        button.style.marginLeft = '10px';
        button.style.background = background;
        button.style.color = text;
        button.style.borderRadius = "10px";
    }

    var colorButtonServerDown = (button) => {
        setButtonStyle(button, '#080808', '#222222');
    }

    var colorButtonServerAvailable = (button) => {
        setButtonStyle(button, '#151515', '#aaaaaa');
    }

    var colorButtonServerResponded = (button) => {
        setButtonStyle(button, 'yellow', 'black');
    }

    var colorButtonDownloadInProgress = (button) => {
        setButtonStyle(button, 'orange', 'black');
    }

    var colorButtonSuccess = (button) => {
        if(button.id == 'video') {
            setButtonStyle(button, 'blue', 'white');
        } else {
            setButtonStyle(button, 'green', 'white');
        }
    }

    var colorButtonError = (button) => {
        setButtonStyle(button, 'red', 'black');
    }


    var checkIfServerDownloadedAudio = () => {
        checkIfServerDownloadComplete(audioButton, checkAudioCallback);
    }
    var checkIfServerDownloadedVideo = () => {
        checkIfServerDownloadComplete(videoButton, checkVideoCallback);
    }


    var getVideoTitleContainerMobile = () => {
        let headings = document.querySelectorAll("h2");
        for(let i = 0; i < headings.length; i++) {
            if(headings[i].classList.contains('slim-video-information-title') && headings[i].classList.contains('slim-video-metadata-title-modern')) {
                console.log("h2 find!");
                return headings[i];
            }
        }
        return false;
    }

    var getVideoTitleContainerDesktop = () => {
        let headings = document.querySelectorAll("h1");
        for(let i = 0; i < headings.length; i++) {
            if(headings[i].classList.contains('style-scope') && headings[i].classList.contains('ytd-watch-metadata')) {
                console.log("h1 find!");
                return headings[i];
            }
        }
        return false;
    }

    var getVideoTitleContainer = () => {
        let titleElement = false;
        if (mobile) {
            titleElement = getVideoTitleContainerMobile();
        } else {
            titleElement = getVideoTitleContainerDesktop();
        }
        if (!titleElement) {
            console.log("Couldn't find titleElement");
        }
        return titleElement;
    }


    var buttonExists = (id) => {
        if(document.getElementById(id)) {
            return true;
        } else {
            return false;
        }
    }

    var audioButton;
    var videoButton;
    var createButtons = (title) => {
        console.log("create download buttons...")
        audioButton = document.getElementById('audio')
        videoButton = document.getElementById('video')
        if(audioButton) audioButton.remove();
        if(videoButton) videoButton.remove();

        audioButton = createAudioButton();
        title.append(audioButton);
        videoButton = createVideoButton();
        title.append(videoButton);

        checkIfServerDownloadedAudio();
        checkIfServerDownloadedVideo();
    }


    let oldURL = window.location.href;
    var URL_changed = () => {
        let newURL = window.location.href;
        if (oldURL === newURL) {
            oldURL = newURL;
            return false;
        } else {
            oldURL = newURL;
            return true;
        }
    }


    var update = () => {
        if(!buttonExists('audio') || !buttonExists('video') || URL_changed()) {
            let titleElement = getVideoTitleContainer();
            if (titleElement){
                createButtons(titleElement);
            }
        }
    }

    setInterval(update, 500);
})();
