#!/bin/bash
#Criado em: 02/12/2021
#by: https://t.me/OliveiraWS

clear
echo -e "\e[1;33m"
echo "+----------------------------------+"
echo -e "+ HTTP REQUEST FOR 24/7 HEROKU APP +"
echo -e "\e[1;33m+----------------------------------+"
echo ""
echo -e "\e[1;31m"
echo PASTE THE LINK IN FORMAT: "AppName.herokuapp.com";
echo ""
echo -e "\e[1;32m"
echo -ne "HEROKU APP LINK: ";
read APP
echo ""
echo -e "\e[1;32m"
echo -ne "SECONDS FOR REQUEST: ";
read SECONDS
echo ""
while true; do curl -m 2 $APP.; sleep $SECONDS; sleep 1; clear; echo Loop Request; sleep 1; clear; done
read foo
;;
