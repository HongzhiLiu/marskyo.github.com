---
layout: post
title: "capistrano and sinatra"
date: 2012-01-08 22:29
comments: true
---

### capistrano 自动部署

1. 安装capistrano

```bash
gem install capistrano
```

2. 在sinatra的目录下新建 capfile

```ruby
load 'deploy' if respond_to?(:namespace)
load 'config/deploy.rb' # remove this line to skip loading any of the default tasks
```

3. 新建config/deploy.rb
说几个重要配置

```ruby
#rvm 配置
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.9.3-p0@rails3'        # Or whatever env you want it to run in.
set :rvm_type, :user  # Copy the exact line. I really mean :user here

＃bundle 配置
require 'bundler/capistrano' 

#passenger standalone启动方式
namespace :deploy do
  task :start do 
    run "cd #{current_release}; passenger start -p 3006 -e production -R config.ru -d"
  end

  task :stop do 
    run "cd #{current_release}; passenger stop --port 3006"
  end
end
```

