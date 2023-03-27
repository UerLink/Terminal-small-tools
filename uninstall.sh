#! /bin/bash
echo -e "\033[31m[卸载提示]\033[0m 卸载可能需要输入密码"
sudo rm /usr/bin/fy
echo -e "\033[31m[卸载提示]\033[0m 终端快捷翻译软链接已删除"
echo -e "\033[31m[卸载提示]\033[0m 路径：/usr/bin/fy"
sudo rm /usr/bin/run
echo -e "\033[31m[卸载提示]\033[0m 终端快捷命令软链接已删除"
echo -e "\033[31m[卸载提示]\033[0m 路径：/usr/bin/fun"
sudo rm -rf /usr/local/Terminal-small-tools
echo -e "\033[31m[卸载提示]\033[0m 终端小工具文件夹镜像已经删除"
echo -e "\033[31m[卸载提示]\033[0m 路径：/usr/local/Terminal-small-tools"


num=0
str=''
max=100
postfix=('|' '/' '-' '\')
while [ $num -le $max ]
do
	let index=num%4
	printf "[%-50s %-2d%% %c]\r" "$str" "$num" "${postfix[$index]}"
	let num++
	sleep 0.005
	if (($num % 2 == 0)); then
		str+='#'
	fi
done
printf "\n"
echo -e " ☕ \033[33m 卸载完成, 感谢您的支持与信任！ \033[0m"
