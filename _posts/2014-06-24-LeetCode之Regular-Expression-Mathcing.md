---
layout: post
category : LeetCode
tagline: "正则表达式匹配"
tags : [LeetCode，面试，正则表达式，递归]
---
{% include JB/setup %}

<h4 id="Regular-Expression-Matching">Regular Expression Matching</h4>

>
Implement regular expression matching with support for ‘\.’ and ‘*’.

	'.' Matches any single character.
	'*' Matches zero or more of the preceding element.

	The matching should cover the entire input string (not partial).
		
	The function prototype should be:
	bool isMatch(const char *s, const char *p)
		
	Some examples:
	isMatch("aa","a") → false
	isMatch("aa","aa") → true
	isMatch("aaa","aa") → false
	isMatch("aa", "a*") → true
	isMatch("aa", ".*") → true
	isMatch("ab", ".*") → true
	isMatch("aab", "c*a*b") → true


解法：这里的匹配是指两者完全匹配。如果没有`*`那么问题很简单。
如果`p[1]!='*'`,`s`与`p`的匹配结果取决于`s[0]==p[0] && isMatch(s+1,p+1)`。
如果`p[1]=='*'`,如果`s[0]!=p[0]`，结果取决于`isMatch(s,p+2)`。
如果`s[0]==p[0]`，结果取决于<del>`isMatch(s,p+2)||isMatch(s+1,p)||isMatch(s+1,p+2)`</del>取决于`isMatch(s,p+2)||isMatch(s+1,p)`。

代码如下：
	
	//{java}
    public boolean isMatch(String s, String p) {
         int sl = s.length();int pl=p.length();
         if(pl==0)
            return sl==0;
         if(pl<2||p.charAt(1)!='*')
         {
             return sl>0&&(p.charAt(0)==s.charAt(0) || p.charAt(0)=='.')&&isMatch(s.substring(1,sl),p.substring(1,pl));
         }

         if(sl>0 && (p.charAt(0)==s.charAt(0) || p.charAt(0)=='.'))
         {
			//贪婪匹配
             if(isMatch(s.substring(1,sl),p)) return true;
            //  if(isMatch(s.substring(1,sl),p.substring(2,pl))) return true;
         }
         return isMatch(s,p.substring(2,pl));
     }

代码量很少，通过时间为996ms。这里可以用`dp[i][j]`来保存已经比较出结果的子串，`i和j`分别代表`s和p`的串长度。因为是从前往后搜，串长度确定是有唯一的匹配结果的，在递归时直接拿来用，可以防止重复搜索。下面代码是我凭感觉瞎凑出来的，通过时间只有556ms。
	
	//{java}
	public class Solution {
	     
	     public boolean isMatch(String s, String p) {
	         int d[][]=new int[s.length()+1][p.length()+1];
	         return isMatch2(s,p,d);
	     }
	    public boolean isMatch2(String s, String p,int d[][]) {
	        if(d[s.length()][p.length()]!=0)
	            return d[s.length()][p.length()]==1;
	        if(s.length()==0&&p.length()==0)
	            return true;
	        if(p.length()==0)
	            return false;
	        boolean any=false;
	        boolean b1=false,b2=false,b3=false,b4=false,b5=false;
	        if(p.length()>1&&p.charAt(1)=='*')
	            any=true;
	        
	        if(any)
	        {
	           
	            b2=isMatch2(s,p.substring(2,p.length()),d);
	            if(s.length()>0)
	             if(s.charAt(0)==p.charAt(0)||p.charAt(0)=='.')
	            {
	                    b1=isMatch2(s.substring(1,s.length()),p,d);
	                     b4=isMatch2(s.substring(1,s.length()),p.substring(2,p.length()),d);
	            }
	        }
	        else
	        {
	             if(s.length()>0)
	            if(s.charAt(0)==p.charAt(0)||p.charAt(0)=='.')
	            {
	                    b3=isMatch2(s.substring(1,s.length()),p.substring(1,p.length()),d);
	            }
	        }
	         d[s.length()][p.length()]=(b1||b2||b3||b4)?1:-1;
	        return d[s.length()][p.length()]==1;
	     
	    }
	}