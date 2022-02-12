---
title: 'Selection Sort'
date: Thu, 25 Jun 2020 02:34:34 +0000
draft: false
tags: ['algorithm', 'Algorithms']
---

This is the second post in my series on sorting algorithms. Previously, I talked about the insertion sorting algorithm ([Link Here](http://abhinavpradeep.com/blog/algorithms/insertion-sort/)). Today, we take a look at the selection sort algorithm. Later, we implement this in a .net core console application.

Selection sort is one of the elementary sorting algorithms. It sorts the data by finding the smallest item and swapping it into the array in the first unsorted location. The algorithm enumerates the array from the first unsorted item to the end. It then picks the smallest item, swapping it out with the first unsorted item. Given Below is the graphical representation of selection sort -

![](http://abhinavpradeep.com/wp-content/uploads/2020/06/Selection-Sort-Gif.gif)

Selection sort is an inefficient sorting algorithm. It has a worst case, average and best case performance of O(n2). It takes up no extra space at O(n). This is because it operates directly on the array. However selection sort is the algorithm of choice when the cost of a swap is very high. This is due to its property of minimising the number of swaps as compared to other algorithms.

#### Implementation through code

Now we can move on to implementing this in code. All this code is available on my GitHub ([Link here](https://github.com/AbhinavPradeep/SortingArrays)).

<a href="https://gist.github.com/AbhinavPradeep/39372f7ea0e3eed28c4d2b7a4e1bb655">View this gist on GitHub</a>

In the code above, I have created a class with a Sort method. The sort method executes a selection sort on an array when called and is provided with an array as an argument. It also times the ticks that the algorithm (sorting only, not the entire method) takes to execute.

This method also calls another method to print out the contents of the array. The code for this method is given below.

<a href="https://gist.github.com/AbhinavPradeep/b573b0f9cd3c50c59a30246baaca516d">View this gist on GitHub</a>

![](http://abhinavpradeep.com/wp-content/uploads/2020/06/Screen-Shot-2020-06-25-at-12.14.30-pm.png)

Given above is the result of executing this method by calling it from program.cs and giving it an array containing numbers 9 through 1. Note that I have also called another method to execute an insertion sort on the same array. The code for this method can be found in my previous blog post ([Link Here](http://abhinavpradeep.com/blog/algorithms/insertion-sort/)). Here, you can observe that the insertion sort executes in fewer ticks as compared to the selection sort. This is an observable result of their efficiencies.

In the near future, we will be looking at the bubble sort and compare its effectiveness with the insertion and selection sorts. Until then, goodbye!