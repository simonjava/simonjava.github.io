---
layout: post
category : LeetCode
tagline: "字符组合"
tags : [LeetCode，面试，字符，组合，递归]
---
{% include JB/setup %}

<h4 id="Letter-Combinations-of-a-Phone-Number">Letter Combinations of a Phone Number</h4>

>Given a digit string, return all possible letter combinations that the number could represent.
>
>A mapping of digit to letters (just like on the telephone buttons) is given below.
>
![picture](img/leetcode_LetterCombinationsOfaPhoneNumber.png)
>
	Input:Digit string "23"
	Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].

解法：字符组合问题，一般用递归都能很快解决。

代码如下：
		
	//{java}
	public class Solution {
	    public List<String> letterCombinations(String digits) {
	        String []table = new String []{""," ","abc","def","ghi","jkl","mno","pqrs","tuv","wxyz"};
	         List<String> ls= new ArrayList<String>();
	        if(digits.length()==0)
	        {
	            ls.add("");
	            return ls;
	        }
	        char c = digits.charAt(0);
	       
	        for(int i=0;i<table[c-48].length();i++)
	        {
	            char t = table[c-48].charAt(i);
	            for(String temp:letterCombinations(digits.substring(1,digits.length())))
	            {
	                ls.add(t+temp);
	            }
	        }
	        return ls;
	    }
	}