---
layout: post
category : android开发
tagline: "工作记录"
tags : [工作,android,shell]
---
{% include JB/setup %}

<h4>{{page.title}}</h4>

提交svn diff时提示解析格式不对，原因是shell编码不对。
解决方法，在环境变量中设置

	export LC_ALL="en_US.UTF-8" && export LANG="en_US.UTF-8" && 		export LANGUAGE="en-US.UTF-8"

设置UTF-8编码。（感谢坤哥指导）

顺便记录今天工作内容，完成调色板和涂鸦功能的编写。
