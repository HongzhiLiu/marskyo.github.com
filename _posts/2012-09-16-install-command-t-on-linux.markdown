---
layout: post
title: "vim插件command-T在linux下安装"
date: 2012-09-16 13:41
comments: true
tags: 
    - vim
    - linux
---


其实很好装，网上说不好装的太多了，把我吓着了差点没装着。  
其实最重要的一点是你得保证vim中的+ruby得和command-t中的so的编译进的ruby lib一致就好了，不管你是ruby1.8还是1.9.


1. 在mac中，因为自带的vim中的ruby支持是1.8, 所以编译commandT时要切换到1.8中进行编译。

2. 在linux中，我默认用1.9，vim-nox自带为1.8,那么肯定就会crash啦， 所以需要自己去下载vim source进行编译，然后再编commandT,说得这么多，其实有编译经验的，几分钟就搞定了啦 。

这是个vim configure的范例

{% gist 3731191 %}
