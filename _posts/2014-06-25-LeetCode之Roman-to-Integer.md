---
layout: post
category : LeetCode
tagline: "数字转换为字符串"
tags : [LeetCode，面试，字符转换]
---
{% include JB/setup %}

<h4 id="Roman-to-Integer">Roman to Integer</h4>

>Given an integer, convert it to a roman numeral.
>
Input is guaranteed to be within the range from 1 to 3999.

解法：这题主要要理解罗马字符代表的数字的意义，之前不了解，代码写的有点长，数字转换一般就是取余数，除的循环过程。罗马字符每个字符都代表一个值，这里是减的过程。下面贴一个网上的代码。后面一题是罗马字符转换数字，就是加的过程。

代码如下：
	
	//{java}
	public class Solution {  
	    public String intToRoman(int number) {  
	        int[] values = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 };  
	        String[] numerals = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" };  
	        StringBuilder result = new StringBuilder();  
	        for (int i = 0; i < values.length; i++) {  
	            while (number >= values[i]) {  
	                number -= values[i];  
	                result.append(numerals[i]);  
	            }  
	        }  
	        return result.toString();  
	    }  
	} 