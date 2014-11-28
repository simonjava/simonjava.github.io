---
layout: post
category : android开发
tagline: "工作记录"
tags : [工作,android,EditText]
---
{% include JB/setup %}

<h4>{page.title}</h4>

在自定义的EditText中定义`sigleline=true`,`onDraw`方法画出来的东西不显示。。。奇怪，不明白原因。

EditText 中获得焦点，会不停的onDraw来实现光标一闪一闪的效果，结果在里面画边框有时会失效。还是用多个`view`模拟边框或者问设计师要个背景图。

另今天接触动态布局`view.setLayoutParams(lp)`可使动态布局立马生效，非常好用。

布局，同一Activity，有多个步骤的界面，如注册流程。到底是用一套部件，改参数。还是用多套部件，设置可见性。我觉得后一种更好一些。ok，明天来改。


