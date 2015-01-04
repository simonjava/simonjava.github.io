---
layout: post
category : 轻量级标记语言
tagline: "Markdown"
tags : [markdown,破解]
---
{% include JB/setup %}

MarkdownPad2是一款很好的编写Markdown的编辑工具，使用免费，但如果想要使用它的进阶功能，需要付款$19.5（*穷屌实在买不起*）。它使用C#编写，由于有源码没有加密，晚上也有许多[破解教程](http://blog.csdn.net/hazir/article/details/17023255)，教程都比较详细，分析修改源码的身份验证逻辑，这里省去分析部分，直接修改它的二进制代码。

下载[HxD](http://mh-nexus.de/en/downloads.php?product=HxD),一款免费的16进制磁盘编辑器。

用HxD打开MarkdownPad2.exe，Ctrl+F选择十六进制，查找`2C 02 16 2A 02 02 03`,修改`16`为`17`，注意不要按Backspace删除再修改，这样会提示改变文件大小，直接光标在`1`后按个`7`会自动覆盖`6`，保存即可。如图：

![MarkdownPad2破解](/img/markdown破解.jpg)

。


