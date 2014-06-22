---
layout: post
category : LeetCode
tagline: "Z字形重排字符串"
tags : [LeetCode，面试，字符串，Z型重排]
---
{% include JB/setup %}

<h4 id="ZigZag-Conversion">ZigZag Conversion</h4>

> The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
<code><pre>
P   A   H   N
A P L S I I G
Y   I   R
</pre></code>
>
And then read line by line: "PAHNAPLSIIGYIR"
>
Write the code that will take a string and make this conversion given a number of rows:
>
string convert(string text, int nRows);
>
convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR". 



解法：O(n)算法，按Z字形重排字符串，一开始用一个二维数组保存重排后的元素，然后按行遍历得到字符串，报超时。根据nRows能推算出哪些字符是第一行，哪些字符是第二行，找出每一行对应的字符即可。


	//{java}
	public class Solution {
	 public static String convert(String s, int nRows) {
	        int r=nRows;
	        if(r==1)
	            return s;
	        String s2="";
	        for(int i=0;i<r;i++)
	        {
	            if(i==0||i==r-1)
	            {
	                for(int j=0;j+i<s.length();j+=2*r-2)
	                {
	                    s2+=s.charAt(i+j);
	                }
	            }
	            else
	            {
	            	
	                for(int j=0;j+i<s.length();) 
	                {
	                    s2+=s.charAt(i+j);
	                    int t=j+2*r-2-2*i;
	                    if(t+i<s.length())
	                    {
	                       s2+=s.charAt(i+t);
	                    }
	                    j+=2*r-2;
	                }
	            }
	        }
	        return s2;
	    }
	   public static void main(String []s)
	   {
		   System.out.println(convert("ABC", 2));
	   }
	}