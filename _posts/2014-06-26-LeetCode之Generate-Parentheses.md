---
layout: post
category : LeetCode
tagline: "括号所有组合"
tags : [LeetCode，面试，组合穷举，括号组合，递归]
---
{% include JB/setup %}

<h4 id="Generate-Parentheses">Generate Parentheses</h4>

> Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
>
>For example, given n = 3, a solution set is:
>
	"((()))", "(()())", "(())()", "()(())", "()()()" 


解法：穷举组合问题，使用递归。`(())(())`这种情况很容易漏掉。

代码如下：
		
	//{java}
	public class Solution {
	    public List<String> generateParenthesis(int n) {
	        List<String> ls = new ArrayList<String>();
	        if(n==0)
	        {
	            ls.add("");
	            return ls;
	        }
	        Set<String> set = new HashSet<String>();
	        for(String temp:generateParenthesis(n-1))
	        {
	            set.add("()"+temp);
	            set.add(temp+"()");
	            for(int i=0;i<temp.length();i++)
	            {
	                if(temp.charAt(i)=='(')
	                {
	                    set.add(temp.substring(0,i+1)+"()"+temp.substring(i+1,temp.length()));
	                }
	            }
	        }
	        ls.addAll(set);
	        return ls;
	    }
	}