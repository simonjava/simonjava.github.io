---
layout: post
category : LeetCode
tagline: "正则表达式匹配2"
tags : [LeetCode，面试，正则匹配，贪心，递归]
---
{% include JB/setup %}

<h4>{{page.title|remove_first:'Leetcode之'}}</h4>

>Implement wildcard pattern matching with support for `?` and `*`.
>


	'?' Matches any single character.
	'*' Matches any sequence of characters (including the empty sequence).
	
	The matching should cover the entire input string (not partial).
	
	The function prototype should be:
	bool isMatch(const char *s, const char *p)
	
	Some examples:
	isMatch("aa","a") → false
	isMatch("aa","aa") → true
	isMatch("aaa","aa") → false
	isMatch("aa", "*") → true
	isMatch("aa", "a*") → true
	isMatch("ab", "?*") → true
	isMatch("aab", "c*a*b") → false
 

解法：这题与之前[那题](#)类似，区别是这题搜索量更大，用递归会TLE。AC的是贪心的代码，抄的[这篇文章](http://blog.csdn.net/shiquxinkong/article/details/28104547)。难处就是处理`*`的情况，这里用的方法是，遍历`S`，与`P`，尽量匹配(匹配`P`中越多字符越好)，记录不匹配时是否可以回溯，两个游标分别该回溯到哪个位置。

1. 如`abcdcdcda`与`a*cdcda`比较。
2. 当`abcdcd c da`与`a*cdcd a `不匹配时，`S`串应该回溯到`abc d cdcda`,`P`串应该回溯到`a* c dcda`。
3. 继续比较还是不匹配，`S`串应该回溯到`abcd c dcda`,`P`串应该回溯到`a* c dcda`。
4. `P`一直回溯到原来位置，因为`P`中字符总是要被全部匹配的。

代码如下：贪心
		
	//{java}
	public class Solution {
	    public boolean isMatch(String s, String p) {
	        int bs=-1,bp=-1;
	        int is=0,ip=0;
	        while(is<s.length())
	        {
	            if(ip<p.length() && (s.charAt(is)==p.charAt(ip) || p.charAt(ip)=='?') )
	            {
	                is++;
	                ip++;
	            }else
	            {
	                if(ip<p.length()&&p.charAt(ip)=='*')
	                {
	                    while(ip<p.length() && p.charAt(ip)=='*')
	                        ip++;
	                    bp=ip;
	                    bs=is;
	                }else
	                {
	                    if(bp==-1)
	                        return false;
	                    else
	                    {
	                        is=++bs;
	                        ip=bp;
	                    }
	                }
	            }
	        }
	        while(ip<p.length() && p.charAt(ip)=='*')
	                    ip++;
	        return is==s.length() && ip==p.length();
	    } 
	}

递归代码，会超时:

	//{java}
	public class Solution {
	    public boolean isMatch(String s, String p) {
	        int sl = s.length();int pl=p.length();
	        if(pl==0)
	            return sl==0;
	        if(p.charAt(0)!='?' && p.charAt(0)!='*')
	            return sl>0&&p.charAt(0)==s.charAt(0) && isMatch(s.substring(1,sl),p.substring(1,pl));
	        if(p.charAt(0)=='?')
	            return sl>0&&isMatch(s.substring(1,sl),p.substring(1,pl));
	        if(p.charAt(0)=='*')
	        {
	            if(sl>0&&isMatch(s.substring(1,sl),p))
	                return true;
	        }
	        return isMatch(s,p.substring(1,pl));
	        
	    }
	}