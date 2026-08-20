# 此为新手专用的一键下载脚本（半完全版本）
> Omia 2026.08.16
---
**需注意**：**此为Debian系用户专用（包括Ubuntu系统（Xubuntu、Kubuntu、Lubuntu）、Linux Mint（Cinnamon、XFCE、MATE）、Kali Linux.....等关于Debian的发行版本）**
---
## 接下来开始讲解一键下载脚本的使用方法

### 第一步：克隆仓库
先打开终端，输入下面这行：
```git
git clone https://github.com/sunZshanY/Linux.git
```
克隆完记得进到文件夹里面：
```sh
cd Linux
```

### 第二步：给脚本加上执行权限
```sh
chmod +x main.sh
```

### 第三步：运行脚本
```sh
./main.sh
```
然后就等着就行，中途会要你输一次密码（输密码的时候屏幕上啥都不显示，这是正常的，输完直接回车）。

---

## 脚本都装了些什么

- git：代码仓库工具
- zsh、fish：两个好用的shell，装完可以自己选
- libreoffice：办公套件，写文档做表格 （有LibreOffice Write Draw .....）
- kitty：终端模拟器，比自带的舒服
- vim、nvim、nano、helix（hx）：四个编辑器，挑顺手的用 (想美化的可以去搞LazyVim或者是其他的呢)
- fonts-jetbrains-mono、fonts-noto-cjk：字体
- fcitx5全家桶：中文输入法（含rime）
- vlc：本地播放器，几乎啥格式都能放
- blender：3D建模
- obs-studio：录屏和直播
- cmake、make、clang：以后写代码/编译的时候要用
- gnome-todo：桌面待办事项
- broadcom-sta-dkms：博通无线网卡驱动 （仅限Mac或者其他用户使用）

后面内容添加了 pythoon java lua 等编程语言的依赖，望周知

## 注意事项（划重点）

1. 一定得是Debian系的系统，Arch、Fedora那些用不了，别乱试
2. 安装过程中千万别关终端，关了就装了一半没下文了
3. broadcom-sta-dkms是博通网卡的驱动，如果你电脑不是博通网卡，可以把这行删掉再运行，能省不少时间
4. 如果中途哪个包装失败了，先 `sudo apt update` 一下再重新跑一遍

---

有问题提issues，觉得有用点个star，救救孩子吧~
