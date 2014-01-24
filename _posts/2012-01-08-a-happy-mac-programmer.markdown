---
layout: post
title: "a happy mac programmer"
date: 2012-02-08 16:05
comments: true
tags: 
    - ruby
    - mac
    - ios
uuid: bb507e250accf69aa
---

## 引子

2011年底时，从呆了三年半的公司离职了，主要是从事的移动应用方面的开发。现在的公司研发味道比较浓，我目前主要负责的是iphone产品的研发，我的主要兴趣还是在移动产品的研发，希望哪天有一款自己能够运营的不错的产品。

一个多月以来，我没有打游戏，很少做别的娱乐，全心放在了mac上的开发。
主要包括

  *  iphone开发 
  *  ruby  开发 
  *  mac   一些日常应用 

### iphone开发

1. 自己学习的一点经验

1. 语音通信的解决方案，类似于腾讯的微信功能 [进入][3]

1. 关于手写界面还是使用xib的问题

### ruby开发

1. mac中环境的配置

1. sinatra快速上手

1. Sublime Text2 快速上手-(mac篇) [进入][1]

1. capistrano 自动部署 [进入][2]

### mac 日常应用

哈哈，这里有一个结论就是：初期会把windows一些习惯和类操作方式带过来了，熟悉了之后发现Mac自带的软件更人性化。

1. 文件操作

   因为在windows下用习惯了totalcommand, Mac上功能和界面简洁的Finder有点适应用不了。
初期我装上了[PathFinder](http://www.cocoatech.com/),一个外挂式的Finder增强工具。
可以多标签，可以分栏，稍稍好用一点了。不过在试用期满之前，我发现外挂的东西用起来还是有点这里那里的问题，卸载了直接用Finder。 这里我要说的是善用command+`和Terminal结合，其实用起来也不错。

1. 输入法

   自带的拼音输入法还不错，自带的五笔就悲剧了，连侯选词也没有，目前在用QQ输入法，凑合着用用吧，比windows的输入体验差太多。

1. 终端工具

   前期装的iTerm2+zsh,增强了自带的Terminal的多个功能，后发现更喜欢原生的Terminal+bash。需要什么定制自己实现就是了，根本不需要用zsh。 发一个自己写的PS1提示符定制：

       parse_git_branch() {
         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
       }
       PS1="\$(parse_git_branch)-$(rvm current)\n\W$ "

1. 浏览器

   如果不需要代理功能，我会说safari最好用，但是需要蛋疼的proxy配置，还是用chrome算了。

1. 知识笔记

   Evernote目前很爱，iphone上的阅读效果同样不错。 

[1]: /blog/2012/01/08/sublime-text-intro
[2]: /blog/2012/01/08/capistrano-and-sinatra
[3]: /blog/2012/02/05/ios-and-andorid-voice
