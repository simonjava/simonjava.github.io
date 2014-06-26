---
layout: post
category : LeetCode
tagline: "归并k个有序链表"
tags : [LeetCode，面试，链表，有序，归并，递归，堆]
---
{% include JB/setup %}

<h4 id="Merge-k-sorted-Lists">Merge k sorted Lists</h4>

>Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity. 

解法：这题有两种较好的解法，一种解法是类似锦标赛，每次将链表集合一分为2，递归求解。第二种解法是每次取出`k`个链表的链表头，将他们放入堆中，每次从取出堆中取出最小元素，然后将最小元素的下一个运算插入堆，再维护，直到堆空，排序完成。两种解法的复杂度都是`O(logk)`。第一次提交时是每次取出一个链表和长链表合并，结果超时，锦标赛顺利过了。

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
	    public ListNode mergeKLists(List<ListNode> lists) {
	        if(lists.size()==0)
	            return null;
	        if(lists.size()==1)
	            return lists.get(0);
	        List<ListNode> aa = lists.subList(0,lists.size()/2);
	        List<ListNode> bb = lists.subList(lists.size()/2,lists.size());
	        ListNode a = mergeKLists(aa);
	        ListNode b = mergeKLists(bb);
	        ListNode head = new ListNode(0);
	        ListNode p = head;
	        while(a!=null && b!=null)
	        {
	            if(a.val>b.val)
	            {
	                p.next=b;
	                b=b.next;
	            }else
	            {
	                p.next=a;
	                a=a.next;
	            }
	            p=p.next;
	        }
	        if(a!=null)
	            p.next=a;
	        if(b!=null)
	            p.next=b;
	        return head.next;
	    }
	}