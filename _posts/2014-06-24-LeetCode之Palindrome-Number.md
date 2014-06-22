---
layout: post
category : LeetCode
tagline: "回文整数"
tags : [LeetCode，面试，整数，回文]
---
{% include JB/setup %}

<h4 id="Palindrome-Number">Palindrome Number</h4>

>
Determine whether an integer is a palindrome. Do this without extra space.
>
click to show spoilers.
Some hints:
>
Could negative integers be palindromes? (ie, -1)
>
If you are thinking of converting the integer to string, note the restriction of using extra space.
>
You could also try reversing an integer. However, if you have solved the problem "Reverse Integer", you know that the reversed integer might overflow. How would you handle such case?
>
There is a more generic way of solving this problem.





解法：这题可以将整数转化为字符串，判断字符串是否为回文，也可以将整数转置，判断转置过后的整数与原整数是否相等。


	//{java}
	public class Solution {
	    public boolean isPalindrome(int x) {
	        if(x<0)
	            return false;
	        int k=0;
	        int t=x;
	        while(t!=0)
	        {
	            k=k*10+t%10;
	            t/=10;
	        }
	        return x==k;
	    }
	}