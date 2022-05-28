#!/bin/bash
clear

score1=0
score2=0
x=0;y=0

declare -A A
declare -A blue
for ((i=1; i<9; i++));do 
	for ((j=1; j<9; j++));do
		A[$i,$j]="\e[0;1m   \e[0m"
		blue[$i,$j]="0"
	done
done

makeUI(){ 
	echo -e "\n\n\n\n\n"
	echo "                             _  _____  _    __  ____  __			"
	echo "                            / \|_   _|/ \   \ \/ /\ \/ /			"
	echo "                           / _ \ | | / _ \   \  /  \  /			"
	echo "                          / ___ \| |/ ___ \  /  \  /  \			"
	echo "                         /_/   \_\ /_/   \_\/_/\_\/_/\_\			"
	echo -e "\n"
	echo -e "                         ___ ___ ___ ___ ___ ___ ___ ___  "
	echo -e "                        |   |   |   |   |   |   |   |   | "
	echo -e "                        |${A[1,1]}|${A[1,2]}|${A[1,3]}|${A[1,4]}|${A[1,5]}|${A[1,6]}|${A[1,7]}|${A[1,8]}| "
	echo -e "                        |___|___|___|___|___|___|___|___| "   
	echo -e "                        |   |   |   |   |   |   |   |   | "
	echo -e "                        |${A[2,1]}|${A[2,2]}|${A[2,3]}|${A[2,4]}|${A[2,5]}|${A[2,6]}|${A[2,7]}|${A[2,8]}| "
	echo -e "                        |___|___|___|___|___|___|___|___| "    
	echo -e "                        |   |   |   |   |   |   |   |   | "
	echo -e "                        |${A[3,1]}|${A[3,2]}|${A[3,3]}|${A[3,4]}|${A[3,5]}|${A[3,6]}|${A[3,7]}|${A[3,8]}| "
	echo -e "                        |___|___|___|___|___|___|___|___| "    
	echo -e "                        |   |   |   |   |   |   |   |   | "
	echo -e "                        |${A[4,1]}|${A[4,2]}|${A[4,3]}|${A[4,4]}|${A[4,5]}|${A[4,6]}|${A[4,7]}|${A[4,8]}| "
	echo -e "                        |___|___|___|___|___|___|___|___| "    
	echo -e "                        |   |   |   |   |   |   |   |   | "
	echo -e "                        |${A[5,1]}|${A[5,2]}|${A[5,3]}|${A[5,4]}|${A[5,5]}|${A[5,6]}|${A[5,7]}|${A[5,8]}| "
	echo -e "                        |___|___|___|___|___|___|___|___| "    
	echo -e "                        |   |   |   |   |   |   |   |   | "
	echo -e "                        |${A[6,1]}|${A[6,2]}|${A[6,3]}|${A[6,4]}|${A[6,5]}|${A[6,6]}|${A[6,7]}|${A[6,8]}| "
	echo -e "                        |___|___|___|___|___|___|___|___| "    
	echo -e "                        |   |   |   |   |   |   |   |   | "
	echo -e "                        |${A[7,1]}|${A[7,2]}|${A[7,3]}|${A[7,4]}|${A[7,5]}|${A[7,6]}|${A[7,7]}|${A[7,8]}| "
	echo -e "                        |___|___|___|___|___|___|___|___| "    
	echo -e "                        |   |   |   |   |   |   |   |   | "
	echo -e "                        |${A[8,1]}|${A[8,2]}|${A[8,3]}|${A[8,4]}|${A[8,5]}|${A[8,6]}|${A[8,7]}|${A[8,8]}| "
	echo -e "                        |___|___|___|___|___|___|___|___| \n\n"    
	echo -e "                         1P : $score1                  2P : $score2 "	
	echo -e "\n\n\n"
}

input_key(){
	read -s -n 1 INPUT
	if [ "$INPUT" = "" ];then
		read -s -n 1 a
		if [ "$a" = "[" ];then
			read -s -n 1 b
			INPUT="$INPUT$a$b"
		fi
	fi
	unset a;unset b;
}

while true;
do
	clear
	makeUI
	input_key
	if [ $x = "0" ];then 
		A[8,8]="\e[47;1m   \e[0m"
		x=8;y=8;
		continue
	fi 
	if [ $y = "1" ] && [ $INPUT = "[D" ];then 
		continue
	fi
	if [ $x = "1" ] && [ $INPUT = "[A" ];then 
		continue
	fi
	if [ $y = "8" ] && [ $INPUT = "[C" ];then 
		continue
	fi
	if [ $x = "8" ] && [ $INPUT = "[B" ];then 
		continue
	fi 
	if [ "$INPUT" = "[A" ];then 
		if [ "${blue[$x,$y]}" = "1" ];then 
			A[$x,$y]="\e[44;1m   \e[0m"
		else
			A[$x,$y]="\e[0;1m   \e[0m"
		fi
		x=`expr $x - 1`
		A[$x,$y]="\e[47;1m   \e[0m"
	elif [ "$INPUT" = "[B" ];then
		if [ "${blue[$x,$y]}" = "1" ];then 
			A[$x,$y]="\e[44;1m   \e[0m"
		else
			A[$x,$y]="\e[0;1m   \e[0m"
		fi
		x=`expr $x + 1`
		A[$x,$y]="\e[47;1m   \e[0m" 
	elif [ "$INPUT" = "[D" ];then
		if [ "${blue[$x,$y]}" = "1" ];then 
			A[$x,$y]="\e[44;1m   \e[0m"
		else
			A[$x,$y]="\e[0;1m   \e[0m"
		fi
		y=`expr $y - 1`
		A[$x,$y]="\e[47;1m   \e[0m" 
	elif [ "$INPUT" = "[C" ];then
		if [ "${blue[$x,$y]}" = "1" ];then 
			A[$x,$y]="\e[44;1m   \e[0m"
		else
			A[$x,$y]="\e[0;1m   \e[0m"
		fi
		y=`expr $y + 1`
		A[$x,$y]="\e[47;1m   \e[0m" 
	elif [ $INPUT = ""];then
		A[$x,$y]="\e[44;1m   \e[0m"
		if [ "${blue[$x,$y]}" = "1" ];then 
			continue
		else
			blue[$x,$y]=1 
			score1=`expr $score1 + 1`
		fi
	else
		continue
	fi
done
