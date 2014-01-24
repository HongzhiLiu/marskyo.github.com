---
layout: post
title: Ruby源码调试方法
comments: true
---

<p class="meta">update: 2011-07-25 - hhuai</p>

在windows下调试,使用wingdb + vc2010
===================================

1. 设置环境变量：（d:\other为我的zlib,openssl这些库的目录)

       "C:\Program Files\Microsoft Visual Studio 10.0\VC\bin\vcvars32.bat"
       set INCLUDE=%INCLUDE%d:\other\include;
       set LIB=%LIB%d:\other\lib;

2. 生成Makefile
   注意按这个目录来，别进到win32目录去了

       D:\tmp\ruby-1.9.2-p180>win32\configure.bat --prefix=d:\tmp\rubydebug
       cl -nologo -MD rtname.c user32.lib -link > nul
       Checking unicows.lib
       Creating Makefile.new
       "type `nmake' to make ruby."

3. 修改makefile 

       OPTFLAGS = -W2 -wd4996  -Zm600
       CFLAGS = /Od -MD $(DEBUGFLAGS) $(OPTFLAGS) $(PROCESSOR_FLAG) 
       LDFLAGS = $(LDFLAGS) -Fm /DEBUG 

4. 编译
       
       D:\tmp\ruby-1.9.2-p180\build>nmake

   遇到下面这个错语的话，将源码删除，再重新解压编译，不知道是什么 问题。    
   NMAKE : fatal error U1045: spawn failed : Permission denied

5. 安装
       
       D:\tmp\ruby-1.9.2-p180\build>nmake install

6. windbg启动设置
       
       "windbg.exe" -y C:\WINDOWS\Symbols;d:\tmp\ruby-1.9.2-p180;SRV*D:\symbols*http://msdl.microsoft.com/download/symbols

6、调试
   
   Windbg提供了两种方式来启动应用，这里以ruby的irb为例：    
   open executable：ruby -x "<path>\irb.bat"，这时候我们可以很方便地在任何地方设置断点，包括main函数。    
   也可以运行irb之后，在WinDbg里选择attach to a process， 在列出的进程中选择ruby.exe。   


在windows下调试，使用wingdb+linux虚拟机,适用于gdb+linux
=======================================================

1. 修改编译参数
   
       ./configure CFLAGS="-ggdb -g3 -gdwarf-2" --enable-shared --disable-install-doc --prefix=/tmp/rubydebug

2. 编译、安装

       make && make install

   哎，在linux下搞ruby就是简单，完成了。

3. 调试
   
   可以用gdb来调了，当然，也可以用(wingdb)[http://www.wingdb.com/wgHome.htm]在win上用vs来进行调试