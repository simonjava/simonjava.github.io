---
layout: post
category : LeetCode
tagline: "链表存数运算"
tags : [LeetCode，面试，链表，遍历]
---
{% include JB/setup %}

这题比较水。



<h4 id="AddTwoNumbers">Add Two Numbers</h4>

>You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
>
>Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
>
>Output: 7 -> 0 -> 8


解法：先遍历相加，再处理进位，注意`{5}{5}`的这种情况，需要增加一个节点。

这题数字是逆序存储，如果数字是顺序存储呢？方法也很多，容易想到的是每次乘以10将链表转为整数然后相加，结果再转成链表。或者将两个链表重新头插一边转换成这个问题。

代码如下：

	//{java}
	/**
	 * Definition for singly-linked list.
	 * public class ListNode {
	 *     int val;
	 *     ListNode next;
	 *     ListNode(int x) {
	 *         val = x;
	 *         next = null;
	 *     }
	 * }
	 */
	public class Solution {
	    public static ListNode addTwoNumbers(ListNode l1, ListNode l2) {
	        ListNode p=l1,q=l2,t=l1;
	        while(p!=null && q!=null)
	        {
	            p.val+=q.val;
	            t=p;
	            p=p.next;
	            q=q.next;
	        }
	        while(q!=null)
	        {
	            t.next=q;
	             t=t.next;
	            q=q.next;
	        }
	        p=l1;
	        int jinwei=0;
	        while(p!=null)
	        {
	            p.val+=jinwei;
	            jinwei=p.val/10;
	            p.val%=10;
	            t=p;
	            p=p.next;
	        }
	        if(jinwei==1)
	            t.next=new ListNode(1);
	        return l1;
	    }
	}




