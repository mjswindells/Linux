#!/bin/bash
clear
chmod 600 Profile.txt

JOIN="\e[44;1m   JOIN   \e[0m"
SIGN_IN="\e[44;1m  SIGN IN  \e[0m"
EXIT="\e[44;1m   EXIT   \e[0m"
SIGN_OUT="\e[44;1m  SIGN OUT \e[0m"
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
	echo -e "                   $JOIN              $SIGN_IN               "
	echo ""
	echo -e "                   $EXIT              $SIGN_OUT              "
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
		JOIN="\e[41;1m   JOIN   \e[0m";SELECTED=1
	else
		if [ $SELECTED = "1" ];then
			JOIN="\e[44;1m   JOIN   \e[0m"
			if [ "$INPUT" = "[A" ] || [ "$INPUT" = "[B" ];then
				EXIT="\e[41;1m   EXIT   \e[0m";SELECTED=3
			elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				SIGN_IN="\e[41;1m  SIGN IN  \e[0m";SELECTED=2
			elif [ $INPUT = ""];then
				clear
				chmod 755 JOIN.sh
				./JOIN.sh
				SELECTED=0
			else
				JOIN="\e[41;1m   JOIN   \e[0m"
			fi
		elif [ $SELECTED = "2" ];then
			SIGN_IN="\e[44;1m  SIGN IN  \e[0m"
			if [ "$INPUT" = "[A" ] || [ "$INPUT" = "[B" ];then
				SIGN_OUT="\e[41;1m  SIGN OUT \e[0m";SELECTED=4
			elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				JOIN="\e[41;1m   JOIN   \e[0m";SELECTED=1
			elif [ $INPUT = ""];then
				clear
				chmod 755 SIGN_IN.sh
				./SIGN_IN.sh
				SELECTED=0
			else
				SIGN_IN="\e[41;1m  SIGN IN  \e[0m"
			fi
		elif [ $SELECTED = "3" ];then
			EXIT="\e[44;1m   EXIT   \e[0m"
			if [ "$INPUT" = "[A" ] || [ "$INPUT" = "[B" ];then
				JOIN="\e[41;1m   JOIN   \e[0m";SELECTED=1
			elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				SIGN_OUT="\e[41;1m  SIGN OUT \e[0m";SELECTED=4
			elif [ $INPUT = ""];then
				break;
			else
				EXIT="\e[41;1m   EXIT   \e[0m"
			fi
		else
			SIGN_OUT="\e[44;1m  SIGN OUT \e[0m"
			if [ "$INPUT" = "[A" ] || [ "$INPUT" = "[B" ];then
				SIGN_IN="\e[41;1m  SIGN IN  \e[0m";SELECTED=2
			elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				EXIT="\e[41;1m   EXIT   \e[0m";SELECTED=3
			elif [ $INPUT = ""];then
				clear
				chmod 755 SIGN_OUT.sh
				./SIGN_OUT.sh
			else
				SIGN_OUT="\e[41;1m  SIGN OUT \e[0m"
			fi
		fi
	fi
	clear
done
