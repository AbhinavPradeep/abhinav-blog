---
title: 'Data structures - Linked Lists'
date: Mon, 20 Jan 2020 05:10:41 +0000
draft: false
tags: ['Data Structures', 'datastructures', 'linkedlist', 'singlylinkedlist']
---

My blog looks completely different. I know. That's because we had to nuke the old one to self-host the blog. Besides, it turned out looking much better. I'm pretty happy with the changes. I did plan on publishing this post back in December. However, we lost the draft while making the changes. So now I have to do this all over again. Well, I can't really do anything, can I?

Today's topic of discussion is the Linked List. We will delve deeper into its inner workings and even make one on our own using c#.

TL;DR
-----

Linked Lists contain nodes that can store an object and a pointer called the Next pointer. The first node is called the head node. The next pointer of each node points to the next node in the list. To see if a node is the last node, check if the next pointer of that node is null. To remove a node from the list, make the pointer of the previous node point to the next node. In order to add a node, create a node object and make the pointer of the last node in the list point to it.

Linked List
-----------

A linked list is a data structure. Data structures basically allow for better access and management of data. Each type of data structure has its strengths and weaknesses. Linked Lists are useful for a variety of reasons. Linked Lists are very efficient as far as data allocation is concerned. They also have faster insert and delete time. However, one downside is the search time. Because we have to go through the entire list to find a specific node. It takes time to find a specific node.

There are two types of linked lists namely

*   Singly Linked lists.
*   Doubly Linked lists.

Singly Linked Lists
-------------------

![](http://abhinavpradeep.com/wp-content/uploads/2020/01/SinglyLinkedLinkedLists.png)

Singly Linked Lists

In a singly-linked linked list, each node is connected to the other by a single link. It can only be traversed in a single direction; that is, you can go from the first node in the list to the last node, but you cannot move from the last node to the first node.

Designing a singly-linked linked list.
--------------------------------------

Imagine that we need to make a list of people and store their names. We, therefore, create a person.cs class.

<a href="https://gist.github.com/AbhinavPradeep/bc54626bb243d50f3d8461baad1e7ff1">View this gist on GitHub</a>

Designing your own singly-linked linked list is a very easy task. The first thing that you need to do is to create a node class. Given below is the example of the node class that we are going to be using in this example.

<a href="https://gist.github.com/AbhinavPradeep/dca08904d318ea873e016dbab4abce3e">View this gist on GitHub</a>

The node contains an object of type person. It also contains a pointer to the "Next" node.

Next, we instantiate a node called "Head" and assign a null value to it.

<a href="https://gist.github.com/AbhinavPradeep/a92c1904615b4cba73cb798ca13bae08">View this gist on GitHub</a>

Now we have the CreateNode() method. The CreateNode() method accepts a person and sets the current nodes person to the given person. this basically adds a new node to the list.

<a href="https://gist.github.com/AbhinavPradeep/6cc72460e38f2794db2bdcc723e43951">View this gist on GitHub</a>

Then we have our Add() method. The Add() method uses the CreateNode(). The add method, however, checks where it needs to be placed.

<a href="https://gist.github.com/AbhinavPradeep/44fb92e686421bbe2c7a279789725865">View this gist on GitHub</a>

Finally, we have the Remove() method. The remove method first filters to find the required node. Then, makes the previous nodes pointer point to the next node.

<a href="https://gist.github.com/AbhinavPradeep/8a1f3323f8c924ac3f3ddbf904604f96">View this gist on GitHub</a>

All of this code is available [here](https://github.com/AbhinavPradeep/LinkedList) at my github