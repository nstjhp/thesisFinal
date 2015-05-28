Welcome
=======

This repository contains most things to do with my final accepted thesis.

In particular:

* The LaTeX class file I made
* Text (inc. tables)
* References (everyone single one was hand edited...)
* Some figures (and scripts)

You can download the PDF from the [UEA library](https://ueaeprints.uea.ac.uk/52210/).

You can probably recompile it if you have a full TeXlive distribution using XeLaTeX and have the fonts I used installed (Minion Pro, Myriad Pro, Monaco).
The command would be something like `xelatex base.tex` but as I haven't included all the figures you can try passing draft mode to the graphicx package and see if that works.

Style
=====

You can read a bit about the style of my thesis design in the [Colophon](https://en.wikipedia.org/wiki/Colophon_%28publishing%29) (`colophon.tex`).
I had inspirations but followed something that I wanted *my* thesis to look like.
I'm sure it's not to everyone's taste but I'm very happy with the final appearance.
It is supposed to read with pages back-to-back, with a wide margin always on the outside of the recto and verso sides of a double page spread.
There are many gems in this thesis, a number of which may not be obvious to the casual reader and so will only be revealed by looking through the class file (`nicksclass.cls`), which to be fair is not likely to be understood by many people...even myself, so thanks to [tex.stackexchange.com](http://tex.stackexchange.com/)!
Despite all the challenges I bloody love **LaTeX**!

Updates
=======

I do not intend to make any updates to the text of this thesis as this was the final submitted and accepted version.
Thus this aspect of the repository should be treated as frozen.
However, I may push various figure files, scripts etc. to this repository in the future.

Advice
======

I highly recommend students to focus on the content of their thesis before worrying about the presentation.
If, like me, you can't keep away from tinkering with the look of LaTeX documents then start with Markdown.
That's what I did before converting to LaTeX when I was happy enough with my progress.
Then, when I was bored or needed a break, I would try to tick things off my design to-do list.

Random commands I used during the writing-up process
====================================================

Example commands to run to do basic converting:

* `pandoc flowering.md -o test.pdf`
* `pandoc -f markdown -t latex -o test.tex flowering.md`

With the latter you will need to put documentclass, includegraphics, begin and end document lines in as appropriate.

Vi command to comment out verbatim sections after converting to latex
`:g/verbatim/s/^/%/`
