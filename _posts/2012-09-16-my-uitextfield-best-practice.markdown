---
layout: post
title: "my best practice in UITextField"
date: 2012-09-16 13:22
comments: true
tags: 
    - ios
---

## 引言

个人的一些UITextField处理经验，谈不上最佳，只是个人心得。

- 问题1， 处理键盘出现的界面自动上升。  
这里键盘高度采用自动获取，然后再整体上升，保证键盘盖不到就不处理，键盘盖到就计算上升高度。
上代码：

{% gist 3731147 %}


- 问题2， 当键盘弹出后，让其如何消失呢？  
我采用的方法是做一层透明层，然后盖在最上面，但这时连TextField本身也盖住了，这就需要在hittest上做点手脚了，看代码。

TextField加透明层部分

{% gist 3731165 %}

透明层的实现部分

{% gist 3731169 %}
