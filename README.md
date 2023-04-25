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

### Model parameters (weights) 

For the model to run you need the model parameters or weights. These can be donwloaded from the [Huggin Face Whisper.cpp project](https://huggingface.co/ggerganov/whisper.cpp/tree/main). Check the [checksum values](https://huggingface.co/ggerganov/whisper.cpp) using `shasum` and put these weights into a properly named directory. You will need the location/path of these weights when executing the script.

Download the base model (gglm-base.bin) which gives fair performance, while the medium model (gglm-medium.bin) might perform better in certain circumstances and or languages.

### Whisper Subs

To install the Whisper Subs script clone, or copy the shell script in this repository.

## Use

```bash
whisper_subs.sh -v /home/xy/Downloads/file.mp4 -l "en" -m /models/ggml-base.bin
```


