---
layout: post
category : android开发
tagline: "工作记录"
tags : [工作,android,view]
---
{% include JB/setup %}

<h4>{page.title}</h4>

今天工作中遇到一个问题，有两个视图A，B。都重写了`onDraw()`方法，都捕捉`onTouch()`事件调用`invalidate()`来重绘视图。
调用日志发现很奇怪，发现我不管touch哪个视图，两个`onDraw()`都会被调用。经排查原因如下：

1. A视图较大，B视图覆盖了A视图的部分，碰到A视图时，也会绘制覆盖A的视图。

2. touch B视图时，return的是false，touch时间会继续交给A视图处理。

以上造成不管碰到哪个视图，都会调用`onDraw()`方法进行重绘。
