#!/usr/bin/sh

# uncomment a line in the system config file
LOCALE_GEN_FILE="/etc/locale.gen"
LOCALE_LINE='en_US\.UTF-8 UTF-8'
sudo sed -i "s/#$LOCALE_LINE/$LOCALE_LINE/g" "$LOCALE_GEN_FILE"

locale_lines_found=$(cat "$LOCALE_GEN_FILE" | grep "$LOCALE_LINE" | wc -l)
echo "locale_lines_found = $locale_lines_found"

if [ $locale_lines_found -lt 1 ]; then
    echo "ERROR: failed to set locale in: $LOCALE_GEN_FILE"
    exit
fi
if [ $locale_lines_found -gt 1 ]; then
    echo "WARNING: \"$LOCALE_LINE\" found multiple times in \"$LOCALE_GEN_FILE\""
else
    echo "Successfully uncommented \"$LOCALE_LINE\" in \"$LOCALE_GEN_FILE\""
fi

# generate the locale
sudo locale-gen

# overwrite system locale
localectl set-locale LANG=en_US.UTF-8 && echo "Success!"
