---
layout: post
category : LeetCode
tagline: "求最长回文子串"
tags : [LeetCode，面试，最长子串，回文]
---
{% include JB/setup %}

<h4 id="Longest-Palindromic-Substring">Longest Palindromic Substring</h4>

>Given a string S, find the longest palindromic substring in S. You may assume that the maximum length of S is 1000, and there exists one unique longest palindromic substring.



解法：O(n^2)算法，假设每个点为中心，算出以这个点为中心的最长回文子串。要考虑`XyX`和`XX`两种情况。

O(n)算法，[manacher 算法](http://leetcode.com/2011/11/longest-palindromic-substring-part-ii.html?replytocom=13142) 以后补充。

	//{java}
	//O(n^2)
	public class Solution {
	    public String longestPalindrome(String s) {
	        int max1=0,a1=0,max2=0,a2=-1;
	        for(int a=0;a<s.length();a++)
	        {
	            int i=0;
	            while(a-i>=0 && a+i<s.length())
	            {
	                if(s.charAt(a-i)==s.charAt(a+i))
	                {
	                    i++;
	                }else
	                {
	                    break;
	                }
	            }
	           if(i-1>max1)
	           {
	               max1=i-1;
	               a1=a;
	           }
	        }
	        
	        for(int a=0;a<s.length()-1;a++)
	        {
	            if(s.charAt(a)==s.charAt(a+1))
	            {
	                int i=0;
	                while(a-i>=0&&a+1+i<s.length())
	                {
	                    if(s.charAt(a-i)==s.charAt(a+i+1))
	                    {
	                        i++;
	                    }else
	                    {
	                        break;
	                    }
	                }
	                if(i-1>=max2)
	                {
	                    max2=i-1;
	                    a2=a;
	                }
	            }
	        }
	        int n1=0,n2=0;
	        n1=1+max1*2;
	        if(a2!=-1)
	            n2=2+max2*2;
	        if(n1>n2)
	            return s.substring(a1-max1,a1+max1+1);
	        else
	            return s.substring(a2-max2,a2+1+max2+1);
	        
	    }
	}
