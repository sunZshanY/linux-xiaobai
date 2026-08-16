#!/bin/bash
# =====================================================
# Debian系Linux新手一键配置脚本
#
# 支持:
# Ubuntu
# Kubuntu
# Xubuntu
# Lubuntu
# Linux Mint
# Kali Linux
# Debian
#
# 功能:
# 1. 更新系统
# 2. 检查Linux内核
# 3. 安装Linux Headers
# 4. 自动检测无线网卡
# 5. 安装开发环境
# 6. 配置Python Java Lua环境
#
# =====================================================


echo "================================="
echo " Debian系 Linux 初始化脚本启动 "
echo "================================="
echo ""


# 防止root运行

if [ "$EUID" -eq 0 ]; then

    echo "错误：请不要使用root运行此脚本"
    echo "请使用普通用户执行:"
    echo "./setup.sh"

    exit 1

fi



# =====================================================
# 1. 更新系统
# =====================================================


echo ">>> 第一步：更新软件源"

sudo apt update

sudo apt upgrade -y



# =====================================================
# 2. 检查Linux内核
# =====================================================


echo ""
echo ">>> 第二步：检查Linux内核"


KERNEL_VERSION=$(uname -r)


if [ -n "$KERNEL_VERSION" ]; then

    echo "当前内核:"
    echo "$KERNEL_VERSION"


    echo ""
    echo "正在安装Linux Headers..."


    sudo apt install -y linux-headers-"$KERNEL_VERSION"


    if [ $? -eq 0 ]; then

        echo "Linux Headers安装成功"

    else

        echo "Linux Headers安装失败"
        echo "继续执行后续步骤"

    fi


else

    echo "无法获取Linux内核版本"
    echo "跳过Headers安装"

fi




# =====================================================
# 3. 检测无线网卡
# =====================================================


echo ""
echo ">>> 第三步：检测无线网卡"


WIFI_INFO=$(lspci | grep -i -E "network|wireless")


echo "$WIFI_INFO"



if echo "$WIFI_INFO" | grep -qi "Broadcom"; then


    echo ""
    echo "检测到 Broadcom 网卡"

    echo "安装 Broadcom 驱动..."

    sudo apt install -y broadcom-sta-dkms



elif echo "$WIFI_INFO" | grep -qi "Intel"; then


    echo ""
    echo "检测到 Intel 网卡"

    echo "Linux内核已经支持，无需额外驱动"



elif echo "$WIFI_INFO" | grep -qi "Realtek"; then


    echo ""
    echo "检测到 Realtek 网卡"

    echo "使用Linux默认驱动"

    echo "如果无法使用WiFi，请查询对应型号"



else


    echo ""
    echo "未检测到常见无线网卡"

    echo "请手动检查驱动"


fi





# =====================================================
# 4. 安装软件环境
# =====================================================


echo ""
echo ">>> 第四步：安装常用软件"


sudo apt install -y \

git \
zsh \
fish \
kitty \
vim \
neovim \
nano \
helix \
\
fonts-jetbrains-mono \
fonts-noto-cjk \
\
fcitx5 \
fcitx5-qt \
fcitx5-rime \
fcitx5-chinese-addons \
\
libreoffice \
vlc \
firefox-esr \
\
cmake \
make \
clang \
gcc \
g++ \
\
python3 \
python3-pip \
python3-venv \
python3-dev \
\
openjdk-21-jdk \
\
lua5.4 \
luarocks \
\
blender \
obs-studio





# =====================================================
# 5. 环境检测
# =====================================================


echo ""
echo "================================="
echo " 环境检测 "
echo "================================="



echo ""
echo "Python:"
python3 --version



echo ""
echo "Java:"
java -version



echo ""
echo "Lua:"
lua -v



echo ""
echo "Git:"
git --version




# =====================================================
# 完成
# =====================================================


echo ""
echo "================================="
echo " 全部安装完成 "
echo "================================="


echo ""
echo "建议操作:"
echo "1. 重启电脑"
echo "2. 配置fcitx5输入法"
echo "3. 配置zsh/fish"
echo "4. 配置Neovim"
echo "5. 更新系统"

echo ""

echo "Linux折腾愉快！"