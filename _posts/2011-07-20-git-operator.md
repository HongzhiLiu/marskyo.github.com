---
layout: post
title: git备忘录持续更新
comments: true
---


### 远程仓库的建立

1. 远程先建一个空仓库

```bash
$ mkdir -p ~/git/depot.git
$ cd ~/git/depot.git
$ git --bare init
```

1. 本地库添加远程仓库

```bash
$ git remote add origin ssh://xiao@ip地址:端口/~/git/depot.git
```

1. 提交到远程仓库

```bash
$ git push origin master
```
