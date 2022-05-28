#!/bin/bash

MyId="ID"
MyPw="PW"
ID="\e[44;1m        $MyId        \e[0m"
Duplicate_check="\e[44;1m Duplicate check \e[0m"
PW="\e[44;1m        $MyPw        \e[0m"
SIGN_IN="\e[44;1m  SIGN IN  \e[0m"
EXIT="\e[44;1m   EXIT   \e[0m"
SELECTED=0


makeUI(){ 
	echo -e "\n\n\n\n\n\n\n\n"
	echo "                          ____ ___ ____ _   _   ___ _   _     	"
	echo "                         / ___|_ _/ ___| \ | | |_ _| \ | | 		"
	echo "                         \___ \| | |  _|  \| |  | ||  \| |		"
	echo "                          ___) | | |_| | |\  |  | || |\  |		"
	echo "                         |____/___\____|_| \_| |___|_| \_|		"
	echo "				    				        						"
    echo "                                                                  "
	echo -e "                   $ID   $Duplicate_check  		            "
	echo ""
	echo -e "                   $PW 						                "
	echo ""
	echo -e "                         $SIGN_IN      $EXIT                   "
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
	makeUI
	input_key
	if [ $SELECTED = "0" ];then
		ID="\e[41;1m        $MyId        \e[0m";SELECTED=1
	else
		if [ $SELECTED = "1" ];then
			ID="\e[44;1m        $MyId        \e[0m"
			if [ "$INPUT" = "[A" ];then
				SIGN_IN="\e[41;1m  SIGN IN  \e[0m";SELECTED=4
			elif [ "$INPUT" = "[B" ];then
				PW="\e[41;1m        $MyPw        \e[0m";SELECTED=3
			elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				Duplicate_check="\e[41;1m Duplicate check \e[0m";SELECTED=2
			elif [ $INPUT = ""];then
				read -p "ID를 입력하시오 : " MyId
				ID="\e[44;1m        $MyId        \e[0m";SELECTED=1
			else
				ID="\e[41;1m        $MyId        \e[0m"
			fi
		elif [ $SELECTED = "2" ];then
			Duplicate_check="\e[44;1m Duplicate check \e[0m"
			if [ "$INPUT" = "[A" ] || [ "$INPUT" = "[B" ];then
				EXIT="\e[41;1m   EXIT   \e[0m";SELECTED=5
			elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				ID="\e[41;1m        $MyId        \e[0m";SELECTED=1
			elif [ "$INPUT" = "" ];then
				profile=`cat ./Profile.txt | grep -w "$MyId"`
				id=$(echo $profile | cut -d ' ' -f 1)
				cutId=1
				while [ "$id" != "" ]
				do 
					if [ "$id" = "$MyId" ];then
						break
					fi
					cutId=`expr $cutId + 4`
					id=$(echo $profile | cut -d ' ' -f $cutId)
				done
				if [ "$id" = "$MyId" ];then
					Duplicate_check="\e[44;1m 같은 ID 존재 \e[0m"
					clear
					makeUI
					read -s a
					Duplicate_check="\e[41;1m Duplicate check \e[0m"
				else
					Duplicate_check="\e[44;1m 회원 가입 가능 \e[0m"
					clear
					makeUI
					read -s a
					Duplicate_check="\e[41;1m Duplicate check \e[0m"
				fi
			else
				Duplicate_check="\e[41;1m Duplicate check \e[0m"
			fi
		elif [ $SELECTED = "3" ];then
			PW="\e[44;1m        $MyPw        \e[0m"
			if [ "$INPUT" = "[A" ];then
				ID="\e[41;1m        $MyId        \e[0m";SELECTED=1
			elif [ "$INPUT" = "[B" ];then
				SIGN_IN="\e[41;1m  SIGN IN  \e[0m";SELECTED=4 
			elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				Duplicate_check="\e[41;1m Duplicate check \e[0m";SELECTED=2
			elif [ $INPUT = ""];then
				read -p "PW를 입력하시오 : " MyPw
				PW="\e[44;1m        $MyPw        \e[0m";SELECTED=3
			else
				PW="\e[41;1m        $MyPw        \e[0m"
			fi
		elif [ $SELECTED = "4" ];then
			SIGN_IN="\e[44;1m  SIGN IN  \e[0m" 
			if [ "$INPUT" = "[A" ];then
				PW="\e[41;1m        $MyPw        \e[0m";SELECTED=3
			elif [ "$INPUT" = "[B" ];then
				ID="\e[41;1m        $MyId        \e[0m";SELECTED=1
			elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				EXIT="\e[41;1m   EXIT   \e[0m";SELECTED=5
			elif [ $INPUT = ""];then
				profile=`cat ./Profile.txt | grep -w "$MyId"`
				id=$(echo $profile | cut -d ' ' -f 1)
				cutId=1
				while [ "$id" != "" ]
				do 
					if [ "$id" = "$MyId" ];then
						break
					fi
					cutId=`expr $cutId + 4`
					id=$(echo $profile | cut -d ' ' -f $cutId)
				done
				if [ "$id" = "$MyId" ];then
					break
				else
					echo -e "$MyId\t\t$MyPw\t\t0\t\t0" >> Profile.txt
					break
				fi
			else
				SIGN_IN="\e[41;1m  SIGN IN  \e[0m" 
			fi
		else
			EXIT="\e[44;1m   EXIT   \e[0m"
			if [ "$INPUT" = "[A" ] || [ "$INPUT" = "[B" ];then
				Duplicate_check="\e[41;1m Duplicate check \e[0m";SELECTED=2
			elif [ "$INPUT" = "[C" ] || [ "$INPUT" = "[D" ];then
				SIGN_IN="\e[41;1m  SIGN IN  \e[0m";SELECTED=4
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
