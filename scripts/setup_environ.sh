#!/bin/bash
if [[ "$PWD" == *scripts ]]; then
   cd ..
fi
if [ -e ./ffmpeg-kit ]; then
   cd ffmpeg-kit
   git reset --hard
   git pull
else
   git clone --depth 1 https://github.com/arthenica/ffmpeg-kit
   cd ffmpeg-kit
fi
git apply --reject --whitespace=fix ../scripts/ffmpeg_enable_executable.diff