\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nicksclass}[2014/09/24, v0.2, My thesis class]

\DeclareOption{draft}{
  \PassOptionsToClass{\CurrentOption}{book}
}
\ProcessOptions
%\LoadClassWithOptions[a4paper]{book}
\LoadClass[a4paper]{book}

\RequirePackage{fixltx2e}
\RequirePackage[strict]{changepage}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{booktabs}
\RequirePackage[morefloats=100]{morefloats}

\definecolor{bookRed}{rgb}{0.667,0.0667,0.2}
\definecolor{bookBlue}{rgb}{0.0,0.5,1.0}
\definecolor{bookGrey}{gray}{0.65}
\definecolor{bookDGrey}{gray}{0.3}

% Nice table of contents
\RequirePackage{titletoc}
\titlecontents{chapter}[0cm]{}{\hspace{1.5em}\addfontfeatures{SmallCapsFeatures={LetterSpace=6.0}}\scshape\color{bookRed}\contentslabel{1.5em}}{\hspace{0em}\addfontfeatures{SmallCapsFeatures={LetterSpace=6.0}}\scshape\color{bookRed}}{\hspace{1em}{\color{bookBlue}\scshape\thecontentspage}}
\titlecontents{section}[3.5em]{}{\scshape\color{bookRed}\contentslabel{2.0em}\normalfont\normalcolor}{}{\hspace{1em}{\color{bookBlue}\scshape\thecontentspage}}
\titlecontents{subsection}[6.1em]{}{\scshape\color{bookRed}\contentslabel{2.6em}\normalfont\normalcolor}{}{\hspace{1em}{\color{bookBlue}\scshape\thecontentspage}}
%\titlecontents{subsubsection}[8em]{}{\scshape\color{bookRed}\contentslabel{3.4em}\normalfont\normalcolor}{}{\hspace{1em}{\color{bookBlue}\scshape\thecontentspage}}

% Nice chapter title pages
\RequirePackage[pagestyles]{titlesec}
\titleformat{\chapter}[display]
{\raggedright\LARGE}%\fontsize{18}{20}\selectfont}
{\marginpar{\scshape\centering{\fontsize{150}{158}\selectfont{\color{bookGrey}\thechapter}}\newline \leftmark}}
{4ex}
{\MakeUppercase}
[\vspace{1.5ex}%
\titlerule]
\titlespacing*{\chapter}{0pt}{-2cm}{1cm}
\titlespacing*{name=\chapter,numberless}{0pt}{-1cm}{30pt}

% Nice section title format
\titleformat{\section}
  {\raggedright\Large}{\scshape\thesection}{1em}{}
\titleformat{\subsection}
  {\raggedright\fontsize{13}{15}\selectfont\itshape}{\normalfont\scshape\thesubsection}{1em}{}
\titleformat{\subsubsection}
  {\raggedright\fontsize{12}{14}\selectfont\addfontfeatures{SmallCapsFeatures={LetterSpace=6.0}}\scshape}{\normalfont}{0em}{}

% Nice page header (no footer) Uses pagestyles option of titlesec
\newpagestyle{main}{
\sethead[\addfontfeatures{SmallCapsFeatures={LetterSpace=6.0}}\scshape\mbox{\llap{\color{bookRed}\thepage\kern1em\color{bookRed}}}\color{bookDGrey}\MakeLowercase{\chaptertitle}][][]% even
{}{}{\addfontfeatures{SmallCapsFeatures={LetterSpace=6.0}}\scshape\color{bookDGrey}\toptitlemarks\MakeLowercase{\sectiontitle}\rlap{\kern1em\color{bookRed}\thepage}}} % odd
\pagestyle{main}% Set it up

%\graphicspath{{/home/nick/Dropbox/march2014/multinest4thesis/flowering/figures/}{/home/nick/Documents/multinestThesisData/LFYFD/}{/home/nick/Documents/multinestThesisData/LFYFD/post-samples/}{/home/nick/Dropbox/NSpaper/revision2/supplement/finalImagesSupp/}}

% Use minion pro for maths and text, myriad for sans, monaco for mono
\RequirePackage{amsmath}
\RequirePackage[MnSymbol]{mathspec}
\setmainfont[Ligatures=TeX]{Minion Pro}
\setmathsfont(Digits,Latin,Greek){Minion Pro}
\setmathrm{Minion Pro}
\exchangeforms{phi}
\setsansfont[Ligatures=TeX,Scale=MatchLowercase]{Myriad Pro}
\setmonofont[Scale=MatchLowercase]{Monaco}
\RequirePackage{metalogo}

\newcommand*\diffd{\mathop{}\!\mathrm{d}}
\newcommand{\dd}[2]{\frac{\diffd #1}{\diffd #2}} % derivative
\newcommand{\ddd}[2]{\frac{\diffd^2 #1}{\diffd #2^2}} % double derivative
\newcommand*\myfullwidth{\dimexpr\textwidth+\marginparsep+\marginparwidth\relax}

\RequirePackage[font={sf},twoside,justification=RaggedRight]{caption}
\RequirePackage[font={sf,normalsize}]{subcaption}

% The package that made all my margin things possible :-)
\RequirePackage{sidenotes}
\DeclareCaptionStyle{sidecaption}[]{font=sf,justification=RaggedRight}
\DeclareCaptionStyle{widefigure}[]{font={normalsize,sf},justification=RaggedRight}
\DeclareCaptionStyle{widetable}[]{font={normalsize,sf},justification=RaggedRight}
\DeclareCaptionStyle{margintable}[]{font=sf,justification=RaggedRight}
\DeclareCaptionStyle{marginfigure}[]{font={normalsize,sf},justification=RaggedRight}

% From tex.sx Stops latex complaining about too many maths fonts
\RequirePackage{etoolbox}
\def\new@mathgroup{\alloc@8\mathgroup\mathchardef\@cclvi}
\patchcmd{\document@select@group}{\sixt@@n}{\@cclvi}{}{}
\patchcmd{\select@group}{\sixt@@n}{\@cclvi}{}{}

\RequirePackage{microtype}

% Set up margins etc as required by guidelines
% Use a decent size marginparwidth
% includemp option very important
\RequirePackage[a4paper,verbose,includemp=true]{geometry}
\geometry{textheight=636pt, marginparsep=20pt, marginparwidth=125pt, inner=40mm, outer=15mm, headsep=40pt, headheight=20pt}
\raggedbottom% Give a bit more flexibility in page setting
\clubpenalty=10000
\widowpenalty=10000

% Use 11pt font with sth that looks like it might fit within guidelines
\renewcommand{\normalsize}{\fontsize{11pt}{17pt}\selectfont}%

\RequirePackage[hidelinks,linktoc=all]{hyperref}%no coloured links

%% Bibliography stuff
\RequirePackage[style=numeric-comp,%
            backend=biber,%
            sorting=none,%
            hyperref=true,%
            url=false,%
            isbn=false,%
            doi=false,%
            eprint=false,%
            backref=true,%
            citereset=chapter,%
            firstinits=true,%
            maxcitenames=2,%
            maxbibnames=20,%
            citetracker%
            ]{biblatex}%
\DefineBibliographyStrings{english}{%
    backrefpage  = {see p.}, % for single page number
    backrefpages = {see pp.} % for multiple page numbers
}
% removes pagination (p./pp.) before page numbers
\DeclareFieldFormat{pages}{#1}
% Remove Oxford comma from refs
\renewcommand*{\finalnamedelim}{\addspace \bibstring {and}\space}

% Here''s my bibliography
\addbibresource{refs.bib}
\renewbibmacro{in:}{%remove In: from articles
  \ifentrytype{article}{}{\printtext{\bibstring{in}\intitlepunct}}}

\AtEveryBibitem{% Clean up the bibtex rather than editing it
 \clearfield{month}
 \clearfield{series}
 \ifentrytype{book}{}{% Remove publisher and editor except for books
  \clearlist{publisher}
  \clearname{editor}
 }
}

% from http://tex.stackexchange.com/a/86051
% So that journals are in title case
% and article titles are in sentence case
\DeclareFieldFormat{myplain}{#1}
\newbibmacro*{journal}{%
  \iffieldundef{journaltitle}
    {}
    {\printtext[journaltitle]{%
       \printfield[myplain]{journaltitle}%
       \setunit{\subtitlepunct}%
       \printfield[myplain]{journalsubtitle}}}}

\defbibheading{bibliography}[\bibname]{\chapter*{#1}}%

% Use a wider header in bibliography due to using a fullwidth page
\newpagestyle{biblio}[]{%
\sethead[\addfontfeatures{SmallCapsFeatures={LetterSpace=6.0}}\color{bookRed}\scshape\thepage\quad\color{bookDGrey}\MakeLowercase{\bibname}][][]%
{}{}{\addfontfeatures{SmallCapsFeatures={LetterSpace=6.0}}\color{bookDGrey}\scshape\MakeLowercase{\bibname}\quad\color{bookRed}\thepage}%
}

\patchcmd{\chapter}{plain}{empty}{}{}%% No page numbers on chap title pages, or abstract, TOC etc. http://tex.stackexchange.com/a/19741

% command to go back to full justification
\def\flushboth{%http://www.tex.ac.uk/cgi-bin/texfaq2html?label=flushboth
  \let\\\@normalcr
  \@rightskip\z@skip \rightskip\@rightskip
  \leftskip\z@skip
  \parindent 1.5em\relax}

% Title page
\newcommand*{\myTitlePage}{\begingroup
\begin{center}
{\fontsize{37pt}{37pt}\selectfont\color{bookRed} Mathematical modelling of the floral transition\\[0.3\baselineskip]
\Huge ---  with a Bayesian flourish ---}\\
\vspace{1.5cm}
{\Huge\textsc{Nick Pullen}}\\[0.4\baselineskip]
{\LARGE %John Innes Centre\\
September, 2014}\\[5mm]
\centering\includegraphics[width=0.5\paperwidth,height=0.5\paperheight,%
keepaspectratio]{UEAshield.png}\\%
%\vspace{12cm}
%\vfill
{\Large A thesis submitted to the University of East Anglia
for the degree of Doctor of Philosophy}\\[1cm]
\includegraphics[scale=0.65,keepaspectratio]{JIClogo.pdf}
\end{center}
\endgroup}

%%%%%%%%%%%%%%%%%%%%%%
% NICK HACKING
% What was ultimately a doomed attempt to get author-year refs
% in the margins
% Failed due to floating marginnotes spilling over pages sometimes
% and therefore having the previous author and number by the 
% next ref number in the text
%%%%%%%%%%%%%%%%%%%%%%
\DeclareCiteCommand{\nickcite}[\cbx@necessary]
  {\usebibmacro{cite:init}%
   \usebibmacro{prenote}}
  {\usebibmacro{citeindex}%
   \usebibmacro{nickcite}%
   \usebibmacro{cite:comp}}
  {}  
  {\usebibmacro{cite:dump}%
   \usebibmacro{postnote}}

\newbibmacro*{nickcite}{%
  \ifciteseen
    {}% 
    {\iffieldequalstr{entrytype}{article}% checks if the entry type is "article",
                                         % and if true, entry fields and punctuation are 
                                         % printed as specified below; if false, default  
                                         % biblatex citation scheme is used
      {%  
        \xappto\cbx@citehook{%
          %\noexpand\footnotetext[\thefield{labelnumber}]{%
          \noexpand\marginpar{[\thefield{labelnumber}]{%
            \addspace\entrydata{\thefield{entrykey}}{%
            \printnames{labelname}\addspace%
         %   \mkbibemph{\printfield{shortjournal}},\addspace%
            \printfield{year}}}}}%
         %%   \mkbibemph{\printfield{shortjournal}},\addspace%
         %%   \printfield{year}\addperiod}}}}%
      }{}}}
   %   {\usebibmacro{notefullcite}}}}%
%%%%%%%%%%%%%%%%%%%%%%
\newrobustcmd{\cbx@necessary}[1]{%
  %\mkbibsuperscript{#1}%
  \mkbibbrackets{#1}%
  \cbx@citehook
  \global\let\cbx@citehook=\empty}
\let\cbx@citehook=\empty
