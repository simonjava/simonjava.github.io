---
layout: post
category : LeetCode
tagline: "和为0的3个数"
tags : [LeetCode，面试，和为k的n个数]
---
{% include JB/setup %}

<h4 id="Two-Sum">Two Sum</h4>

>Given an array of integers, find two numbers such that they add up to a specific target number.

>The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.

>You may assume that each input would have exactly one solution.

>Input: numbers={2, 7, 11, 15}, target=9
>Output: index1=1, index2=2 

解法：最普通的解法就是两层循环遍历，但是会`O(n^2)`会超时,好一点就是排序后二分查找复杂度是`O(nlogn)`。可以先将数组中数和索引存到HashMap中，然后再遍历查找，如果数组里有重复的数字，要找到所有的这些数的索引，则要将这些索引都当做value存到HashMap中。

补：这题是只有唯一解，如果不只有唯一解呢，则不用`break`。这只是两数求和，元素重复问题暂时不用考虑，如`{2,1,3} target=4`，则`2+2=4`应该是不符合解的要求的，有两个`2`了，这里可能需要些额外判断，即不能是同一个元素。

	//{java}
	public class Solution {
	    public int[] twoSum(int[] numbers, int target) {
	        Map<Integer,Integer> map = new HashMap<Integer,Integer>();
	        for(int i=0;i<numbers.length;i++)
	        {
	          map.put(numbers[i],i);
	        }
	         for(int i=0;i<numbers.length;i++)
	        {
	          if(map.containsKey(target-numbers[i]))
	          {
	              int k = map.get(new Integer(target-numbers[i]));
	              if(i!=k)
	              return i<k?new int[]{i+1,k+1}:new int[]{k+1,i+1};
	          }
	        }
	        return null;
	    }
	}


























