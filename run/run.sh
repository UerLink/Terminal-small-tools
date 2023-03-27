#!/bin/bash
path="/usr/local/Terminal-small-tools/run/data.csv"



# 打印命令列表
run_print(){

	clear
	# 打印所有快捷命令
	id=1
	echo "——————————————————————————————————————"
	while IFS=',' read -r col1 col2 col3
	do
		echo -e "[\033[32m $id \033[0m]\t$col1\t\033[32m➜ \033[0m$col2"
	  	id=`expr $id + 1`
	done < $path
	echo "——————————————————————————————————————"
}



if [ -n "$1" ]
then 
	
	if [ "$1" == "help" ]
	then 
	
		echo -e "\033[32m[使用说明]\033[0m \033[33m 运行命令：\033[0m run 编号"
		echo -e "\033[32m[使用说明]\033[0m \033[33m 自定义命令方法：\033[0m ⇣⇣⇣"
		echo -e "\033[32m[使用说明]\033[0m  修改date.csv文件,路径：\033[37m /usr/local/Terminal-small-tools/run/data.csv \033[0m"
		echo -e "\033[32m[使用说明]\033[0m  格式要求： 名称,命令"
	else
		run
		clear
		# 获得编号
		code=$1
		# 初始化id以进行遍历csv文件
		id=1
		while IFS=',' read -r col1 col2
		do
		
			if [ $code -eq $id ]
			then
			      	cols1=$col1
				cols2=$col2
				# 打印命令列表
				run_print
			echo -e "\033[32m[提示]\033[0m 已执行：$cols1\t\033[32m➜ \033[0m $cols2"
				# 删除命令中的换行符
				cols2=${cols2%$'\r'}

				# 执行存储的命令
				$cols2		
				
			fi
		# id加 1
		id=`expr $id + 1`
		done < $path	
	fi
	
else
	# 打印命令列表
	run_print
fi

