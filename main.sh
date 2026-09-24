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

sudo apt update && sudo apt upgrade -y



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
# 4. 安装中文输入法
# =====================================================


echo ""
echo ">>> 第四步：安装中文输入法"


echo "请选择中文输入法（推荐Fcitx5，中文输入体验更好）"
read -p "请选择输入法 [1:Fcitx5(推荐) 2:Ibus]: " number


# 直接回车默认Fcitx5

number=${number:-1}


case "$number" in

    1)


        echo ""
        echo "已选择 Fcitx5，正在安装..."


        sudo apt install -y fcitx5 fcitx5-chinese-addons fcitx5-rime fcitx5-frontend-gtk3 fcitx5-frontend-qt5


        if [ $? -eq 0 ]; then

            echo "Fcitx5 安装成功"

            echo "重启后配置环境变量:"
            echo "GTK_IM_MODULE=fcitx"
            echo "QT_IM_MODULE=fcitx"
            echo "XMODIFIERS=@im=fcitx"

        else

            echo "Fcitx5 安装失败"

        fi


        ;;

    2)


        echo ""
        echo "已选择 Ibus，正在安装..."


        sudo apt install -y ibus ibus-libpinyin ibus-rime


        if [ $? -eq 0 ]; then

            echo "Ibus 安装成功"

            echo "重启后执行 ibus-setup 进行配置"

        else

            echo "Ibus 安装失败"

        fi


        ;;

    *)


        echo ""
        echo "无效选择，默认安装 Fcitx5..."


        sudo apt install -y fcitx5 fcitx5-chinese-addons fcitx5-rime


        ;;

esac


# =====================================================
# 5. 安装常用软件
# =====================================================


echo ""
echo ">>> 第五步：安装常用软件"


# Debian系包名不同: Debian为hx，Ubuntu为helix

if apt-cache show helix >/dev/null 2>&1; then

    HELIX_PKG=helix

else

    HELIX_PKG=hx

fi


sudo apt install -y \
cowsay\
pacman\
hello \
git \
zsh \
fish \
python3 \
openjdk-25-jdk \
lua5.4 \
vim \
neovim \
curl \
wget \
rustc \
obs-studio \
blender \
gimp \
emacs \
kitty \
libreoffice \
obs-studio \
cmake \
clang \


if [ $? -eq 0 ]; then

    echo "常用软件安装成功"

else

    echo "部分软件安装失败"
    echo "请先执行 sudo apt update 后重试"

fi



# =====================================================
# 6. 环境检测
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
