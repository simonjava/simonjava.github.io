---
layout: post
category : LeetCode
tagline: "利用map，特殊要求的字符串比较"
tags : [LeetCode，面试，map，字符串比较]
---
{% include JB/setup %}

<h4>{{page.title|remove_first:'Leetcode之'}}</h4>


>Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
>
>If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
>
>The replacement must be in-place, do not allocate extra memory.
>
>Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
`1,2,3 → 1,3,2`
`3,2,1 → 1,2,3`
`1,1,5 → 1,5,1`

解法：不好干啊，推了半天，终于一次性AC。数组的后方`i`开始搜索（后方是一个降序数组），在`i`的后方找到比`num[i]`大的最小的数（在降序数组中找大于`num[i]`的最小的数，可以二分找更快），交换。交换后`i`以后元素仍然是一个降序的排列。然后转置该部分元素。

代码如下：
		
	//{java}
	public class Solution {
	    public void nextPermutation(int[] num) {
	        int i,j;
	        waiceng:
	        for(i=num.length-2;i>=0;i--)
	        {
				//这里直接从数组最小的元素开始找，二分找应该更快
	            for(j=num.length-1;j>i;j--)
	            {
	                if(num[i]<num[j])
	                {
	                    int t = num[i];
	                    num[i]=num[j];
	                    num[j]=t;
	                    break waiceng;
	                }
	            }
	        }
	        int s = i+1;int e=num.length-1;
	        while(s<e)
	        {
	            int t = num[s];
	            num[s]=num[e];
	            num[e]=t;
	            s++;e--;
	        }
	    }
	}


//搜索元素部分替换成二分
	
	//{java}
	public class Solution {
	    public void nextPermutation(int[] num) {
	        int i,j;
	        waiceng:
	        for(i=num.length-2;i>=0;i--)
	        {
	            int s=i+1,e=num.length-1;
	            while(s<=e-1)
	            {
	                int t =(s+e+1)/2;
	                if(num[t]>num[i])
	                    s=t;
	                else
	                    e=t-1;
	            }
	            if(num[e]>num[i])
	            {
	                int t = num[i];
	                num[i]=num[e];
	                num[e]=t;
	                break;
	            }
	        }
	     
	        int s = i+1;int e=num.length-1;
	        while(s<e)
	        {
	            int t = num[s];
	            num[s]=num[e];
	            num[e]=t;
	            s++;e--;
	        }
	    }
	}