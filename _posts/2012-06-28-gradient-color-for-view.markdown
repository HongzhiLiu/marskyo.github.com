---
layout: post
title: "UIView实现渐变色"
date: 2012-06-28 11:00
comments: true
tags: 
    - ios
---

遇到个需求，需要多套配色的渐变效果，渐变简单，但配色很多，美工制作比较麻烦。所以敲敲打打就有了下面这个扩展。     
### 惯例，有图有真相环节 

<a href="http://www.flickr.com/photos/73858287@N03/7458611128/" title="Flickr 上 hhuai2012 的 3"><img src="http://farm9.staticflickr.com/8022/7458611128_e3efffc435.jpg" width="247" height="500" alt="3"></a>

### 具体代码

{% gist 3008574 %}

### 使用方法：

    [self setGradientColor:CGRectMake(100, 100, 100, 100) startColor:[UIColor redColor] endColor:[UIColor clearColor] type:RIGHT2LEFT];

- startColor 起始色
- endColor  结束色
- type 分别有从左到右，从右到右，从上到下，从下到下




