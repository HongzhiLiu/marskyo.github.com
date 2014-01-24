---
layout: post
title: Debian添加开机运行服务
comments: true
---

<p class="meta">update: 2010-07-22 - hhuai</p>

1. 在/etc/init.d/目录下建好脚本,取名叫blah

       #! /bin/sh
       # /etc/init.d/blah
       #
       
       # Some things that run always
       touch /var/lock/blah
       
       # Carry out specific functions when asked to by the system
       case "$1" in
         start)
           echo "Starting script blah "
           echo "Could do more here"
           ;;
         stop)
           echo "Stopping script blah"
           echo "Could do more here"
           ;;
         *)
           echo "Usage: /etc/init.d/blah {start|stop}"
           exit 1
           ;;
       esac
       
       exit 0

2. 修改脚本权限
       
       chmod 755 /etc/init.d/blah

3. 添加启动链接
   
       root@skx:~# update-rc.d blah defaults
       Adding system startup for /etc/init.d/blah ...
         /etc/rc0.d/K20blah -> ../init.d/blah
         /etc/rc1.d/K20blah -> ../init.d/blah
         /etc/rc6.d/K20blah -> ../init.d/blah
         /etc/rc2.d/S20blah -> ../init.d/blah
         /etc/rc3.d/S20blah -> ../init.d/blah
         /etc/rc4.d/S20blah -> ../init.d/blah
         /etc/rc5.d/S20blah -> ../init.d/blah


4. 删除服务

       root@skx:/etc/rc2.d# update-rc.d -f  blah remove
       update-rc.d: /etc/init.d/blah exists during rc.d purge (continuing)
        Removing any system startup links for /etc/init.d/blah ...
          /etc/rc0.d/K20blah
          /etc/rc1.d/K20blah
          /etc/rc2.d/S20blah
          /etc/rc3.d/S20blah
          /etc/rc4.d/S20blah
          /etc/rc5.d/S20blah
          /etc/rc6.d/K20blah
