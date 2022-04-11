#!/bin/bash

while : 
do
	echo "-----------------------------------------"
	read -p "<<이름과 점수를 입력하세요>> : " name_score 
	echo "-----------------------------------------"
	if [ "$name_score" = "exit" ] || [ "$name_socre" = "EXIT" ] || [ "$name_score" = "Exit" ]
	then
		unset name_scor;unset name;unset score;unset grade
		echo -e "*** 프로그램을 종료합니다.\n"
		break
	fi

	name=$(echo $name_score | cut -d ' ' -f 1)
	score=$(echo $name_score | cut -d ' ' -f 2); declare -i score


	if [ "$score" -ge 90 ] && [ "$score" -le 100 ]
	then
		grade="A"
	elif [ "$score" -ge 80 ] && [ "$score" -lt 90 ]
	then
		grade="B"
	elif [ "$score" -ge 70 ] && [ "$score" -lt 80 ]
	then
		grade="C"
	elif [ "$score" -ge 60 ] && [ "$score" -lt 70 ]
	then
		grade="D"
	else
		grade="F"
	fi
	
	echo "*** 학생 $name은(는) $score점을 맞아 $grade학점을 취득하였습니다."
done


