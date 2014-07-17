---
layout: post
category : LeetCode
tagline: "正则表达式匹配2"
tags : [LeetCode,面试,正则匹配,贪心,递归]
---
{% include JB/setup %}

<h4>{{page.title|remove_first:'Leetcode之'}}</h4>

> Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
>
>For example,
Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6. 

![img/leetcode_TrappingRainWater.png](img/leetcode_TrappingRainWater.png)

解法：被虐了，一种比较好理解的方法是，用`S[i]`标记第`i`列能放多少水。他取决与`i`之前的最大高度和`i`之后的最大高度，则至少需要开辟一个数组来存一侧的最大高度。然后遍历另一侧时顺便求解。

另外一种方法是Discuss中的，两个游标，一个从前遍历，一个从后遍历，记录总的水量、总的水量中黑块的个数、当前的Level。算水量时把黑块部分也计算在内，以后再减。

空间复杂度为常量,代码如下：
		
	//{java}
	public class Solution {
	    public int trap(int[] A) {
	        if(A.length==0)
	            return 0;
	        int block=0,all=0,level=0,s=0,e=A.length-1;
	        while(s<=e)
	        {
	            int t = min(A[s],A[e]);
	            if(t>level)
	            {
	                all+=(t-level)*(e-s+1);
	                level=t;
	            }
	            if(A[s]<A[e])
	                block+=A[s++];
	            else
	                block+=A[e--];
	        }
	        return all-block;
	    }
	    
	    public int min(int a,int b)
	    {
	        return a>b?b:a;
	    }
	}