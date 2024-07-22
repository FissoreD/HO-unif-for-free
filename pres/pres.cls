\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{pres}
[2024/05/31]
\LoadClass[compress]{beamer}
\usetheme{Boadilla}

\ProcessOptions\relax

\newcommand{\frameofframes}{/}

\setbeamertemplate{footline}
{%
  \begin{beamercolorbox}[colsep=1.5pt]{upper separation line foot}
  \end{beamercolorbox}
  \begin{beamercolorbox}[ht=2.5ex,dp=1.125ex,%
      leftskip=.3cm,rightskip=.3cm]{myfootlinetext}%
    {\usebeamerfont{title in head/foot}\insertshorttitle}%
    %: \insertsection 
    \hfill%
    {\usebeamerfont{frame number}
      \insertframenumber~
      \frameofframes~
      \inserttotalframenumber
    }
  \end{beamercolorbox}%
  \begin{beamercolorbox}[colsep=1.5pt]{lower separation line foot}
  \end{beamercolorbox}
}

\setbeamercolor*{palette quaternary}{use=structure,fg=structure.fg!50!black,bg=white}

\newtheorem*{remark}{Remark}
\usepackage[]{biblatex}
\DeclareCiteCommand{\footcite}[\mkbibfootnote]
  {\usebibmacro{prenote}}
  {\printnames[labelname]{author}:%
    \printfield{title} - %
    \printfield{year}
  }
  {\addsemicolon\space}
  {\usebibmacro{postnote}}

\DeclareCiteCommand{\inlinecite}
  {\usebibmacro{prenote}}
  {
    \printfield{title} \\ %
    \printnames[labelname]{author} - %
    \printfield{year}
  }
  {\addsemicolon\space}
  {\usebibmacro{postnote}}

\beamertemplatenavigationsymbolsempty

% Footnote style
\makeatletter
\renewcommand\@makefntext[1]{\leftskip=2em\hskip-2em\@makefnmark#1}
\makeatother
