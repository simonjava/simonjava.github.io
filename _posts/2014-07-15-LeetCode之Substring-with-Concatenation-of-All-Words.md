---
layout: post
category : LeetCode
tagline: "利用map，特殊要求的字符串比较"
tags : [LeetCode，面试，map，字符串比较]
---
{% include JB/setup %}

<h4>{{page.title|remove_first:'Leetcode之'}}</h4>


> You are given a string, S, and a list of words, L, that are all of the same length. Find all starting indices of substring(s) in S that is a concatenation of each word in L exactly once and without any intervening characters.
>
>For example, given:
>
>S: `"barfoothefoobarman"`
>L: `["foo", "bar"]`
>
>You should return the indices: `[0,9]`.
>(order does not matter). 

解法：这题没想出来，一直陷入KMP中无法自拔，主要不好解决的地方在于`L`中的字符串可以是重复的，否则可以直接用标记出来。

这题的题解使用`HashMap`处理的。遍历`S`的可能满足条件部分，因为L中字符串长度确定，用`cur`记录单词出现的次数，并和标准的`map`做比较。

代码如下：
		
	//{java}
	public class Solution {
	    public List<Integer> findSubstring(String S, String[] L) {
	      HashMap<String,Integer> map = new HashMap<String,Integer>();
	      List<Integer> result = new ArrayList<Integer>();
	      for(String l:L)
	      {
	          if(map.get(l)==null)
	            map.put(l,1);
	          else
	            map.put(l,map.get(l)+1);
	      }
	      int ll = L[0].length();
	      for(int i=0;i<S.length()-ll*L.length+1;i++)
	      {
	          int j=0;
	          HashMap<String,Integer> cur = new HashMap<String,Integer>();
	          for(j=0;j<L.length;j++)
	          {
	              String l = S.substring(j*ll+i,j*ll+i+ll);
	              if(cur.get(l)==null)
	                cur.put(l,1);
	              else
	                cur.put(l,cur.get(l)+1);
	              if(map.get(l)==null||cur.get(l)>map.get(l))
	                break;
	          }
	          if(j==L.length)
	            result.add(i);
	      }
	      return result;
	    }
	    public static void main(String a[])
	    {
	    	System.out.println(new Solution().findSubstring("barfoothefoobarman",new String[]{"foo","bar"}));
	    }
	}