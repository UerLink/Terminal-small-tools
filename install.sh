#! /bin/bash
path=$(pwd)
echo -e "\033[32m[安装提示]\033[0m 当前路径：$path"
echo -e "\033[32m[安装提示]\033[0m 由于是拷贝文件夹可能需要输入密码"
rm -rf /usr/local/Terminal-small-tools
cd ..
sudo cp -r Terminal-small-tools /usr/local/
echo -e "\033[32m[安装提示]\033[0m 终端小工具文件夹已经镜像到/usr/local/内"

sudo ln -s /usr/local/Terminal-small-tools/fy/fy.sh /usr/bin/fy
echo -e "\033[32m[安装提示]\033[0m 翻译小工具已经在/usr/bin/建立软链接"