from flask import Flask, request

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>video server is running</p>"

audio_dir = "/nas/safe/music/download/"
audio_download_filename = audio_dir + ".cd-download"
audio_history_filename = audio_dir + ".yt-dl-server-history"

video_dir = "/nas/safe/youtube/"
video_download_filename = video_dir + ".cd-download"
video_history_filename = video_dir + ".yt-dl-server-history"


def add_vid_to_download_list(video_url, filename):
    print("video received: " + video_url)
    print("adding video to list: " + filename)
    file = open(filename, 'a')
    file.write(video_url + '\n')
    file.close()


def is_vid_in_file(vid, filename):
    try:
        ListFile = open(filename, 'r')
    except:
        return False
    lines = ListFile.readlines()
    print(lines)
    for line in lines:
        if line.strip().find(vid) != -1:
            return True
    return False


def get_video_id_from_url(url):
    url_fragments = url.split("watch?v=")
    if (len(url_fragments) < 2):
        return None
    return url_fragments[1][0:11]


def add_vid_to_history(vid, filename):
    print("adding vid to history: " + filename)
    file = open(filename, 'a')
    file.write(vid + '\n')
    file.close()


@app.route("/add_audio", methods = ['POST'])
def add_audio():
    url = request.data.decode()
    vid = get_video_id_from_url(url)
    add_vid_to_download_list(vid, audio_download_filename)
    add_vid_to_history(vid, audio_history_filename)
    return "OK"


@app.route("/add_video", methods = ['POST'])
def add_video():
    url = request.data.decode()
    vid = get_video_id_from_url(url)
    add_vid_to_download_list(vid, video_download_filename)
    add_vid_to_history(vid, video_history_filename)
    return "OK"


@app.route("/check_audio", methods = ['POST'])
def check_audio():
    url = request.data.decode()
    print(url)
    vid = get_video_id_from_url(url)
    print(vid)
    if is_vid_in_file(vid, audio_download_filename):
        return "DOWNLOAD IN PROGRESS"
    if is_vid_in_file(vid, audio_history_filename):
        return "DOWNLOAD COMPLETE"
    # TODO parse if vid exists in filenames
    return "NO HISTORY"


@app.route("/check_video", methods = ['POST'])
def check_video():
    url = request.data.decode()
    vid = get_video_id_from_url(url)
    if is_vid_in_file(vid, video_download_filename):
        return "DOWNLOAD IN PROGRESS"
    if is_vid_in_file(vid, video_history_filename):
        return "DOWNLOAD COMPLETE"
    # TODO parse if vid exists in filenames
    return "NO HISTORY"

