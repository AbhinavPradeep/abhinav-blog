---
title: 'Learning Measure Theory 3: Measurable spaces and functions'
date: Sat, 22 Jun 2024 11:24:22 +0000
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
summary: "Notes from learning measure theory. Covers measurable spaces and functions. These are notes and therefore liable to inaccuracies."
images:
   - images/cover.png
hideCoverImage: true
cover:
    image: "images/cover.png"
    alt: "Measure Theory - Part 3"
    caption: "Measure Theory - Part 3"
    relative: true
    hidden: true
editPost:
  URL: "https://github.com/AbhinavPradeep/abhinav-blog/blob/main/content"
  Text: "Edit this post on github" # edit text
  appendFilePath: true # to append file path to Edit link
---
## $\pi$ and $\lambda$-systems

Before going onto measurable spaces, it is important to flesh out $\pi$-systems and $\lambda$-systems as these simplify later proofs.

### $\pi$-system

Consider some set $E$. A $\pi$-system on $E$ is a collection $\mathcal{C}$ of subsets of $E$ that are closed under finite intersection.

### $\lambda$-system

Consider some set $E$. A $\lambda$-system on $E$ is a collection $\mathcal{D}$ of subsets of $E$ that satisfy:

1. $E \in \mathcal{D}$

2. For any $A,B \in \mathcal{D}$, $B \subseteq A \implies A \setminus B \in \mathcal{D}$

3. For some monotone increasing $\left( \text{i.e. } A\_1 \subseteq A\_2 \subseteq A\_3  \text{ ... }\right)$ sequence of sets $A\_n \in \mathcal{D}$, we have that the countable union $\bigcup\_{i=1}^{\infty} A\_i \in \mathcal{D}$

### $\sigma$-algebras as a $\pi$ and $\lambda$-system

Consider some collection of sets $\Sigma$ of $E$.

$$\Sigma \text{ is a } \sigma \text{-algebra on E} \iff \left(\Sigma \text{ is a } \pi \text{-system on E}\right) \land \left(\Sigma \text{ is a } \lambda \text{-system on E}\right)$$

$\implies$

A $\sigma$-algebra is $\pi$-system as it is closed under countable intersection and therefore finite intersection. It is also a $\lambda$-system as it contains $E$, is closed under relative complement (as $A \setminus B = A \cap B^c$), and also countable unions of any sequence.

$\impliedby$

Suppose $\Sigma$ is both a $\pi$ and $\lambda$-system. To show that it is a $\sigma$-algebra,

1. $E \in \Sigma$.

2. $\Sigma$ is closed under complement: As we have $E \in \Sigma$ (first property of $\lambda$-system), we have that for any set $S \in \Sigma$, $S \subseteq E$ and therefore $S^c := E \setminus S \in \Sigma$ (second property of $\lambda$-system)

3. $\Sigma$ is closed under countable union: Firstly we have that $\Sigma$ is closed under finite unions. This is because as $\Sigma$ is a $\pi$-system, we have closure under finite intersection, and closure under complement was previously proven. Hence, by De Morgans law, $\Sigma$ is closed under finite unions. Now consider some sequence of sets $A\_n \in \Sigma$. Define $B\_n = \bigcup\_{i=1}^{n} A\_n$. $B\_n \in \Sigma$ by closure under finite union. Moreover, as $\Sigma$ is also a $\lambda$-system, we have closure under countable unions of a monotone increasing sequence. Hence, as $B\_n$ is a monotone increasing sequence, we have $\bigcup\_{i=1}^{\infty} B\_i \in \Sigma$. As $\bigcup\_{i=1}^{\infty} B\_i = \bigcup\_{i=1}^{\infty} A\_i$, $\bigcup\_{i=1}^{\infty} A\_i \in \Sigma$

### Dynkin's $\pi$-$\lambda$ theorem

Consider a $\pi$-system $\Pi$ and a $\lambda$-system $\Lambda$ on $E$.

$$\Pi \subseteq \Lambda \implies \sigma \Pi \subseteq \Lambda$$

For this proof we must first establish that, for some $\lambda$-system $\mathcal{D}$ with $S \in \mathcal{D}$:

$$\hat{\mathcal{D}} := \lbrace A \in \mathcal{D}  \text{ } |  \text{ } A \cap S \in \mathcal{D} \rbrace$$

Then $\hat{\mathcal{D}}$ is a $\lambda$-system:

1. $E \in \hat{\mathcal{D}}$ as $E \in \mathcal{D}$ and $E \cap S = S \in \mathcal{D}$

2. Consider some $A,B \in \hat{\mathcal{D}}$ with $B \subseteq A$ We want to show that $A \setminus B \in \hat{\mathcal{D}}$. We have that $A \setminus B \in \mathcal{D}$. Note that we also have $A \cap S \in \mathcal{D}$ and $B \cap S \in \mathcal{D}$. To show that $\left(A \setminus B\right) \cap S \in \mathcal{D}$, consider that $A \setminus B = A \cap B^c$. Now consider 

$$\left(A \setminus B\right) \cap S$$

Distributing,

$$ = \left(A \cap S\right) \setminus \left(B \cap S\right)$$

As $B \subseteq A$, we also have that $B \cap S \subseteq A \cap S$. Hence, we have that $\left(A \setminus B\right) \cap S \in \mathcal{D}$ and hence $\left(A \setminus B\right) \in \hat{\mathcal{D}}$

3. Consider some monotone increasing sequence of sets $A\_n \in \hat{\mathcal{D}}$. That is, $\forall n  \text{ } A\_n \cap S \in \mathcal{D}$. Hence we also have that the sequence $A\_n \cap S$ is increasing. Hence we have that $\bigcup\_{i=1}^{\infty} \left( A\_i \cap S\right) \in \mathcal{D}$. By the distributive law, $\bigcup\_{i=1}^{\infty} \left( A\_i \cap S\right) = \left(\bigcup\_{i=1}^{\infty} A\_i\right) \cap S$. Hence, as $\left(\bigcup\_{i=1}^{\infty} A\_i\right) \cap S \in \mathcal{D}$, we have $\bigcup\_{i=1}^{\infty} A\_i \in \hat{\mathcal{D}}$. 

Now, to prove the Dynkin $\pi$-$\lambda$ theorem, we will prove that the smallest smallest $\lambda$-system $\mathcal{D}$ (intersect of all $\lambda$-systems containing $\Pi$) generated by $\Pi$ is also a $\pi$-system. This would then mean that $\mathcal{D}$ is a $\sigma$-algebra containing $\Pi$. Moreover, by defenition, $\sigma\Pi \subseteq \mathcal{D}$. First fix some $S \in \Pi$. Consider:

$$\mathcal{D}\_S := \lbrace A \in \mathcal{D}  \text{ } |  \text{ } A \cap S \in \mathcal{D} \rbrace$$

As $\Pi \subseteq \mathcal{D}$, we have that $S \in \mathcal{D}$. Hence we have $\mathcal{D}\_S$ is a $\lambda$-system. Moreover, we have that $\Pi \subseteq \mathcal{D}\_S$ as if we have $A \in \mathcal{D}$ such that $A \in \Pi$, we have that $A \cap S \in \Pi$, as $\Pi$ is a $\pi$-system, and $\mathcal{D}\_S$ contains all such sets. Hence $\mathcal{D}\_S$ is a $\lambda$-system containing $\Pi$. Hence it must also contain $\mathcal{D}$ by the minimality of $\mathcal{D}$. Therefore, $\mathcal{D}\_S = \mathcal{D}$. Hence we have that $A \cup S \in \mathcal{D}$ for any $S \in \Pi$.

Now take any $B \in \mathcal{D}$. Consider the set:

$$\mathcal{D}\_B := \lbrace A \in \mathcal{D}  \text{ } |  \text{ } A \cap B \in \mathcal{D} \rbrace$$

$\mathcal{D}\_B$ is again a $\lambda$-system. Since $\mathcal{D} = \mathcal{D}\_S$, we have for any set $B \in \mathcal{D}$ such that $B \in \Pi$, we have that, for any $A \in \mathcal{D}$, $A \cap B \in \mathcal{D}$ and hence $\Pi \subseteq \mathcal{D}\_B$. Hence we also have that $\mathcal{D}\_B = \mathcal{D}$. Hence $\forall A,B \in \mathcal{D}$, we have that $A \cap B \in \mathcal{D}$. Therefore $\mathcal{D}$ is also a $\pi$-system. Hence, $\mathcal{D}$ is a $\sigma$-algebra. We have:

$$\Pi \subseteq \sigma\Pi \subseteq \mathcal{D} \subseteq \Lambda$$

## Measurable spaces

A measurable space is a tuple $(E,\mathcal{E})$ where $\mathcal{E}$ is a $\sigma$-algebra on $E$. Last time we covered the definition and basic properties of $\sigma$-algebra, including how to generate a $\sigma$-algebra for any set $C \subseteq E$, with motivation rooted in non-measurable subsets of $\mathbb{R}$. To extend on that we will now define the measurable space $(\mathbb{R},\mathcal{B})$. Let $C := \lbrace (-\infty,x]  \text{ } |  \text{ } x \in \mathbb{R} \rbrace$. $\mathcal{B}$, called the Borel $\sigma$-algebra, is defined as $\mathcal{B} := \sigma C$. Note that $\mathcal{B}$ contains all usual sets of interest in $\mathbb{R}$:

1. Singleton sets $\lbrace x \rbrace$: For some $x \in \mathbb{R}$ we have that $(-\infty,x] \in C$ and therefore $(-\infty,x] \in \sigma C$. Note that as $\sigma C$ is a $\sigma$-algebra, the complement $(-\infty,x]^c = (x,\infty) \in \sigma C$. Now let,

$$I\_n = \left(x-\frac{1}{n}  \text{ } ,  \text{ } \infty\right)$$

Note that 

$$\forall n \in \lbrace 1,2,3  \text{ ... } \rbrace, I\_n \in \sigma C$$

as $\forall n \in \lbrace 1,2,3  \text{ ... } \rbrace, x-\frac{1}{n} \in \mathbb{R}$. Now let

$$L := \bigcap\_{n=1}^{\infty} I\_n$$

Clearly $L \in \sigma C$ as $\sigma$-algebras are closed under countable intersection. Consider that $\forall n$, $[x,\infty) \subseteq I\_n$. Hence,

$$[x,\infty) \subseteq L$$

Next we wish to prove $L \subseteq [x,\infty)$. Now consider some $a \in L$ such that $a \notin [x,\infty)$. We will prove that such $a$ cannot exist. $a \notin [x,\infty) \implies a < x$ and $a \in L \implies \forall n, a \in I\_n$. We have that $\lim\_{n \to \infty} x-\frac{1}{n} = x$. If $a < x$ then we have that $a < x - \frac{1}{N}$ for some sufficiently large $N$. Hence, $a \notin I\_N$ and therefore $a \notin L$, which is a contradiction. Hence,

$$L \subseteq [x,\infty)$$

$$\left([x,\infty) \subseteq L\right) \land \left(L \subseteq [x,\infty)\right) \implies L = [x,\infty)$$

As we have $[x,\infty) \in \sigma C$ and $(-\infty,x] \in \sigma C$, by closure under intersection, we have $(-\infty,x] \cap [x,\infty) = \lbrace x \rbrace \in \sigma C$, and therefore we have singleton sets in the $\mathcal{B}$.

2. Open intervals $(a,b)$: As we have $\lbrace x \rbrace \in \sigma C$ and $(\infty,x] \in \sigma C$, we have that $(-\infty,x] \setminus \lbrace x \rbrace = (-\infty,x] \cap \lbrace x \rbrace^c = (-\infty,x) \in \sigma C$. A similar strategy can be employed with $[x,-\infty)$. Hence for any $a,b \in \mathbb{R}$ we have sets of the form $(-\infty,b)$ and $(a,\infty)$ in $\sigma C$. If $a < b$, we have that $(-\infty,b) \cap (a,\infty) = (a,b) \in \sigma C$

3. Closed intervals $[a,b]$: As we showed inclusion of sets of form $(a,b)$ and the singletons $\lbrace a \rbrace$ and $\lbrace b \rbrace$ we can just take the unions of these.

### Product spaces

For two measurable spaces $(E,\mathcal{E})$ and $(F,\mathcal{F})$, the product space is defined as $(E \times F,\mathcal{E} \otimes \mathcal{F})$ where

$$\mathcal{E} \otimes \mathcal{F} := \sigma \lbrace A \times B  \text{ } |  \text{ } A \in \mathcal{E}, B \in \mathcal{F} \rbrace$$

## Measurable functions

A function $f: (E, \mathcal{E}) \to (F, \mathcal{F})$ is considered an $\mathcal{E}$/$\mathcal{F}$ measurable function if $\forall S \in \mathcal{F}$, the preimage $f^{-1}(S) \in \mathcal{E}$, where the preimage is defined to be:

$$f^{-1}(S) := \lbrace x \in E  \text{ } |  \text{ } f(x) \in S \rbrace$$

### Properties of measurable functions

#### Mesuability from generating sets

$f:(E, \mathcal{E}) \to (F, \mathcal{F})$ is $\mathcal{E}$/$\mathcal{F}$ measurable $\Leftrightarrow$  $\forall S \in \mathcal{F}\_0$ where $\mathcal{F} = \sigma\mathcal{F}\_0$, $f^{-1}(S) \in \mathcal{E}$

$\Rightarrow$

As $\mathcal{F}\_0 \subset \mathcal{F}$, the measureability definition guarantees this.

$\Leftarrow$

Consider set 

$$\mathcal{G} := \lbrace X \in \mathcal{F}  \text{ } |  \text{ } f^{-1}(X) \in \mathcal{E} \rbrace$$

Now prove that $\mathcal{G}$ is a $\sigma$-algebra:

1. $F \in \mathcal{G}$ as $E = f^{-1}(F)$

2. $S \in \mathcal{G}$. $S^c \in \mathcal{G}$ as $f^{-1}(S^c) = f^{-1}(S)^c$

3. $S\_n \in \mathcal{G}$. $\bigcup\_{n}S\_n \in G$ as $f^{-1}(\bigcup\_{n}S\_n) = \bigcup\_{n}f^{-1}(S\_n)$

Suppose $\mathcal{F}\_0 \subseteq \mathcal{G}$. 

Hence $\mathcal{F} \subseteq \mathcal{G}$ as $\mathcal{G}$ was shown to be a $\sigma$-algebra and $\mathcal{F}$ is generated by $\mathcal{F}\_0$. Moreover, as $\mathcal{G}$ is built from the elements of $\mathcal{F}$, $\mathcal{G} \subseteq \mathcal{F}$. Hence, $\mathcal{G} = \mathcal{F}$. Therefore, if $\mathcal{F}\_0 \subseteq \mathcal{G}$, which implies that $\forall S \in \mathcal{F}\_0$ $f^{-1}(S) \in \mathcal{E}$, $\mathcal{F} = \lbrace X \in \mathcal{F}  \text{ } |  \text{ } f^{-1}(X) \in \mathcal{E} \rbrace$, i.e. $\mathcal{F}$ is precisely the set such that every element of $\mathcal{F}$ has an inverse image that lies in $\mathcal{E}$, which is the equivalent of saying that every set in $\mathcal{F}$ has an inverse image in $\mathcal{E}$, which is the definition of measurability.

#### Composition of measurable functions

For some measurable spaces $(E,\mathcal{E})$, $(F,\mathcal{F})$, and $(G,\mathcal{G})$ and functions $f: E \to F$ and $g: F \to G$

$$(f \text{ is } \mathcal{E}/\mathcal{F} \text{ measurable}) \land (g \text{ is } \mathcal{F}/\mathcal{G} \text{ measurable}) \to g \circ f \text{ is } \mathcal{E}/\mathcal{G} \text{ measurable}$$

Consider some set $S \in \mathcal{G}$. As $g$ is $\mathcal{F}/\mathcal{G}$ measurable, $g^{-1}(S) \in \mathcal{F}$. Moreover, as $f$ is $\mathcal{E}/\mathcal{F}$ measurable, $f^{-1}(g^{-1}(S)) \in \mathcal{E}$. Hence, $g \circ f$ is $\mathcal{E}/\mathcal{G}$ measurable.

#### Measurability of sections

$f: E \times F \rightarrow G$ be $(\mathcal{E} \otimes \mathcal{F}) / \mathcal{G}$-measurable. For some $x\_0 \in E$ we have that the function $y \mapsto f(x\_0, y)$, called a section of $f$, is $\mathcal{F}/\mathcal{G}$-measurable:

Consider the function $h: F \to E \times F$ defined by $y \mapsto (x\_0,y)$. Want to show that $h$ is $\mathcal{F} / \mathcal{E} \otimes \mathcal{F}$-measurable.

Consider that,

$$h^{-1}(A \times B) = \begin{cases}
    B \text{ if } x\_0 \in A \\\
    \emptyset \text{ if } x\_0 \not \in A
\end{cases}$$

Hence it is clear that for any $A \times B$ such that $ A \in \mathcal{E}$ and $B \in \mathcal{F}$, $h^{-1}(A \times B) \in \mathcal{F}$, as $B \in \mathcal{F}$ and $\emptyset \in \mathcal{F}$. The set $(\mathcal{E} \otimes \mathcal{F})\_0 =\lbrace A \times B  \text{ } |  \text{ } A \in \mathcal{E}, B \in \mathcal{F} \rbrace$ is what generates $\mathcal{E} \otimes \mathcal{F}$. By measurability from generating sets, if $h^{-1}(S) \in \mathcal{F}$ for any $S \in (\mathcal{E} \otimes \mathcal{F})\_0$, then it holds that $h^{-1}(S) \in \mathcal{F}$ for any $S \in \mathcal{E} \otimes \mathcal{F}$ as $\mathcal{E} \otimes \mathcal{F}$ is generated by $(\mathcal{E} \otimes \mathcal{F})\_0$. As $h^{-1}(S) \in \mathcal{F}$ for any $S \in (\mathcal{E} \otimes \mathcal{F})\_0$ has been shown, $h$ is $\mathcal{F} / \mathcal{E} \otimes \mathcal{F}$-measurable.

Now consider the function $y \mapsto f(x\_0,y)$. Clearly, $y = f \circ h$. As $y$ is a composition of measurable functions, it is a measurable function itself.

### Numerical functions

The extended reals are defined as $\overline{\mathbb{R}} := [-\infty,\infty]$ and the corresponding Borel $\sigma$-algebra is generated by topology of $\overline{\mathbb{R}}$. Borel $\sigma$-algebras more generally are the $\sigma$-algebra generated by the topolgy of a topological space. In this case $\overline{\mathcal{B}} := \sigma \lbrace [-\infty, x]  \text{ } |  \text{ } x \in \mathbb{R} \rbrace$. $(\overline{\mathbb{R}},\overline{\mathcal{B}})$ form a measureable space.

For some measurable space $(E,\mathcal{E})$,

$f:(E,\mathcal{E}) \to (\mathbb{R},\mathcal{B})$ is a called a real valued function on $E$.

$f:(E,\mathcal{E}) \to (\overline{\mathbb{R}},\overline{\mathcal{B}})$ is a called a numerical function $E$.

A $\mathcal{E}/\overline{\mathcal{B}}$ measuarable numerical function are more succinctly be denoted as an $\mathcal{E}$ measurable function, or more succinctly $f \in \mathcal{E}$.

### Building numerical functions

Consider measurable space $(E,\mathcal{E})$

#### Indicator functions

Simplest measurable functions. For any set $A \in \mathcal{E}$ we define:

$$\mathbf{1}\_A(x) = \begin{cases}
    1 \text{ if } x \in A \\\
    0 \text{ if } x \notin A
\end{cases}$$

Consider any set $S \in \overline{\mathcal{B}}$. We have that:

$$\mathbf{1}\_A^{-1} \left( S\right) = \begin{cases}
    E \text{ if } 0 \in S \land 1 \in S \\\
    A \text{ if } 0 \notin S \land 1 \in S \\\
    A^c \text{ if } 0 \in S \land 1 \notin S \\\
    \emptyset \text{ if } 0 \notin S \land 1 \notin S
\end{cases}$$

By definition we have $E,\emptyset \in \mathcal{E}$ and since we have that $A \in \mathcal{E}$, by closure $A^c \in \mathcal{E}$. Hence $\mathbf{1}\_A$ is measurable.

#### Simple functions

A function is simple if, for any sequence of sets $A\_i \in \mathcal{E}$ and $\alpha\_i \in \mathbb{R}$, it can be written as:

$$s(x) = \sum\_{i=1}^{n} \alpha\_i \mathbf{1}\_{A\_i}(x)$$

Any arbitrary sets $A\_i$ can be used, but for simplicity sake, we take the sets as disjoint as such representation is possible for arbitrary sequence $A\_i$. Simple functions are evidently measurable as, for any $S \in \overline{\mathcal{B}}$,

$$s^{-1} \left(S\right) = \bigcup\_I A\_i$$

Where $I := \lbrace i \in \lbrace 1,2,3  \text{ ... } n \rbrace  \text{ }| \text{ } \alpha\_i \in S \rbrace$. As each $A\_i$ is measurable, the countable union of these lies in $\mathcal{E}$.

For simple functions we also have that:

$$f+g,  \text{ } f-g,  \text{ } fg,  \text{ } f/g  \text{ } (\text{with } g \neq 0) ,  \text{ } f \lor g,  \text{ } f \land g$$

Are simple functions. Note that $\lor$ when used with functions rather than propositions is to take the maximum and $\land$ when used with function rather than propositions is to take the minimum.

#### Limits of measurable functions

For some sequence $a\_n \in \overline{\mathbb{R}}$, 

$\inf{(a\_n)}$ is defined to be the greatest lower bound of $a\_n$

$\sup{(a\_n)}$ is defined to be the smallest upper bound of $a\_n$

$\limsup{(a\_n)}$ is very loosely the infimum of the set of eventual supremums. Specifically,

$$\limsup{(a\_n)} = \inf{\lbrace \sup{\lbrace a\_m  \text{ } |  \text{ } m \ge n  \rbrace}  \text{ } |  \text{ } n \ge 0 \rbrace}$$

$\liminf{(a\_n)}$ is very loosely the supremum of the set of eventual infimums. Specifically,

$$\liminf{(a\_n)} = \sup{\lbrace \inf{\lbrace a\_m  \text{ } |  \text{ } m \ge n  \rbrace}  \text{ } |  \text{ } n \ge 0 \rbrace}$$

To build the larger class of $\mathcal{E}$-measurable functions, limits are taken pointwise. For each $x$ the function is defined on, define $a\_n := f\_n(x)$.

By definition, for each $a\_n$, $\liminf{(a\_n)} \le \limsup{a\_n}$. If $\liminf{(a\_n)} = \limsup{(a\_n)}$, for every $a\_n$ then $f\_n$ is said to converge to $f$, denoted $f\_n \to f$.

If every sequence $a\_n$ is increasing, that is to say that $f\_n$ increases pointwise, then the limit always exists and is denoted by $f\_n \uparrow f$.

If every sequence $a\_n$ is decreasing, that is to say that $f\_n$ decreases pointwise, then the limit always exists and is denoted by $f\_n \downarrow f$. 

For some sequence of functions $f\_n \in \mathcal{E}$, we have the following pointwise:

1. $\sup f\_n \in \mathcal{E}$

Let $s := \sup{(f\_n)}$. The Borel $\sigma$-algebra on $\overline{\mathbb{R}}$ can be generated by a set of intervals of the form $[-\infty, r]$. Hence it is sufficient to show measurability for these intervals. To do this consider that $\forall r \in \mathbb{R}$:

$$s^{-1}[-\infty, r] = \lbrace x \in E  \text{ } |  \text{ } s(x) \le r \rbrace$$

$s(x) \le r \implies \forall n  \text{ } f\_n(x) \le r$. Hence:

$$s^{-1}[-\infty, r] = \bigcap\_n \lbrace x \in E  \text{ } |  \text{ } f\_n(x) \le r \rbrace$$

Which is:

$$s^{-1}[-\infty, r] = \bigcap\_n f\_n^{-1}[-\infty,r]$$

As $\forall n  \text{ } f\_n \in \mathcal{E}$, we have that the countable intersection also lies in $\mathcal{E}$. Hence, $\sup f\_n \in \mathcal{E}$.

2. $\inf f\_n \in \mathcal{E}$

We have that $\inf f\_n  = - \sup (-f\_n)$

3. $\limsup f\_n \in \mathcal{E}$ and $\liminf f\_n \in \mathcal{E}$

As both are defined by $\sup$ and $\inf$ of sequences of measurable functions by 1. and 2. we have 3.

Hence, if $\limsup f\_n = \liminf f\_n = f$, then $f\_n \to f$ and we have that $f$ is measurable.

#### Approximation from below

$$f^+ \in \mathcal{E}\_{+} \iff \exists \text{ simple } f\_n \in \mathcal{E} \text{ s.t. } f\_n \uparrow f^+ $$

$\implies$

Goal is to chop up $\overline{\mathbb{R}}^+$ into smaller and smaller pieces. Based on these pieces, create simple functions that are the lower bound of $f^+$ on each interval. As the pieces keep getting smaller "resolution" increases and sequence of indicator functions pointwise converge to $f^+$.

First cut $\overline{\mathbb{R}}^+$ into $[0,n)$ and $[n,\infty]$ for some integer $n$. Now subdivide $[0,n)$ into $n2^{n}$ pieces, each of width $\displaystyle \frac{1}{2^n}$. These intervals look like:

$$\left[\frac{k-1}{2^n} , \frac{k}{2^n}\right)  \text{ } ,  \text{ } k \in \lbrace 0,1,2,  \text{ ... } n2^n \rbrace$$

Hence define the positive simple functions: 

$$d\_n := \sum\_{k=1}^{n2^n} \frac{k-1}{2^n} \mathbf{1}\_{\left[\frac{k-1}{2^n} , \frac{k}{2^n}\right)} + n \mathbf{1}\_{[n,\infty]} $$

That is, for each interval of the form $\left[\frac{k-1}{2^n} , \frac{k}{2^n}\right)$, we take the lower bound $\frac{k-1}{2^n}$ and on the interval $[n,\infty]$, we take the lower bound $n$. From this, we can define:

$$f\_n := d\_n \circ f^+$$

By composition of measurable functions, $f\_n \in \mathcal{E}\_+$. Moreover, $f\_n$ is again a simple function. Note that, by the construction of $d\_n$, $d\_n(r) \uparrow r$ for each $r \in \overline{\mathbb{R}^+}$. Therefore we also have that $d\_n \circ f^+ \uparrow f^+$. Hence, for any $f^+ \in \mathcal{E}\_+$ we can make a sequence of simple functions $f\_n$ such that $f\_n \uparrow f$.
 
$\impliedby$

If $f^+$ is the pointwise limit of simple functions then it is $\mathcal{E}$-measurable as it was previously proven that the limits of measruable functions were measurable. 

#### Decomposition of measurable functions

For any $f \in \mathcal{E}$ we can split it into $f = f^+ - f^-$ with $f^+ := f \lor 0$ and $f^- = - \left(f \land 0\right)$. Such decomposition is because we want $f^+$ and $f^-$ to be positive functions. We have that:

$$f \in \mathcal{E} \iff \left(f^+ \in \mathcal{E}\_+\right) \land \left(f^- \in \mathcal{E}\_+\right)$$

$\implies$

Suppose $f \in \mathcal{E}$. For some $r \ge 0$ we have that $\lbrace f^+ \le r \rbrace = \lbrace f \le r \rbrace \in \mathcal{E}$ and for $r < 0$ we have $\lbrace f^+ \le r \rbrace = \emptyset \in \mathcal{E}$. Similarly for $r \ge 0$ we have that $\lbrace f^- \ge -r \rbrace = \lbrace f \le -r \rbrace \in \mathcal{E}$ and for $r < 0$ we have $\lbrace f^- \ge -r \rbrace = \emptyset \in \mathcal{E}$. 

$\impliedby$

Suppose $f^+, f^- \in \mathcal{E}\_+$. For $r \ge 0$, we have $\lbrace f \le r \rbrace = \lbrace f^+ \le r \rbrace \in \mathcal{E}$. For $r < 0$ we have $\lbrace f \le r \rbrace = \lbrace f^- \ge -r \rbrace \in \mathcal{E}$.

Hence we have that any $f \in \mathcal{E}$ can always be decomposed as a linear combination of positive measurable functions. These functions can then always be approximated from below by simple functions. Therefore we now have an effective way to build a large class of measurable functions.

### Monotone Class Theorem for Functions

On some measurable space $(E,\mathcal{E})$, a monotone class of functions $\mathcal{M}$ is a collection of numerical functions that satisfies:

1. $\mathbf{1}\_E \in \mathcal{M}$

2. $\text{Bounded } f, g \in \mathcal{M} \implies \forall a,b \in \mathbb{R},  \text{ } af+bg \in \mathcal{M}$

3. $f\_n \in \mathcal{M}, f\_n \uparrow f \implies f \in \mathcal{M}$

The monotone class theorem states:

For a monotone class $\mathcal{M}$ on $E$, and a $\pi$-system $C$ such that $\mathcal{E} = \sigma C$. If $\forall A \in C,  \text{ } \mathbf{1}\_A \in \mathcal{M}$, we have that:

1. $f \in \mathcal{E}\_+ \implies f \in \mathcal{M}$ 

2. If $f$ is a bounded $\mathcal{E}$-measurable function, then $f \in \mathcal{M}$

Consider the set:

$$\mathcal{D} := \lbrace A \in \mathcal{E}  \text{ } |  \text{ } \mathbf{1}\_A \in \mathcal{M} \rbrace$$

We have that $\mathcal{D}$ is a $\lambda$-system:

1. $E \in \mathcal{D}$ as $\mathbf{1}\_E \in \mathcal{M}$

2. Suppose $A,B \in \mathcal{D}$, $B \subseteq A$. We have that $\mathbf{1}\_{A \setminus B} = \mathbf{1}\_{A} - \mathbf{1}\_{B}$, and hence $\mathbf{1}\_{A \setminus B} \in \mathcal{E}$. As we have that $\mathbf{1}\_{A \setminus B} \in \mathcal{M}$ we also have that $A \setminus B \in \mathcal{D}$

3. For some increasing sequence of sets $A\_n \in \mathcal{D}$ with $A = \bigcup\_{n=1}^{\infty} A\_n$ we also have that:

$\mathbf{1}\_{A\_n} \uparrow \mathbf{1}\_{A}$ and by definition, 

$\mathbf{1}\_{A} \in \mathcal{M}$. Hence we have that $A \in \mathcal{D}$

By the definition of $\mathcal{D}$, $C \subseteq \mathcal{D}$. By Dynkin's $\pi$-$\lambda$ theorem, $C \subseteq \mathcal{D} \implies \sigma C \subseteq \mathcal{D}$. That is $\mathcal{E} \subseteq \mathcal{D}$. This implies that $\forall S \in \mathcal{E}$, we have $\mathbf{1}\_S \in \mathcal{M}$.

As $\forall S \in \mathcal{E}$, we have $\mathbf{1}\_S \in \mathcal{M}$ and $\mathbf{1}\_S \le 1$. Hence we have that all linear combinations, that is all simple functions, lie in $\mathcal{M}$. For some $f \in \mathcal{E}\_+$ can be written as an increasing pointwise limit of simple functions. By the third property of monotone classes, we have that $f \in \mathcal{M}$. 

If $f \in \mathcal{E}$ is bounded then we also have that in the decomposition $f = f^+ - f^-$, $f^+$ and $f^-$ are bounded. Moreover, as $f^+, f^- \in \mathcal{E}\_+$, by the prior step, $f^+, f^- \in \mathcal{M}$. Hence, by property 2. of monotone classes, we have that $f = f^+ - f^- \in \mathcal{M}$.

### Standard measurable spaces

Consider two measurable spaces $(E,\mathcal{E})$ and $(F,\mathcal{F})$. Consider a bijection $f(x) : E \to F$. Denote the functional inverse $\hat{f}(y)$ as $\hat{f}(y) = x \iff f(x) = y$. If we have that $f$ is $\mathcal{E} / \mathcal{F}$-measurable and $\hat{f}$ is $\mathcal{F}/\mathcal{E}$-measurable, then we have that $f$ is an isomorphism between $(E,\mathcal{E})$ and $(F,\mathcal{F})$. The spaces themselves are now said to be isomorphic.

A measurable space $(X,\mathcal{X})$ is said to be standard if, for some Borel subset $F$ of $\mathbb{R}$, it is isomorphic to $(F,\mathcal{B}\_F)$, where $\mathcal{B}\_F$ is generated by the open sets of $F$.