---
layout: post
title: Windbg调试技巧收集
comments: true
uuid: 971338a142f49d149
---

<p class="meta">2011-07-26 - hhuai</p>

在调Ruby源码时，使用windbg和linux下的dbg分别试了一下，     
在linux下编译环境比较方便，但调试的话还是windbg要好用一些，       
比如Ruby中指向对象的指针全是用的 VALUE，在dbg下怎么也不好看       
在windbg下一个dt命令就可以把结构打出来

* 条件断点中使用字符串的比较

  如下面的意思是，在rb_define_module_function函数中name参数==String时停下来

  1. 将以下语句存为d:\script.txt
  
         as /ma mychar_alias poi(name)
         .echo ${mychar_alias}
         .if ($scmp("${mychar_alias}","String")==0) {k} .else {gc}
  
  2. 在命令行中下断点
      
         bu msvcr100_ruby191!rb_define_module_function  "$<d:\\script.txt"