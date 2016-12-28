---
layout: post
category : LeetCode
tagline: "旋转有序数组的二分查找问题"
tags : [LeetCode，面试，二分查找，有序数组，旋转]
---
{% include JB/setup %}

<h4>{{page.title|remove_first:'Leetcode之'}}</h4>


>Suppose a sorted array is rotated at some pivot unknown to you beforehand.
>
(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
>
>You are given a target value to search. If found in the array return its index, otherwise return -1.
>
>You may assume no duplicate exists in the array.

解法：哎，不好干啊。思想肯定是二分的思想，二分主要就是取哪一边的问题。分析见代码注释。


代码如下：
		
	//{java}
	public class Solution {
	    public int search(int[] A, int target) {
	        int s=0,e=A.length-1;
	        while(s<=e)
	        {
	            int t=(s+e)/2;
	            if(A[t]==target)
	            return t;
	            if(A[t]<target)
	            {
	                if(A[t]>A[e])
					//说明旋转点在t-e之间，要找的值肯定也在其中
	                {
	                     s=t+1;
	                }
					//旋转点不在t-e之间，要找的数可能在t-e之间，也可能在s-t之间。t-e之间的数肯定是升序排列，判断target是否可能在t-e之间。
	                else if(A[e]>=target)
	                {
					
	                    s=t+1;
	                }
	                else
	                {
	                    e=t-1;
	                }
	            }
	            else if(A[t]>target)
	            {
	               if(A[t]<A[s])
	                {
	                     e=t-1;
	                }
	                else if(A[s]<=target)
	                {
	                    e=t-1;
	                }
	                else
	                {
	                    s=t+1;
	                } 
	            }
	        }
	        return -1;
	    }
	}