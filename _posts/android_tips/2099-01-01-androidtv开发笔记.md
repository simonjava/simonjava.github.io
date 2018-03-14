---
layout: post
category : android开发
tagline: "工作记录"
tags : [工作,android,View,Measure]
---
{% include JB/setup %}

<h4>{{page.title}}</h4>


1. `android:clipChildren` 该属性控制Android的一个子view是否运行超越父控件边界放置。Android系统默认赋予该属性值是true，即不允许超越所在父布局的边界。如果设置为false，则表示允许该子view超越父布局的边界。

2. clipToPadding就是说控件的绘制区域是否在padding里面的，true的情况下如果你设置了padding那么绘制的区域就往里缩，clipChildren是指子控件是否超过padding区域，这两个属性默认是true的

3. view.bringChildToFront 将view的层级变得最高，默认有个remove 和 add 的过程

4. getChildDrawingOrder 可以修改默认的view绘制顺序。

5.  只有focus的view才有资格参与KeyEvent的处理.

一个view有资格获得focus的前提是isFocusable()方法返回true，你可以通过setFocusable(boolean)方法来设置它。另外当在touch mode下的时候，还
需要isFocusableInTouchMode()也返回true，你也可以通过setFocusableInTouchMode(boolean)来设置它。

focus的移动是基于这样的算法，它尝试在某个给定的方向上找最临近的view，设置它为新的focus。在极个别情况，如果默认的算法不符合你的需求，你也可以
在xml布局文件中通过显式指定nextFocusDown/Left/Right/Up这些属性来表明focus移动的顺序。在运行时刻，你也可以通过调用
View.requestFocus()方法来动态地让某个view获得focus。

6. View.dispatchKeyEvent. KeyEvent的派发就是在view层次结构的focus path上自上而下发生的 .
 关于焦点的情况，这篇文章讲得很好，http://www.cnblogs.com/xiaoweiz/p/3812906.html 。 focus 链路。

7.   beforeDescendants：viewgroup会优先其子类控件而获取到焦点

        afterDescendants：viewgroup只有当其子类控件不需要获取焦点时才获取焦点

        blocksDescendants：viewgroup会覆盖子类控件而直接获得焦点


8. hasFocus() //视图 以及他的子孙 是否已经获得了焦点 focus 调用链。
hasFocusable() // 是否有获取焦点的能力
 isFocused() // 自己是否获得焦点
  isFocusable()