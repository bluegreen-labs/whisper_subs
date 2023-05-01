#!/bin/bash

while getopts 'v:l:m:' OPTION; do
  case "$OPTION" in 
    l)
      language="$OPTARG" 
      ;;

    v)
      filename="$OPTARG"
      ;;

    m)
      model="$OPTARG"
      ;;

    ?) 
      echo "Usage: $(basename $0) -v video file path -l language (e.g. 'en' or 'fr')"
      exit 1
      ;;
  esac
done

# trap no parameters provided
if [[ ! -n $1 ]];
then 
 echo "Usage: $(basename $0) -v video format (*.mp4) -l language (e.g. 'en' or 'fr') -m model path"
fi

files=`ls $filename`


# trap no parameters provided
if [[ ! -n $files ]];
then
 echo "No $filename files found"
fi

for file in $files; do

 echo "#################################"
 echo "Processing: $file"
 echo "in language: $language"
 echo "#################################"

 # strip the audio from a video file
 ffmpeg -i $file -ar 16000 -ac 1 -c:a pcm_s16le -y /tmp/tmp_whisper.wav > /dev/null 2>&1

 # convert to subtitles
 whisper -m $model -osrt -l $language true -f /tmp/tmp_whisper.wav > /dev/null 2>&1

 # move subtitle file into output directory
 mv /tmp/tmp_whisper.wav.srt ${file}.${language}.srt

 # remove temporary audio file
 rm /tmp/tmp_whisper.wav

done
