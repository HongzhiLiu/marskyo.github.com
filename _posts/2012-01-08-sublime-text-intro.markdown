---
layout: post
title: "Sublime Text2 快速上手"
date: 2012-01-08 18:06
comments: true
tags:
    - editor 
uuid: 4f0a2da94050a5514
---

### 引言

最近转到mac下，抛开被神话过的Textmate没用，而用了和Ruby一样同样源于日本开发人员开发的一款编辑器。
名为[Sublime Text 2][1]。至于其哪里好用，可以先跟我一起把这个编辑器设置好了，再来写点代码试试后说话。

#### 看看我的界面

<a href="http://www.flickr.com/photos/73858287@N03/6659323315/" title="Flickr 上 hhuai2012 的 11"><img src="http://farm8.staticflickr.com/7152/6659323315_1123824780.jpg" width="500" height="364" alt="11"></a>

#### 下载安装

这一步本来没必要再说了，直接去官网下载安装好就可以使用了。
其主页是提供了试用版本的，还没培养出付费习惯的朋友可以想办法nop掉保存时的弹出对话框即可。
关于是否付费和破解，自己看着办吧，不推荐也不排斥。

#### 参考Lucifr的介绍，挑选一些好用的

Sublime Text 2 入门及技巧 [进入][2]

#### 装上Textmate中那个酷酷的[RailsCast主题]

1. 下载  
    cd ~/Library/Application Support/Sublime Text 2/Packages/Default
    git clone git://github.com/antlong/Textmate-Themes.git

2. 配置  
打开sublime, 然后在菜单中选择Sublime Text 2 => Preferences => Color Scheme => Default => Textmate-Themes, 在里面选个RailsCast2或你中意的。

3. 修改  
RailsCast2 默认会有一个难看的背景色，我对比了Textmate是没有的。
注释掉第33、34行
        <!--
        <key>background</key>
        <string>#282828</string>
        -->
现在基本和Textmate显示一模一样了，不对，比他更好，显示中文更完美。

#### 增加在console下快捷打开方式

类似于Textmate中的mate, 没有这个也太不方便了.
方法1：官网的做法
    ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl

方法2：用苹果的脚本
    alias slime='open -a "/Applications/Sublime Text 2.app"'

方法2好像有点bug, 我又切换到方法1中去了

#### 差不多可以使用了，试试下面这几个好用的快捷键吧

1. command + t 快速定位文件
2. command + r 快速定位方法
3. command + shift + p 选择所有命令
4. command + b 运行当前ruby脚本
5. 按住control + shift 进行列操作
6. command + d 就是好用

更多待你自己使用。

[1]: http://sublimetext.com/2
[2]: http://lucifr.com/139225/sublime-text-2-tricks-and-tips/
[3]: https://github.com/antlong/Textmate-Themes
