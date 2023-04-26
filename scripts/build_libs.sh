#!/bin/bash
if [ -z $ANDROID_SDK_ROOT ]; then
    echo "ANDROID_SDK_ROOT not set"
    exit 1
fi
if [ -z $ANDROID_NDK_ROOT ]; then
    echo "ANDROID_NDK_ROOT not set"
    exit 1
fi
if [[ "$PWD" == *scripts ]]; then
   cd ..
fi
if [ ! -e ./ffmpeg-kit ]; then
  echo "No ffmpeg-kit. Did you run setup_environ.sh first?"
  exit 1
fi
cd ffmpeg-kit
./android.sh --api-level=21 --enable-gpl --enable-shine --enable-x264 --enable-x265 --enable-libtheora --enable-opus --enable-libvorbis --enable-twolame
function copy_libs {
   if [ -e ../app/libs/lib/$1/ ]; then
      rm -r ../app/libs/lib/$1/*
   else
      mkdir ../app/libs/lib/$1/
   fi
   cp -t ../app/libs/lib/$1/ prebuilt/$2/ffmpeg/bin/* prebuilt/$2/ffmpeg/lib/*
   cp android/libs/$1/libc++_shared.so ../app/libs/lib/$1/
}

if [ ! -e ../app/libs ]; then
      mkdir ../app/libs
fi

if [ ! -e ../app/libs/lib ]; then
      mkdir ../app/libs/lib
fi

copy_libs armeabi-v7a android-arm-neon
copy_libs arm64-v8a android-arm64
copy_libs x86 android-x86
copy_libs x86_64 android-x86_64
cd ../app/libs/
rm libraries.jar
zip -r ./libraries.jar lib/

