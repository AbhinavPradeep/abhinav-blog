---
title: 'Algorithm Archives - Shunting Yard Algorithm'
date: Thu, 07 Jan 2021 02:29:14 +0000
draft: false
tags: ['Algorithms', 'algorithms', 'bubble sort', 'sorting algorithm']
---

Visual basic .NET was launched as a successor to Visual Basic in 2002. It runs on the .NET framework and is multi-paradigm and object-oriented. As far as I'm aware multi-paradigm refers to the language's ability to support more than one programming paradigm or style, for example - to support OOP in combination with imperative and procedural styles. VB.NET is being deprecated as the language will not have any new features added to it. However, its continuing support on .NET core and inherent simplicity make it a good language for year 11 & 12 students to use in our pursuit to make discerning decisions concerning the development, use and impact of technologies.

As part of my effort to get some study done during the summer break, I decided that I would start off learning VB.NET through coding a calculator. A basic one would be no fun and repetitive. Hence, I decided to create a calculator that could evaluate expressions with multiple operators and brackets, while taking into consideration the precedence of operators (i.e. BODMAS). It was while coding this calculator that I stumbled upon the [Shunting-Yard Algorithm](https://en.wikipedia.org/wiki/Shunting-yard_algorithm).

#### What is it?

The Shunting-Yard Algorithm is a method for converting infix mathematical expressions to their postfix forms. Infix expressions refer to the way we normally write mathematical expressions, ex: 2 + 3 \* 5 - 6 /2 \* ( 3 - 1 ). Computers however would struggle to deal with this due to the lack of operator precedence. Postfix or Reverse Polish Notation fixes this problem. For example, the above infix expression when converted to postfix would look something like this: 2 3 5 \* + 6 2 / 3 1 - \* -. This would allow for easier evaluation as demonstrated below -

![](https://abhinavpradeep.com/wp-content/uploads/2021/01/Evaluating-Postfix@2x-2-1024x331.png)

#### Important terms

*   Token - Can be a number or operator of any kind. In this case, the token will be of type string.
*   Operator - Mathematical symbols used to represent any operation.
*   Stack - LIFO (last item in first item out) data structure
*   Queue - FIFO (first item in first item out) data structure

#### Pseudo logic

![](https://abhinavpradeep.com/wp-content/uploads/2021/01/Screen-Shot-2021-01-05-at-2.48.01-pm-1024x479.png)

#### Example diagram

![](https://abhinavpradeep.com/wp-content/uploads/2021/01/ShuntingYardDemonstation@2x-1024x576.png)

#### Efficiency

Every token will be read, pushed, or popped once making giving the shunting yard algorithm a run-time efficiency of log(n) or linear complexity - which makes it very efficient.