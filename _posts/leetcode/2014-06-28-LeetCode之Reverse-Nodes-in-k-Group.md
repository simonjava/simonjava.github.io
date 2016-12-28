---
layout: post
category : LeetCode
tagline: "调换链表每K节点的位置"
tags : [LeetCode，面试，链表，，递归，顺序调换]
---
{% include JB/setup %}

<h4 id="Reverse-Nodes-in-k-Group">Reverse Nodes in k-Group</h4>

>Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
>
>If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
>
>You may not alter the values in the nodes, only nodes itself may be changed.
>
>Only constant memory is allowed.
>
>For example,
Given this linked list: `1->2->3->4->5`
>
>For `k = 2`, you should return: `2->1->4->3->5`
>
>For `k = 3`, you should return: `3->2->1->4->5` 

解法：还是递归，每k个用头插法重新处理一遍，解决这类问题有个技巧，为了方便，可以用一个假头把链接起链表，省去许多条件判断。

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
	    public ListNode reverseKGroup(ListNode head, int k) {
	        ListNode pk=head;
	        for(int i=0;i<k-1&&pk!=null;i++,pk=pk.next)
	        {
	        }
	        if(pk==null)
	            return head;
	        ListNode l = reverseKGroup(pk.next,k);
	        ListNode p = head,q=head;
	        ListNode h = new ListNode(0);
	        for(int i=0;i<k&&p!=null;i++)
	        {
	            ListNode t =p;
	            p=p.next;
	            t.next=h.next;
	            h.next = t;
	        }
	        q.next=l;
	        return h.next;
	    }
	}