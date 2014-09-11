---
layout: post
category : LeetCode
tagline: "垃圾回收知识点"
tags : [面试,Java,笔记,随手记,垃圾回收]
---
{% include JB/setup %}

<h4>{{page.title}}</h4>

1. 一般而言,为Null的对象都会被作为垃圾处理,所以将不用的对象显式地设为Null,有利于GC收集器判定垃圾,从而提高了GC的效率。

2. 静态变量属于全局变量,不会被GC回收,它们会一直占用内存。

3. JVM什么时候会进行垃圾回收。线程空闲的时候，堆内存不够用的时候。
 
//公共父节点，await实现。并行继续学习。垃圾回收。博客。打印简历