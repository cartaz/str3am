#! /bin/bash
 
VBR="120k" # AQUI É A TAXA DE BITS, DE 128 A 4000 A QUALODADE MUDA E PODE SER PERSONALIZADO
FPS="15" # TAXA DE FPS QUE VOCE QUER NO VIDEO, RECOMENDO ABAIXO DE 25
QUAL="ultrafast"
 
TWITCH="rtmp://rio.contribute.live-video.net/app" # O SERVIDOR PODE SER MODIFICADO PARA OUTROS BR, VEJA A LISTA EM https://stream.twitch.tv/ingests/
KEY="SUA KEY DA LIVE AQUI"
 
VIDEO_SOURCE="video.mp4" # UTILIZE DESTA FORMA CASO VOCE ESTEJA DENTRO DA PASTA ONDE ESTA O VIDEO, OU DEFINA A LOCALIZACAO, EX: "/home/Desktop/video.mp4"
AUDIO_SOURCE="http://stream.zeno.fm/yuzyuq2d2c9uv" # PODE SER DEFINIDO UMA RADIO STREAM VIA LINK OU UM ARQUIVO DE AUDIO.MP3, siga o mesmo passo acima
 
ffmpeg -v quiet \
-re -f lavfi -i "movie=filename=$VIDEO_SOURCE:loop=0, setpts=N/(FRAME_RATE*TB)" \
-thread_queue_size 512 -i "$AUDIO_SOURCE" \
-map 0:v:0 -map 1:a:0 \
-map_metadata:g 1:g \
-vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
-acodec libmp3lame -ar 44100 -threads 6 -qscale:v 3 -b:a 320000 -bufsize 512k \
-f flv "$TWITCH/$KEY"
