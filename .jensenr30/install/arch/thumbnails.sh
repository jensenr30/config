#!/usr/bin/bash

echo "Unfortunately thunar doesn't render audio files out of the box.  Lets fix that!"
echo "Courtesy of anon89812132"
echo "https://forum.manjaro.org/t/thunar-wont-display-thumbnails-of-audio-files/84234/4"

file='audiocovers.thumbnailer'
target='/usr/share/thumbnailers'
sudo cp "thumbnailers/$file" "$target/$file"

ls -la "$target"
bat "$target/$file"

service='tumblerd'
echo "Killing thumbnailer service $service..."

killall -9 "$service"

echo "You now have to restart $service."
echo "If you are using tumblerd, you can restart it by closing all thunar instances and start it up again"
