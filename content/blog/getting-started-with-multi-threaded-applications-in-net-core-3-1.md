---
title: 'Getting started with multi-threaded applications in .net core 3.1'
date: Tue, 30 Jun 2020 03:14:33 +0000
draft: false
tags: ['asynchronous', 'C#', 'multi-threaded', 'parallel', 'threads']
---

Today, we take a break from [my series on sorting algorithms](https://abhinavpradeep.com/blog/algorithms/) and look at thread-safety. As a result, we will learn about threads and create a multi-threaded program. Then, we learn about thread safety and implement it in a C# console application.

#### What are threads?

Every program I have ever written has had a single sequential flow of control. Once the program begins executing, it systematically goes through every line of code until the end. Hence, at any given point in time, only one statement is executed. As a result of this one cannot access the full extent of a processor's power. The program runs on a single thread. Multi-threaded programming however solves this problem. It allows you to run multiple methods at the same time i.e. parallel execution.

A thread can, therefore, be defined as a flow of control, multiple of which can run parallel to each other. This creates a host of issues related to the flow of the program. Thread-safe code, therefore, ensures that all the threads behave properly without any unintended interaction.

#### Implementation through code -

WARNING - naive implementation for demonstration purposes.

We will now create a simple console application. It has an 'Account' class with two simple and seemingly infallible 'Deposit' and 'Withdraw' methods. Given below is the code for this class.

<a href="https://gist.github.com/AbhinavPradeep/5ae445fc16a41aaf45156461afe02ba9">View this gist on GitHub</a>

Note - The 'Thread.Sleep(10000)' is nothing but a kind of buffer to simulate the execution of a large chunk of code or latency in connection to a database. It might as well be a large loop. An alternative for this could be -

```csharp
for (int i = 0; i < 100000000; i++)
{
    //Simulating large chunk of code
}
```

It would not make any difference. However, the number of zeros need to be matched in order to gain similar results as 'Thread.Sleep(10000)

From the class above, we can assume that the Withdraw() method would execute logically perfectly. It does run through a comparative 'if' statement to check for the account balance before it performs a withdrawal. if the account balance is lower than the withdrawal amount then it exits and does not allow the account to be overdrawn.

In order to test this, we would call the method from the main method, debug through the code, and inspect the program's flow. If we do this, no problems appear. However, the program only works if we assume that multiple threads do not access the account at the same time.

In order to demonstrate the pitfalls of this program in a multi-threaded environment , we can execute the following code in our main method. This code creates an array of threads and then the threads execute parallelly to withdraw from the account.

<a href="https://gist.github.com/AbhinavPradeep/6bd2508e461946b0fedf7f493240a914">View this gist on GitHub</a>

The code above creates an Account object. It then deposits $100. Then, an array of threads are created. As stated before, threads can run parallel to each other. They hence provide an easy way to stress test our code. After this, we program each thread to withdraw $90. Then, through a 'for' loop, all the threads in the array are executed. The result is as follows.

![](http://abhinavpradeep.com/wp-content/uploads/2020/06/Screen-Shot-2020-06-28-at-6.21.33-pm.png)

#### Discussing the results

The results are undesirable. In a real-world scenario, this would mean that the bank would owe whoever owns the account nearly $1160. So, what happened here?

As stated before, threads run parallel to each other. Hence, all the threads hit the 'Withdraw' method at the same time. The 'Withdraw' method checks to see if each thread is withdrawing less than or equal to $100. Since each thread is withdrawing only $90, they pass the test. The program does not consider that 15 threads are executing it at the same time. Hence, they all hit the program, wait at the buffer, and withdraw $90 of money, leaving a negative balance.

#### Fixing this issue -

To fix this issue a small modification needs to be made to the account class. We need to implement a lock around the code within the 'Withdraw' method. The lock method ensures that one thread does not enter a critical section of code while another thread is in that critical section. This forces the threads to execute one after another (i.e. the thread is forced to execute the entire block of locked code, preventing another thread from hitting the 'Withdraw' method when the current thread is waiting at the Thread.Sleep(10000)). Given below is the code to implement the lock() -

<a href="https://gist.github.com/AbhinavPradeep/69c5cadc0db98135da061dd70fd725cc">View this gist on GitHub</a>

When we execute the code this time, we get the following output -

![](http://abhinavpradeep.com/wp-content/uploads/2020/06/Screen-Shot-2020-06-28-at-6.17.23-pm.png)

#### Discussing the output -

The above output is desirable. This allows for multiple threads to hit the method at the same time without breaking. The first thread can execute as the balance is $100 and the amount of money being withdrawn is $90. Every thread after that, however, cannot withdraw money as there is only $10 left as balance.

Learning about threads has been interesting. There is still a lot to learn about threads and asynchronous programming. Soon, we will be looking at C#'s Async/Await method and implement it in a console application. Until then, goodbye!