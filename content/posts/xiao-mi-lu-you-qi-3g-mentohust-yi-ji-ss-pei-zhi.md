---
author: "Fred Liang"
categories: ["Technology"]
date: 2018-01-09T00:07:00Z
description: "正常情况下校园网的网速是 10mb/s，尤其是在使用华科的镜像源的时候，速度可以稳定在11+mb/s。由于之前百兆路由器速度限制，只能达到2mb/s，因此更换了一个路由器。"
draft: false
image: "https://images.fredliang.cn/photo-1496055401924-5e7fdc885742?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ%3D%3D%0A&s=dc77c148231a3785e219e73b24140a07"
slug: "xiao-mi-lu-you-qi-3g-mentohust-yi-ji-ss-pei-zhi"
tags: ["Technology"]
title: "小米路由器 3G mentohust 以及 SS 配置"

---

正常情况下校园网的网速是 10mb/s，尤其是在使用华科的镜像源的时候，速度可以稳定在11+mb/s。
由于之前百兆路由器速度限制，只能达到2mb/s，因此更换了一个路由器。

由于刚出的小米路由器3G，文档以及路由器配置都需要自己去找，花费了一些时间。

## 1.获取 ssh 权限


先从[http://www1.miwifi.com/miwifi_download.html](http://www1.miwifi.com/miwifi_download.html) 下载最新的路由器开发版rom

登录[路由器后台](https://192/168.31.1)刷入路由器
按照[miwifi.com](http://www1.miwifi.com/miwifi_open.html)中的教程获取 ssh 权限。

win 选手请先看一下WinSCP和PuTTY的使用

## 2.编译 mentohust

看过几篇博客，但是他们基本上使用的mini，和第三代，CPU 型号不一样。

尝试过后发现需要自己手动编译。

==我编译完成了的版本（只适用于小米路由器3G等mt7621 cpu）下载：[mentohust](https://storage.fredliang.cn/static/mentohust)==

### 2.1 在自己的服务器/电脑上搭建编译环境

我再 google cloud 的 Ubuntu 服务器上搭建。

首先在[http://archive.openwrt.org/chaos_calmer/15.05.1/ramips/mt7621/](http://archive.openwrt.org/chaos_calmer/15.05.1/ramips/mt7621/) 里面找到[OpenWrt-SDK-15.05.1-ramips-mt7621_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2](http://archive.openwrt.org/chaos_calmer/15.05.1/ramips/mt7621/OpenWrt-SDK-15.05.1-ramips-mt7621_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2)
mt7621(小米路由器3G 的 CPU 型号) 的 SDK，里面有编译工具链。

可以直接在服务器上面创建目录，在里面
<pre data-user="fredliang" class="command-line language-bash"><code>wget http://archive.openwrt.org/chaos_calmer/15.05.1/ramips/mt7621/OpenWrt-SDK-15.05.1-ramips-mt7621_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2 
tar jxf OpenWrt-SDK-15.05.1-ramips-mt7621_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2</code></pre>

配置编译环境变量
<pre data-user="fredliang" class="command-line language-bash"><code>export PATH=$PATH:刚才解压完的目录/staging_dir/toolchain-mips_34kc_gcc-5.3.0_musl-1.1.16/bin 目录的完整路径
export CC=mipsel-openwrt-linux-gcc  
export CPP=mipsel-openwrt-linux-cpp  
export GCC=mipsel-openwrt-linux-gcc  
export CXX=mipsel-openwrt-linux-g++  
export RANLIB=mipsel-openwrt-linux-uclibc-ranlib
export LDFLAGS="-static"  
export CFLAGS="-Os -s"</code></pre>

### 2.2 编译libpcap

在准备好的目录 git clone 代码
配置环境然后编译

<pre data-user="fredliang" class="command-line language-bash"><code>git clone https://github.com/the-tcpdump-group/libpcap.git
cd libpcap
./configure --host=mipsel-openwrt-linux --prefix=设定一个路径  --with-pcap=linux
make</code></pre>

不用管 error ，我们需要的 libpcap.a 已经编译完成了，是编译不需要的libpcap.so.1出现的 error。

### 2.3 编译 mentohust 

在准备好的目录 git clone 代码
通过脚本生成configure

<pre data-user="fredliang" class="command-line language-bash"><code>git clone https://github.com/hyrathb/mentohust
cd mentohust
sh autogen.sh
./configure --host=mipsel-openwrt-linux   --disable-encodepass --disable-notify --prefix=设定一个路径 --with-pcap=前面保存的libpcap.a文件路径
make</code></pre>

之后可以在 mentohust 的 src 目录获得 mentohust 文件
然后将 mentohust 下载到本地

## 3. scp 复制文件到路由器启动

在本地将 mentohust 拷贝到服务器上面

<pre data-user="fredliang" class="command-line language-bash"><code>scp mentohust root@192.168.31.1:/etc/mentohust</code></pre>

然后进入路由器
给路由器可执行权限
根据自己学校的 mentohust 设置更改参数
安装好可以通过 /etc/mentohust -h 查看可配置参数

<pre data-user="fredliang" class="command-line language-bash"><code>chmod a+x /etc/mentohust
/etc/mentohust -u账号 -p密码 -neth1 -i0.0.0.0 -m0.0.0.0 -g0.0.0.0 -s0.0.0.0 -o0.0.0.0 -t8 -e30 -r15 -a1 -d1 -b0 -v4.10 -fdefault.mpf -cudhcpc -i</code></pre>

华科的学生可以参考
-b2 意思是在后台运行，保持输出
<pre data-user="fredliang" class="command-line language-bash"><code>/etc/mentohust -u学号 -p校园网密码 -neth1 -a0 -d1 -b2</code></pre>


配置开机启动

<pre data-user="fredliang" class="command-line language-bash"><code>vi /etc/rc.local</code></pre>

在exit 0的前一行加入

<pre data-user="fredliang" class="command-line language-bash"><code>/etc/mentohust -u学号 -p校园网密码 -neth1 -a0 -d1 -b2</code></pre>

## 4.shaodowsocks 相关文件配置
### 4.1 安装 Misstar Tools 工具箱

下载安装
<pre data-user="fredliang" class="command-line language-bash"><code>wget http://www.misstar.com/tools/appstore/install.sh -O</code></pre>

在浏览器打开路由器后台，发现多了 mt 工具箱
打开路由器后台插件管理，按 f12，在浏览器开发者工具里审查元素找到安装的按钮，修改 div的 id 为 ss
点击安装，发现安装的是 shadowsocks。

