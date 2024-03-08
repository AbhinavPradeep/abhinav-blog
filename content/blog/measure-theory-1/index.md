---
title: 'Learning Measure Theory 1: Riemann integration'
date: Sun, 18 Jun 2023 12:14:07 +0000
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
  - "math"
  - "measure theory"
summary: "Notes from learning measure theory. Covers a review of Riemann integrals and integrability. These are notes and therefore liable to inaccuracies."
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

## Partition

Partition of $[a,b]$

$$P = \lbrace x_0,x_1,x_2,x_3, ... x_n \rbrace$$

Where

$$x_0 = a, x_n = b$$

Such that

$$a = x_0 < x_1 < x_2 < x_3 < ... x_n =b$$

Effectively a union of closed intervals:

$$[a,b] = [x_0,x_1] \cup [x_1,x_2] \cup [x_3,x_4] ... \cup [x_{n-1},x_n]$$

## Upper and Lower sums

For some $f:[a,b] \to \mathbb{R}$, with respect to some partition $P$

$$U(f,P) = \sum_{i=0}^{n}\sup_{[x_i,x_{i+1}]}\left(f\right)(x_{i+1}-x_i)$$

$$L(f,P) = \sum_{i=0}^{n}\inf_{[x_i,x_{i+1}]}\left(f\right)(x_{i+1}-x_i)$$

$$L(f,P) \le U(f,P)$$

## Refinement inequalities

$P^* $ is a refinement of a partition $P$ if it is a partition such that $P \subset P^*$.

$$ L(f,P) \le L(f,P^* ) \le U(f,P^* ) \le U(f,P) $$

## Riemann Integrability

### Def 1 / Actual definition

$$U(f) = \inf_{P}U(f,P)$$

$$L(f) = \sup_{P}L(f,P)$$

If a function is Riemann integrable, then

$$\int_{a}^{b}f = U(f) = L(f)$$

### Def 2 / Equivalent condition

$$\forall \epsilon > 0 \text{ } \exists P_\epsilon \text{ such that}$$

$$U(f,P_\epsilon)-L(f,P_\epsilon) < \epsilon$$

## Pointwise Convergence

Consider a sequence of $f_i:D \to \mathbb{R}$. This sequence is said to pointwise converge to $f:D \to \mathbb{R}$ if:

$$\forall x \in D, \exists \epsilon > 0, \exists N \in \mathbb{N}, N > 0 \text{ such that if }  n > N$$

$$\left|f(x)-f_n(x)\right| < \epsilon$$

## Uniform Convergence

Consider a sequence of $f_i:D \to \mathbb{R}$. This sequence is said to uniformly converge to $f:D \to \mathbb{R}$ if:

$$\forall \epsilon > 0, \exists N \in \mathbb{N}, N > 0 \text{ such that } \forall x \in D \text{ if } n > N$$

$$\left|f(x)-f_n(x)\right| < \epsilon$$

## Interchanging the Riemann integral and limit

### Theorem 1:

If $f_n$ uniformly converges to $f:[a,b]\to \mathbb{R}$ and $f_n$ is Riemann integrable $\forall n$, then $f$ is Riemann integrable and

$$\int_{a}^{b}f = \lim_{n \to \infty}\int_{a}^{b}f_n$$

That is,

$$\int_{a}^{b}\lim_{n \to \infty}f_n = \lim_{n \to \infty}\int_{a}^{b}f_n$$

#### Part 1: Proving integrability:

Fix $\epsilon>0$. Choose $N$ such that if $n \ge N$,

$$\left|f(x)-f_n(x)\right| < \frac{\epsilon}{4(a-b)}$$

Find corresponding partition $P$ such that:

$$U(f_n,P) - L(f_n,P) < \frac{\epsilon}{2}$$

Consider 

$$U(f,P) - L(f,P)$$

$\left|f(x)-f_n(x)\right| < \frac{\epsilon}{4(a-b)}$ implies that:

$$\left|f(x)-f_N(x)\right| < \frac{\epsilon}{4(a-b)}$$

$$f_N(x)-\frac{\epsilon}{4(a-b)} < f(x) < f_N(x)+\frac{\epsilon}{4(a-b)}$$

This implies that:

$$U(f,P) - L(f,P) < U\left(f_N(x)+\frac{\epsilon}{4(a-b)},P\right) - L\left(f_N(x)-\frac{\epsilon}{4(a-b)},P\right)$$

Consider

$$U\left(f_N(x)+\frac{\epsilon}{4(a-b)},P\right) - L\left(f_N(x)-\frac{\epsilon}{4(a-b)},P\right)$$

The upper and lower sums are a summations and are therefore linear. Moreover, they are the upper and lower 'Riemann integrals'. Hence:

$$U\left(f_N(x),P\right) + \int_{a}^{b}\left(\frac{\epsilon}{4(a-b)}\right) - \left(L\left(f_N(x),P\right) - \int_{a}^{b}\left(\frac{\epsilon}{4(a-b)}\right)\right)$$

$$U\left(f_N(x),P\right) + \int_{a}^{b}\left(\frac{\epsilon}{4(a-b)}\right) - L\left(f_N(x),P\right) + \int_{a}^{b}\left(\frac{\epsilon}{4(a-b)}\right)$$

$$U\left(f_N(x),P\right) - L\left(f_N(x),P\right) + 2\int_{a}^{b}\left(\frac{\epsilon}{4(a-b)}\right)$$

$$U\left(f_N(x),P\right) - L\left(f_N(x),P\right) + \int_{a}^{b}\left(\frac{\epsilon}{2(a-b)}\right)$$

$$U\left(f_N(x),P\right) - L\left(f_N(x),P\right) + \int_{a}^{b}\left(\frac{\epsilon}{2(a-b)}\right)$$

$$U\left(f_N(x),P\right) - L\left(f_N(x),P\right) + \frac{\epsilon}{2}$$

Hence,

$$ U(f,P) - L(f,P) < U\left(f_N(x),P\right) - L\left(f_N(x),P\right) + \frac{\epsilon}{2}$$

From the choice of $P$

$$ U(f,P) - L(f,P) < \frac{\epsilon}{2} + \frac{\epsilon}{2}$$

$$ U(f,P) - L(f,P) < \epsilon$$

As this argument can be repeated $\forall \epsilon > 0$ and the Riemann integrability of $f_n$ guarentees the existence of the necessary $P$, the above argument can be restated as:

$$\forall \epsilon > 0 \text{ } \exists P \text{ such that}$$

$$U(f,P)-L(f,P) < \epsilon$$

Which is the definition of Riemann integrability. Hence $f$ is Riemann integrable.

#### Part 2: Proving interchange of limits

Fix $\epsilon>0$. Choose $N$ such that if $n>N$,

$$\left|f(x)-f_n(x)\right| < \frac{\epsilon}{(a-b)}$$

This implies that 

$$f_n(x)-\frac{\epsilon}{(a-b)} < f(x) < f_n(x)+\frac{\epsilon}{(a-b)}$$

As $f:[a,b] \to \mathbb{R}$ and $f_n:[a,b] \to \mathbb{R}$ are Riemann integrable,

$$\int_{a}^{b}\left(f_n(x)-\frac{\epsilon}{(a-b)}\right)dx < \int_{a}^{b}f(x)dx < \int_{a}^{b}\left(f_n(x)+\frac{\epsilon}{(a-b)}\right)dx$$

By linearity of the Riemann integral

$$\int_{a}^{b}f_n(x)dx-\int_{a}^{b}\left(\frac{\epsilon}{(a-b)}\right)dx < \int_{a}^{b}f(x)dx < \int_{a}^{b}f_n(x)dx+\int_{a}^{b}\left(\frac{\epsilon}{(a-b)}\right)dx$$

$$\int_{a}^{b}f_n(x)dx-\epsilon < \int_{a}^{b}f(x)dx < \int_{a}^{b}f_n(x)dx-\epsilon$$

This implies that

$$\left|\int_{a}^{b}f(x)dx-\int_{a}^{b}f_n(x)dx\right| < \epsilon$$

This argument can be repeated $\forall \epsilon \in \mathbb{R}$. Hence, this can be stated as:

$$\forall \epsilon > 0 \text{ } \exists N > 0 \text{ } N \in \mathbb{N} \text{ such that if } n > N,$$

$$\left|\int_{a}^{b}f(x)dx-\int_{a}^{b}f_n(x)dx\right| < \epsilon$$

This is the limit definition of a sequence. Hence it can be said that

$$\int_{a}^{b}f = \lim_{n \to \infty}\int_{a}^{b}f_n$$

That is,

$$\int_{a}^{b}\lim_{n \to \infty}f_n = \lim_{n \to \infty}\int_{a}^{b}f_n$$

## Deficiencies of the Riemann integral

Theorem 1 is an example of the deficiencies of Riemann integration. The proof makes it explicit that there is a heavy reliance on uniform continuity. In general limits may not be brought inside the integral if convergence is pointwise. 

In general for a function on $[a,b]$ to be Riemann integrable, it must be both bounded on $[a,b]$ and have only finitely many discontinuities. Below are some examples of functions that are not Riemann integrable.

Example 1:

![targets](./images/CF.png)

It is the characteristic function of the irrational numbers $\in [0,1]$. Now consider any partition $P$. Refinements of $P$ would reduce the size of intervals $[x_i,x_{i+1}]$. By the density of irrationals in the reals, any $[x_i,x_{i+1}]$ contains at least one irrational number. Hence for infinitely small intervals $[x_i,x_{i+1}]$:

$$\sup_{[x_i,x_{i+1}]}f = 1$$

Hence

$$U(f,P) = \sum_{i=0}^{n}\sup_{[x_i,x_{i+1}]}\left(f\right)(x_{i+1}-x_i)$$

$$U(f,P) = \sum_{i=0}^{n}(x_{i+1}-x_i)$$

$$U(f,P) = x_n - x_0$$

$$U(f,P) = 1 - 0$$

$$U(f,P) = 1$$

Correspondingly,

$$\inf_{[x_i,x_{i+1}]}f = 0$$

$$L(f,P) = \sum_{i=0}^{n} 0 \cdot (x_{i+1}-x_i)$$

$$L(f,P) = 0$$

Taking infinitely smaller partitions is equivalent to taking an infimum over the set of all $U(f,P)$ and the supremum over set of all $L(f,P)$. Hence as $L(f) \neq U(f)$, the $f(x)$ is not Riemann integrable.


Example 2:

![targets](./images/UB.png)

For any partition $P=\{x_0,x_1,x_2 ... x_n\}$ on $f(x)$, $\displaystyle \sup_{[x_0,x_1]}f = \infty$. Therefore the upper sum $U(f,P)$ is always infinite.

However, if the below is taken:

$$\lim_{a \to 0} \int_{a}^{1} f(x)$$

By the FTC

$$\lim_{a \to 0} \int_{a}^{1} f(x) = \lim_{a \to 0} \left( 2\sqrt{x} \bigg|^{1}_{a}\right)$$

$$\lim_{a \to 0} \int_{a}^{1} f(x) = \lim_{a \to 0} \left(2\sqrt{1} - 2\sqrt{a}\right)$$

By direct substitution

$$\lim_{a \to 0} \int_{a}^{1} f(x) = 2 - 2\sqrt{0}$$

$$\lim_{a \to 0} \int_{a}^{1} f(x) = 2 $$

From the above it is evident that the limit of Riemann sums exist. However the integral $\displaystyle \int_{0}^{1} f(x)$ cannot be directly computed.