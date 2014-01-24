---
layout: post
title: Ruby源码分析
comments: true
date: 2012-01-08 16:05
uuid: 145e38e5ec30a4933
---

<p class="meta">2012-01-08 - hhuai</p>


* 首先看一下RClass, RObject, RBasicObject之间的关系

```c
struct RBasic {
    unsigned long flags;
    VALUE klass;
};

struct RObject {
    struct RBasic basic;
    struct st_table *iv_tbl;
};

struct RClass {
    struct RBasic basic;
    struct st_table *iv_tbl;
    struct st_table *m_tbl;
    VALUE super;
};
```

以前研究过jvm, 再看看动态语言原理都差不多。

*  RClass 表示的是一个类结构。

和jvm一样，其中存着两个必须的东西，变量表(iv_tbl)和方法表(m_tbl)。   
这里的变量表应该是只包含类变量（我不确定)   
super表示父类。   

*  RObject 表示是一个类实例对像。   

其中为什么要包含一个变量表而不需要方法表呢，   
因为方法表是每个实例可以共用的，   
而变量确是每个实例自己拥有的。   

*  RBasic是一个公共基类

其他所有的东东都继承于他，里面包含一个klass,就是指向的类结构(RClass)   
这样所有的东西都是对像了。  

*  RObject 

struct RObject  下面之外的所有东西  
struct RClass   类对象  
struct RFloat   小数  
struct RString  字符串  
struct RArray   数组  
struct RRegexp  正则表达式  
struct RHash    hash表  
struct RFile    IO, File, Socket等等  
struct RData    所有定义在C层次上的类，除了上面提到的。  
struct RStruct  Ruby的Struct类  
struct RBignum  大的整数   

其他的一些类，都是常用类，Ruby将其native化了，和jvm里的一些类是一样的道理。


* 关于全局函数

理论上来说，纯面向对象是不应该存在全局函数，但是Ruby中可以直接调用p,puts这些方法。   
(按阿勇的解释一路分析下去)   
在rdoc中查看p函数的定义   

```c
    p(...) ruby Kernel
    p(obj) → obj p(obj1, obj2, ...) → [obj, ...] p() → nil

    static VALUE
    rb_f_p(int argc, VALUE *argv, VALUE self)
    {
    }
```

可以看到p是在Kernel中定义的，实现方式是纯c的内部实现。   
注（源码中搜搜，发现是没有Kernel.c这样的代码文件的，kernel的定义全在object.c中的Init_Object函数中。）   
根据rb_f_p一路往下跟，在io.c中的5958行可以看到如下语句：   

```c
    rb_define_global_function("p", rb_f_p, -1);
```
    
从句面意思看，就是把p和rb_f_p关联，再定义为一个全局方法。继续往下走，       
看rb_define_global_function的实现,只有一句话。  

```c
    rb_define_module_function(rb_mKernel, name, func, argc)
```

rb_mKernel就是Kernel模块，初始化实现在object.c中.   
到这里其实大至就已经明白了，要定义一个所谓的全局函数，就在Kernel模块中定义函数。   
当然这个函数应该是c的实现，在Object初始化时加载进去。   
按这个道理推一下，我们应该能这样调用

    Object#p
    ruby-1.9.2-p290 :001 > "".p "haha"
    NoMethodError: private method \`p called for "":String

会报错，那么继续往下再看rb_define_module_function的实现

    rb_define_private_method(rb_mKernel, name, func, argc);
    rb_define_singleton_method(rb_mKernel, name, func, argc);
    
先定义成私方法，再定义成单例方法。   
所谓的rb_define_private_method,rb_define_protected_method都是调用rb_add_method,只是标志位不一样。   
rb_undef_method其实也是，只是传参时将绑定的方法传NULL进去。   
既然是私有方法，又是单例方法，那可以这么调   

    "".send(:p, "haha") #输出haha,调用成功了
    Kernel.p 'haha'     #也可成功

那么在irb中为什么能调用Object的私有方法呢，看网上有资料说是有隐含的self调用   
和在类中一样的，私有方法，只有隐式self才能调用，例:   

```ruby
        class A
          def f; p1; end       #隐式self
          def f1; self.p1; end #显式self
          private 
          def p1; 'p1'; end
        end

        A.new.f   #输出p1
        A.new.f1  #错误,private方法不能调用
```

所以直接写p可以成功调用，而self.p却不行   
先分析到这，有时间继续挖。   

    
    

        



