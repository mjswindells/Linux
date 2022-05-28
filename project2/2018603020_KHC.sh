#!/bin/bash
clear
chmod 600 Profile.txt

export ID1P="1P LOGIN"
export ID2P="2P LOGIN"
JOIN="\e[44;1m   JOIN   \e[0m"
SIGN_IN="\e[44;1m  SIGN IN  \e[0m"
EXIT="\e[44;1m   EXIT   \e[0m"
SIGN_OUT="\e[44;1m  SIGN OUT \e[0m"
LOG1P="\e[44;1m  $ID1P  \e[0m"
LOG2P="\e[44;1m  $ID2P  \e[0m"
SELECTED=0


makeUI(){ 
	echo -e "\n\n\n\n\n\n\n\n"
	echo "                          ____   ___  ____ ___ _       _     		"
	echo "                         / ___| / _ \/ ___|_ _| |     / |			"
	echo "                         \___ \| | | \___ \| || |     | |			"
	echo "                          ___) | |_| |___) | || |___  | |			"
	echo "                         |____/ \___/|____/___|_____| |_|			"
	echo "                             _  _____  _    __  ____  __			"
	echo "                            / \|_   _|/ \   \ \/ /\ \/ /			"
	echo "                           / _ \ | | / _ \   \  /  \  /			"
	echo "                          / ___ \| |/ ___ \  /  \  /  \			"
	echo "                         /_/   \_\ /_/   \_\/_/\_\/_/\_\			"
	echo "				            										"
	echo "                                            2018603020 KHC		"
	echo "				    				        						"
    echo "                                                                  "
	echo -e "                   $LOG1P              $SIGN_IN                 "
	echo ""
	echo -e "                   $LOG2P              $SIGN_OUT                "
	echo ""
	echo -e "                       $JOIN       $EXIT                       "
	echo -e "\n\n"
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
	makeUI
	input_key
	if [ $SELECTED = "0" ];then
		LOG1P="\e[41;1m  $ID1P  \e[0m" ;SELECTED=1
	elif [ $SELECTED = "1" ];then
		LOG1P="\e[44;1m  $ID1P  \e[0m" 
		if [ "$INPUT" = "[A" ] ;then
			JOIN="\e[41;1m   JOIN   \e[0m"; SELECTED=5
		elif [ "$INPUT" = "[B" ] ;then 
			LOG2P="\e[41;1m  $ID2P  \e[0m"; SELECTED=3
		elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
			SIGN_IN="\e[41;1m  SIGN IN  \e[0m";SELECTED=2
		elif [ $INPUT = ""];then
			clear
			chmod 755 LOG1P.sh
			source ./LOG1P.sh
			LOG1P="\e[44;1m  $ID1P  \e[0m" ;SELECTED=1
		else
			LOG1P="\e[41;1m  $ID1P  \e[0m" 
		fi
	elif [ $SELECTED = "2" ];then
		SIGN_IN="\e[44;1m  SIGN IN  \e[0m"
		if [ "$INPUT" = "[A" ];then 
			EXIT="\e[41;1m   EXIT   \e[0m";SELECTED=6
		elif [ "$INPUT" = "[B" ];then
			SIGN_OUT="\e[41;1m  SIGN OUT \e[0m";SELECTED=4
		elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
			LOG1P="\e[41;1m  $ID1P  \e[0m" ;SELECTED=1
		elif [ $INPUT = ""];then
			clear
			chmod 755 SIGN_IN.sh
			./SIGN_IN.sh
			SELECTED=0
		else
			SIGN_IN="\e[41;1m  SIGN IN  \e[0m"
		fi
	elif [ $SELECTED = "3" ];then
		LOG2P="\e[44;1m  $ID2P  \e[0m"
		if [ "$INPUT" = "[A" ] ;then
			LOG1P="\e[41;1m  $ID1P  \e[0m" ;SELECTED=1
		elif [ "$INPUT" = "[B" ];then
			JOIN="\e[41;1m   JOIN   \e[0m"; SELECTED=5 
		elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
			SIGN_OUT="\e[41;1m  SIGN OUT \e[0m";SELECTED=4
		elif [ $INPUT = ""];then
			chmod 755 LOG2P.sh
			source ./LOG2P.sh
			LOG2P="\e[44;1m  $ID2P  \e[0m"; SELECTED=3
		else
			LOG2P="\e[41;1m  $ID2P  \e[0m"
		fi
	elif [ $SELECTED = "4" ];then
		SIGN_OUT="\e[44;1m  SIGN OUT \e[0m"
		if [ "$INPUT" = "[A" ];then
			SIGN_IN="\e[41;1m  SIGN IN  \e[0m";SELECTED=2
		elif [ "$INPUT" = "[B" ];then
			EXIT="\e[41;1m   EXIT   \e[0m";SELECTED=6 
		elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
			LOG2P="\e[41;1m  $ID2P  \e[0m"; SELECTED=3
		elif [ $INPUT = ""];then
			clear
			chmod 755 SIGN_OUT.sh
			./SIGN_OUT.sh
		else
			SIGN_OUT="\e[41;1m  SIGN OUT \e[0m"
		fi
	elif [ $SELECTED = "5" ];then
		JOIN="\e[44;1m   JOIN   \e[0m"
		if [ "$INPUT" = "[A" ];then 
			LOG2P="\e[41;1m  $ID2P  \e[0m"; SELECTED=3
		elif [ "$INPUT" = "[B" ];then
			LOG1P="\e[41;1m  $ID1P  \e[0m" ;SELECTED=1 
		elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
			EXIT="\e[41;1m   EXIT   \e[0m";SELECTED=6 
		elif [ $INPUT = ""];then
			if [ "$ID1P" != "1P LOGIN" ] && [ "$ID2P" != "2P LOGIN" ];then
				if [ "$ID1P" != "로그인실패" ] && [ "$ID2P" != "로그인실패" ];then
					if [ "$ID2P" != "ID중복" ];then 
						clear
						chmod 755 JOIN.sh
						source ./JOIN.sh
						SELECTED=0
					else
						break
					fi
				else
					break
				fi 
			else
				break
			fi
		else
			JOIN="\e[41;1m   JOIN   \e[0m"
		fi
	elif [ $SELECTED = "6" ];then
		EXIT="\e[44;1m   EXIT   \e[0m"
		if [ "$INPUT" = "[A" ];then
			SIGN_OUT="\e[41;1m  SIGN OUT \e[0m";SELECTED=4 
		elif [ "$INPUT" = "[B" ];then
			SIGN_IN="\e[41;1m  SIGN IN  \e[0m";SELECTED=2
		elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
			JOIN="\e[41;1m   JOIN   \e[0m"; SELECTED=5 
		elif [ $INPUT = ""];then
			break
		else
			EXIT="\e[41;1m   EXIT   \e[0m"
		fi 
	fi
	clear
done
