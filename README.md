# connect-downloader

## What does it do?

This small script downloads Adobe Connect meetings so you can watch them in other media players.

## But why?

Variable speed playback, that's why.

## Required software

- [wget](https://www.gnu.org/software/wget/)
- [unzip](http://www.info-zip.org/UnZip.html)
- [ffmpeg](https://www.ffmpeg.org/)

## Usage 

`$ ./connect-downloader.sh https://xxxxxx.adobeconnect.com/<YOUR MEETING ID>`

Notice the lack of slash at the end of the url. Wait a while and you will see a `<YOUR MEETING ID>.flv` file in the current directory. Watch your video with some [free software](https://www.videolan.org/vlc/).

## Other stuff

I know pretty much nothing about Adobe Connect. In my particular use case the audio files were in cameraVoip\*.flv and the video files were in screenshare\*.flv. You may need to investigate your zip and update the script if the video doesn't turn out correctly for you.
