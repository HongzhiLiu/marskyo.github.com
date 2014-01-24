--- 
title: xcode调试心得
layout: post
tags: 
    - xcode
    - ios
uuid: 3f6d3d99f75a52207
---

## 引言

前一阵我被quartz 2d绘图搞蒙了，最近才明了起来，有时间写写相关的记录。    
今天我调了一天内存错误，objective c中的内存溢出让我想吐。

看看下面这个错误：

### 完全看不出一二，也不知道从哪错，从哪调起。

<a href="http://www.flickr.com/photos/73858287@N03/8659274799/" title="Flickr 上 hhuai2012 的 2.jps"><img src="http://farm9.staticflickr.com/8100/8659274799_ddaa6788e3.jpg" width="500" height="242" alt="2.jps"></a>

我一点点代码调，终于搞定了这个BUG.


### 第二次再有类似的错误，我实在没力气了，google了一下，发现可以这样

在Diagnostics中设置几个选项

- Enable Scribble. Fill allocated memory with 0xAA and deallocated memory with 0x55.
- Enable Guard Edges. Add guard pages before and after large allocations.
- Enable Guard Malloc. Use libgmalloc to catch common memory problems such as buffer overruns and use-after-free.

<a href="http://www.flickr.com/photos/73858287@N03/8659274893/" title="Flickr 上 hhuai2012 的 3"><img src="http://farm9.staticflickr.com/8109/8659274893_ca87c783c8.jpg" width="446" height="248" alt="3"></a>

这次再报错会有堆栈

<a href="http://www.flickr.com/photos/73858287@N03/8660375098/" title="Flickr 上 hhuai2012 的 4"><img src="http://farm9.staticflickr.com/8112/8660375098_519a7b8c86.jpg" width="500" height="146" alt="4"></a>

终于搞定了，头发又白了几根。
