---
layout: post
title: "webkit 研究"
date: 2011-08-17 5:59
comments: true
tags: 
    - other
---

<p class="meta">update: 2011-07-19 - hhuai</p>

## 第一部分--Qtwebkit编译

1. 编译环境准备

   * 系统: Ubuntu 11.04 ,可以的话，一定要使用这个。
   * 源码版本: http://svn.webkit.org/repository/webkit/trunk  Revision: 92854
   * Qt库版本: 4.7.2 (Ubuntu 11.04上直接可装这个版本，低的版本由于依赖，麻烦得很)

2. 安装编译依赖环境

       sudo apt-get upgrade
       sudo apt-get install libxslt-dev gperf bison libsqlite3-dev flex libqt4-dev build-essential subversion libenchant-dev libXt-dev  libxrender-dev libfontconfig1-dev

3. 编译

       export LIBRARY_PATH=/usr/lib/i386-linux-gnu
       QTDIR=/usr/share/qt4/ ./Tools/Scripts/build-webkit --qt --debug 

   编译成功会出现如下字样
       ===========================================================
       WebKit is now built (02m:59s).
       To run QtTestBrowser with this newly-built code, use the
       "Tools/Scripts/run-launcher" script.
       ===========================================================

       

4. 运行(Tools/Scripts/run-launcher不一定可行)

       WebKitBuild/Debug/bin/QtTestBrowser

5. 用gdb进行调试(有图有真相)

   ![webkit debug](http://pic.yupoo.com/hhuai/BiBsYHBc/medium.jpg)

## 第二部分--Qtwebkit分析
   待续。。。
