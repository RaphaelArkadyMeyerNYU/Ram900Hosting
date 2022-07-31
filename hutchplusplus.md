@def title = "Hutch++ | Raphael A. Meyer"
@def hascode = true


\enabletheorems
\newcounter{NumAlgorithms}

\newcommand{\trace}{\text{tr}}

# Updates for Hutch++

At SOSA 2021, I presented the paper [Hutch++: Optimal Stochastic Trace Estimation](https://arxiv.org/pdf/2010.09649.pdf) (with Cameron Musco, Christopher Musco, and David P. Woodruff).
This webpage contains some short updates that may be useful to people.

Table of Contents:

\tableofcontents <!-- you can use \toc as well -->

# Hutch++ for Undergrads

I believe that the analysis of both Hutchinson's Estimator and Hutch++ is simple and approachable.
This section contains the analysis an advanced undergraduate should hopefully be able to understand.

## Part 1: The Fundamental Shape of Hutchinson's Estimator

\begin{definition}{Hutchinson's Estimator}{}
	Fix $\mA \in \bbR^{n \times n}$ be a real matrix, and fix $\ell\in\bbN$.
	Let $\vx_1,\ldots,\vx_\ell \in\bbR^n$ be vectors drawn with i.i.d. $\cN(0,1)$ entries.
	Then, Hutchinson's Estimator is
	\[
		H_\ell(\mA) \defeq \frac1\ell \sum_{i=1}^\ell \vx_i^\intercal \mA \vx_i
	\]
\end{definition}

We can easily verify two properties of this classical estimator for symmetric $\mA$:

\begin{lemma}{Hutchinson's Mean and Variance}{}
$\E[H_\ell(\mA)] = \trace(\mA)$ and $\Var[H_\ell(\mA)]=\frac2\ell\onormof{\mA}{F}^2$
\end{lemma}
\begin{dropdown}{_Proof_}
\begin{proof}
The expectation is easy to verify:
\[
	\E[H_\ell(\mA)] = \E[\vx^\intercal\mA\vx] = \sum_{i=1}^n \sum_{j=1}^n \E[[\mA]_{i,j}\vx_i\vx_j] = \sum_{i=1}^n \mA_{i,i} = \trace(\mA)
\]

In order to analyze the variance, we present the analysis of Lemma 9 from \cite{avron2011randomized}.
Let $\mA=\mU\mLambda\mU^\intercal$ be the eigendecomposition of $\mA$, and let $\vy \defeq \mU^\intercal\vx$.
Then, for $\vx\sim\cN(0,\eye)$, we have $\vy \sim\cN(0,\mU\mU^\intercal) = \cN(0,\eye)$.
Therefore,

\begin{align}
	\Var[H_\ell(\mA)]
	&= \frac1\ell \Var[\vx^\intercal\mA\vx] \\
	&= \frac1\ell \Var[\vx^\intercal\mU\mLambda\mU^\intercal\vx] \\
	&= \frac1\ell \Var[(\mU^\intercal\vx)^\intercal\mLambda(\mU\vx)] \\
	&= \frac1\ell \Var[\vy^\intercal\mLambda\vy] \\
	&= \frac1\ell \Var[\sum_{i=1}^n \lambda_i y_i^2] \\
	&= \frac1\ell \sum_{i=1}^n \Var[\lambda_i y_i^2] \\
	&= \frac1\ell \sum_{i=1}^n 2\lambda_i^2 \\
	&= \frac2\ell \onormof{\mA}{F}^2
\end{align}

Note we cannot just use linearity of trace naively on the sum $\vx^\intercal\mA\vx=\sum_{i=1}^n\sum_{j=1}^n x_ix_j \mA_{i,j}$ since linearity of variance only holds for independent samples.
\end{proof}
\end{dropdown}

This variance is in term of the *Frobenius* norm of $\mA$.
So, we expect that Hutchinson's Estimator satisfies $H_\ell(\mA) \in \trace(\mA) \pm \frac{\sqrt2}{\sqrt\ell} \onormof{\mA}{F}$ with high probability.[^highprobability]
Typically in computer science we are given an error tolerance $\eps$, and want to know how many matrix-vector products we need to compute. (i.e. how small can we make $\ell$ while still being accurate?)
In order to build a guarantee here, we _assume $\mA$ is positive semi-definite (PSD)_, which in turn implies that $\onormof{\mA}{F} \leq \trace(\mA)$.
With this in mind, we can prove the standard result for Hutchinson's Estimator:

\begin{lemma}{Hutchinson's Estimator}{hutch-rate}
	Fix $\mA \in \bbR^{d \times d}$ be a PSD matrix.
	Then, $\Var[H_\ell(\mA)]\leq\frac{2}{\ell}\trace^2(\mA)$
\end{lemma}

So, if we want to ensure $H_\ell(\mA)\in(1\pm\eps)\trace(\mA)$ with good probability, we need the standard deviation to have $\frac{\sqrt 2}{\sqrt \ell}\trace(\mA) \leq \eps \trace(\mA)$, so we need $\ell=O(\frac{1}{\eps^2})$ samples.

## Part 2: Hutchinson's versus the Top Few Eigenvalues

_This was a section in the first draft of the paper, but was unfortunately cut. This is a slow, methodical intuition for the geometry Hutch++ takes advantage of._

Hutchinson's Estimator is powerfull, and gives a nice rate of convergence.
However, the proof of \lemmaref{hutch-rate} has a suspicious step.
If we write out three lines of analysis:
\begin{align}
	|\trace(\mA) - H_\ell(\mA)|
	&\leq \tsfrac{\sqrt 2}{\sqrt \ell} \normof{\mA}_F & \hspace{1cm} & (\text{Standard Deviation})\\
	&\leq \tsfrac{\sqrt 2}{\sqrt \ell} \trace(\mA) & & (\normof{\mA}_F \leq \trace(\mA)) \\
	&= \eps \ \trace(\mA) & & (\ell = O(\tsfrac{1}{\eps})) \\
\end{align}

Looking at these inequalities,
- The analysis of line 1 is always tight, since we know the variance of $H_\ell(\mA)$ exactly.
- The analysis of line 3 is always tight, since we just set $\ell$ to the smallest value that gets error $\eps$.
- The analysis of line 2 is not always tight.

The second line is tight only if $\normof{\mA}_F \approx \trace(\mA)$.
That is, the analysis above only tells us that Hutchinson's Estimator needs $O(\frac1\eps)$ samples if $\mA$ is the kind of matrix that has $\normof{\mA}_F \approx \trace(\mA)$.
So, what kind of matrix is that?
\begin{claim}{Eigenvalue Intuition}{l2-l1-l0-intuit}
If $\normof{\mA}_F\approx\trace(\mA)$, then $\mA$ has very few large eigenvalues, followed by much smaller eigenvalues.

_Try to show this yourself. If you're having trouble, look at the argument below._
\end{claim}
\begin{dropdown}{_Proof_}
\begin{proof}
First, we rewrite $\normof{\mA}_F$ and $\trace(\mA)$ explicitly in terms of the eigenvalues of $\mA$.
Let $\vv = [\lambda_1, \lambda_2, \ldots, \lambda_d]$ be the eigenvalues of $\mA$.
Then, recall that
\[
	\normof{\mA}_F = \normof{\vv}_2
	\hspace{0.75cm}
	and
	\hspace{0.75cm}
	\trace(\mA) = {\textstyle \sum_{i=1}^d \lambda_i} = \normof{\vv}_1
\]
where the last equality follows from $\mA$ being PSD.
So, we are given that $\normof{\vv}_2 \approx \normof{\vv}_1$: this is now just a statement about vectors in $\bbR^d$!

We now need to show that if a vector $\vv$ has $\normof{\vv}_2 \approx \normof{\vv}_1$, then $\vv$ is nearly sparse: it has only a few large values.

There are many intuition, and we will look at the extreme, and assume that $\normof{\vv}_2=\normof{\vv}_1$ exactly. _Prove that $\vv$ has at most 1 nonzero element in it._
\end{proof}
\end{dropdown}

We now finish the discussion with a comparison of two ideas:
- So, Hutchinson's Estimator only needs to use many samples (i.e. $O(\frac1\eps)$ samples) if $\mA$ has very special structure: it has a small number of large eigenvalues.
- If a matrix has a small number of large eigenvalues, the trace must be well approximated by the sum of those eigenvalues.

With this, we conclude the fundamental intuition behind Hutch++:

\begin{claim}{Hutch++ Intuition}{}
If $\mA$ is the kind of matrix that is hard for Hutchinsons's Estimator to handle, then $\trace(\mA)$ is well approximated by the top few eigenvalues of $\mA$
\end{claim}

This leads us to pick the following rough design of an algorithm:
1. Find a good low-rank approximation $\tilde\mA_k$
1. Notice that $\trace(\mA) = \trace(\tilde \mA_k) + \trace(\mA - \tilde\mA_k)$
1. Compute $\trace(\tilde \mA_k)$ exactly
1. Approximate $\trace(\mA-\tilde\mA_k)$ with Hutchinson's Estimator
1. Return $\text{Hutch++}(\mA) = \trace(\tilde\mA_k) + H_\ell(\mA-\tilde\mA_k)$

In the next section, we state a formal version of \claimref{l2-l1-l0-intuit} (see \lemmaref{l2-l1-l0}), show how to compute such a matrix $\tilde\mA_k$ (see $\mQ\mQ^\intercal\mA$ in \theoremref{tropp-error}), and bound the complexity of the Hutch++ estimator (see \theoremref{thm-hutchpp-variance}).


## Part 3: The Variance of Hutch++
_Special thanks to [Joel A. Tropp](http://users.cms.caltech.edu/~jtropp/) for working most of this out, and encouraging us to look into sharpening the constants in the analysis of Hutch++._

By expressing the variance of Hutch++ with all of its constants laid bare, and by using a very simple analysis, this analysis will hopefully allow practitioners to easily the exact parameters in Hutch++ code.

Before bounding the variance of Hutch++, we include the proof of one lemma and import another theorem:

\begin{lemma}{L2/L1/L0 Bounds}{l2-l1-l0}
Let $\mA\in\bbR^{d \times d}$ be a PSD matrix.
Let $\mA_k$ be the best rank-k approximation to $\mA$.
Then, $\onormof{\mA-\mA_k}{F} \leq \frac{1}{2\sqrt k} \trace(\mA)$.
\end{lemma}

\begin{dropdown}{_Proof: Lemma 7 from \cite{gilbert2007one}_}
\begin{proof}
Let $\vv=[\lambda_1 \ldots \lambda_n]$ be the vector of eigenvalues of $\mA$, such that $\lambda_1 \geq \lambda_2 \geq ... \ \lambda_n \geq 0$.
Then $\vv_k \defeq [\lambda_1 \ldots \lambda_k \ 0 \ldots 0]$ is the vector of eigenvalues of $\mA_k$.
With this notation, we just need to prove that $\onormof{\vv-\vv_k}{2} \leq \frac{1}{2\sqrt k} \onormof{\vv}{1}$.
The rest of this proof is just Lemma 7 from [this paper](https://www.math.uci.edu/~rvershyn/papers/one-sketch-forall-complete.pdf).

H&ouml;lder's inequality states that $\sum_{i=1}^n a_i b_i \leq \onormof{\va}{p} \cdot \onormof{\vb}{q}$ for any vector $\va,\vb$ so long as $\frac1p + \frac1q = 1$.
If we take $\va=\vb=\vv-\vv_k$, $p=1$, and $q=1$, we find that $\onormof{\vv-\vv_k}{2}^2 \leq \onormof{\vv-\vv_k}{1} \ \onormof{\vv-\vv_k}{\infty}$.
Further, note that by our construction of $\vv_k$, $\onormof{\vv}{1} = \onormof{\vv_k}{1} + \onormof{\vv-\vv_k}{1}$.
Then,
\[
	\frac{\onormof{\vv-\vv_k}{2}}{\onormof{\vv}{1}}
	\leq
	\frac{\sqrt{\onormof{\vv-\vv_k}{1} \ \onormof{\vv-\vv_k}{\infty}}}{\onormof{\vv_k}{1} + \onormof{\vv-\vv_k}{1}}
\]
Note that $\onormof{\vv-\vv_k}{\infty} = \lambda_{k+1}$ and $\onormof{\vv_k}{1} = \sum_{i=1}^k  \lambda_i \geq k\lambda_{k+1}$.
Then, if we let $\gamma \defeq \onormof{\vv-\vv_k}{1}$, we find
\[
	\frac{\sqrt{\onormof{\vv-\vv_k}{1} \ \onormof{\vv-\vv_k}{\infty}}}{\onormof{\vv_k}{1} + \onormof{\vv-\vv_k}{1}}
	\leq
	\frac{\sqrt{\gamma \ \lambda_{k+1}}}{k\lambda_{k+1} + \gamma}
\]
We don't have a good way to bound $\gamma = \onormof{\vv-\vv_k}{1}$, so we instead notice that the function $\gamma \mapsto \frac{\sqrt{a\gamma}}{b+\gamma}$ is maximized at $\gamma=b$ (check with calculus).
So, $\frac{\sqrt{a\gamma}}{b+\gamma} \leq \frac{\sqrt{ab}}{2b}$ for all $\gamma$:
\[
	\frac{\sqrt{\gamma \ \lambda_{k+1}}}{k\lambda_{k+1} + \gamma}
	\leq
	\frac{\sqrt{(k\lambda_{k+1}) \lambda_{k+1}}}{2k\lambda_{k+1}}
	= \frac{1}{2\sqrt k}
\]
So, overall, we have shown that
\[
	\frac{\onormof{\mA-\mA_k}{F}}{\trace(\mA)} = \frac{\onormof{\vv-\vv_k}{2}}{\onormof{\vv}{1}} \leq \frac{1}{2\sqrt k}
\]
\end{proof}
\end{dropdown}

We also import the following theorem, which controls the expected error from our low-rank approximation, and which we do not prove:

\begin{theorem}{Expected Projection Error}{tropp-error}
Sample $\mS\in\bbR^{n \times (k+p)}$ with $\cN(0,1)$ entries.
Let $\mQ$ be any orthonormal basis for $\mA\mS$ (e.g. a QR decomposition).
Then,
\[
	\E[\onormof{(\eye-\mQ\mQ^\intercal)\mA}{F}^2]
	\leq
	(1+\tsfrac{k}{p-1})\onormof{\mA-\mA_k}{F}^2
\]
\end{theorem}
\begin{dropdown}{_Proof: Adapted from \cite{halko2011finding}_}
\begin{proof}
This is almost exactly the statement of Theorem 10.5 in \citep{halko2011finding}, but not exactly.
Theorem 10.5 bounds the expected Frobenius norm (not squared).
Instead, at the bottom of page 57 and top of page 58 from [this version of the paper](https://arxiv.org/pdf/0909.4061.pdf), we see that the proof of Theorem 10.5 actually proves
\[
	\left(\E [\onormof{(\eye-\mQ\mQ^\intercal)\mA}{F}^2]\right)^{1/2} 
	\leq \ldots
	\leq (1+\frac{k}{p-1})\onormof{\mSigma_2}{F}^2
\]
Where, $\onormof{\mSigma_2}{F}^2=\onormof{\mA-\mA_k}{F}^2$, completing the importing of this theorem.
\end{proof}
\end{dropdown}

Now, we proceed to the analysis of the variance of Hutch++:

\label{thm_hutchpp_variance}
\begin{theorem}{Variance of Hutch++}{thm-hutchpp-variance}
Fix parameters $k$ and $\ell$.
Let $p=2k+1$ and construct $\mQ\in\bbR^{n \times k+p}$ as in \theoremref{tropp-error}.
Then let
\[
	\text{Hutch++}(\mA) \defeq \trace(\mQ^\intercal\mA\mQ) + H_\ell((\eye-\mQ\mQ^\intercal)\mA)
\]
Then,
\[
	\E[\text{Hutch++}(\mA)] = \trace(\mA)
\]
\[
	\Var[\text{Hutch++}(\mA)] \leq \frac{1}{k\ell}\trace^2(\mA)
\]
\end{theorem}
\begin{dropdown}{_Proof_}
\begin{proof}

We first look at the expectation by using the Tower Law, the expectation of Hutchinson's estimator, the cyclic property of trace, and the linearity of trace:
\begin{align}
	\E[\text{Hutch++}(\mA)]
	&= \E[\trace(\mQ^\intercal\mA\mQ) + H_\ell((\eye-\mQ\mQ^\intercal)\mA)] \\
	&= \E[\trace(\mQ^\intercal\mA\mQ)] + \E\left[\E[H_\ell((\eye-\mQ\mQ^\intercal)\mA)|\mQ]\right] \\
	&= \E[\trace(\mQ^\intercal\mA\mQ)] + \E[\trace((\eye-\mQ\mQ^\intercal)\mA)] \\
	&= \E[\trace(\mA\mQ\mQ^\intercal)] + \E[\trace(\mA-\mQ\mQ^\intercal\mA)] \\
	&= \E[\trace(\mA\mQ\mQ^\intercal)+\trace(\mA-\mQ\mQ^\intercal\mA)] \\
	&= \trace(\mA)
\end{align}
We now move onto the Variance bound.
First, recall the [Conditional Variance Formula](https://en.wikipedia.org/wiki/Law_of_total_variance), which says for any random variables $X,Y$,
\[
	\Var[Y] = \E[\Var[Y|X]] + \Var[\E[Y|X]]
\]
Taking $Y=\text{Hutch++}(\mA)$ and $X=\mQ$, we can bound the variance of Hutch++:
\[
	\Var[\text{Hutch++}]
	= \E[\Var[\text{Hutch++} | \mQ]] + \Var[\E[\text{Hutch++} | \mQ]]
\]
The second term above is always zero:
\begin{align}
	\Var[\E[\text{Hutch++}(\mA) | \mQ]]
	&= \Var\left[\E[\trace(\mQ^\intercal\mA\mQ) + H_\ell( (\eye-\mQ\mQ^\intercal)\mA) | \mQ]\right] \\
	&= \Var\left[\trace(\mQ^\intercal\mA\mQ) + \trace((\eye-\mQ\mQ^\intercal)\mA) \right] \\
	&= \Var\left[\trace(\mA)\right] \\
	&= 0
\end{align}
So, we just need to bound the first term from the conditional variance formula:
\begin{align}
	\E[\Var[\text{Hutch++} | \mQ]]
	&= \E[\Var[\trace(\mQ^\intercal\mA\mQ)+H_\ell( (\eye-\mQ\mQ^\intercal)\mA)|Q]] \\
	&= \E[\Var[H_\ell( (\eye-\mQ\mQ^\intercal)\mA)|Q]] \\
	&\leq \tsfrac{2}{\ell} \E[\onormof{(\eye-\mQ\mQ^\intercal)\mA}{F}^2] \\
	&\leq \tsfrac{2}{\ell} (1+\frac{k}{p-1})\onormof{\mA-\mA_k}{F}^2 \\
\end{align}
Where the first inequality uses the variance of Hutchinson's Estimator, and the second uses \theoremref{tropp-error}.
Recall that we set $p=k+1$.
After substituting and simplifying the expression, we find
\[
	\E[\Var[\text{Hutch++} | \mQ]]
	\leq \tsfrac{4}{\ell}\onormof{\mA-\mA_k}{F}^2
\]
And by \lemmaref{l2-l1-l0}, we complete the proof:
\[
	\tsfrac{4}{\ell}\onormof{\mA-\mA_k}{F}^2 \leq \tsfrac{4}{\ell} \cdot \tsfrac{1}{4\ell}\trace^2(\mA) = \tsfrac{1}{k\ell}\trace^2(\mA)
\]
\end{proof}
\end{dropdown}

## Part 4: Practitioner Advice
The variance in \theoremref{thm-hutchpp-variance} still has two parameters in it,
which leave a bit of ambiguity for practitioners.
So, we quickly analyze the choice of $k$ and $\ell$ that minimizes our bound on the variance.

Formally, suppose we are allowed to compute exactly $m$ matrix-vector products with $\mA$.
Then,
* Computing $\mQ$ uses $k+p=2k+1$ products
* Computing $\trace(\mQ^\intercal\mA\mQ)$ uses $k+p=2k+1$ products
* Computing $H_\ell( (\eye-\mQ\mQ^\intercal)\mA)$ uses $\ell$ products
So, we have $m=2(2k+1)+\ell=4k+2+\ell$.
We can then verify that $k=\frac{m-2}{8}$ and $\ell=\frac{m}{2}-1$ minimizes the variance.
Notably, this is equivalent to setting $\ell=4k$, which looks more intuitive.
This produces a final variance of $\Var[\text{Hutch++}(\mA)]\leq\frac{16}{(m-2)^2}\trace^2(\mA)$.

# Nystr&ouml;m-Hutch++

One additional approach to implementing Hutch++ for PSD matrices considers the Nystr&ouml;m method, where we use the approximation
\[
	\tilde\mA_k = (\mA\mQ)(\mQ^\intercal\mA\mQ)^{-1}(\mA\mQ)^{\intercal}
\]
Note that we can compute $\tilde\mA_k=\mY(\mQ^\intercal\mY)^{-1}\mY^\intercal$ where $\mY=\mA\mQ$ contains all the matrix-vector products with $\mA$.
We can compute $\trace(\tilde\mA_k)$ efficiently:
\begin{align}
	\trace(\tilde\mA_k)
	&= \trace(\mY(\mQ^\intercal\mY)^{-1}\mY^\intercal) \\
	&= \trace((\mQ^\intercal\mY)^{-1}(\mY^\intercal\mY))
\end{align}
The matrix inversion is only for a $(k+p) \times (k+p)$ sized matrix, which is easy.
We can then define the _**NYS-Hutch++**_ estimator as
\begin{align}
	\text{NYS-Hutch++}(\mA)
	&\defeq \trace((\mQ^\intercal\mY)^{-1}(\mY^\intercal\mY)) + H_\ell(\mA-\tilde\mA_k) \\
\end{align}
We can write out this Hutchinson's Estimator step as
\[
	H_\ell(\mA-\tilde\mA_k) =
	\frac{1}{\ell}\left(\trace(\mG^\intercal\mA\mG) - \trace(\mR^\intercal(\mQ^\intercal\mY)^{-1}\mR) \right)
\]
where $\mG$ has random sign-bit entries and $\mR\defeq\mY^\intercal\mG$.
Formally, we can write this out as the following algorithm:


\begin{algorithm}{NYS-Hutch++}
**input**: Matrix-Vector Oracle access to $\mA\in\bbR^{d \times d}$. Number $m$ of queries.

**output**: Approximation to $\trace(\mA)$

1. Sample $\mS\in\bbR^{d \times \frac{m}{4}}$ and $\mG\in\bbR^{d \times \frac{m}{2}}$ with i.i.d. $\{+1,-1\}$ entries.
1. Compute an orthonormal basis $\mQ\in\bbR^{d \times \frac{m}{4}}$ for the span of $\mA\mS$
1. Compute $\mY=\mA\mQ$ and $\mR=\mY^\intercal\mG$
1. return $\trace((\mQ^\intercal\mY)^{-1}(\mY^\intercal\mY)) + \frac{2}{m}\left(\trace(\mG^\intercal\mA\mG) - \trace(\mR^\intercal(\mQ^\intercal\mY)^{-1}\mR) \right)$
\end{algorithm}

Or, in matlab:

```julia
function trace_est=simple_nystrom_hutchplusplus(A, num_queries)
    S = 2*randi(2,size(A,1),ceil(num_queries/4))-3;
    G = 2*randi(2,size(A,1),floor(num_queries/2))-3;
    [Q,~] = qr(A*S,0);
    Y = A*Q;
    R = Y' * G;
    QYinv = pinv(Q' * Y);
    trace_est = trace(QYinv * (Y'*Y)) + 1/size(G,2)*[trace(G'*A*G) - trace(R'*QYinv*R)];
end
```


# Epilogue

## Code

* We provide [code on Github](https://github.com/RaphaelArkadyMeyerNYU/hutchplusplus), written in MATLAB.

* [Akshay Agrawal](https://www.akshayagrawal.com/) also has an [implementation on Github](https://github.com/akshayka/hessian_trace_estimation) using pytorch, though we haven't verified this code ourselves.

* Email me if you want to add your implementation to the list!

## Quiz Questions
If you have read Hutch++, then quiz yourself by trying to answer some intuitive high-level questions:

1.	Why is the constant-factor approximation on our low-rank approximation $\|A-\tilde{A}_k\|_F \leq 2 \|A-A_k\|_F$ sufficient? Why don't we need a relative error approximation like $\|A-\tilde{A}_k\|_F \leq (1+\varepsilon) \|A-A_k\|_F$?
\begin{right}
_Give an intuitive answer, not a mathematical one._
\end{right}

## Footnotes

[^highprobability] We analyze variance in this page for convenience, but all of these confidence intervals hold with high probability (i.e. with logarithmic dependence on the failure probability), and this is widely analyzed in the formal publications.


## References

* \biblabel{gilbert2007one}{Gilbert et al. (2007)} **Gilbert**, **Strauss**, **Tropp**, and **Vershynin**. [One sketch for all: fast algorithms for compressed sensing](https://www.math.uci.edu/~rvershyn/papers/one-sketch-forall-complete.pdf). _STOC_ 2007.

* \biblabel{halko2011finding}{Halko et al. (2011)} **Halko**, **Martinsson**, and **Tropp**. [Finding structure with randomness: Probabilistic algorithms for constructing approximate matrix decompositions](https://arxiv.org/pdf/0909.4061.pdf). _SIAM review 53 no. 2_ 2011.

* \biblabel{avron2011randomized}{Avron, Toledo (2011)}**Avron** and **Toledo**. [Randomized algorithms for estimating the trace of an implicit symmetric positive semi-definite matrix](http://www.cs.tau.ac.il/~stoledo/Bib/Pubs/trace3.pdf). _Journal of the ACM (JACM) 58, no. 2_ 2011.

\theoremscripts
