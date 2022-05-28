#!/bin/bash
clear


MyId="ID"
MyPw="PW"
ID="\e[44;1m        $MyId        \e[0m"
PW="\e[44;1m        $MyPw        \e[0m"
LOGIN="\e[44;1m  LOGIN  \e[0m"
EXIT="\e[44;1m   EXIT   \e[0m"
SELECTED=0

UI2P(){ 
	echo -e "\n\n\n\n\n\n\n\n"
	echo "                      ____  ____    _     ___   ____ ___ _   _		"
	echo "                     |___ \|  _ \  | |   / _ \ / ___|_ _| \ | |		"
	echo "                       __) | |_) | | |  | | | | |  _ | ||  \| |		"
	echo "                      / __/|  __/  | |__| |_| | |_| || || |\  |		"
	echo "                     |_____|_|     |_____\___/ \____|___|_| \_|		"
	echo "				    				        							"
	echo "                                                                 	    "
	echo -e "                                   $ID      		           	    "
	echo ""
	echo -e "                                   $PW      		                "
	echo -e "\n"
	echo -e "                                 $LOGIN  $EXIT                     "
	echo -e "\n\n\n\n"
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

while true;
do
	UI2P 
	input_key
	if [ $SELECTED = "0" ];then
		ID="\e[41;1m        $MyId        \e[0m";SELECTED=1
	else
		if [ $SELECTED = "1" ];then
			ID="\e[44;1m        $MyId        \e[0m"
			if [ "$INPUT" = "[A" ];then
				LOGIN="\e[41;1m  LOGIN  \e[0m";SELECTED=3
			elif [ "$INPUT" = "[B" ];then
				PW="\e[41;1m        $MyPw        \e[0m";SELECTED=2
			elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				ID="\e[41;1m        $MyId        \e[0m";SELECTED=1
			elif [ $INPUT = ""];then
				read -p "ID를 입력하시오 : " MyId
				ID="\e[44;1m        $MyId        \e[0m";SELECTED=1
			else
				ID="\e[41;1m        $MyId        \e[0m"
			fi
		elif [ $SELECTED = "2" ];then
			PW="\e[44;1m        $MyPw        \e[0m"
			if [ "$INPUT" = "[A" ];then
				ID="\e[41;1m        $MyId        \e[0m";SELECTED=1
			elif [ "$INPUT" = "[B" ];then
				LOGIN="\e[41;1m  LOGIN  \e[0m";SELECTED=3
			elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				PW="\e[41;1m        $MyId        \e[0m";SELECTED=2
			elif [ $INPUT = ""];then
				read -p "PW를 입력하시오 : " MyPw
				PW="\e[44;1m        $MyPw        \e[0m";SELECTED=2
			else
				PW="\e[41;1m        $MyPw        \e[0m"
			fi
		elif [ $SELECTED = "3" ];then
			LOGIN="\e[44;1m  LOGIN  \e[0m"
			if [ "$INPUT" = "[A" ];then
				PW="\e[41;1m        $MyPw        \e[0m";SELECTED=2
			elif [ "$INPUT" = "[B" ];then
				ID="\e[41;1m        $MyId        \e[0m";SELECTED=1
			elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				EXIT="\e[41;1m   EXIT   \e[0m";SELECTED=4
			elif [ $INPUT = ""];then
				while read profile
				do 
					id=`echo $profile | cut -d ':' -f 1`
					pw=`echo $profile | cut -d ':' -f 2` 
					if [ "$id" = "$MyId" ];then
						break
					fi
				done < Profile.txt
				if [ "$id" = "$MyId" ] && [ "$pw" = "$MyPw" ];then
					if [ "$id" != "$ID1P" ];then 
						ID2P=$id 
					else
						ID2P="ID중복"
					fi
				else
					ID2P="로그인실패"
				fi
				clear; break
			else
				LOGIN="\e[41;1m  LOGIN  \e[0m"
			fi
		else
			EXIT="\e[44;1m   EXIT   \e[0m"
			if [ "$INPUT" = "[A" ];then
				PW="\e[41;1m        $MyPw        \e[0m";SELECTED=2
			elif [ "$INPUT" = "[B" ];then
				ID="\e[41;1m        $MyId        \e[0m";SELECTED=1
			elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				LOGIN="\e[41;1m  LOGIN  \e[0m";SELECTED=3
			elif [ $INPUT = ""];then
				clear
				break
			else
				EXIT="\e[41;1m   EXIT   \e[0m"
			fi
		fi
	fi
	clear
done
