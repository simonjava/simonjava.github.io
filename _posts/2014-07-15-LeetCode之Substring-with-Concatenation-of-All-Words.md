---
layout: post
category : LeetCode
tagline: "调换链表每对节点的位置"
tags : [LeetCode，面试，链表，，递归，顺序调换]
---
{% include JB/setup %}

<h4 id="page.title">{{page.title}}</h4>

>Given a linked list, swap every two adjacent nodes and return its head.
>
>For example,
Given `1->2->3->4`, you should return the list as `2->1->4->3`.
>
>Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed. 

解法：链表题目首先想到的就是递归，这题就是简单的递归，突然想起来了，转置链表，用递归就能很快实现。

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
	    public ListNode swapPairs(ListNode head) {
	        if(head==null||head.next==null)
	            return head;
	        ListNode q = head;
	        ListNode p = head.next;
	        ListNode k = swapPairs(p.next);
	        q.next=k;
	        p.next=q;
	        return p;
	    }
	}