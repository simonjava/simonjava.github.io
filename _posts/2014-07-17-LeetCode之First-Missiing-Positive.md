---
layout: post
category : LeetCode
tagline: "找第一个丢失的正整数"
tags : [LeetCode，面试，标记，花式技巧]
---
{% include JB/setup %}

<h4>{{page.title|remove_first:'Leetcode之'}}</h4>


> G Given an unsorted integer array, find the first missing positive integer.
>
>For example,
Given `[1,2,0]` return `3`,
and `[3,4,-1,1]` return `2`.
>
>Your algorithm should run in `O(n)` time and uses constant space. 

解法：太花哨了，这题不能额外开辟线性空间，要想做标记，只能利用自身空进啊。

之前没看清题目以为是要找一个连续数组中缺失的那个数（这样用sum）。这题主要思想就是，如果一个数在可能丢失的数的范围内（即大于0，小于A.length），那么就把它放在正确的位置上。

虽然代码看起来像嵌套两重循环，复杂度像`O(n^2)`,但是交换操作最多发生`n-1`次（因为每次交换都至少有一个会回到自己的位置上）。加上最后一次遍历数组找到丢失的数，总的复杂度为`O(3*n)`。

还看到一种解法，将一个数乘以`-1`当做出现过的标记，好机智。

代码如下：
		
	//{java}
	public class Solution {
	    public int firstMissingPositive(int[] A) {
	        if(A.length==0)
	        return 1;
	        for(int i=0;i<A.length;i++)
	        {
	            //Need swap
	            while(A[i]>0&&A[i]<=A.length)
	            {
	                //应该出现的位置
	                int j=A[i]-1;
	                if(A[j]!=A[i])//=j+1
	                {
	                    int t=A[j];
	                    A[j]=A[i];
	                    A[i]=t;
	                }
	                else
	                    break;
	            }
	        }
	        int i=0;
	        for(i=0;i<A.length;i++)
	        {
	            if(A[i]!=i+1)
	            {
	               break;
	            }
	        }
	        return i+1;
	    }
	}