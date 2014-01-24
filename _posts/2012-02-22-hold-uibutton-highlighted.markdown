---
layout: post
title: "保持UIButton高亮状态"
date: 2012-02-22 16:41
comments: true
tags: 
    - ios
---

问题
---------------

有一些情景，我们需要保持Button的高亮状态，下次点击再消失.比如一些开关控制，打开闪光灯之类。
我的第一反映是在UIButton的事件中直接将UIButton的highlighted属性设为真，如下：

```c
-(void) onButtonClick:(id)sender{
    [sender setHighlighted:YES];
}
```

实际情况并不起效，原因是UIButton的事件执行后，会自动掉setHighlighted,将其设为NO.这样我们的代码就不起作用了。 
方法有两种 

  - 点击后修发UIButton的图片，我在网上看过有说这种方法的，我现在维护的项目代码中也有这种写法。
  - 通过objective c的延迟执行，等于系统自动设置完成后，我们再将其设为高亮。

两种方法，我偏向后种，代码更干净。给出例子：

```c
- (void)highlightButton:(UIButton *)b { 
    [b setHighlighted:YES];
}

-(void) onButtonClick:(id)sender{
    [self performSelector:@selector(highlightButton:) withObject:sender afterDelay:0.0];
}
```
