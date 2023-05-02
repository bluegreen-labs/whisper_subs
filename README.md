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

# rename main to whisper
# and copy to local bin folder
cp main /home/xy/bin/whisper
```
Make sure that the `home/xy/bin` or any other destination folder is searched for executables. 

Alternatively, copy the pre-compiled executable `whisper`, and the script, in this project into the destination folder. The binary is compiled on Ubuntu/Pop OS 22.04.

```bash
mv whisper* /home/xy/bin/
```

To check the validity of the binary shasum values are provided:

```bash
shasum whisper
2fc3f7b877ebc4c5eccbac4fc58d3c42112aac1d  whisper
```
Make the binary executable.

```bash
# make the binary executable
chmod +x /home/xy/bin/whisper
```

### Model parameters (weights) 

For the model to run you need the model parameters or weights. These can be donwloaded from the [Huggin Face Whisper.cpp project](https://huggingface.co/ggerganov/whisper.cpp/tree/main). Check the [checksum values](https://huggingface.co/ggerganov/whisper.cpp) using `shasum` and put these weights into a properly named directory. You will need the location/path of these weights when executing the script.

Download the base model (gglm-base.bin) which gives fair performance, while the medium model (gglm-medium.bin) might perform better in certain circumstances and or languages.

### Whisper Subs

To install the Whisper Subs script clone, or copy the shell script in this repository.

## Use

The use case is aimed at running the routine on a batch of files in a particular directory. To run the script, move into the desired directory and call the script, where:

- -v specifies the video file as regular expression wildcard, quoted (e.g. "*.mp4" will process all mp4 files)
- -l specifies the language, quoted (e.g. "en" for English, "fr" for French)
- -m specifies the model to use as a path to a model file 

```bash
# move into your video directory
cd /home/xyz/Videos

# start subtitle routine
whisper_subs.sh -v "prefix_*.mp4" -l "en" -m /models/ggml-base.bin
```

The resulting `srt` files will be for the format `{*.mp4}.{language}.srt`

### Burning subtitles

The `srt` files can be used as subtitles in most modern video players. However, if you need hard coded subtitles you can burn in these `srt` subtitle files into a video file using the following `ffmpeg` command:

```bash
ffmpeg -i movie.mp4 -vf subtitles=subtitles.srt -c:a copy output_file.m4v
```


