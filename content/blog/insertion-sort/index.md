---
title: 'Insertion sort'
date: Wed, 24 Jun 2020 07:38:47 +0000
draft: false
tags: ['Algorithms']
---

Recently, I've been learning about different types of sorting algorithms. However, I am far from being an expert on this. So take everything I say with a grain of salt. In this blog post, I document my first look at insertion sort. Later, we implement this method of sorting in a .Net core console application.

Insertion sort is one of the elementary sorting algorithms. It sorts each item in the array as it is encountered. This method of sorting works from left to right. Everything left of the current item is known to be sorted. Everything to its right is unsorted. As a part of the sorting process, the current item is placed/inserted into place within the sorted section. Below is a graphical representation of how insertion sort works.

![](http://abhinavpradeep.com/wp-content/uploads/2020/06/Insertion-sort-example-1.gif)

Insertion sort has a worst-case and average efficiency of O(n<sup>2</sup>). This makes insertion sort unsuitable for large data sets. However, insertion sort has the best efficacy of O(n) when given a small and nearly sorted data set. From what I gather, O(n<sup>2</sup>) aka quadratic complexity is used when the complexity is exponential. ie. if n is 4, the complexity would be 16. Note here complexity means the number of operations executed.

#### Implementation through code

Now we can move on to implementing this in code. All this code is available on my GitHub ([Link here](https://github.com/AbhinavPradeep/SortingArrays)).

<a href="https://gist.github.com/AbhinavPradeep/d90e38de177c4f7e12ad4b2e0125982d">View this gist on GitHub</a>

In the code above, I have created a class with a Sort method. The sort method executes an insertion sort on an array when called and is provided with an array as an argument. It also times the ticks that the algorithm (sorting only, not the entire method) takes to execute.

The sorting in and of itself is just 2 "for" statements and 1 "if" statement. The first "for" iterates through the entire array. The second "for" moves backward comparing the current index with previous ones, swapping when necessary.

This method also calls another "PrintIntegerArray" method. This, as the name suggests is a simple method that iterates through an integer array and prints its constituents. Below, you will find the code for this -

<a href="https://gist.github.com/AbhinavPradeep/b573b0f9cd3c50c59a30246baaca516d">View this gist on GitHub</a>

Then, all that's left to do is to create an array in Program.cs and call the InsertionSort method. The result of this on an array containing digits 9 through 1 in the reverse order is as follows.

![](http://abhinavpradeep.com/wp-content/uploads/2020/06/Screen-Shot-2020-06-24-at-5.05.49-pm.png)

In the near future, we will be looking at the selection sort and compare its effectiveness with the insertion sort. Until then, goodbye!