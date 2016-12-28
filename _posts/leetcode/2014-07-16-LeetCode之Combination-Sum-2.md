---
layout: post
category : LeetCode
tagline: "k在数组中可能的组合，不能重复使用元素"
tags : [LeetCode，面试，组合，递归]
---
{% include JB/setup %}

<h4>{{page.title|remove_first:'Leetcode之'}}</h4>


>  Given a collection of candidate numbers (C) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.
>
Each number in C may only be used once in the combination. 
>
>For example, given candidate set `10,1,2,7,6,1,5` and target `8`,
A solution set is:
`[1, 7]`
`[1, 2, 5]`
`[2, 6]`
`[1, 1, 6]` 

>要求：不能有重复组合，组合中元素升序排列。 

解法：解法大致与前一题类似。需要注意的是。但这题与前一题不同，这题数组中的元素是是会重复的。如果是用完一个数，直接从他的下一个数开始搜，有可能会有重复组合。
如`[1,1,1,1] and target=3`，得出的结果就是`[1,1,1],[1,1,1]`。
这里需要做些限制即可，在同一个层次的搜索中，相同的数只会被用来搜索一次。

代码如下：
		
	//{java}
	public class Solution {
	    public List<List<Integer>> combinationSum2(int[] c, int tar) {
	        Arrays.sort(c);
	        return slove(c,tar,0);
	        
	    }
	    
	    //c中可能有重复元素
	     public List<List<Integer>> slove(int[] c, int tar,int position) {
	         List<List<Integer>> re = new ArrayList<List<Integer>>();
	        if(tar==0)
	            re.add(new ArrayList<Integer>());
	        for(int i=position;i<c.length&&c[i]<=tar;i++)
	        {
	            if(i!=position && c[i]==c[i-1])
	                continue;
	            List<List<Integer>> ll = slove(c,tar-c[i],i+1);
	             for(List<Integer> l:ll)
	            {
	                 l.add(0,c[i]);
	                re.add(l);
	            }
	        }
	        return re;
	     }
	   
	}