---
layout: post
category : LeetCode
tagline: "去除有序数组中的重复元素"
tags : [LeetCode，面试，数组，，重复元素，去除]
---
{% include JB/setup %}

<h4 id="Remove-Duplicates-from-Sorted-Array
">Remove Duplicates from Sorted Array
</h4>
 
>Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.
>
>Do not allocate extra space for another array, you must do this in place with constant memory.
>
>For example,
Given input array `A = [1,1,2]`,
>
>Your function should return `length = 2`, and A is now `[1,2]. `

解法：`O(n)`算法,记录当前非重复元素的个数，调整索引赋值即可。

代码如下：
		
	//{java}
	public class Solution {
	    public int removeDuplicates(int[] A) {
	        int k = 0;
	        for(int i=0;i<A.length;i++)
	        {
	            if(i!=0&&A[i]==A[i-1])
	            {
	               k++;
	            }
	            A[i-k]=A[i];
	        }
	        return A.length-k;
	    }
	}