---
layout: post
category : LeetCode
tagline: "k在数组中可能的组合，可以重复使用元素"
tags : [LeetCode，面试，组合，递归]
---
{% include JB/setup %}

<h4>{{page.title|remove_first:'Leetcode之'}}</h4>


> Given a set of candidate numbers (C) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.
>
The same repeated number may be chosen from C unlimited number of times. 
>For example, given candidate set 2,3,6,7 and target 7,
A solution set is:
`[7]`
`[2, 2, 3]`

>要求：不能有重复组合，组合中元素升序排列。 

解法：解法是递归，这里有些技巧，

1. 先将数组进行排序，这样会方便许多。
2. 比如当tar为0是，返回一个List集合，集合中要有一个空的List。
3. 标记当前查找的位置，每次只从当前位置向后找，因为数组是有序的，这样能保证不会有重复的组合以及数组会升序排列。

这题与后一题不同，这题数组中的元素是不会重复的。

代码如下：
		
	//{java}
	public class Solution {
	    public List<List<Integer>> combinationSum(int[] c, int tar) {
	        Arrays.sort(c);
	        return slove(c,tar,0);
	        
	    }
   
	    //c中不会有重复元素
	     public List<List<Integer>> slove(int[] c, int tar,int position) {
	         List<List<Integer>> re = new ArrayList<List<Integer>>();
	        if(tar==0)
	            re.add(new ArrayList<Integer>());
	        for(int i=position;i<c.length&&c[i]<=tar;i++)
	        {
	            List<List<Integer>> ll = slove(c,tar-c[i],i);
	             for(List<Integer> l:ll)
	            {
	                 l.add(0,c[i]);
	                re.add(l);
	            }
	        }
	        return re;
	     }
	}