---
title: 'Bubble sort'
date: Fri, 26 Jun 2020 04:42:56 +0000
draft: false
tags: ['Algorithms', 'algorithms', 'bubble sort', 'sorting algorithm']
---

This is the third post in my series on sorting algorithms. Previously, I talked about the selection sorting algorithm ([Link Here](http://abhinavpradeep.com/blog/algorithms/selection-sort/)). Today, we take a look at the bubble sort algorithm. Later, we implement this in a .net core console application.

Bubble sort is considered to be one of the simplest sorting algorithms. This algorithm works from right to left. On each pass, it compares each array item with its right neighbor. As a result, the smaller item moves towards the right. If the items are already in the right order, no swaps are performed. Subsequent passes are performed until no more swaps are performed. Given Below is the graphical representation of bubble sort –

![](http://abhinavpradeep.com/wp-content/uploads/2020/06/Bubble-Sort-1.gif)

Bubble sort has a worst-case and average efficiency of O(n^2). However, it has the redeeming quality of being efficient at sorting small and nearly sorted data sets. Hence, it has the best case efficiency of O(n). Moreover, it takes up only O(n) space. This is because it operates directly on the array. This means that it is a candidate when minimizing space is paramount.

#### Implementation through code

Now we can move on to implementing this in code. All this code is available on my GitHub ([Link here](https://github.com/AbhinavPradeep/SortingArrays)).

<a href="https://gist.github.com/AbhinavPradeep/04eadb64d75c6c91ea729e3c203d96c4">View this gist on GitHub</a>

In the code above, I have created a class with a Sort method. The sort method executes a bubble sort on an array when called. It also times the ticks that the algorithm (sorting only, not the entire method) takes to execute. The code consists of two for loops that iterate through the array and an if statement to compare the items in the array.

This method also calls another method to print out the contents of the array. Given below is the code for this method.

<a href="https://gist.github.com/AbhinavPradeep/b573b0f9cd3c50c59a30246baaca516d">View this gist on GitHub</a>

![](http://abhinavpradeep.com/wp-content/uploads/2020/06/Screen-Shot-2020-06-26-at-11.12.26-am-1.png)

Given above is the result of executing this method by calling it from program.cs and giving it an array containing numbers 9 through 1. Note that I have also called another method to execute a selection sort on the same array. The code for this method can be found in my previous blog post ([Link Here](http://abhinavpradeep.com/blog/algorithms/insertion-sort/)). Here, you can observe that the selection sort executes in fewer ticks as compared to the bubble sort. This is an observable result of their efficiencies.

In the near future, we will be looking at the shell sort and compare its effectiveness with the insertion, selection and bubble sorts. Until then, goodbye!