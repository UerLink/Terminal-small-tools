#!/bin/bash
path="/usr/local/Terminal-small-tools/run/data.csv"



# 打印命令列表
run_print(){

	clear
	# 展示所有快捷命令
	id=1
	echo "---------------------"
	while IFS=',' read -r col1 col2 col3
	do
		echo -e "[\033[32m $id \033[0m]\t$col1\t$col2\t\033[32m➜ \033[0m$col3"
	  	id=`expr $id + 1`
	done < $path
	echo "---------------------"
	echo -e "\033[32m[提示]\033[0m \033[33m 运行命令：\033[0m run 编号"
	echo -e "\033[32m[提示]\033[0m \033[33m 修改命令：\033[0m run help"
}










if [ -n "$1" ]
then 
	
	if [ "$1" == "help" ]
	then 
	

		echo -e "\033[32m[提示]\033[0m \033[33m自定义命令方法：\033[0m"
		echo -e "\033[32m[提示]\033[0m  修改date.csv文件,路径：\033[37m /usr/local/Terminal-small-tools/run/data.csv \033[0m"
		echo -e "\033[32m[提示]\033[0m  格式要求： 次数,名称,命令"
	else
		run
		clear
		# 获得编号
		code=$1
		# 初始化id以进行遍历csv文件
		id=1
		while IFS=',' read -r col1 col2 col3
		do
		
		if [ $code -eq $id ]
		then
		      	cols1=$col1
			cols2=$col2
			cols3=$col3
			
			# 打印命令列表
			run_print
			echo "---------------------"
			echo -e "\033[32m[提示]\033[0m 执行：$cols2\t$cols3"
			echo -e "\033[32m[提示]\033[0m 日志：⇣⇣⇣"
			# 删除命令中的换行符
			cols3=${cols3%$'\r'}
			
			# 执行存储的命令
			$cols3
			
					
			# 次数加 1
			cols1=`expr $cols1 + 1`
			# 选择行
			line_number=$code
			line_number_next=`expr $line_number + 1`
			# 插入行
			sed -i "${line_number}i $cols1,$cols2,$cols3" $path
			# 删除行
			sed -i "${line_number_next}d" $path
			
		fi
		# id加 1
		id=`expr $id + 1`
		done < $path	
	fi
	
else
	# 打印命令列表
	run_print
fi

