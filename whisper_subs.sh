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
    echo "Usage: $(basename $0) -v video file path -l language (e.g. 'en' or 'fr') -m model path"
fi

# strip the audio from a video file
ffmpeg -i $filename -ar 16000 -ac 1 -c:a pcm_s16le -y /tmp/tmp_whisper.wav

# convert to subtitles
whisper -m $model -osrt -l $language true -f /tmp/tmp_whisper.wav

# move subtitle file into output directory
mv /tmp/tmp_whisper.wav.srt ${filename}.${language}.srt

# remove temporary audio file
rm /tmp/tmp_whisper.wav
