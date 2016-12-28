---
layout: post
category : android开发
tagline: "工作记录"
tags : [工作,android,View,Lisview]
---
{% include JB/setup %}

<h4>{{page.title}}</h4>

the problem is that you are mis-using the inflator, don't give null as the root node

if you pass null as the root node, all the size parameters you set in the xml fail to work

the correct code is

	view = inflater.inflate(R.layout.lview_row, parent, false);

这样item.xml在布局中定义的height就会起作用。
