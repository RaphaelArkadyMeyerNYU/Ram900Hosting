@def title = "Raphael's Thesis Defense"
@def tags = ["nyu", "student", "research"]

<!-- ~~~
<style>
.franklin-content{
  width:700px
}
</style>
~~~
 -->

# My Thesis Defense

_**Update**_: The defense is over now, and was a success! Thanks to everyone who showed up, and especially big thanks to my dissertation committee!

~

I will be defending my thesis on April 16th, 2024 at 9:30am in Room 1201 of 370 Jay Street.
The defense if open to the public (*email me for access to the building to attend in-person*).
The defense will also by broadcast over zoom, at this [link](https://nyu.zoom.us/j/97956046015).

**Add my defense to your calendar with this [link](https://calendar.google.com/calendar/event?action=TEMPLATE&tmeid=cW5sZjU0ZmI3M2Vldml1dXJuYm00aTZtNmMgY182MWZmNDQ4NTQyMDBhYzQyZWMwMjUyYWFlNDM4MjAzNGIwZjg2ZDgzMzA5ZmVjZDg4OThmNjRmMzYxYzc4NTRmQGc&tmsrc=c_61ff44854200ac42ec0252aae4382034b0f86d83309fecd8898f64f361c7854f%40group.calendar.google.com).**

You can find slides for my talk [here](/assets/thesisDefense50minOneNote.pdf).

The defense will cover my work on fast randomized algorithms for numerical linear algebra, namely on four of my papers covering the following four topics: 
- [*Trace Estimation*](https://arxiv.org/abs/2010.09649)
- [*Kronecker Trace Estimation*](https://arxiv.org/abs/2309.04952)
- [*Small Block Krylov Methods for Low-Rank Approximation*](https://arxiv.org/abs/2305.02535)
- [*Low-Rank Approximation to functions of matrices*](https://arxiv.org/abs/2311.14023)

Everyone is welcome to attend.
Though, keep in mind that the presentation will be technical in nature, and will assume the audience is at least somewhat comfortable with both linear algebra and randomized algorithms.

The formal title and abstract of the defense is below.

$\phantom{.}$

## Towards Optimal Matrix-Vector Complexity of Numerical Linear Algebra

The world is full of important problems with linear structure. Many machine learning, data science, and scientific computing applications require subroutines that solve numerical linear algebra problems. By solving numerical linear algebra problems more quickly, we can scale up the models and datasets used in these applications, enabling bigger and better scientific computations.

In practice, most fast linear algebra algorithms interact with their input matrix only by computing matrix-vector products, so it is crucial to understand how many of these products are necessary and sufficient to solve numerical linear algebra problems. Motivated by this, we will explore the Matrix-Vector Complexity of such algorithms.

This thesis will cover recent progress in four fundamental problems in numerical linear algebra: trace estimation, Kronecker trace estimation, low-rank approximation, and low-rank approximation of matrix functions. We will examine fast and pragmatic randomized algorithms that solve these problems with low matrix-vector complexity. We then complement most of these algorithms with information-theoretic lower bounds on the number of matrix-vector products needed.
