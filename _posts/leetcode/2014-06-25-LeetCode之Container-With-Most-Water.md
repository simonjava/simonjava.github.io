---
layout: post
category : LeetCode
tagline: "双向遍历数组"
tags : [LeetCode，面试，数组，双向遍历]
---
{% include JB/setup %}

<h4 id="Container-With-Most-Water">Container With Most Water</h4>

>Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water. 

解法：这题没有弄出来，这题目的是找最大的`(j-i)*min(height[i],height[j])`。两头双向遍历，这里保证`j-i`从最大不断减小，使`min(height[i],height[j])`逐渐增大，能保证最大的目标值能在遍历过程中出现过。加入目前`height[i]>height[j]`,这时`height[j]`是瓶颈，则要移动`j`，移动`i`只会使值越来小。

代码如下：
	
	//{java}
	public class Solution {
	    public int maxArea(int[] height) {
	        int max=0;
	        int i=0,j=height.length-1;
	        while(i<j)
	        {
	            int min = Math.min(height[i],height[j]);
	             max=Math.max(max,(j-i)*min);
	            if(height[i]<height[j])
	            {
	                i++;
	            }else
	            {
	                j--;
	            }
	           
	        }
	        return max;
	    }
	}