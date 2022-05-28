#!/bin/bash

START="\e[44;1m  START  \e[0m"
EXIT="\e[44;1m   EXIT   \e[0m"
Y="\e[43;1m \e[0m"
MAP1="\e[44;1m  MAP 1  \e[0m"
MAP2="\e[44;1m  MAP 2  \e[0m"
SELECTED=0 
while read profile
do 
	id=`echo $profile | cut -d ':' -f 1`
	if [ "$id" = "$ID1P" ];then 
		W1=`echo $profile | cut -d ':' -f 3`
		L1=`echo $profile | cut -d ':' -f 4`
	fi
	if [ "$id" = "$ID2P" ];then 
		W2=`echo $profile | cut -d ':' -f 3`
		L2=`echo $profile | cut -d ':' -f 4`
	fi
done < Profile.txt

LOBBYUI(){ 
	echo -e "\n\n\n\n\n\n\n\n"
	echo "                             _  _____  _    __  ____  __			"
	echo "                            / \|_   _|/ \   \ \/ /\ \/ /			"
	echo "                           / _ \ | | / _ \   \  /  \  /			"
	echo "                          / ___ \| |/ ___ \  /  \  /  \			"
	echo "                         /_/   \_\ /_/   \_\/_/\_\/_/\_\			"
	echo "                           _     ___  ____  ______   __           "
	echo "                          | |   /   \| __ )| __ ) \ / /           "
	echo "                          | |  | | | |  _ \|  _ \\\ V /            "
	echo "                          | |__| |_| | |_) | |_) || |             "
	echo "                          |_____\___/|____/|____/ |_|             "
	echo "				    				        						"
	echo "                    _ ____                        ____  ____      "
	echo "                   / |  _ \                      |___ \|  _ \     "
	echo "                   | | |_) |                       __) | |_) |    "
	echo "                   | |  __/                       / __/|  __/     "
	echo "                   |_|_|                         |_____|_|        "
    echo ""          
	echo -e "                 ID : $ID1P                          ID : $ID2P "
	echo -e "                 WIN : $W1                           WIN : $W2 "
	echo -e "                 LOSE : $L1                          LOSE : $L2 "
	echo -e "\n\n"
	echo -e "                       $START       $EXIT                       "
	echo -e "\n\n"
}


MAPUI(){
	echo -e "\n\n\n\n\n\n\n\n"
	echo "                             _  _____  _    __  ____  __			"
	echo "                            / \|_   _|/ \   \ \/ /\ \/ /			"
	echo "                           / _ \ | | / _ \   \  /  \  /			"
	echo "                          / ___ \| |/ ___ \  /  \  /  \			"
	echo "                         /_/   \_\ /_/   \_\/_/\_\/_/\_\			"
	echo "             __  __    _    ____    ____  _____ _     _____ ____ _____"
	echo "            |  \/  |  / \  |  _ \  / ___|| ____| |   | ____/ ___|_   _|"
	echo "            | |\/| | / _ \ | |_) | \___ \|  _| | |   |  _|| |     | | "
	echo "            | |  | |/ ___ \|  __/   ___) | |___| |___| |__| |___  | | "
	echo "            |_|  |_/_/   \_\_|     |____/|_____|_____|_____\____| |_|"
	echo -e "\n\n\n"
	echo "              _ _ _ _ _ _ _ _               _ _ _ _ _ _ _ _  "
	echo -e "             |_|_|_|_|_|_|_|_|             |_|_|_|_|_|_|_|_| "
	echo -e "             |_|_|_|_|_|_|_|_|             |_|$Y|_|_|_|_|$Y|_| "
	echo -e "             |_|_|_|_|_|_|_|_|             |_|_|$Y|_|_|$Y|_|_| "
	echo -e "             |_|_|_|_|_|_|_|_|             |_|_|_|$Y|$Y|_|_|_| "
	echo -e "             |_|_|_|_|_|_|_|_|             |_|_|_|$Y|$Y|_|_|_| "
	echo -e "             |_|_|_|_|_|_|_|_|             |_|_|$Y|_|_|$Y|_|_| "
	echo -e "             |_|_|_|_|_|_|_|_|             |_|$Y|_|_|_|_|$Y|_| "
	echo "             |_|_|_|_|_|_|_|_|             |_|_|_|_|_|_|_|_| " 
	echo -e "\n                 $MAP1                      $MAP2 "
}

input_key(){
	read -s -n 1 INPUT
	if [ "$INPUT" = "" ];then
		read -s -n 1 a
		if [ "$a" = "[" ];then
			read -s -n 1 b
			INPUT="$INPUT$a$b";
		fi
	fi
	unset a;unset b;
}

LOBBY(){
	while true;
	do
		LOBBYUI
		input_key
		if [ $SELECTED = "0" ];then
			START="\e[41;1m  START  \e[0m";SELECTED=1
		elif [ $SELECTED = "1" ];then
			START="\e[44;1m  START  \e[0m"
			if [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				EXIT="\e[41;1m   EXIT   \e[0m" ;SELECTED=2
			elif [ "$INPUT" = "[A" ] || [ "$INPUT" = "[B" ];then
				START="\e[41;1m  START  \e[0m"
			elif [ $INPUT = ""];then 
				SELECTED=0;clear
				MS
				clear;break
			else
				START="\e[41;1m  START  \e[0m"
			fi
		else
			EXIT="\e[44;1m   EXIT   \e[0m"
			if [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				START="\e[41;1m  START  \e[0m" ;SELECTED=1
			elif [ "$INPUT" = "[A" ] || [ "$INPUT" = "[B" ];then
				EXIT="\e[41;1m   EXIT   \e[0m"
			elif [ $INPUT = ""];then
				clear;break
			else
				EXIT="\e[41;1m   EXIT   \e[0m"
			fi 
		fi
		clear
	done
}
MS(){ 
	while true;
	do
		MAPUI
		input_key
		if [ $SELECTED = "0" ];then
			MAP1="\e[41;1m  MAP 1  \e[0m" ;SELECTED=1
		elif [ $SELECTED = "1" ];then
			MAP1="\e[44;1m  MAP 1  \e[0m"
			if [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				MAP2="\e[41;1m  MAP 2  \e[0m" ;SELECTED=2
			elif [ "$INPUT" = "[A" ] || [ "$INPUT" = "[B" ];then
				MAP1="\e[41;1m  MAP 1  \e[0m"
			elif [ $INPUT = ""];then 
				clear
				chmod 755 MAP1.sh 
				./MAP1.sh
				clear;break
			else
				MAP1="\e[41;1m  MAP 1  \e[0m"
			fi
		else
			MAP2="\e[44;1m  MAP 2  \e[0m"
			if [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				MAP1="\e[41;1m  MAP 1  \e[0m" ;SELECTED=1
			elif [ "$INPUT" = "[A" ] || [ "$INPUT" = "[B" ];then
				MAP2="\e[41;1m  MAP 2  \e[0m"
			elif [ $INPUT = ""];then
				clear
				chmod 755 MAP2.sh 
				./MAP2.sh
				clear;break
			else
				MAP2="\e[41;1m  MAP 2  \e[0m"
			fi 
		fi
		clear
	done
}
LOBBY
