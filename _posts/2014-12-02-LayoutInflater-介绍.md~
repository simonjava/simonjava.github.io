---
layout: post
category : android开发
tagline: "工作记录"
tags : [工作,android,LayoutInflater]
---
{% include JB/setup %}

<h4>{{page.title}}</h4>

inflate的意思是"充气，使……膨胀"。LayoutInflater可以看作是给Layout填充东西的一个类。主要是用来加载res/layout/*.xml布局。

三种实例方式

	1. LayoutInflater inflater = getLayoutInflater(); 

	2. LayoutInflater localinflater=(LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

	3. LayoutInflater inflater = LayoutInflater.from(context); 

本质都是调用`context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);`。

