---
layout: post
category : LeetCode
tagline: "正则表达式匹配2"
tags : [LeetCode,面试,正则匹配,贪心,递归]
---
{% include JB/setup %}

<h4>{{page.title|remove_first:'Leetcode之'}}</h4>

>I Given an array of non-negative integers, you are initially positioned at the first index of the array.
>
>Each element in the array represents your maximum jump length at that position.
>
>Your goal is to reach the last index in the minimum number of jumps.
>
>For example:
Given array `A = [2,3,1,1,4]`
>
>The minimum number of jumps to reach the last index is `2`. (Jump 1 step from index `0` to `1`, then `3` steps to the last index.) 
 

解法：一开始想了是`O(n^2)`的算法，用`flag[i]`来记录从`i`到末尾的最小步数，然后从后往前填充`flag[i]`，算法TLE。

之后想了一种用`flag[i]`来表示第`i`步能到达的最远距离，遍历数组，如遍历到元素`j`，找出能到达`j`的最小步数，用来更新`flag[i+1]`。思想是对的，算法不够优化。

代码如下：能AC
		
	//{java}
	public class Solution {
	    public int jump(int[] A) {
	        if(A.length==1)
	            return 0;
	        int flag[] = new int[A.length];
	        flag[A.length-1]=0;
	        flag[1]=A[0];
	        int max=1;
	        for(int i=1;i<A.length-1;i++)
	        {
	            int j=1;
	            for(j=1;j<=max;j++)
	            {
					//第j步就可以到达i
	                if(flag[j]>=i)
	                {
	                    break;
	                }
	            }
				//j+1步最远能到哪？
	            if(i+A[i]>flag[j+1])
	            {
	                flag[j+1]=i+A[i];
	                if(j+1>max)
	                    max=j+1;
	            }
	        }
	        for(int i=1;i<A.length;i++)
	            if(flag[i]>=A.length-1)
	                return i;
	        return 0;
	    }
	}

之后想到了一种`O(n)`的方法，遍历数组，每次只遍历只有第`i`步才能到点，如`1231221`，第一次遍历`1`,第二次遍历`2`，第三次遍历`31`，第四次遍历`122`,再走一步即可到末尾，总共需要4步。即每次只遍历到上一次遍历时更新的最大距离处。`O(n)`算法。

代码如下：

	//{java}
	public class Solution {
	    public int jump(int[] A) {
	        if(A.length==1)
	            return 0;
	        int step=0;
	        int last_max=0;
	        int max=0;
	        while(max<A.length-1)
	        {
	            int t =max;
	            for(int i=last_max;i<=t&&i<A.length-1;i++)
	            {
	                if(i+A[i]>max)
	                {
	                    max=i+A[i];
	                }
	            }
	            last_max=t+1;
	            step++;
	        }
	        return step;
	    }
	}

代码写得显得有些繁琐，Discuss中有人贴出了更简洁的代码。思想是一样的。

	//{java}
	public class Solution {
	    public int jump(int[] A) {
	        int step=0;
	        int last_max=0;
	        int max=0;
	        for(int i=0;i<A.length;i++)
	        {
	            if(i>last_max)
	            {
	                last_max=max;
	                step++;
	            }
	            max=Math.max(i+A[i],max);
	        }
	        return step;
	    }
	}