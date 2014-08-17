---
layout: post
category : LeetCode
tagline: "包含子串的最小窗口"
tags : [LeetCode,面试,字符子串,最小窗口]
---
{% include JB/setup %}

<h4>{{page.title|remove_first:'Leetcode之'}}</h4>

> Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).
>
For example,
S = `"ADOBECODEBANC"`
T = `"ABC"`
>
Minimum window is `"BANC"`.
>
Note:
If there is no such window in S that covers all characters in T, return the emtpy string `""`.
>
If there are multiple such windows, you are guaranteed that there will always be only one unique minimum window in S. 
 

解法：好想不好编，调试了好多次。和最长非重复子串很像。这里需要先记录Target string中字符分布。e往后扩展，对S进行扫描，当扫描到一个窗口满足要求时，再缩小s确定最小的窗口。中间有个常数数量级的循环来判断窗口是否包含了T。

代码如下：
		
	//{java}
	public class Solution {
	    public String minWindow(String S, String T) {
	        int stardard[] =new int[256];
	        for(int i=0;i<T.length();i++)
	        {
	            stardard[T.charAt(i)]++;
	        }
	        int flag[] = new int[256];
	        int s=0,e=0;
	        boolean e_go = true;
	        int min = 0x7fffffff;
	        String re = "";
	        while(s<e+T.length() && (e<S.length()||e_go==false))
	        {
	            if(e_go)
	            {
	                char c = S.charAt(e++);
	                flag[c]++;
	                if(stardard[c]!=0&&flag[c]>=stardard[c])
	                {
	                    boolean get =true;
	                    for(int i=0;i<256;i++)
	                    {
	                        if(stardard[i]!=0 && flag[i]<stardard[i])
	                        {
	                            get=false; 
	                            break;
	                        }
	                    }
	                    if(get)
	                    {
	                        if(e-s<min)
	                        {
	                            re = S.substring(s,e);
	                            min = e-s;
	                        }
	                        e_go=false;
	                        continue;
	                    }  
	                }
	            }else
	            {
	                char c = S.charAt(s++);
	                flag[c]--;
	                if(stardard[c]!=0&&flag[c]<stardard[c])
	                {
	                        e_go=true;
	                        continue;
	                }
	                if(e-s<min)
	                {
	                    re = S.substring(s,e);
	                    min = e-s;
	                } 
	            }
	        }
	        return re;
	    }
	}