---
layout: post
category : LeetCode
tagline: "最长括号匹配子串"
tags : [LeetCode，面试，括号匹配，最长子串，堆栈，标记]
---
{% include JB/setup %}

<h4>{{page.title|remove_first:'Leetcode之'}}</h4>


>Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
>
>For "(()", the longest valid parentheses substring is "()", which has length = 2.
>
>Another example is ")()())", where the longest valid parentheses substring is "()()", which has length = 4. 

解法：哎，不好干啊，一开始只管考虑右括号。忽略了`"()(()"`这种情况左括号也阻碍连续匹配的情况。用栈把匹配的左括号也标记起来。然后同时考虑左括号和右括号，再扫一遍字符串。


代码如下：虽然过了，但是太长了，哎。
		
	//{java}
	public class Solution {
	    public int longestValidParentheses(String s) {
	        int stack[] = new int[s.length()];
	        int top=0;
	        int count=0;
	        int max=0;
	        int flag[] = new int[s.length()];
	        for(int i=0;i<s.length();i++)
	        {
	            char c = s.charAt(i);
	            if(c=='(')
	                stack[top++]=i;
	            else
	            {
	                if(top>0)
	                {
	                    int j= stack[--top];
	                    flag[j]=1;
	                }
	            }
	        }
	        int zuokuohao=0;
	        for(int i=0;i<s.length();i++)
	        {
	            char c = s.charAt(i);
	            if(c=='(')
	            {
	                zuokuohao++;
	                if(flag[i]==1)
	                    count++;
	                else
	                {
	                    max=Math.max(max,count);
	                    count=0;
	                }
	            }
	            else
	            {
	             zuokuohao--;
	             if(zuokuohao<0)
	             {
	                 max=Math.max(max,count);
	                 count=0;
	                 zuokuohao=0;
	             }
	            }
	        }
	        return Math.max(max,count)*2;
	    }
	}


下面代码是比较标准的，只要扫一遍字符串即可。

	//{java}
	public class Solution {
	    public int longestValidParentheses(String s) {
	        int stack[] = new int[s.length()];
	        int top=0,last=-1;
	        int max=0;
	        int flag[] = new int[s.length()];
	        for(int i=0;i<s.length();i++)
	        {
	            char c = s.charAt(i);
	            if(c=='(')
	                stack[top++]=i;
	            else
	            {
	                if(top>0)
	                {
	                    int j= stack[--top];
	                    if(top==0)
	                        max=Math.max(max,i-last);
	                    else
							//栈中最近那个左括号
	                        max=Math.max(max,i-stack[top-1]);
	                }else
	                {
						//发生了一次不匹配
	                    last=i;
	                }
	            }
	        }
	        return max;
	    }
	}


Discuss里面还有一个clever的boy给出一段很机智的代码

	//{cpp}
	class LVP{

	    public:
	    int lvp( string s ){
	        int len = s.size();
	        if( !len )          // if string is empty, return 0 instantly.
	            return 0;
	        for( int i = 0;i < len;i++ )    
	            if( s[i] == ')' )   
	                for( int j = i - 1;j >= 0;j-- )     // for every ')’，find the first match '(' before it
	                    if( s[j] == '(' )   {           // and mark the two with a special flag,like '0'
	                        s[i] = '0';
	                        s[j] = '0';
	                        break;
	                    }
	        int max = 0,temp = 0;                       
	        for( int i = 0;i < len;i++ )    {           // the problem changed to find the longest '0' in the string
	            if( s[i] == '0' )
	                temp++;
	            else    {
	                max = temp > max ? temp : max;
	                temp = 0;
	            }
	        }
	        max = temp > max ? temp : max;              // longest '0'sequence may still stored in temp
	        return max;
	    }
	};