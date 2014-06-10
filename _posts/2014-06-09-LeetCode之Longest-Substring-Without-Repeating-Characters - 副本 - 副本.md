---
layout: post
category : LeetCode
tagline: "求连续最长非重复子串"
tags : [LeetCode，面试，最长子串，非重复]
---
{% include JB/setup %}

膜拜燊爷，秒解。



<h4 id="LongestSubstringWithoutRepeatingCharacters">Longest Substring Without Repeating Characters</h4>

>Given a string, find the length of the longest substring without repeating characters. For example, the longest substring without repeating letters for "abcabcbb" is "abc", which the length is 3. For "bbbbb" the longest substring is "b", with the length of 1.

跟我没有任何关系，我还在想纠结怎么遍历，不小心把题目告诉了燊爷，然后被妙解，有种被剧透的感觉。

解法：两个游标s与e，e移动并且标记哪些字符已经出现，若str[e]已经出现过，移动s并擦除对应字符的标记。maxSubLength肯定在e移动时出现过了。算法复杂度`O(n)`。

代码如下：

	//{java}
	public class Solution {
	    public static int lengthOfLongestSubstring(String s) {
	        int begin=0,end=0;
	        int flag[] = new int[256];
	        int max=0;
	       while(end<s.length())
	       {
	           if(flag[s.charAt(end)]==0)
	           {
	               flag[s.charAt(end)]++;
	               end++;
	               max=(end-begin)>max?(end-begin):max;
	           }
	           else
	           {
	               flag[s.charAt(begin)]--;
	               begin++;
	           }
	       }
	       return max;
	    }
	
	    public static void main(String s[])
	    {
	    	System.out.println(lengthOfLongestSubstring("wlrbbmqbhcdarzowkkyhiddqscdxrjmowfrxsjybldbefsarcbynecdyggxxpklorellnmpapqfwkhopkmco"));
	    }
	}















