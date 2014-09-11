---
layout: post
category : LeetCode
tagline: "Java并发知识点笔记"
tags : [面试,Java,笔记,随手记,并发]
---
{% include JB/setup %}

<h4>{{page.title}}</h4>

之前腾讯实习面试这道题就没答出来，问有`A B C`三个线程，如何让`B C`先执行完，`A`再执行，终于看到了相关章节，可以用`CountDownLatch`解决。

	//{java}
	package 使用CountDownLatch来控制线程执行的先后顺序;

	import java.util.concurrent.CountDownLatch;
	import java.util.concurrent.ExecutorService;
	import java.util.concurrent.Executors;
	
	public class CountDownLatchTest {
		public static void main(String []args) throws InterruptedException
		{
			ExecutorService exec = Executors.newCachedThreadPool();
			CountDownLatch latch = new CountDownLatch(2);
			exec.execute(new Task(1, latch));
			exec.execute(new Task(2, latch));
			latch.await();
			System.out.println("主线程结束");
		}
	
	}
	
	class Task implements Runnable
	{
		int id;
		CountDownLatch latch;
		
		public Task(int id, CountDownLatch latch) {
			super();
			this.id = id;
			this.latch = latch;
		}
	
		@Override
		public void run() {
			System.out.println(id+"开始工作");
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			System.out.println(id+"工作完成");
			latch.countDown();
			
		}
		
	}


`latch.await()`表示调用线程`latch.await()`阻塞直到`latch.getCount()=0`才开始执行。`latch.countDown()`则是减1。

//公共父节点，await实现。并行继续学习。垃圾回收。博客。打印简历