---
layout: post
category : LeetCode
tagline: "论文投稿字体嵌入问题"
tags : [字体,嵌入,投稿]
---
{% include JB/setup %}

<h4>{{page.title|remove_first:'Leetcode之'}}</h4>

首先告诉大家如何看自己的pdf文档字体是否嵌 入：在pdf格式的文件中，点“文件”-> “文档属性”-> “字体”，显示的就是你文档中用的所有字体了，每一个字体后面，如果注明了“embeded(已嵌入)”或“embeded subset(已嵌入子集)”，就说明是嵌入了，否则就要想办法。

出现问题一般都是Matlab，莫名其妙的默认字体Helvetica。

我的解决方法：

使用[cutepdf-writer](http://www.freehao123.com/cutepdf-writer/)作为打印机重新打印一遍，打印以后就不需要原先的嵌入字体了，简单方便。