#!/bin/bash
#Criado em: 02/12/2021
#by: https://t.me/OliveiraWS < OLIVEIRAE or LOVECRAFT

clear
echo -e "\e[1;33m+----------------------------------+"
echo -e "\e[1;33m+    FFMPEG TOOL FOR STREAMERS     +"
echo -e "\e[1;33m+          BY LOVECRAFT            +"
echo -e "\e[1;33m+----------------------------------+"
echo ""
echo -e "\e[1;34mSUGESTION OF SERVERS FOR THE LIVE:"
echo -e "\e[0;35mTWITCH: \e[1;36m rtmp://live-fra.twitch.tv/app"
echo -e "\e[1;31mYOUTUBE: \e[1;36m rtmp://a.rtmp.youtube.com/live2"
echo -e "\e[1;34mFACEBOOK: \e[1;36m rtmps://live-api-s.facebook.com:443/rtmp"
echo ""
echo -ne "\e[1;32mPASTE THE SERVER OF LIVE: ";
read SERVER
echo ""
echo -ne "\e[1;32mPASTE THE KEY STREAM: ";
read KEY
echo ""
echo -ne "\e[1;32mDIRACTORY OF THE VIDEO OR NAME FILE: ";
read VIDEO
echo ""
echo -e "\e[1;33mSugestion of audio lofi stream: \e[1;36mhttp://stream.zeno.fm/yuzyuq2d2c9uv"
echo -e "\e[1;32m"
echo -ne "DIRACTORY OF THE AUDIO, LINK OR NAME FILE: ";
read AUDIO
echo ""
clear
echo -e "\e[1;32mSTREAM STARTING"
sleep 2
clear
echo -e "\e[1;36mSTREAM STARTED, GO CHECK THE TRANSMISSION"
ffmpeg -v quiet -stream_loop -1 -re -i $VIDEO -stream_loop -1 -re -i $AUDIO -vcodec libx264 -pix_fmt yuvj420p -maxrate 4000k -preset ultrafast -r 12 -framerate 15 -g 50 -c:a aac -b:a 320000 -ar 44100 -strict experimental -video_track_timescale 1000 -b:v 4000k -f flv  $SERVER/$KEY
read foo
;;

