---
layout: post
category : LeetCode
tagline: "二分查找的变种"
tags : [LeetCode，面试，查找，二分]
---
{% include JB/setup %}

<h4>{{page.title|remove_first:'Leetcode之'}}</h4>


> Given a sorted array of integers, find the starting and ending position of a given target value.
>
>Your algorithm's runtime complexity must be in the order of O(log n).
>
>If the target is not found in the array, return `[-1, -1]`.
>
>For example,
Given `[5, 7, 7, 8, 8, 10]` and target value 8,
return `[3, 4]`. 

解法：这题先看看这个数能不能找到，如果能找到的话，再找出他的左右边界，找边界也是可以二分查找的。

代码如下：
		
	//{java}
	public class Solution {
	    public int[] searchRange(int[] A, int target) {
	        int s=0,e=A.length-1,t=0;
	        while(s<=e)
	        {
	            t =(s+e)/2;
	            if(A[t]==target)
	            {
	                int left = findLeftBound(A,target,t-1);
	                int right = findRightBound(A,target,t+1);
	                return new int[]{left,right};
	            }
	            if(A[t]<target)
	                s=t+1;
	            else
	                e=t-1;
	        }
	        return new int []{-1,-1};
	    }
	    public int findLeftBound(int[] A, int target, int e)
	    {
	        int s=0;
	        while(s<=e)
	        {
	            int t =(s+e)/2;
	            if(A[t]==target)
	                e=t-1;
	            else
	                s=t+1;
	        }
	        return s;
	    }
	    
	     public int findRightBound(int[] A, int target, int s)
	    {
	        int e=A.length-1;
	        while(s<=e)
	        {
	            int t =(s+e)/2;
	            if(A[t]==target)
	                s=t+1;
	            else
	                e=t-1;
	        }
	        return e;
	    }
	}