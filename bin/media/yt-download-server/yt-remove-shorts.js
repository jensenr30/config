// ==UserScript==
// @name         Remove YouTube Shorts
// @namespace    https://github.com/hallzy
// @version      0.4
// @description  Removes YouTube Shorts Videos from your current page.
// @author       Steven Hall, Josh Pohl, Ryan Jensen
// @match        http://*.youtube.com/*
// @match        https://*.youtube.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=youtube.com
// @grant        none
// ==/UserScript==
(
    () => {
        const removeShorts = () => {
            let shorts = document.querySelectorAll('[is-shorts]');
            if (shorts.length > 0) {
                shorts[0].parentElement.remove();
                clearInterval(myInterval);
            }
        }

        let myInterval = setInterval(removeShorts, 1000);
    }
)();