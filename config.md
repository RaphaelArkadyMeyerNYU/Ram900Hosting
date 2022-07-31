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

