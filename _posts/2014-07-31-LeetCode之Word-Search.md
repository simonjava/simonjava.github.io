---
layout: post
category : LeetCode
tagline: "深处优先搜索字符串"
tags : [LeetCode,面试,DFS,深度优先,遍历]
---
{% include JB/setup %}

<h4>{{page.title|remove_first:'Leetcode之'}}</h4>

>  Given a 2D board and a word, find if the word exists in the grid.
>
The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.
>
For example,
Given board =
>
	[
	  ["ABCE"],
	  ["SFCS"],
	  ["ADEE"]
	]
>
word = `"ABCCED"`, -> returns `true`,
word = `"SEE"`, -> returns `true`,
word = `"ABCB"`, -> returns `false`.

解法：深度优先遍历，一开始超时，是将`flag`的初始化放在两层循环内了
这样消耗很大，当数组太大时，二维数组初始化消耗也很大，可以认为是`O(n^2)`。深搜主要关键是确定递归的参数。

改进后的代码如下：
		
	//{java}
	public class Solution {
	    public boolean exist(char[][] board, String word) {   
	        boolean flag[][]=new boolean[board.length][board[0].length];
	        for(int i=0;i<board.length;i++)
	        {
	            for(int j=0;j<board[0].length;j++)
	            {
	                if(slove(board,flag,i,j,word,0))
	                {
	                    return true;
	                }
	            }
	        }
	        return false;
	    }
	    public boolean slove(char [][]board,boolean [][]flag,int i,int j,String word,int k)
	    {
	        if(i<0 || j<0 || i>=board.length || j>=board[0].length || flag[i][j] || board[i][j]!=word.charAt(k))
	            return false;
	        if(k==word.length()-1)
	            return true;
	        flag[i][j]=true;
	        if(slove(board,flag,i+1,j,word,k+1)||slove(board,flag,i-1,j,word,k+1)||slove(board,flag,i,j+1,word,k+1)||slove(board,flag,i,j-1,word,k+1))
	        {
	            return true;
	        }
	        flag[i][j]=false;
	        return false;
	    }
	}