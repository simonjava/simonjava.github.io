---
layout: post
category : LeetCode
tagline: "数独"
tags : [LeetCode，面试，数独，递归]
---
{% include JB/setup %}

<h4>{{page.title|remove_first:'Leetcode之'}}</h4>


>Write a program to solve a Sudoku puzzle by filling the empty cells.
>
>Empty cells are indicated by the character '.'.
>
>You may assume that there will be only one unique solution. 

解法：数独问题，构造递归`slove(char[][] board,int i,int j)`表示在`i,j`之前的局面都是合法的，对每个`board[i][j]`可能出现的数都搜索一遍，当`i=9`时说明局面有效。

代码如下：
		
	//{java}
	public class Solution {
	    public void solveSudoku(char[][] board) {
	        slove(board,0,0);
	    }
	    
	    public boolean slove(char[][] board,int i,int j)
	    {
	        if(j==9)
	        {
	            j=0;
	            i+=1;
	        }
	        if(i==9)
	            return true;
	        if(board[i][j]=='.')
	        {
	            int flag[]=new int[9];
	            for(int k=0;k<9;k++)
	            {
	                if(board[i][k]!='.')
	                    flag[board[i][k]-'1']=1;
	            }
	            for(int k=0;k<9;k++)
	            {
	                if(board[k][j]!='.')
	                    flag[board[k][j]-'1']=1;
	            }
	            for(int m=0;m<3;m++)
	            {
	                for(int n=0;n<3;n++)
	                if(board[i/3*3+m][j/3*3+n]!='.')
	                    flag[board[i/3*3+m][j/3*3+n]-'1']=1;
	            }
	            for(int k=0;k<9;k++)
	            {
	                if(flag[k]==0)
	                {
	                    board[i][j]=(char)(k+'1');
	                    if(slove(board,i,j+1))
	                        return true;
	                }
	            }
	            board[i][j]='.';
	            return false;
	        }else
	        {
	             return slove(board,i,j+1);
	        }
	    }
	}