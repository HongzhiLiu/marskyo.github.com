---
layout: post
title: console技巧收集（持继更新）
comments: true
uuid: e226d4c32497ba275
---


1.  如何让git push 时自动输入密码？

    解：使用ssh-agent
        [xiao@localhost project]$ ssh-agent bash
        [xiao@localhost project]$ ssh-add
        Enter passphrase for /home/xiao/.ssh/id_rsa:
        Identity added: /home/xiao/.ssh/id_rsa (/home/xiao/.ssh/id_rsa)

1.  登陆时自动启动ssh-agent

        ####SSHagent settings####
        SSH_ENV="$HOME/.ssh/environment"

        function start_agent {
             echo "Initializing new SSH agent..."
             /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
             echo succeeded
             chmod 600 "${SSH_ENV}"
             . "${SSH_ENV}" > /dev/null
             /usr/bin/ssh-add;
        }

        # Source SSH settings, if applicable

        if [ -f "${SSH_ENV}" ]; then
             . "${SSH_ENV}" > /dev/null
             ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
                 start_agent;
             }
        else
             start_agent;
        fi

1.  使用passphrase登陆
  
    解:    
    ssh-keygen 可以在~/.ssh目录下生成 id_rsa(私钥) 和 id_rsa.pub(公钥)。     
    如需在对应远程主机上建立对应的passphrase，    
    就需要将id_rsa.pub(公钥)拷到远程主机上的~/.ssh/authorized_keys2     
    authorized_keys2可以写多条，多条之间用换行隔开。      
    一般需要将私钥的权限设为600 


1.  scp操作: 

        scp -P 2222 ~/.ssh/authorized_keys2 xiao@192.168.11.10:.ssh/authorized_keys2_nn

1.  sudo如何不需输入密码?
  
    解：root用户下输入visudo,进入sudoers的编辑，在最后加入:    
        用户名 ALL=NOPASSWD:ALL

1.  vim 编辑文件时，保存需要root权限怎么办？

        :w !sudo tee %

1.  ssh内网转发

    1. 修改或修改sshd_config       
           GatewayPorts yes
    
    2. 在内网机器上执行,(www.hhuai.cn为外网转发机器)
           ssh -C -R 10000:localhost:21 -l www hhuai.cn -p 2222

    3. 参考资料
       [SSH隧道与端口转发及内网穿透](http://blog.creke.net/722.html)
       [使用SSH连接内网服务](http://hi.baidu.com/zkheartboy/blog/item/5311c70082ee1819738b6541.html)

       
