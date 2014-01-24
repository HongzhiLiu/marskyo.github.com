---
layout: post
title: Debian相差8小时问题
comments: true
uuid: e95c57e7d5641dd0e
---

<p class="meta">update: 2010-07-20 - hhuai</p>


我这里发现只要是时区的问题，因为分是对的，小时差8。    
修改方法是修改以下三个文件
  
    more /etc/timezone  
    Asia/Shanghai

    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

    more /etc/default/rcS
    ...
    UTC=no
    ...