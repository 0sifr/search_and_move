#! /bin/bash
#where there is a mass of mp3s:
#	1. searches the files for artist name "$a_name",
#	2. moves all files containing $a_name and puts it in one folder.

echo ">>>>>>> enter artists' name"
read a_name
echo ">>>>>>> searching for tracks containing word(s): $a_name"
grep -ril "$a_name" > /tmp/$a_name.m3u
#mkdir $a_name/		#rsync makes the directory anyway
echo ">>>>>>> moving tracks containing words(s) $a_name to ./$a_name/ "
rsync -avru --dry-run --remove-source-files --files-from=/tmp/$a_name.m3u . $a_name/
#================================================================================================

#dependencies: libid3-tools
find . -name "*.mp3" -exec id3info {} \; | grep TPE1
#tail --bytes -17

