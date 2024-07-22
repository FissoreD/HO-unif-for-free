\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{rapport}
[2021/11/22 v1.10 adding the titlepageneglish macro.]
\LoadClass[a4paper, twoside]{article}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\RequirePackage{geometry}
\RequirePackage{titling,fancyhdr}
\RequirePackage{enumitem}

\def\whitepage{
  \newpage
  \thispagestyle{empty}
  \mbox{}
  \newpage
}

\pagestyle{fancy}
\fancyfoot{}

\usepackage[bottom]{footmisc}

\fancyhead[LE]{\textsl{\leftmark}}
\fancyhead[RE, LO]{\textbf{\thepage}}
\fancyhead[RO]{\textsl{\rightmark}}
