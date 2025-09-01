<!--
Add here global page variables to use throughout your
website.
The website_* must be defined for the RSS to work
@def prepath = "Ram900Hosting"
-->
@def website_title = "Raphael Meyer's Website"
@def website_descr = "Raphael Arkady Meyer's Personal Website at NYU"
@def website_url   = "https://ram900.hosting.nyu.edu/"



@def author = "Raphael Arkady Meyer"

<!-- Table of contents has this depth level. Might be usefull down the line
	if I use a ToC, but not important for now. -->
@def mintoclevel = 1

<!--
Add here files or directories that should be ignored by Franklin, otherwise
these files might be copied and, if markdown, processed by Franklin which
you might not want. Indicate directories by ending the name with a `/`.
-->
@def ignore = ["node_modules/", "franklin", "franklin.pub", "_fkl_libs/"]

<!--
Add here global latex commands to use throughout your
pages. It can be math commands but does not need to be.
For instance:
* \newcommand{\phrase}{This is a long phrase to copy.}
-->

\newcommand{\akash}{[Akash Rao](https://www.linkedin.com/in/akashgrao/)}
\newcommand{\cam}{[Cameron Musco](https://people.cs.umass.edu/~cmusco/)}
\newcommand{\chris}{[Christopher Musco](https://www.chrismusco.com/)}
\newcommand{\chrisc}{[Chris Camaño](https://chriscamano.github.io/)}
\newcommand{\davidp}{[David Persson](https://scholar.google.com/citations?user=jOtDnRAAAAAJ&hl=en&oi=ao)}
\newcommand{\davidw}{[David P. Woodruff](http://www.cs.cmu.edu/~dwoodruf/)}
\newcommand{\ethan}{[Ethan N. Epperly](https://www.ethanepperly.com/)}
\newcommand{\haim}{[Haim Avron](http://www.math.tau.ac.il/~haimav/)}
\newcommand{\jean}{[Jean Honorio](https://www.cs.purdue.edu/homes/jhonorio/)}
\newcommand{\joel}{[Joel A. Tropp](https://tropp.caltech.edu/)}
\newcommand{\kevin}{[Kevin Shu](https://kevinshu.me/)}
\newcommand{\maji}{[Hemanta K. Maji](https://www.cs.purdue.edu/homes/hmaji/)}
\newcommand{\samson}{[Samson Zhou](https://samsonzhou.github.io/)}
\newcommand{\tyler}{[Tyler Chen](https://research.chen.pw/)}
\newcommand{\will}{[William Swartworth](https://wswartworth.github.io/)}

\newcommand{\style}[2]{~~~<span style="!#1">~~~#2~~~</span>~~~}
\newcommand{\span}[2]{~~~<span class="!#1">~~~#2~~~</span>~~~}

\newcommand{\newicon}[0]{~~~<img style="width:25px;height:18px;padding-left:0", src="/assets/knuths-new.gif"></img>~~~}

\newenvironment{algorithm}[1]{
	@@pseudocode
	\stepcounter{NumAlgorithms}
	\style{font-size: 20px}{Algorithm \arabic{NumAlgorithms}: #1}

	---

}{
	@@
}

