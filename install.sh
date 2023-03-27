#! /bin/bash

 




path=$(pwd)
echo -e "\033[32m[安装提示]\033[0m 当前路径：$path"
echo -e "\033[32m[安装提示]\033[0m 由于是拷贝文件夹可能需要输入密码"
sudo rm -rf /usr/local/Terminal-small-tools
cd ..
sudo cp -r Terminal-small-tools /usr/local/
echo -e "\033[32m[安装提示]\033[0m 终端小工具文件夹已经镜像到/usr/local/内"

sudo ln -s /usr/local/Terminal-small-tools/fy/fy.sh /usr/bin/fy
echo -e "\033[32m[安装提示]\033[0m 终端快捷翻译已经在/usr/bin/建立软链接"

sudo ln -s /usr/local/Terminal-small-tools/run/run.sh /usr/bin/run
echo -e "\033[32m[安装提示]\033[0m 终端快捷命令已经在/usr/bin/建立软链接"


num=0
str=''
max=100
postfix=('|' '/' '-' '\')
while [ $num -le $max ]
do
#if [ $num == 20 ]; then
	#echo -e "\033[32m[安装提示]\033[0m 终端小工具文件夹已经镜像到/usr/local/内"
#elif [ $num == 40 ]; then
	#echo -e "\033[32m[安装提示]\033[0m 终端快捷翻译已经在/usr/bin/建立软链接"
#elif [ $num == 60 ]; then
	#echo -e "\033[32m[安装提示]\033[0m 终端快捷命令已经在/usr/bin/建立软链接"
#fi
	let index=num%4
	printf "[%-50s %-2d%% %c]\r" "$str" "$num" "${postfix[$index]}"
	let num++
	sleep 0.005
	if (($num % 2 == 0)); then
		str+='#'
	fi
done
printf "\n"
echo -e "\033[32m[安装提示]\033[0m \033[33m 安装完成, 请重新启动终端\033[0m"
