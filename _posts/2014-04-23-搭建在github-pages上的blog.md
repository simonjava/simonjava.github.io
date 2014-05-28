---
layout: post
category : 静态网页框架
tagline: "博客搭建"
tags : [github pages,disqus,jeklly,prism,mathjax,blog,simonjava]
---
{% include JB/setup %}

>什么问题问聪神，总能得到最好的答案。

今天就问了他如何创建个人blog比较好，他就跟我推荐了这个。目前感觉优点很多，是非常灵活，可以加上各种插件，免费，不用担心数据遗失。默认的域名也不错，可以提升逼格，文件就保存在github里面，所以也支持回滚（虽然我觉得应该不常用），缺点就是难道以后我都用记事本写博客，那要粘贴图片代码什么的怎么办，也没有即视功能，不过用熟了应该蛮爽的。

<p>怎么安装就不说了，google github blog就能出来，我说说我安装过程中遇到的问题。
	<ul>
		<li>
		1.不好调试，你也不知道你的提交文件格式对不对。这里可以到网站的Setting中GitHub Pages中看到部分信息，如果是提示10分钟后就可见，说明模板格式没有问题。
		</li>
		<li>
		2.确保你的提交的文本时utf-8格式。我直接从网上复制的模板下来我的文本编辑器默认格式是ANSI格式的。
		</li>
	</ul>
</p>
<p>另外，我利用disqus托管了评论功能，非常方便。</p>
<pre class="prettyprint">

class Test
{
	public static void main(String []args)
	{
		System.out.println("使用google-code-prettify进行code hignlight..出界了");
	}
}
</pre>
<p>
今天就先用这个简单模板写一篇。
</p>
<p>{{ page.date | date_to_string }}</p>

 ~~ 是 ~~