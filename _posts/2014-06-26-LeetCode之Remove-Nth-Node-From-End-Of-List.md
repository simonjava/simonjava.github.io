---
layout: post
category : LeetCode
tagline: "删除链表中的倒数第k个元素"
tags : [LeetCode，面试，链表，元素删除，倒数]
---
{% include JB/setup %}

<h4 id="Remove-Nth-Node-From-End-of-List">Remove Nth Node From End of List</h4>

>Given a linked list, remove the nth node from the end of list and return its head.
>
>For example,
>
	Given linked list: 1->2->3->4->5, and n = 2.
>
	After removing the second node from the end, the linked list becomes 1->2->3->5.
>
>Note:
Given n will always be valid.
Try to do this in one pass. 

解法：一般的解法都是先计算出数组长度。这里要求只能扫描数组一次，那就用两个标记，让一个标记先走k步，其实性能没有区别。

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
	    public ListNode removeNthFromEnd(ListNode head, int n) {
	        ListNode p = head;
	        ListNode q = head;
	        int k=0;
	        while(p!=null)
	        {
	            if(k>n)
	            q=q.next;
	            p=p.next;
	            k++;
	        }
	        if(k<=n)
	            return head.next;
	        q.next=q.next.next;
	        
	        return head;
	    }
	}