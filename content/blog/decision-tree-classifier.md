---
title: 'Decision tree classifier'
date: Thursday, 7 Sep 2023 12:14:07 +0000
draft: false
comments: true
toc: true
showToc: true
TocOpen: false
math: true
Author: Abhinav Pradeep
ShowPostNavLinks: true
ShowRssButtonInSectionTermList: true
tags: 
  - "machine learning"
  - "supervised learning"
summary: ""
# images:
#   - STRUT.png
# cover:
#     image: "RecursiveInsert.png"
#     alt: "Tree data structure"
#     caption: "Tree data structure"
#     relative: true
editPost:
  URL: "https://github.com/AbhinavPradeep/abhinav-blog/blob/main/content"
  Text: "Edit this post on github" # edit text
  appendFilePath: true # to append file path to Edit link
---

## What are decision trees?

Decision trees are a form of supervised machine learning. They are built on a binary tree data structure and generate predictions by percolating input features through a system of binary questions. The below illustration depicts a decision tree (specifically a classifier tree):

![targets](/DCT1.png)

Decision trees are of two primary types: classification and regression. Loosely, classification trees output predictions with a discrete domain whereas regression trees output predictions with a continuous domain. For example, an algorithm to predict the fruit given a set of descriptors would be a classification algorithm whereas an algorithm to calculate  the probability of post-operative complications would be a regression algorithm. 


## Formalizing the classification problem:

Given training data as a set of $n$ tuples of the form:

$$\textbf{d} = \lbrace (\textbf{X}_i, L_i) | i \in [1,n] \rbrace$$

Where $\textbf{X}$ is a feature vector containing some $m$ features.

$$\textbf{X} = ( x_1, x_2, x_3,... x_m )$$

And $L$ is the label such that $L$ must have a discrete domain, the task is to generate a model $m(\textbf{X})$ that assigns labels based on an input feature vector. That is, given some feature vector $\textbf{X}$, it can generate prediction $\hat{L}$:

<!-- i.e. $L$ can only assume a state from a finite or countably infinite set,  -->

$$m(\textbf{X}) = \hat{L}$$

For the purposes of this article, the problem is further simplified by assuming that features cannot be equipped with comparators. That is, if weight is a feature, the question "Is weight $\le$ $x$ kg?" cannot be asked. Clearly this would stunt the algorithm's efficacy when dealing with numerical features. However, when it comes to non-numerical features, such questions would generally be meaningless. For example, if colour was a feature, the question "Is colour $\le$ green?" is meaningless. Hence, the purpose of this article is to create a classifier algorithm for data with non-numeric features. Specifically, a decision classifier tree of such specifications will be created.

## Strategy:

The problem of creating a decision classifier tree boils down to one of asking the right questions in the right order. To be more concrete, consider the head node of the tree. This would be first question asked. Consider again the training data set

$$\textbf{d} = \lbrace (\textbf{X}_i, L_i) | i \in [1,n] \rbrace$$

Given that any boolean question partitions this data into two sets $\textbf{d}_T$ and $\textbf{d}_F$, it is intuitive that the best question to ask would be on that creates the purest split. That is, the question that generates $\textbf{d}_T$ and $\textbf{d}_F$ with the least mixing of labels must be asked. 

![targets](/DCT2.png)

To be more concrete, this 'mixing' is quantified by Gini impurity index. We take a quick detour to derive this. Consider some dataset consisting of items marked by $J$ labels with relative frequencies $\left( \text{i.e.} \frac{\text{number of occurrences}}{\text{size of dataset}}\right)$ $p_i$ , $i \in [1,J]$. Gini impurity measures the probability that choosing an item at random and label at random from this dataset would yield an incorrect match. The items and labels are both identically distributed according to relative frequency, as visualized by the below illustration:

![targets](/DCT3.png)

Clearly, the likelihood of picking correctly matching the item $i$ and label $i$ would be:

$$P(\text{Matching}_i) = P(\text{Picking the item}_i) \text{ and } P(\text{Picking the label}_i)$$

By probability theory:

$$P(\text{Matching}_i) = P(\text{Picking the item}_i) \times P(\text{Picking the label}_i)$$

Probability of picking the correct item would be its relative frequency $p_i$. Moreover, as the items and labels are identically distributed, the probability of picking the correct label would also be $p_i$.

$$ P(\text{Matching}_i) =  p_i \times p_i$$

$$ P(\text{Matching}_i) =  p_i^2$$

Now, the the probability of correctly matching any label with its corresponding item can be written as:

$$P(\text{Matching}) =  P(\text{Matching}_1) \text{ or } P(\text{Matching}_2) \text{ or } ... \text{ } P(\text{Matching}_J)$$

By probability theory:

$$P(\text{Matching}) =  P(\text{Matching}_1) + P(\text{Matching}_2) + ... \text{ } P(\text{Matching}_J)$$

In summation notation:

$$P(\text{Matching}) =  \sum_{i=1}^{J} P(\text{Matching}_i)$$

From earlier derivation,

$$P(\text{Matching}) =  \sum_{i=1}^{J} p_i^2$$

Now consider the probability of an incorrect match. As matching and not matching are mutually exclusive and exhaustive,

$$P(\text{Matching}) + P(\text{Not Matching}) = 1$$

$$P(\text{Not Matching}) = 1 - P(\text{Matching})$$

$$P(\text{Not Matching}) = 1 - \sum_{i=1}^{J} p_i^2$$

As the Gini impurity $G$ measures the probability that choosing an item at random and label at random would yield an incorrect match,

$$G = 1 - \sum_{i=1}^{J} p_i^2$$



<!-- Given a label $i$, probability of assigning the correct item to that label would be the relative frequency of the item with that label: $p_i$. -->


## Implementation: