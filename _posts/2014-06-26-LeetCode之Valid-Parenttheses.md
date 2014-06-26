---
layout: post
category : LeetCode
tagline: "括号合法问题"
tags : [LeetCode，面试，栈，括号合法]
---
{% include JB/setup %}

<h4 id="Valid-Parentheses">Valid Parentheses</h4>

>Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
>
>The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.

解法：用栈存左括号，当匹配到右括号时弹出，如匹配不到，则结束返回错误。注意如果直接一个`右括号`时，栈顶没有元素。

代码如下：
		
	//{java}
	public class Solution {
	    public boolean isValid(String s) {
	       char stack[] = new char[10000];
	       int top=0;
	        for(int i=0;i<s.length();i++)
	        {
	           char c = s.charAt(i);
	           if(c=='('||c=='{'||c=='[')
	                stack[top++]=c;
	            else
	            {
	                if(top==0||stack[top-1]!=other(c))
	                    return false;
	                else
	                    top--;
	            }
	        }
	        return top==0;
	    }
	    public char other(char c)
	    {
	        if(c==')')
	             return '(';
	        if(c==']')
	             return '[';
	        if(c=='}')
	             return '{';
	        return 0;
	    }
	}