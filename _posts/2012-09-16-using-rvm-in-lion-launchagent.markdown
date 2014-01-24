---
layout: post
title: "在Macos的Launchagents中使用rvm"
date: 2012-09-16 13:41
comments: true
tags: 
    - rvm
    - macox
---

Launchagents是Mac ox中一个自启动服务，用ruby脚本来写服务的话，需要注意一下环境变量，当然搞ruby的，大家都用rvm,所以就变成处理rvm 的问题了。

启动脚本写法稍稍有点复杂，在我google之后，决定采取这种写法

{% gist 3731244 %}

其实启动时候rvm会报错，说不能login之类，在头顶加上-l选项即可

```bash
#!/bin/bash -l
```

plist好写一点，照这个模板来就好

{% gist 3731240 %}
