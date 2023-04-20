# Whisper Subs

Small bash script which uses the whisper.cpp project to generate subtitle (srt) file for a given video file.

## Installation

### Whisper

The script relies on [whisper.cpp](https://github.com/ggerganov/whisper.cpp), a high performance implementation of the OpenAI Whisper model.

To install whisper.cpp clone the whisper.cpp repository

```bash
# clone the project
git clone https://github.com/ggerganov/whisper.cpp.git
```
in the git project directory run

```bash
# build the project
make
```

### Model parameters (weights) 

https://huggingface.co/ggerganov/whisper.cpp

## Use

```bash
whisper_subs.sh -v /your/video/file.mp4 -l "en" -m /models/ggml-base.bin
```


