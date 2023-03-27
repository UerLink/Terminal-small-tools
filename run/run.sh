#!/bin/bash
path="/usr/local/Terminal-small-tools/run/data.csv"

if [ -n "$1" ]
then 

	
	
	if [ "$1" == "update" ]
	then 
		echo -e "\033[32m[提示]\033[0m \033[33m 格式要求：\033[0m 编号,名称,次数,命令"
		echo -e "\033[32m[提示]\033[0m 表头“编号，名称，次数，命令”不能更改"
		echo -e "\033[32m[提示]\033[0m \033[33m csv文件路径：\033[0m /usr/local/Terminal-small-tools/run/data.csv"
	else
		# 获得编号
		code=$1
		# 由于csv文件第一行是表头，所以code + 1
		code=`expr $code + 1`
		# 初始化id以进行遍历csv文件
		id=1
		while IFS=',' read -r col1 col2 col3 col4
		do
		
		if [ $code -eq $id ]
		then
		      	cols1=$col1
			cols2=$col2
			cols3=$col3
			cols4=$col4
			echo -e "$cols1\t$cols2\t$cols3\t$cols4"
			
			# 删除命令中的换行符
			cols4=${cols4%$'\r'}
			
			# 执行存储的命令
			$cols4
			
					
			# 次数加 1
			cols3=`expr $cols3 + 1`
			# 选择行
			line_number=$code
			line_number_next=`expr $line_number + 1`
			# 插入行
			sed -i "${line_number}i $cols1,$cols2,$cols3,$cols4" $path
			# 删除行
			sed -i "${line_number_next}d" $path
			
		fi
		# id加 1
		id=`expr $id + 1`
		done < $path	
	fi
	
else
	clear
	# 展示所有快捷命令
	while IFS=',' read -r col1 col2 col3 col4
	do
	  echo -e "$col1\t$col2\t$col3\t$col4"
	done < $path
	echo -e "\033[32m[提示]\033[0m \033[33m 运行命令：\033[0m run 编号"
	echo -e "\033[32m[提示]\033[0m \033[33m 修改命令：\033[0m run updata"
fi

