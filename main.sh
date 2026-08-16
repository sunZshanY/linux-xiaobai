#!/bin/bash
#此项目专为Debian系用户专用（新手小白）
#这里的Debian系为Ubuntu（Xubuntu、Kubuntu、Lubuntu）、Linux Mint（Cinnamon、XFCE、MATE）、Kali Linux.....等关于Debian的发行版本（这里指太多了，先讲这么多）

echo "============================="
echo "    新手一键配置脚本启动！"
echo "============================="
echo ""

#第1步：更新软件源，这里会让你输入密码，输的时候屏幕上不显示，别慌，正常输就行
echo "第一步：更新软件源（需要输入密码）"
sudo apt update && sudo apt upgrade -y

#第2步：开始装软件，东西有点多，慢慢等，泡杯茶吧
echo "第二步：开始安装软件（时间比较久，别关终端）"
sudo apt install -y git zsh fish libreoffice kitty vim nvim nano hx fonts-jetbrains-mono fonts-noto-cjk \
  fcitx5 fcitx5-qt fcitx5-rime fcitx5-chinese-addons gnome-todo broadcom-sta-dkms vlc cmake make clang blender obs-studio

echo ""
echo "=========================================="
echo "  安装完成！可以开始折腾你的系统了~"
echo "=========================================="
