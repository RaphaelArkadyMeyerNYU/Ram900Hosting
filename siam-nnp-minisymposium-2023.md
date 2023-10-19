@def title = "SIAM-NNP: The Matrix-Vector Complexity of Linear Algebra"
@def tags = ["nyu", "student", "research"]

~~~
<style>
.franklin-content{
  width:700px
}
</style>
~~~

# SIAM-NNP Minisymposium on The Matrix-Vector Complexity of Linear Algebra

At the [SIAM-NNP conference](https://sites.google.com/view/siam-nynjpa/annual-meeting), I am organizing a minisymposium on matrix-vector complexity.
This is a small webpage to track the time and place of the talks, as well as the titles and abstracts of the talks.

## When and where is the event?

The talks are at NJIT on October 22nd, 2023.
Specifically, they will run from 8:30am to 10:30am in the Central King Building, on either Floor 2 or Floor 3 (exact location TBD).

To attend, you have to register for the conference [here](https://sites.google.com/view/siam-nynjpa/annual-meeting/registration).
It's free for students and postdocs!

## Schedule

The talks are all 20 minutes long, plus 5 minutes for Q&A.

~~~
<style>
.franklin-content .fndef tr,
td {
  padding: 1.5px 5px;
  font-size: 16px;
}

.franklin-content th {
	font-size: 17px;
}

.franklin-content table td:nth-child(2)
 {
  width: 130px;
}

.franklin-content table tr:nth-child(2),
.franklin-content table tr:nth-child(4),
.franklin-content table tr:nth-child(6),
.franklin-content table tr:nth-child(8),
.franklin-content table tr:nth-child(10),
.franklin-content table tr:nth-child(12),
.franklin-content table tr:nth-child(14),
.franklin-content table tr:nth-child(16)
 {
  background: #f3f3ec;
}
.franklin-content table tr:nth-child(2) a,
.franklin-content table tr:nth-child(4) a,
.franklin-content table tr:nth-child(6) a,
.franklin-content table tr:nth-child(8) a,
.franklin-content table tr:nth-child(10) a,
.franklin-content table tr:nth-child(12) a,
.franklin-content table tr:nth-child(14) a,
.franklin-content table tr:nth-child(16) a
 {
  text-shadow: 0.03em 0 #f3f3ec, -0.03em 0 #f3f3ec, 0 0.03em #f3f3ec, 0 -0.03em #f3f3ec, 0.06em 0 #f3f3ec, -0.06em 0 #f3f3ec, 0.09em 0 #f3f3ec, -0.09em 0 #f3f3ec, 0.12em 0 #f3f3ec, -0.12em 0 #f3f3ec, 0.15em 0 #f3f3ec, -0.15em 0 #f3f3ec;
}

</style>
~~~

| Time | Presenter | University | Talk Title (click to jump to the abstract) |
| :--- | :--- | :--- | :---
| 8:30am | [Shyam Narayanan](https://sites.google.com/view/shyamnarayanan/home) | MIT | [New Lower Bounds for Matrix-Vector Algorithms](#new_lower_bounds_for_matrix-vector_algorithms) |
| 8:55am | [Diana  Halikias](https://e.math.cornell.edu/people/halikias/) | Cornell | [Data-efficient matrix recovery and PDE learning](#data-efficient_matrix_recovery_and_pde_learnings) |
| 9:20am | [William  Swartworth](https://wswartworth.github.io/) | CMU | [Spectrum Approximation via non-adaptive Queries](#spectrum_approximation_via_non-adaptive_queries) |
| 9:45am | [Tyler  Chen](https://chen.pw/) | NYU | [Peering into the black box: Krylov-aware stochastic trace estimation](#peering_into_the_black_box_krylov-aware_stochastic_trace_estimation) |
| 10:10am | [Raphael  Meyer](https://ram900.hosting.nyu.edu/) | NYU | [Hutchinson's Estimator is Bad at Kronecker-Trace-Estimation](#hutchinsons_estimator_is_bad_at_kronecker-trace-estimation) |

## Abstracts for the Talks

<!-- \begin{dropdown}{Shyam Narayanan} -->

#### New Lower Bounds for Matrix-Vector Algorithms

<!-- **Abstract:** -->
The Matrix-Vector model is a model of computation where, given an unknown matrix $\mM$, one
attempts to learn properties of $\mM$ through an oracle that receives as input a vector $\vv$ and outputs
$\mM\vv$. This model captures a wide range of algorithms used in optimization and numerical linear
algebra. This model can also be viewed as a sublinear-query model, where one wishes to ask a
sublinear number of queries to the oracle to learn properties of $\mM$.
In this talk, we demonstrate a new technique for proving lower bounds for the query complexity of
various matrix-vector algorithms. The technique is based on a novel reduction that demonstrates
that "block Krylov" algorithms are optimal for this problem. This allows us to prove lower bounds for
two important questions:

1. Log-concave sampling: we show that sampling from strongly log-concave and log-smooth
    distributions with condition number $\kappa$ requires $\tilde{\Omega}(\min(\sqrt{\kappa} \log d, d))$
    first-order queries. In fact, this bound even holds (and is tight) for the more restricted class of
    Gaussian distributions. Importantly, we provide the first lower bound for general log-concave
    distributions proving that the query complexity of general log-concave sampling cannot be
    dimension-free (i.e., only depend on $\kappa$).

2. Low-rank approximation: we show that providing a $(1 + \epsilon)$-approximate rank-1
    approximation to $\mM$ (in spectral error) requires $\Omega(\log d/\sqrt{\epsilon})$ samples, which is
    optimal. For this question, no super-constant lower bound (either in terms of $\epsilon$ or in $d$) was
    known.

---

#### Data-efficient matrix recovery and PDE learnings

Can one recover the entries of a matrix from only matrix-vector products? If so, how many are
needed? I will present randomized algorithms to recover various structured matrices, as well as
theoretical results which bound the query complexity of these structured families. Moreover, a
continuous generalization of query complexity describes how many pairs of forcing terms and
solutions are needed to uniquely identify a Green's function corresponding to the solution operator
of an elliptic PDE. I will present a recent main result, which is a theoretical guarantee on the number
of input-output pairs required in elliptic PDE learning problems with high probability. The proof of
this result is constructive, and leverages insights from numerical linear algebra and PDE theory.

---

#### Spectrum Approximation via non-adaptive Queries

Variants of Power Method are useful for approximating the top eigenvalues of a matrix, but these
methods rely heavily on adaptivity and typically only learn the top portion of the spectrum. How
well can one do if the goal is to approximate the entire spectrum via non-adaptive matrix-vector
queries? For a symmetric matrix $\mA$, this talk will show how to recover all eigenvalues of $\mA$ to within
$\eps\normof{\mA}_F$ additive error using $O(1/\eps^2)$ matrix-vector queries. I will also discuss a lower bound
showing that $\Omega(1/\eps^2)$ matrix-vector queries are necessary for obtaining our guarantee,
even if we allow adaptivity.

---

#### Peering into the black box: Krylov-aware stochastic trace estimation

Matrix-vector query models have gained increased attention, and in that case that the matrix of
interest is a matrix function (e.g. the matrix inverse or matrix exponential), it is common to use
Krylov subspace methods as a black box for computing matrix-vector products. In this talk, we
discuss how taking a look into the black-box allows further efficiencies to be obtained.

---

#### Hutchinson's Estimator is Bad at Kronecker-Trace-Estimation

We study the problem of estimating the trace of a matrix $\mA$ that can only be access via
Kronecker-matrix-vector products. That is, we can compute $\mA\vx$ for any vector $\vx$ that has Kronecker
structure. In particular, we study how Hutchinson's Estimator performs in this setting, proving tight
rates for the number of matrix-vector products this estimator needs to find a relative error
approximation to the trace of $\mA$. We find an exact expression for the variance of this estimator, show
this is unavoidably exponential, and conclude with evidence that a much faster non-Hutchinson
algorithm may exist.

\theoremscripts
