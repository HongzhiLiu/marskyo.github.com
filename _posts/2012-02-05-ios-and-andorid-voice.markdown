---
layout: post
title: "ios实现amr编解码"
comments: true
tags: 
    - ios
uuid: 945f546efbef89ac1
---

## 介绍

学习ios第一个练手功能就是给已有产品加上语音通信功能，能够互通ios与android。这里给出自己的一些心得，希望能给他人一些参考。

### 资料搜集与参考

1. 类似产品使用的技术

    * talkbox Android版用的是ilbc的第三方编解码库，在iPhone上用的是caf
    * 微信　　 Android版估计是amr估计转码的是交给腾讯强大的服务器了。
    * 米聊　　 Android版和Iphone版用的都是speex

    目前支持的开源第三方库也就只有 ilbc和speex了

2. 考虑采用的方案

   speex需要Android和ios都进入转码，工作量太大，不采用。
剩下的方案就是在amr和ilbc上选择了，android支持amr,低版本不支持ilbc, ios高版本(4.3)只支持ilbc，不能支持amr。
刚开始的测试方案使用的是android将语音转ilbc, 由于我对于android开发不是太熟悉，在同事的帮助下一直没有转换成功，现在想想可能是处理问题，如果能转换成或，这种方案应该是最方便的。

### ios实现amr编解码

#### 录制

1. 将语音录成原始pcm码
   
   注意这里，虽然录制是pcm码，但出来的文件ios依然会封装一层，将其包装成pcf格式。所以就有了第二步。

2. 将pcf中的pcm码取出来

3. 使用libopencore库将其编成amr格式，这时可以发送给android端播放了。

#### 播放

1. 将android版本发送过来的amr解码出来

2. 播放原始pcm即可

代码文件都放在github上了，有需要的可以参考一下。
[https://github.com/hhuai/ios_util](https://github.com/hhuai/ios_util)
