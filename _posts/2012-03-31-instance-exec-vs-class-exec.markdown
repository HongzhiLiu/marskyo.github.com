---
layout: post
title: "instance_exec vs class_exec"
date: 2012-03-31 10:50
comments: true
tags: 
    - ruby
uuid: 85141c1939e151db2
---
两个重要的区别

* Ruby internally uses *self* and *ruby_class* decide where it can define method when it encounters keyword like def, alias reference

* When class_eval is used on a class object to define a method, it will set self = obj, ruby_class = obj. This means that the method you defined is effectively defined as a instance method for the given class.

以下是[邮件列表][1]上的注解，觉得写得已经很明了了。

> ruby use self and internally ruby_class which give it
>  where it can define method when it find keyword like 'def', 'alias', ...
> 
>  With obj.instance_eval ruby will make
>    * self = obj , ruby_class = obj singleton class
> 
>  This mean that inside instance_eval it will define singleton method
> 
>  #instance_eval work with any object, but a class is a little special
>  because it can be seen as an object or as a class. This is why
>  #module_eval, #class_eval exist.
> 
>  With obj.class_eval ruby will make
> 
>   * self = obj, ruby_class = obj
> 
>  This mean that inside class_eval ruby will define instance method.


{% gist 2258904 %}

[1]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/207801
