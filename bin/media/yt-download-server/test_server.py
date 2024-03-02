#!/usr/bin/python

from server import *

import unittest

class TestServer(unittest.TestCase):
    def test_get_video_id_from_url_desktop(self):
        url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ&list=RDdQw4w9WgXcQ&start_radio=1"
        video_id = get_video_id_from_url(url)
        self.assertEqual("dQw4w9WgXcQ", video_id)
        self.assertEqual(11, len(video_id))

    def test_get_video_id_from_url_mobile(self):
        url = "https://m.youtube.com/watch?v=7OCPWCdg2ys"
        video_id = get_video_id_from_url(url)
        self.assertEqual("7OCPWCdg2ys", video_id)
        self.assertEqual(11, len(video_id))

    def test_get_video_id_from_url_homepage(self):
        url = "https://www.youtube.com/"
        video_id = get_video_id_from_url(url)
        self.assertEqual(None, video_id)


if __name__ == "__main__":
    unittest.main()
