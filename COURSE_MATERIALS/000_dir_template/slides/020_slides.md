% Main Title of the Presentation
% [NGS Data Analysis Course](http://ngscourse.github.io/)
% (updated 22-02-2014)


Some syntax
================================================================================

[See Pandoc markdown syntax here](http://johnmacfarlane.net/pandoc/demo/example9/pandocs-markdown.html)

\ 

_italics_

__bold__

<!-- 
some comment here
-->

    verbatim

No break paragraph
like this.

But with 2 spaces   
at the end of the line.


vertical

\ 

space 


Slide with bullets
================================================================================

- one
- two
- three
    - and a second level
	- and more ...

1. ONE
2. TWO
3. THREE


Slide with subsections
================================================================================

Subsection one
--------------

- something here
- more here

Subsection two
--------------

    verbatim here
	more


Slide with hyperlinks
================================================================================

<http://ngscourse.github.io>

[Follow the link](https://github.com)  

[Follow the link](https://github.com "Some comment here for the HTML _on hover_")  


Reusable Link
-------------

[readme]:https://github.com/ngscourse/ngscourse.github.io/blob/master/README.md "this goes to the main readme"

[readme]

[Readme]

[README]

[go to the readme][readme]


Big Image
================================================================================

![caption here: do not use it](images/smile)


Small Image (PNG)
================================================================================

![](images/small)


Square Image
================================================================================

![](images/square)


Horizontal image
================================================================================

![](images/horizontal)


Vertical image
================================================================================

![](images/vertical)


SCALED image
================================================================================

\centerline{\includegraphics[scale=0.1]{images/smile}}

use _proportions_


Maths
================================================================================

As in latex $X = Y$ inside the text 

An equation:

$$f(x)=\sum_{n=0}^\infty\frac{f^{(n)}(a)}{n!}(x-a)^n$$



Slide with two columns
================================================================================

\begin{columns}\begin{column}{0.6\textwidth}\center

  Text and Images

  here

  But markdown is not working

  Hast to be \LaTeX

  - set relative sizes
  - of the columns 

\end{column}\begin{column}{0.4\textwidth}\center

\includegraphics[width=\textwidth,height=\textheight,keepaspectratio]{images/smile}

\end{column}\end{columns}

Tables
================================================================================

Not working at the moment

<!--

una  dos
---  ---
  1    2
  3    4
  5    6

-------     ------ ----------   -------
     12     12        12             12
    123     123       123           123
      1     1          1              1
-------     ------ ----------   -------

-->
