@def title = "Raphael A. Meyer"
@def tags = ["nyu", "student", "research"]


# Raphael Arkady Meyer


@@row
@@container
@@left ![](/assets/profile_2022.jpg) @@
@@
I am a $4^{th}$ year Ph.D. Student at NYU Tandon School of Engineering, advised by [Prof. Christopher Musco](https://www.chrismusco.com) and part of the [Algorithms and Foundations Group](https://csefoundations.engineering.nyu.edu/).

<!-- To compile this for publishing, run `serve(single=true, clear=true, is_final_pass=true)` and upload the _site directory. Be sure to also run `using Franklin`. I'm using github to auto-compile it now though, so I shouldn't need to do this anymore. -->


I research the interplay of theoretical statistics and computation, largely through the lens of linear algebra.

Links:
[Google Scholar](https://scholar.google.com/citations?user=Xpi5HD0AAAAJ), 
[dblp](https://dblp.org/pid/204/4381.html), 
[Github](https://github.com/RaphaelArkadyMeyerNYU), 
[Zoom Room](https://nyu.zoom.us/my/ram900)

~~~
<div style="clear: both"></div>
~~~
@@

My recent publications have looked at:

* Provably *Optimally* Fast Linear-Algebra Algorithms (_[SOSA2021](https://arxiv.org/pdf/2010.09649.pdf)_)
* Active Learning on Linear Function Families (_[SODA2023](https://arxiv.org/abs/2211.06790)_, _[NeurIPS2020](https://arxiv.org/pdf/2006.08035.pdf)_)

Of course, I am interested in problems beyond these areas, and if you want to work with me on a problem, send me an email: $ram900@nyu.edu$

<!-- Some high-level open questions that I think are super interesting.

* When does *adaptivity* speed up fast linear algebra? Why doesn't adaptivity speed up trace estimation (i.e. sum of eigenvalues), but does seem to speed up estimating the top eigenvalue?
 -->

<!-- \tableofcontents --> <!-- you can use \toc as well -->

# News

- \newicon Preprint available on arXiv: [_Near-Linear Sample Complexity for $L_p$ Polynomial Regression_](https://arxiv.org/abs/2211.06790), to appear at SODA 2023.

- I gave a talk at the [TCS Seminar at Purdue](https://theorypurdue.wordpress.com/) in early November to present my new research on the role of block size in Krylov Methods.

\begin{dropdown}{_Old News_}

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

1.  [**Near-Linear Sample Complexity for $L_p$ Polynomial Regression**](https://arxiv.org/abs/2211.06790)[^SODA2023assets]
    
    \span{fakeclass}{at SODA 2023 _with \cam, \chris, \david, and \samson_}
    
1.  [**Fast Regression for Structured Inputs**](https://arxiv.org/abs/2203.07557)[^ICLR2022assets]
    
    \span{fakeclass}{at ICLR 2022 _with \cam, \chris, \david, and \samson_}
    
1.  [**Hutch++: Optimal Stochastic Trace Estimation**](https://arxiv.org/abs/2010.09649)[^hutchassets]
    
    \span{fakeclass}{at SOSA 2021 _with \cam, \chris, and \david_}
    
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

1. **On the Unreasonable Effectiveness of Single Vector Krylov for Low-Rank Approximation**[^PresentationSectionAssets]
    
    \span{fakeclass}{at _[Purdue University TCS Seminar](https://theorypurdue.wordpress.com/)_}
    
1. **Hutch++ and More: Towards Optimal Spectral Sum Estimation**
    
    \span{fakeclass}{at _Matrix Functions, Operator Functions, and Related Approximation Methods_, a minisymposium at SIAM Annual Meeting (AN22)}
    
1. **Hutch++: Optimal Stochastic Trace Estimation**
    
    \span{fakeclass}{at _John Hopkins University Theory Reading Group_}
    
1. **Lessons from Trace Estimation Lower Bounds: Testing, Communication, and Anti-Concentration**[^SiamAN2021assets]
    
    \span{fakeclass}{at _Computational Lower Bounds in Numerical Linear Algebra_, a minisymposium at SIAM Annual Meeting (AN21)}

@@

[^SiamAN2021assets]: Slides available [here](/assets/SiamAN-2021-Beamers.pdf). Video starts at 1:04:55 [here](https://player.vimeo.com/video/578316017#t=1h4m55s).

\end{dropdown}

\begin{dropdown}{Other Conference Presentations}

@@link-hover-only

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
@@link-hover-only

1. **Near-Linear Sample Complexity for $L_p$ Polynomial Regression**
    
    \span{fakeclass}{1-hour-long talk at NYU CDS Student Seminar}
    
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

[^MuscoGroup2019]: Link to the original paper [here](https://arxiv.org/abs/1009.0571). My slides available [here](/assets/MuscoGroup-2019-Beamers.pdf).

\end{dropdown}

# Teaching

I really enjoy teaching, and have been a TA for a few courses now:

* [Algorithmic Machine Learning and Data Science](https://www.chrismusco.com/amlds2020/), New York University, Fall 2020

* [Introduction to Machine Learning](https://www.chrismusco.com/introml/), New York University, Spring 2020

* [Introduction to the Analysis of Algorithms](https://www.cs.purdue.edu/homes/pdrineas/documents/CS381-Fall18/index.html), Purdue University, Fall 2018

# Service

Service outside of reviewing:
1. Organizer for [NYU TCS "Pandemic Presentations" Day](/tcs_presentations)
1. Organizer for NYU Tandon Theory Reading Group

Service as a reviewer:
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
