---
layout: post
category : android开发
tagline: "工作记录"
tags : [工作,android,View,Measure]
---
{% include JB/setup %}

<h4>{{page.title}}</h4>

`measure`-->`layout`-->`draw`.

`measure`的过程理解起来比较困难。`View`在`layout`文件中有`layout_width`和`layout_height`有两个属性。对于这两种属性，我们有三种处理方式：赋具体的值,`match_parent`,`wrap_content`。`measure`的过程就是处理`match_parent`和`wrap_content`的。

[具体看这里](http://webcache.googleusercontent.com/search?q=cache:boQNyBQt5MYJ:www.2cto.com/kf/201207/139574.html+&cd=2&hl=zh-CN&ct=clnk&gl=cn)
