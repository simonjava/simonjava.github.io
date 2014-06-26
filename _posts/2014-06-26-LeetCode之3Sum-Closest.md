---
layout: post
category : LeetCode
tagline: "和最接近k的3个数"
tags : [LeetCode，面试，和最接近k的n个数]
---
{% include JB/setup %}

<h4 id="3Sum-Closest">3Sum Closest</h4>

>Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
>
>Note:
>
     For example, given array S = {-1 2 1 -4}, and target = 1.
>
    The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

解法：和3Sum那题类似，这题还限制了很只有一个解。第一种解法，复杂度`O(n^2logn)`，先对数组进行排序，，确定前两个数，对第三个数使用二分查找。去重，因为已经排过序，相同的数只需确定搜索其中一个即可。

代码如下：
		
	//{java}
	public class Solution {
	    public int threeSumClosest(int[] num, int target) {
		        Arrays.sort(num);
		        int numl=num.length;
		        int close = target-99999;
		        for(int i=0;i<numl-2;i++)
		        {
		        	for(int j=i+1;j<numl-1;j++)
		        	{
		        		int t = findcloseX(num,j+1,numl-1,target-num[i]-num[j]);
		        		 close=closeX(num[i]+num[j]+t,close,target);
		        	}
		        }
		        return close;
		}
		
		public int findcloseX(int num[],int s,int e,int x)
		{
			while(s+1<e)
			{
				int t = num[(s+e)/2];
				if(t>x)
				{
					e=(s+e)/2;
				}else if(t<x)
				{
					s=(s+e)/2;
				}
				else
				{
					return t;
				}
			}
			return closeX(num[s],num[e],x);
		}
		
		public int closeX(int a,int b,int x)
		{
		    return Math.abs(a-x)>Math.abs(b-x)?b:a;
		}
	}

第二种解法，在有序数组中求和最接近k的两个数是一个线性时间，算法的时间复杂度是`O(n)`，就是一个双向遍历过程。(**在数组中查找符合某一条件的元素，首先应该想到双向、二分等**)。

代码如下：

	//{java}
	public class Solution {
	    public int threeSumClosest(int[] num, int target) {
		        Arrays.sort(num);
		        int numl=num.length;
		        int close = target-99999;
		        for(int i=0;i<numl-2;i++)
		        {
		        	int be=i+1, end=numl-1;
		        	int ta=target-num[i];
		        	while(be<end)
		        	{
		        	    if(num[be]+num[end]>ta)
		        	    {
		        	        end--;
		        	    }else if(num[be]+num[end]<ta)
		        	    {    
	    	        	    be++;
		        	    }
		        	    else
		        	    {
		        	        return target;
		        	    }
						close=closeX(num[i]+num[be+1]+num[be],close,target);
		        	}
		        }
		        return close;
		}
		
		public int closeX(int a,int b,int x)
		{
		    return Math.abs(a-x)>Math.abs(b-x)?b:a;
		}
	}