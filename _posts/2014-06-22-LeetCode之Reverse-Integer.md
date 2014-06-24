---
layout: post
category : LeetCode
tagline: "Z字形重排字符串"
tags : [LeetCode，面试，字符串，Z型重排]
---
{% include JB/setup %}

<h4 id="Reverse-Integer">Reverse Integer</h4>

> Reverse digits of an integer.
>
>Example1: x = 123, return 321
Example2: x = -123, return -321 



解法：O(1)的存储空间。题目还提示考虑，如果数字溢出了怎么办，如果16位整数`10009`等，但题目没有这样的测试用例，本题无需考虑(真有溢出就是设置一些标记为判断)。

这里可以用两种方法判断int型溢出。

1. 用`long long`保存下面的`k`，然后循环中判断`k>MAXINT`。
2. 将`x*10`再除以`10`，判断前后是否相等。

	//{java}
	public class Solution {
    public int reverse(int x) {
        boolean isPositive = true;
        if(x<0)
        {
            isPositive = false;
            x*=-1;
        }
        int k=0;
        while(x!=0)
        {
            int t=x%10;
            x/=10;
            k=k*10+t;
        }
        if(!isPositive)
            k*=-1;
        return k;
    }
}