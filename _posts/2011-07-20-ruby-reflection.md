---
layout: post
title: Ruby反射和元编程
comments: true
---

<p class="meta">2010-07-20 - hhuai</p>

* constants妙用
  
  在查看cstruct源码时，发现一个方法根据符号来查找是否有类定义
  Object对像是可以观看到全局的类和Modlue定义的

      Object.const_get(:String) #String
      Class A;end
      Object.const_get(:A)      #A  

* 类和实例扩展Module

  1. 类可以直接使用include
         class A
           include B
         end

  2. 实例使用extend进行扩展
         o.extend(B)

* 类和实例通过eval扩展

  1. 类中可以使用class_eval或instance_eval
     使用一样，但class_eval为类实例方法，instance_eval生成类方法

         s = "string object"     	
         s.len #undefined error
         String.class_eval("alias len size")
         s.len #13   
         #undefined method `size' for class `Class'
         String.instance_eval("alias len size")

  2. 类实例自身可以使用instance_eval

         s = "string object"     
         s.instance_eval("alias len size")   

* Method获取与调用
    注意两者区别，一个是获取，一个是调用
    
      "s".method(:size)#<Method: String#size>
      "s".send(:size)  # 1
    

             
* 禁止修改类

    如果类不想被动态修改，那就冻结他。
      o.freeze  

* include和extend区别

  include : mixes in specified module methods as instance methods in the target class
  extend : mixes in specified module methods as class methods in the target class

  意思是如果对class使用include,将变成类实例方法
  使用extend会成为类方法


* 追踪程序的执行

      proc_object = proc do |event, file, line, id, binding, klass|
        puts "#{event} in #{file}/#{line} #{id} #{klass}"
      end
      
      puts 'hah'
      set_trace_func(proc_object)
      puts 'haha'