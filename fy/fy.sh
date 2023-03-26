#!/bin/bash
if [ -n "$1" ]
then 
	info=$1
	php /usr/local/Terminal-small-tools/fy/fy.php "$info"
else
	echo -e "\033[32m[提示]\033[0m \033[34m命令格式：\033[0m fyy 要翻译的内容"
fi
