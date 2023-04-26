# FFmpegPlugin
FFmpeg Plugin for PojavLauncher
## how to build
builds only on linux because i dont like windows
```
# You must export ANDROID_SDK_ROOT and ANDROID_NDK_ROOT first
# Also you need to install build-essential and nasm. If you encounter errors during building check build.log in the ffmpeg-kit directory and install the necessary packages
./scripts/setup_environ.sh
./scripts/build_libs.sh
./gradlew assemble
```
