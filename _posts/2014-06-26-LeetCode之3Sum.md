---
layout: post
category : LeetCode
tagline: "和为0的3个数"
tags : [LeetCode，面试，和为k的n个数]
---
{% include JB/setup %}

<h4 id="3Sum">3Sum</h4>


>Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
>
>Note:
>
    Elements in a triplet (a,b,c) must be in non-descending order. (ie, a ≤ b ≤ c)
    The solution set must not contain duplicate triplets.
>
    For example, given array S = {-1 0 1 2 -1 -4},
>
    A solution set is:
    (-1, 0, 1)
    (-1, -1, 2)


解法：第一种解法，复杂度`O(n^2logn)`，先对数组进行排序，，确定前两个数，对第三个数使用二分查找。去重，因为已经排过序，相同的数只需确定搜索其中一个即可。

代码如下：
		
	//{java}
	public class Solution {
		public List<List<Integer>> threeSum(int[] num) {
			List<List<Integer>> rl = new ArrayList<List<Integer>>();
		        Arrays.sort(num);
		        int numl=num.length;
		        int last1 =1;
		        for(int i=0;i<numl-2;i++)
		        {
		        	
		        	if(num[i]>0)
		        		break;
		        	if(num[i]==last1)
		        		continue;
		        	last1=num[i];
		        	int last2=1-num[i];
		        	for(int j=i+1;j<numl-1;j++)
		        	{
		        		if(num[i]+num[j]>0)
		        			break;
		        		if(num[j]==last2)
			        		continue;
		        		last2=num[j];
		        		if(findX(num,j+1,numl-1,0-num[i]-num[j])!=-1)
		        		{
		        			 ArrayList<Integer> t = new ArrayList<Integer>();
		        			 t.add(num[i]);
		        			 t.add(num[j]);
		        			 t.add(0-num[i]-num[j]);
		        			rl.add(t);
		        		}
		        	}
		        }
		        return rl;
		}
		
		public int findX(int num[],int s,int e,int x)
		{
			while(s<=e)
			{
				int t = num[(s+e)/2];
				if(t>x)
				{
					e=(s+e)/2-1;
				}else if(t<x)
				{
					s=(s+e)/2+1;
				}
				else
				{
					return (s+e)/2;
				}
			}
			return -1;
		}
		
	    public static void main(String []s)
	    {
	    
	    	System.out.println(new Solution().threeSum(new int[] {-1 ,0, 1, 2, -1, -4}));
	    }
	}


第二种解法，得燊爷指点，在有序数组中求和为k的两个数是一个线性时间，算法的时间复杂度是`O(n)`，就是一个双向遍历过程。

代码如下：

	//{java}
	public class Solution {
		public List<List<Integer>> threeSum(int[] num) {
			List<List<Integer>> rl = new ArrayList<List<Integer>>();
		        Arrays.sort(num);
		        int numl=num.length;
		        for(int i=0;i<numl-2;i++)
		        {
		        	if(num[i]>0)
		        		break;
		        	if(i!=0&&num[i]==num[i-1])
		        		continue;
		            int be=i+1,end=numl-1;
		            while(be<end)
		            {
		        		if(be!=i+1&&num[be]==num[be-1])
		        		{
		        			be++;
		        			continue;
		        		}
		                int temp = num[be]+num[end];
		                if(temp>0-num[i])
		                {
		                    end--;
		                }else if(temp<0-num[i])
		                {
		                    be++;
		                }
		                else{
	    	                ArrayList<Integer> t = new ArrayList<Integer>();
		        			 t.add(num[i]);
		        			 t.add(num[be]);
		        			 t.add(num[end]);
		        			rl.add(t);
		        		    be++;
		                }
		            }
		        }
		        return rl;
		}
		
	    public static void main(String []s)
	    {
	    
	    	System.out.println(new Solution().threeSum(new int[] {-1 ,0, 1, 2, -1, -4}));
	    }
	}