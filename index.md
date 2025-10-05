@def title = "Raphael A. Meyer"
@def tags = ["research"]


# Raphael Arkady Meyer


@@row
@@container
@@left ![](/assets/profile_2022.jpg)
@@
@@

I am a Postdoc at UC Berkeley, hosted by [Michael Mahoney](https://www.stat.berkeley.edu/~mmahoney/) in the Stats Department and ICSI. Before that, I was a Postdoc at Caltech working with [Joel Tropp](https://tropp.caltech.edu/). Before that, I finished my Ph.D. at NYU advised by [Christopher Musco](https://www.chrismusco.com).

<!-- To compile this for publishing, run `serve(single=true, clear=true, is_final_pass=true)` and upload the _site directory. Be sure to also run `using Franklin`. I'm using github to auto-compile it now though, so I shouldn't need to do this anymore. -->

<!-- I research the interplay of theoretical statistics and computation, largely through the lens of linear algebra. -->

I research problems in mathematical computing from the perspective of theoretical computer science.

In the summer of 2022, I visited [Michael Kapralov's](https://theory.epfl.ch/kapralov/) group at EPFL and [Haim Avron's](http://www.math.tau.ac.il/~haimav/) group at TAU.


<!-- ~~~
<div style="clear: both"></div>
~~~ -->

@@

Links:
[Google Scholar](https://scholar.google.com/citations?user=Xpi5HD0AAAAJ), 
[dblp](https://dblp.org/pid/204/4381.html), 
[Github](https://github.com/RaphaelArkadyMeyerNYU), 
[Zoom Room](https://nyu.zoom.us/my/ram900)


My recent publications have looked at:

* Fast Numerical Linear Algebra (_[preprint](https://arxiv.org/abs/2508.21189)_, _[SODA2026](https://arxiv.org/abs/2508.06486)_, _[SIMAX](https://arxiv.org/abs/2311.14023)_)
* Tensor-based Sketching Methods (_[preprint](https://arxiv.org/abs/2508.21189)_, _[preprint](https://arxiv.org/abs/2309.04952)_, _[ICML2025](https://arxiv.org/abs/2502.08029)_)
* Active Learning on Linear Function Families (_[SOSA26](https://arxiv.org/abs/2508.05920)_, _[SODA2023](https://arxiv.org/abs/2211.06790)_)

Of course, I am interested in problems beyond these areas, and if you want to work with me on a problem, send me an email: $ram900@berkeley.edu$

<!-- Some high-level open questions that I think are super interesting.

* When does *adaptivity* speed up fast linear algebra? Why doesn't adaptivity speed up trace estimation (i.e. sum of eigenvalues), but does seem to speed up estimating the top eigenvalue?
 -->

<!-- \tableofcontents --> <!-- you can use \toc as well -->

# News

- \newicon [_Debiasing Polynomial and Fourier Regression_](https://arxiv.org/abs/2508.05920) was accepted to SOSA 2026! I'll be presenting a poster about it at the Simons [Workshop on Linear Systems and Eigenvalue Problems](https://simons.berkeley.edu/workshops/linear-systems-eigenvalue-problems/schedule).

- \newicon [_Does block size matter in randomized block Krylov low-rank approximation?_](https://arxiv.org/abs/2508.06486) was accepted to SODA 2026!

- I gave a talk about Kronecker Matrix-Vector complexity at the Simon's Institute [Recent Progress and Open Directions in Matrix Computations](https://sites.google.com/cornell.edu/rpod-matrix-computations/about) seminar.

$\phantom{.}$

\begin{dropdown}{_Old News_}

September 2025:

- I joined [Michael Mahoney](https://www.stat.berkeley.edu/~mmahoney/)'s group as a postdoc at UC Berkeley (officially in the [Statistics department](http://stat.berkeley.edu/) and at [ICSI](https://www.icsi.berkeley.edu/)).

August 2025

- New paper on arXiv: [_Faster Linear Algebra Algorithms with Structured Random Matrices_](https://arxiv.org/abs/2508.21189). Introducing the oblivious subspace _injection_!

- New paper on arXiv: [_Does block size matter in randomized block Krylov low-rank approximation?_](https://arxiv.org/abs/2508.06486). Punchline: Block Krylov finds a rank-$k$ approximation with $O(k)$ matrix-vector products, regardless of the block size!

- New paper on arXiv: [_Debiasing Polynomial and Fourier Regression_](https://arxiv.org/abs/2508.05920). \chrisc wrote beautiful code for it, available on [github](https://github.com/chriscamano/Debiased-Polynomial-Regression)! Punchline: you can do DPP sampling for polynomial regression by computing the eigenvalues of random complex matrices!

July 2025

- I presented a poster for my paper accepted to ICML: [_Understanding the Kronecker Matrix-Vector Complexity of Linear Algebra_](https://arxiv.org/abs/2502.08029).

June 2025

- I gave a talk on Kronecker Matrix-Vector Complexity at Tom Trogdon's [RMT + NLA II](https://faculty.washington.edu/trogdon/RMT+NLA_II/index.html) workshop this past June!

April 2025

- I gave a talk at the [UCSD MINDS Seminar](https://sites.google.com/ucsd.edu/ucsd-minds/home) on April 18th -- thanks to [Rob Webber](https://sites.google.com/ucsd.edu/rwebber/) for inviting me out!

March 2025

- I recently gave a guest lecture in [Laura Balzano's](https://web.eecs.umich.edu/~girasole/) Randomized Numerical Linear Algebra class at UMich! It was great fun, and many great questions were asked. Thanks for having me! You can find my slides [here](/assets/uMichGuestLecture80minPPT.pdf).

- I made a website to contain the cleanest known proofs for foundational concepts in RandNLA: [link](https://randnla.github.io/). _I actually made it a while ago and don't update it often._

- New preprint on arXiv: [_Understanding the Kronecker Matrix-Vector Complexity of Linear Algebra_](https://arxiv.org/abs/2502.08029). Punchline: there's too much orthogonality!

- I'm talking about low-rank approximation ([this paper](https://arxiv.org/abs/2311.14023) and [this paper](https://arxiv.org/abs/2305.02535)) at Caltech on Friday Feb 14th. Come on out!

January 2025

- Updated version of the Kronecker Trace Estimation paper ([link](https://arxiv.org/abs/2309.04952)). New strengthened results on random rank-one matrices, Rademacher test vectors, and random unit vector test vectors!

October 2024

- I'm at SIAM MDS giving a talk on recent and upcoming results on Kronecker Matrix-Vector Complexity. Come say hi! Thanks to [Ethan](https://www.ethanepperly.com/) and [Rob](https://sites.google.com/ucsd.edu/rwebber/) for organizing the minisymposium!

- Paper accepted at SIMAX: [_Algorithm-Agnostic Low-Rank Approximation of Operator Monotone Matrix Functions_](https://arxiv.org/abs/2311.14023). My first paper in a math journal!

May 2024

- I'll be joining Caltech as a postdoc in [Joel Tropp](https://tropp.caltech.edu/)'s group this fall!

- I've been awarded the Pearl Brownstein Doctoral Research Award (i.e. best dissertation award) for my research! Big thanks to the Tandon CSE department for awarding this to me, and congrats to the other awardees, [Aecios](https://aeciosantos.com/) and [Mengwei](https://www.mengweiren.com/)!

- I gave a talk at the Center for Communications Research on [Trace Estimation](https://arxiv.org/abs/2010.09649) and [Kronecker-Trace Estimation](https://arxiv.org/abs/2309.04952).

April 2024

- **I just successfully defended my thesis, on April 16th 2024!** See details about my talk here: [link](/thesis-defense).

March 2024

- The Responsible AI Lab at NYU Tandon (who I have been a part of for the past two years) wrote a spotlight on me! Thanks to Caterina and the R/AI team for writing this up. See the short interview here: [link](https://mailchi.mp/nyu/rai-march2024-newsletter?e=82659192cb).

January 2024

- I presented my work on [Trace Estimation](https://arxiv.org/abs/2010.09649) and [$f(A)$ Low-Rank Approximation](https://arxiv.org/abs/2311.14023) at the [Mahoney Group](https://www.stat.berkeley.edu/~mmahoney/index.html) at UC Berkeley.

- I presented my work on [Krylov methods](https://arxiv.org/abs/2305.02535) at SODA 2024.

November 2023

- New preprint on arXiv: [_Algorithm-Agnostic Low-Rank Approximation of Operator Monotone Matrix Functions_](https://arxiv.org/abs/2311.14023).

- I gave a talk on [Krylov methods](https://arxiv.org/abs/2305.02535) at the [Conference on Fast Direct Solvers](https://www.math.purdue.edu/~xiaj/FastSolvers2023/index.html) at Purdue University in November.

- I gave a [talk at UChicago](https://orecchia.net/event/theory-lunch/) on [Trace Estimation](https://arxiv.org/abs/2010.09649) and [Kronecker-Trace Estimation](https://arxiv.org/abs/2309.04952) on November 1st.

October 2023

- Paper accepted at SODA 2024: _[On the Unreasonable Effectiveness of Single Vector Krylov Methods for Low-Rank Approximation](https://arxiv.org/abs/2305.02535)_!

- I organized a minisymposium on _The Matrix-Vector Complexity of Linear Algebra_ at the first ever [SIAM-NNP conference](https://sites.google.com/view/siam-nynjpa/annual-meeting)!
  
  [Shyam Narayanan](https://sites.google.com/view/shyamnarayanan/home), [Diana Halikias](https://e.math.cornell.edu/people/halikias/), [William Swartworth](https://wswartworth.github.io/), [Tyler Chen](https://chen.pw/), and myself were presenting at 8:30am on Sunday.
  What a stacked lineup!
  **See the details here: [link](/siam-nnp-minisymposium-2023).**

September 2023

- New preprint on arXiv: [_Hutchinson’s Estimator is Bad at Kronecker-Trace-Estimation_](https://arxiv.org/abs/2309.04952).

May 2023

- New preprint on arXiv: [_On the Unreasonable Effectiveness of Single Vector Krylov Methods for Low-Rank Approximation_](https://arxiv.org/abs/2305.02535).

March 2023

- I gave two talks at the NYU / UMass Quantum Linear Algebra reading group.

- I gave a talk at the BIRS Perspectives on Matrix Computations about my [_new work on Krylov methods_](https://arxiv.org/abs/2305.02535).

January 2023

- I presented [_Near-Linear Sample Complexity for $L_p$ Polynomial Regression_](https://arxiv.org/abs/2211.06790) at SODA 2023.

November 2022

- I gave a talk at the [TCS Seminar at Purdue](https://theorypurdue.wordpress.com/) in early November to present my new research on the role of block size in Krylov Methods.

October 2022

- New paper accepted at SODA 2023: _Near-Linear Sample Complexity for $L_p$ Polynomial Regression_! I just gave a talk on it last week Friday at the Grad Student Seminar at CDS (at NYU).

September 2022

- I gave a talk at [GAMM ANLA](https://sites.google.com/view/gammanla2022/home) on the role of block size in Krylov Methods for low-rank approximation. A preprint will be available very soon, but until then you can check out my slides for a preview! [Slides](/assets/svkGammAnla20minBeamers.pdf)

July 2022

- I gave a talk at the _SIAM Annual Meeting Minisymposium on Matrix Functions, Operator Functions, and Related Approximation Methods_. Thanks to Heather, Andrew, and Ke for organizing!

June 2022

- I'm going be presenting Hutch++ this summer at [HALG2022](https://www.lse.ac.uk/HALG-2022), with both a short talk and a poster.

- I'm traveling this summer! I'm first in London for [HALG2022](https://www.lse.ac.uk/HALG-2022). Then I'm spending June visiting [Haim Avron](http://www.math.tau.ac.il/~haimav/) at [TAU](https://english.tau.ac.il/), and July visiting [Michael Kapralov](https://theory.epfl.ch/kapralov/) at [EPFL](https://www.epfl.ch/en/). If you're in the same place at the same time, [drop me a line](mailto:ram900@nyu.edu)!

May 2022

- I recently organized a mini-conference for NYU CS Theory researchers to present their "Pandemic Papers" in-person. Thanks to everyone who showed up and made it a success! [_More details here_](/tcs_presentations)

- I'm honored to be awarded the **Deborah Rosenthal, MD Award for Best Quals Examination** in 2022, for my presentation _Towards Optimal Spectral Sum Estimation in the Matrix-Vector Oracle Model_.

April 2022

- I'm honored to be a ICLR 2022 Highlighted Reviewer.

\end{dropdown}


# Publications

@@link-hover-only
    
1.  [**Faster Linear Algebra Algorithms with Structured Random Matrices**](https://arxiv.org/abs/2508.21189)
    
    \span{fakeclass}{in submission _with \chrisc, \ethan, and \joel_}
    
1.  [**Does block size matter in randomized block Krylov low-rank approximation?**](https://arxiv.org/abs/2508.06486)
    
    \span{fakeclass}{at SODA 2026 _with \tyler, \ethan, \chris, and \akash_}
    
1.  [**Debiasing Polynomial and Fourier Regression**](https://arxiv.org/abs/2508.05920)[^DebiasedPolyAssets]
    
    \span{fakeclass}{at SOSA 2026 _with \chrisc and \kevin_}
    
1.  [**Understanding the Kronecker Matrix-Vector Complexity of Linear Algebra**](https://arxiv.org/abs/2502.08029)[^ICML2025assets]
    
    \span{fakeclass}{at ICML 2025 _with \will and \davidw_}
    
1.  [**Hutchinson's Estimator is Bad at Kronecker-Trace-Estimation**](https://arxiv.org/abs/2309.04952)[^KronHutchinsonAssets]
    
    \span{fakeclass}{in submission _with \haim_}
    
1.  [**Algorithm-Agnostic Low-Rank Approximation of Operator Monotone Matrix Functions**](https://arxiv.org/abs/2311.14023)
    
    \span{fakeclass}{in SIMAX _with \davidp and \chris_}
    
1.  [**On the Unreasonable Effectiveness of Single Vector Krylov Methods for Low-Rank Approximation**](https://arxiv.org/abs/2305.02535)[^SODA2024assets]
    
    \span{fakeclass}{at SODA 2024 _with \cam and \chris_}
    
1.  [**Near-Linear Sample Complexity for $L_p$ Polynomial Regression**](https://arxiv.org/abs/2211.06790)[^SODA2023assets]
    
    \span{fakeclass}{at SODA 2023 _with \cam, \chris, \davidw, and \samson_}
    
1.  [**Fast Regression for Structured Inputs**](https://arxiv.org/abs/2203.07557)[^ICLR2022assets]
    
    \span{fakeclass}{at ICLR 2022 _with \cam, \chris, \davidw, and \samson_}
    
1.  [**Hutch++: Optimal Stochastic Trace Estimation**](https://arxiv.org/abs/2010.09649)[^hutchassets]
    
    \span{fakeclass}{at SOSA 2021 _with \cam, \chris, and \davidw_}
    
1.  [**The Statistical Cost of Robust Kernel Hyperparameter Tuning**](https://arxiv.org/abs/2006.08035)[^NeurIPS2020assets]
    
    \span{fakeclass}{at NeurIPS 2020 _with \chris_}
    
1.  \span{link-hover-only}{[**Optimality Implies Kernel Sum Classifiers are Statistically Efficient**](https://arxiv.org/abs/1901.09087)}[^kernelsumassets]
    
    \span{fakeclass}{at ICML 2019 _with \jean_}
    
1.  \span{link-hover-only}{[**Characterizing Optimal Security and Round-Complexity for Secure OR Evaluation**](https://www.cs.purdue.edu/homes/hmaji/papers/ISIT:JhaMajMey17.pdf)}
    
    \span{fakeclass}{at ISIT 2017 _with Amisha Jhanji and \maji_}
    <!-- I don't know why Franklin.jl acts this way. This avoids adding a <p/> tag, which changes the
         CSS priority list. I could replace 'fakeclass' with something actually in the CSS, but -->

@@

$\phantom{.}$

\begin{dropdown}{_Presentation Assets_}

[^DebiasedPolyAssets]: Code available on [github](https://github.com/chriscamano/Debiased-Polynomial-Regression)

[^ICML2025assets]: [Poster](/assets/ICML-2025-Poster.pdf)

[^KronHutchinsonAssets]: [Slides](/assets/kronHutchinsonSiamNNP20min.pdf)

[^SODA2024assets]: Code available on [github](https://github.com/RaphaelArkadyMeyerNYU/SingleVectorKrylov) $\cdot$ [Slides using TCS language](/assets/svkSoda20minOneNote.pdf) $\cdot$ [Slides using Applied Math language](/assets/svkPurdue20minOneNote.pdf)

[^SODA2023assets]: [Slides](/assets/chebyPandemicPresentationsBeamers.pdf)

[^ICLR2022assets]: [Poster](/assets/ICLR-2022-Poster.png)

[^hutchassets]: Code available on [github](https://github.com/RaphaelArkadyMeyerNYU/hutchplusplus) $\cdot$ [Landscape Poster](/assets/hutchplusplusposter.pdf) $\cdot$ [Portrait Poster](/assets/hutchplusplusHalgPoster.pdf) $\cdot$ [4min Slides](/assets/hutchplusplusHalg4minBeamers.pdf) $\cdot$ [12min Slides](/assets/hutchplusplusSosa12minBeamers.pdf) $\cdot$ [25min Slides](/assets/hutchplusplusSosa25minBeamers.pdf) $\cdot$ [35min Slides](/assets/hutchplusplusVida35minBeamers.pdf) $\cdot$ [1hr Slides](/assets/hutchplusplusJHU1hrBeamers.pdf)

[^NeurIPS2020assets]: [Slides](/assets/NeurIPS-2020-Beamers.pdf)

[^kernelsumassets]: [Poster](/assets/ICML-2019-Poster.pdf) $\cdot$ [Slides](/assets/ICML-2019-slides.pdf).
\end{dropdown}

# Talks & Presentations
To date, I have presented every paper I published at the associated conference.
This is a list of other talks or presentations I have given.

\begin{dropdown}{Invited Talks}
@@link-hover-only

1. **Guest Lecture on Trace Estimation**[^UMich2025assets]
    
    \span{fakeclass}{at _[Laura Balzano's](https://web.eecs.umich.edu/~girasole/) Randomized NLA course at the University of Michigan_.}
    
1. **On the Unreasonable Effectiveness of Single Vector Krylov for Low-Rank Approximation**
    
    \span{fakeclass}{at _Caltech SIAM Student/Postoc Seminar_.}
    
1. **Kronecker Matrix-Vector Complexity is Strange**[^SiamMDS2025assets]
    
    \span{fakeclass}{at _Randomized Matrix Computations for Large-scale Scientific and Machine Learning Problems_, a minisymposium at SIAM Conference on Mathematics of Data Science (MDS24)}
    
1. **Optimal Trace Estimation and Sub-Optimal Kronecker-Trace Estimation**
    
    \span{fakeclass}{at _Center for Communications Research_.}
    
1. **Optimal Trace Estimation and Algorithm-Agnostic funNystrom Guarantees**
    
    \span{fakeclass}{at [_UC Berkeley Mahoney Group Meeting_](https://www.stat.berkeley.edu/~mmahoney/index.html).}
    
1. **Optimal Trace Estimation and Sub-Optimal Kronecker-Trace Estimation**
    
    \span{fakeclass}{at [_U Chicago Theory Lunch_](https://orecchia.net/event/theory-lunch/).}
    
1. **On the Unreasonable Effectiveness of Single Vector Krylov for Low-Rank Approximation**
    
    \span{fakeclass}{at [_BIRS workshop on Perspectives on Matrix Computations_](https://www.birs.ca/events/2023/5-day-workshops/23w5108).}
    
1. **On the Unreasonable Effectiveness of Single Vector Krylov for Low-Rank Approximation**
    
    \span{fakeclass}{at _[Purdue University TCS Seminar](https://theorypurdue.wordpress.com/)_}
    
1. **Near-Linear Sample Complexity for $L_p$ Polynomial Regression**
    
    \span{fakeclass}{at _NYU CDS Student Seminar_}
    
1. **Hutch++ and More: Towards Optimal Spectral Sum Estimation**
    
    \span{fakeclass}{at _Matrix Functions, Operator Functions, and Related Approximation Methods_, a minisymposium at SIAM Annual Meeting (AN22)}
    
1. **Hutch++: Optimal Stochastic Trace Estimation**
    
    \span{fakeclass}{at _John Hopkins University Theory Seminar_}
    
1. **Lessons from Trace Estimation Lower Bounds: Testing, Communication, and Anti-Concentration**[^SiamAN2021assets]
    
    \span{fakeclass}{at _Computational Lower Bounds in Numerical Linear Algebra_, a minisymposium at SIAM Annual Meeting (AN21)}

@@

[^UMich2025assets]: Slides available [here](/assets/uMichGuestLecture80minPPT.pdf)

[^SiamMDS2025assets]: Slides available [here](/assets/SiamMds24KronMatVec20minPPT.pdf)

[^SiamAN2021assets]: Slides available [here](/assets/SiamAN-2021-Beamers.pdf). Video starts at 1:04:55 [here](https://player.vimeo.com/video/578316017#t=1h4m55s).

\end{dropdown}

\begin{dropdown}{Other Conference Presentations}

@@link-hover-only

1. **Kronecker Matrix-Vector Complexity is Strange**
    
    \span{fakeclass}{Short Talk at the [RMN + NLA II Conference](https://faculty.washington.edu/trogdon/RMT+NLA_II/)}
    
1. **On the Unreasonable Effectiveness of Single Vector Krylov for Low-Rank Approximation**[^PresentationSectionAssets]
    
    \span{fakeclass}{Short Talk at [Conference on Fast Direct Solvers](https://www.math.purdue.edu/~xiaj/FastSolvers2023/index.html)}
    
1. **Hutchinson's Estimator is Bad at Kronecker-Trace-Estimation**[^PresentationSectionAssets]
    
    \span{fakeclass}{Short Talk at [_SIAM-NNP 2022_](/siam-nnp-minisymposium-2023)}
    
1. **On the Unreasonable Effectiveness of Single Vector Krylov for Low-Rank Approximation**[^PresentationSectionAssets]
    
    \span{fakeclass}{Short Talk at [_GAMM ANLA 2022_](https://sites.google.com/view/gammanla2022/home).}
    
1. **Hutch++: Optimal Stochastic Trace Estimation**[^PresentationSectionAssets]
    
    \span{fakeclass}{Poster and Short Talk at [_HALG 2022_](https://www.lse.ac.uk/HALG-2022).}
    
1. **Chebyshev Sampling is Optimal for Lp Polynomial Regression**[^PresentationSectionAssets]
    
    \span{fakeclass}{Talk at [_NYU "Pandemic Presentations" 2022_](/tcs_presentations)}
    
1. **Hutch++: Optimal Stochastic Trace Estimation**[^PresentationSectionAssets]
    
    \span{fakeclass}{Poster at [_Wald(O) 2021_](https://waldo2021.github.io/).}
    
1. **Optimality Implies Kernel Sum Classifiers are Statistically Efficient**[^PresentationSectionAssets]
    
    \span{fakeclass}{Poster at _Midwest Theory Day 2019_}

@@

[^PresentationSectionAssets]: Assets available in the [Publications](#publications) section.

\end{dropdown}

\begin{dropdown}{Talks at Reading Groups}
_This list is no longer updated. The existing slides are useful though, so I'm keeping this around._
@@link-hover-only

1. **Feature Importance Impossibility Theorems**[^StoyanovichGroup2024]
    
    \span{fakeclass}{45-min-long talk at NYU RAI Reading Group}
    
1. **Fairwashing SHAP (aka Interventional and Observational Shapley Values)**[^StoyanovichGroup2023]
    
    \span{fakeclass}{45-min-long talk at NYU RAI Reading Group}
    
1. **The Equivalence of Matrix-Vector Complexity in Quantum Computing, Part 2**
    
    \span{fakeclass}{1-hour-long talk at NYU/UMass Quantum Linear Algebra Reading Group}
    
1. **The Equivalence of Matrix-Vector Complexity in Quantum Computing, Part 1**
    
    \span{fakeclass}{1-hour-long talk at NYU/UMass Quantum Linear Algebra Reading Group}
    
1. **Hutch++: Optimal Stochastic Trace Estimation**
    
    \span{fakeclass}{1-hour-long talk at NYU VIDA RG Reading Group}
    
1. **Introduction to Leverage Scores**
    
    \span{fakeclass}{1.5-hour-long talk at NYU Tandon Theory Reading Group}
    
1. **Strategies for Episodic Tabular & Linear MDPs**
    
    \span{fakeclass}{Two 1.5-hour-long talks at NYU Tandon Reinforcement Learning Reading Group}
    
1. **Lagrangian Duality**
    
    \span{fakeclass}{Three 1.5-hour-long talks at NYU Tandon Theory Reading Group}
    
1. **Introduction to Differential Entropy**
    
    \span{fakeclass}{1-hour-long talk at NYU CDS Reading Group on Information Theory}
    
1. **Lower bounds on the complexity of stochastic convex optimization**[^MuscoGroup2019]
    
    \span{fakeclass}{1-hour-long presentation of the paper _Information-Theoretic Lower Bounds on the Oracle Complexity of Stochastic Convex Optimization_ by Agarwal et. al.}

@@

[^StoyanovichGroup2024]: Link to relevant paper [here](https://arxiv.org/pdf/2212.11870.pdf).

[^StoyanovichGroup2023]: Link to relevant paper [here](https://arxiv.org/pdf/2006.16234.pdf). My slides available [here](/assets/StoyanovichGroup-2023-Beamers.pdf).

[^MuscoGroup2019]: Link to the original paper [here](https://arxiv.org/abs/1009.0571). My slides available [here](/assets/MuscoGroup-2019-Beamers.pdf).

\end{dropdown}

# Teaching

I really enjoy teaching, and have been a TA for a few courses now:

* [Responsible Data Science](https://dataresponsibly.github.io/rds24/), New York University, Spring 2024

* [Algorithmic Machine Learning and Data Science](https://www.chrismusco.com/amlds2023/), New York University, Fall 2023

* [Responsible Data Science](https://dataresponsibly.github.io/rds23/), New York University, Spring 2023

* [Algorithmic Machine Learning and Data Science](https://www.chrismusco.com/amlds2020/), New York University, Fall 2020

* [Introduction to Machine Learning](https://www.chrismusco.com/introml2020/), New York University, Spring 2020

* [Introduction to the Analysis of Algorithms](https://www.cs.purdue.edu/homes/pdrineas/documents/CS381-Fall18/index.html), Purdue University, Fall 2018

# Service

Service outside of reviewing:
1. Organizer for the [Minisymposium "The Matrix-Vector Complexity of Linear Algebra" at SIAM-NNP 2023](/siam-nnp-minisymposium-2023)
1. Organizer for [NYU TCS "Pandemic Presentations" Day](/tcs_presentations)
1. Organizer for NYU Tandon Theory Reading Group

Service as a reviewer:
1. ICML 2024 Reviewer
1. NeurIPS 2024 Reviewer
1. FOCS 2024 External Reviewer
1. IMA Journal of Numerical Analysis 2024 Reviewer
1. ICALP 2024 External Reviewer
1. ICML 2024 Reviewer
1. IJCAI 2024 Reviewer
1. ICLR 2024 Reviewer
1. NeurIPS 2023 Reviewer
1. TMLR 2023 Reviewer
1. ICLR 2023 Reviewer
1. SODA 2023 External Reviewer
1. NeurIPS 2022 Reviewer
1. ICML 2022 Reviewer
1. STOC 2022 External Reviewer
1. ICLR 2022 Reviewer*
1. NeurIPS 2021 Reviewer*
1. ISIT 2017 External Reviewer

_* Denotes Highlighted / Outstanding Reviewer_

\theoremscripts
