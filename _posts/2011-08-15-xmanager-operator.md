---
layout: post
title: 配置Xmanager连接
comments: true
---

<p class="meta">update: 2011-07-19 - hhuai</p>


用Xshell时,发现这个Xmanager实在太好用了.特记录一下配置

## centos配置方法

1. 修改gdm配置文件,修改内容为粗体部分.

       cat /etc/gdm/custom.conf
       [daemon]
       [security]
       AllowRemoteRoot=true
       [xdmcp]
       Port=177
       Enable=1
       [gui]
       [greeter]
       [chooser]
       [debug]

1. 修改启动顺序,将X启动起来

       cat /etc/inittab
       id:5:initdefault:

1. 关闭防火墙或在防火墙中把端口开放出来.(UDP 177  TCP 6000到6010端口)

1. 重启
  
       sudo reboot

## ubuntu的连接方法

1. Download the attached file and upload it to the server. And, enter the following command to update gdm（更新gdm软件包）
   注：本步骤是为修改Ubuntu 10.10 的gdm bug 而做的。我装的是Ubuntu 11.04，gdm版本已经是2321了，不用更新，哈哈~
   vmware下的ubuntu10.10好像是有这个BUG的，连不上。更新新版本gdm就好了。

       $ wget  -c "http://www.netsarang.com/forum/xmanager/down?num=3526&filename=88406269da081d4091c34728c92d2c6c&savename=gdm_2320-0ubuntu1_i386.deb"  -O gdm_2320-0ubuntu1_i386.deb
       $ sudo dpkg -i gdm_2320-0ubuntu1_i386.deb 
       $ gdm --version
       GDM 2.32.1
 
1. Open the /etc/gdm/custom.conf file and set XDMCP to true（修改custom.conf配置文件）：
   (注：DisplaysPerHost表示显示主机的数量)

       $ sudo gedit /etc/gdm/custom.conf
       添加如下两个字段：
       [security]
       DisallowTCP=false
       [xdmcp]
       Enable=true
       Port=177
       DisplaysPerHost=10 
 
1. Open the /etc/gdm/gdm.schemas file and set XDMCP to true（在ubuntu11.04中无此文件，不用修改）

       $ sudo gedit /etc/gdm/gdm.schemas
       修改xdmcp/Enable字段：
       <schema>
       <key>xdmcp/Enable</key>
       <signatur

1. 重启
  
       sudo reboot

## Xmanager客户端配置方法

1. 运行Xbrowser  
![运行Xbrowser](http://pic.yupoo.com/hhuai/BiiRCBBU/13yStA.png)

1. 新建session,选择第二项XDMCP  
![新建session](http://pic.yupoo.com/hhuai/BiiRCSJt/10uz1C.jpg)

1. 如果不能运行，修改属性  
![修改属性](http://pic.yupoo.com/hhuai/BiiRCHoz/m11cY.png)
