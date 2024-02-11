\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{rapport}
[2021/11/22 v1.10 adding the titlepageneglish macro.]
\LoadClass[a4paper, twoside]{article}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\RequirePackage{geometry}

\RequirePackage{titling,fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{amsthm}
\usepackage{multicol}

\usepackage[utf8]{inputenc}

\usepackage{pifont}
\usepackage{url}
\usepackage{xstring}
\usepackage{etoolbox}
\usepackage{bm}

\usepackage[
    colorlinks, 
    citecolor=red, 
    linkcolor=blue!60!green, 
    urlcolor=blue]{hyperref}

\usepackage{float}
\usepackage{mathtools}
% Bibliography
\usepackage[
  backend=biber,
  sorting=ynt
]{biblatex}
\addbibresource{./bib.bib}

\def\whitepage{
  \newpage
  \thispagestyle{empty}
  \mbox{}
  \newpage
}

\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markboth{\thesection.\ #1}{}}
\fancyfoot{}

\usepackage[bottom]{footmisc}

\fancyhead[LE]{\textsl{\leftmark}}
\fancyhead[RE, LO]{\textbf{\thepage}}
\fancyhead[RO]{\textsl{\rightmark}}

\usepackage{xargs}
\usepackage[textsize=tiny]{todonotes}
\setlength{\marginparwidth}{2cm}
\newcommandx{\unsure}[2][1=]{\todo[linecolor=red,backgroundcolor=red!25,bordercolor=red,#1]{#2}}
\newcommandx{\change}[2][1=]{\todo[linecolor=blue,backgroundcolor=blue!25,bordercolor=blue,#1]{#2}}

\theoremstyle{definition}
\newtheorem{example}{Example}
\newtheorem{theorem}{Theorem}
\newtheorem{definition}{Definition}[section]
\newtheorem{notation}{Notation}
\newtheorem{lemma}{Lemma}

\theoremstyle{remark}
\newtheorem*{remark}{Remark}

\newcommand{\neworrenewcommand}[1]{\providecommand{#1}{}\renewcommand{#1}}
