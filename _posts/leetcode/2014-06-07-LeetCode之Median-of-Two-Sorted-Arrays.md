---
layout: post
category : LeetCode
tagline: "操蛋的第二题-求两个有序表的第k个数"
tags : [LeetCode，面试，有序表，二分]
---
{% include JB/setup %}

妈蛋，硬扛，不肯网上找攻略，弄了我一整天终于通过。



<h4 id="MedianofTwoSortedArrays">Median of Two Sorted Arrays</h4>

>There are two sorted arrays A and B of size m and n respectively. Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

这题虽然要求是`O(log(m+n))`的复杂度，但是测试数据比较弱，`O(n)`的算法也能过，`O(n)`的算法最容易想到的就是合并两个有序表，然后求合并过后的表的中位数，优化一些的就是计数，根据两个表的长度可以算出中位数的位置，然后计数，只要遍历一半就能找到。
这里我先给出我自己写的算法，我看了网上的找第k小数的算法，相比之下，我的算法确实不是很简洁。
算法的思路就是看**哪些数可能成为中位数**。如`{1,2,3,4,5,6,7}`与`{x,y,z}`无论`x y z`的取值是多少，`1`和`7`都不可能成为中位数，就可以直接去掉。比较`A B`数组中间两个数的大小，又可以缩小**可能中位数的范围**,如假设`y>4`,则`1、2、3、z`都不可能成为中位数。这题就麻烦就麻烦在奇数偶数的处理上。

因为之前的预处理，`A`的长度和`B`的长度不会相差大于2，A为较长的数组。

奇奇：如`{1,6,7}`和`{2,3,4,5,8}`，分别取中间的进行比较。处理后为`{1,6}`和`{4,5,8}`。这里要注意标记左右平衡问题，因为最后得到的中位数肯定是左右两边的被处理掉的数的数目相等的。这里右边被干掉一个`7`，左边被干掉了`2 3`。

偶偶：偶数中间的数有两个，规定`A`取下位数，`B`取上位数，这样做的目的是尽量保证左右两边被干掉的数相等。

奇偶:规定若`A`是偶数，则取其下位数，若`B`是偶数，则取其上位数。

代码如下:

	//{java}
	public class Solution {
	    public static double findMedianSortedArrays(int A[], int B[]) {
	        int longArr[]=A;
	        int shortArr[]=B;
	
	        if(A.length<B.length)
	        {
	          longArr=B;
	          shortArr=A;
	        }
			//预处理数组，如`{1,2,3,4,5,6,7}`与`{x,y,z}`无论`x y z`的取值是多少，`1`和`7`都不可能成为中位数
	        int t = longArr.length-shortArr.length;
	        return zhongweishu(longArr,0+(t-1)/2,longArr.length-(t-1)/2,shortArr,0,shortArr.length,0,0);
	    }

	   //left right是记录左右两边被干掉的数，理论上abs(left-right)<=1。
	    static double zhongweishu(int A[],int a1,int a2,int B[],int b1,int b2,int left,int right)
	    {
			//终止条件
	    	if(a2-a1==1 && b2-b1==1)
	    	{
	    		return (A[a1]+B[b1])/2.0;
	    	}
	    
	    	if(a2-a1==2 && b2-b1==1)
	    	{
	    		return zhongweishu(new int[]{A[a1],A[a1+1],B[b1]},left-right);
	    	}
	    	
	    	if(a2-a1==2 && b2-b1==2)
	    	{
	    		return zhongweishu(new int[]{A[a1],A[a1+1],B[b1],B[b1+1]},left-right);
	    	}
	    	if(a2-a1==3 && b2-b1==2)
	    	{
	    		return zhongweishu(new int[]{A[a1],A[a1+1],A[a1+2],B[b1],B[b1+1]},left-right);
	    	}
	    
	    	if(b2-b1==0)
	    	{
	    		return A.length%2==0?(A[A.length/2]+A[A.length/2-1])/2.0 : A[A.length/2];
	    	}
	    
		    int a=(a1+a2)/2,b=(b1+b2)/2;
		    if((a2-a1)%2==0 )
	    			a--;
			if(A[a]<B[b])
	    	{
	    		return zhongweishu(A,a,a2,B,b1,b+1,left+a-a1,right+b2-b-1);	
	    	}
	    	else if(A[a]>B[b])
	    	{
	    		return zhongweishu(A,a1,a+1,B,b,b2,left+b-b1,right+a2-a-1);	
	    	}
	    	else
	    	{
	    			return A[a];
	    	}
	    }

		//找到若干个数的中位数。
	    static double zhongweishu(int A[],int balance)
	    {
	    	Arrays.sort(A);
	    	int begin=0;
	    	int end=A.length;
	    	if(balance==1)
	    		end--;
	    	if(balance==-1)
	    		begin++;
	    	return (end-begin)%2==0?(A[(begin+end)/2]+A[(begin+end)/2-1])/2.0 : A[(begin+end)/2];
	    }
	    public static void main(String []a)
	    {
	    	System.out.println(findMedianSortedArrays(new int[]{1,7,8,9,10,11,12},new int []{2,3,4,5,6}));
	    }
	}

###好的，提交！Accept，oh，完美，代码在LeetCode中通过检测了，不信你可以复制[提交](https://oj.leetcode.com/problems/median-of-two-sorted-arrays/)试试。

##注意，我想说的是上面的代码是错误的。如主函数中的那个样例就过不了。LeetCode中的检测数据太弱了。

错误的原因是因为abs(left-right)>1了，这种情况只可能在奇偶中出现，解决方法就是判断下如果abs(left-right)>1。则偶数就要换另外一个中间的数进行比较。


####这题归根到底是求两个有序数组的第K个数。

现在已知数组A、B升序，`A.length>=B.length`。求A和B归并后的第K个数。

分析：能成为第K个数肯定是A、B中前k个数，假设前k个的下标是1-k。比较`B[n]`和`A[k-n]`,若`B[n]>A[k-n]`，则A中前`k-n`个数不可能成为第k个数，因为就算`B[1到n-1]`全比`A[k-n]`小，`A[k-n]`也只是`k-1`小的数。

如`A={2,3,4,5,6,7}`和`B={1,8,9,10}`，`k=6`。`B[k/3]=B[3]=9>A[5-3]=3`这里3是第三小的数，就算把8换成比3小的数，3也只是第四小的数。所以可以在A数组中把包括3在内的所有数排除。

有了find_k，则求中位数的代码就很简单，找到中位数的位置上的数即可。代码如下。

	//{java}
	public class Solution {
	    public static double findMedianSortedArrays(int A[], int B[]) {
	    	int n = (A.length+B.length);
	    	if((n&1)==0)
	    	{
	    		 return (find_k(A,0,A.length,B,0,B.length,n/2)+find_k(A,0,A.length,B,0,B.length,n/2+1))/2.0;
	    	}
	    	else
	    	{
	    		return find_k(A,0,A.length,B,0,B.length,n/2+1);
	    	}
	       
	    }
	   
	    static int find_k(int A[],int a1,int a2,int B[],int b1,int b2,int k)
	    {
	    	if(a2-a1<b2-b1)
	    		return find_k(B,b1,b2,A,a1,a2,k);
			  if(b2-b1==0)
			  {
			  	return A[a1+k-1];
			 }	
	    	if(k==1)
	    		return A[a1]>B[b1]?B[b1]:A[a1];
	    
	       
	        int b=min(b1+k/2,b2);
	        int a=a1+(k-b+b1);
	        if(A[a-1]<B[b-1])
	        {
	            return find_k(A,a,a2,B,b1,b2,k-(a-a1));
	        }
	        else if(A[a-1]>B[b-1])
	        {
	            return find_k(A,a1,a2,B,b,b2,k-(b-b1));
	        }else
	        {
	        	return A[a-1];
	        }
	   
	    }
	    static int min(int a,int b)
	    {
	    	return a>b?b:a;
	    }
	    static int max(int a,int b)
	    {
	    	return a<b?b:a;
	    }
	    public static void main(String []a)
	    {
	    	System.out.println(findMedianSortedArrays(new int[]{1},new int []{1}));
	    }
	}
























