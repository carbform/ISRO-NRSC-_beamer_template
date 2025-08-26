%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NRSC/ISRO Beamer Theme Class File
% Version: 8.0 (Standard Template)
% Date: 2025/08/26
%
% Description: A full-featured, flexible Beamer class for official
%              NRSC/ISRO presentations. Compatible with pdfLaTeX.
%
% Features:
%   - Selectable font themes ('sans' (default) or 'serif').
%   - Custom command `\setfooterlogo{}` for portability.
%   - Official ISRO/NRSC color palette and styling.
%   - Pre-styled blocks, boxes, code listings, and title page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NRSCISRO}[2025/08/26 v8.0 NRSC ISRO Standard Class]

% --- Class Options for Font Themes ---
\newif\if@sansfont
\DeclareOption{sans}{\@sansfonttrue}
\DeclareOption{serif}{\@sansfontfalse}
\ExecuteOptions{sans} % Sans-serif is the default theme
\ProcessOptions\relax

% --- Load Base Class & Options ---
\PassOptionsToPackage{svgnames}{xcolor}
\LoadClass[compress, 10pt]{beamer}

% --- Required Packages ---
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{microtype}
\RequirePackage{lmodern} % Provides Latin Modern (serif and tt)
\RequirePackage{pdfpages}
\RequirePackage{tcolorbox}
\RequirePackage{array}
\RequirePackage{colortbl}
\RequirePackage{fancybox}
\RequirePackage[footnotesize,hang]{caption}
\RequirePackage{listings} 
\RequirePackage{etoolbox}
\RequirePackage{multicol} 
\RequirePackage{tikz} 
\usetikzlibrary{shapes.geometric, arrows.meta, positioning, fit}

% --- Font Theme Setup ---
\if@sansfont
    \RequirePackage{tgheros} % High-quality Helvetica clone
    % Beamer defaults to sans-serif, so no extra command is needed.
\else
    \usefonttheme{serif} % Switch to classic LaTeX serif font
\fi

% --- ISRO Color Palette ---
\definecolor{ISROOrange}{HTML}{F47216}
\definecolor{ISROBlue}{HTML}{0E88D3}
\definecolor{NRSCGray}{HTML}{4D4D4D}
\definecolor{NRSCWhite}{HTML}{FFFFFF}
\definecolor{NRSCBlack}{HTML}{000000}
\definecolor{ISROAlertRed}{HTML}{D9534F}
\definecolor{ISROExampleGreen}{HTML}{5CB85C}
\definecolor{ISROInfoBlue}{HTML}{5BC0DE}

% --- Beamer Color & Font Configuration ---
\setbeamercolor{structure}{fg=ISROBlue}
\setbeamercolor{normal text}{fg=NRSCBlack, bg=NRSCWhite}

\setbeamercolor{title}{fg=ISROBlue, bg=NRSCWhite}
\setbeamercolor{subtitle}{fg=ISROOrange, bg=NRSCWhite}
\setbeamercolor{author}{fg=NRSCBlack, bg=NRSCWhite}
\setbeamercolor{institute}{fg=NRSCGray, bg=NRSCWhite}
\setbeamercolor{date}{fg=NRSCGray, bg=NRSCWhite}

\if@sansfont
    \setbeamerfont{title}{size=\Large, series=\bfseries, family=\sffamily}
    \setbeamerfont{subtitle}{size=\large, family=\sffamily}
\else
    \setbeamerfont{title}{size=\Large, series=\bfseries} % Serif is default
    \setbeamerfont{subtitle}{size=\large} % Serif is default
\fi
\setbeamerfont{author}{size=\normalsize, family=\ttfamily}
\setbeamerfont{institute}{size=\small, family=\ttfamily}
\setbeamerfont{date}{size=\small, family=\ttfamily}

% --- Template Styling (Blocks, Items, Footer) ---
\setbeamertemplate{blocks}[rounded][shadow=true]
\setbeamercolor{block title}{bg=ISROBlue, fg=NRSCWhite}
\setbeamercolor{block body}{bg=white, fg=black}
\setbeamercolor{block title alerted}{bg=ISROAlertRed, fg=white}
\setbeamercolor{block body alerted}{bg=white, fg=black}
\setbeamercolor{block title example}{bg=ISROExampleGreen, fg=white}
\setbeamercolor{block body example}{bg=white, fg=black}

\AtBeginEnvironment{block}{\setbeamercolor{itemize item}{fg=ISROBlue}}
\AtBeginEnvironment{alertblock}{\setbeamercolor{itemize item}{fg=ISROAlertRed}}
\AtBeginEnvironment{exampleblock}{\setbeamercolor{itemize item}{fg=ISROExampleGreen}}
\setbeamertemplate{itemize items}[square]

\useoutertheme[subsection=false]{miniframes}
\setbeamertemplate{navigation symbols}{}
\setbeamercolor{author in head/foot}{bg=ISROBlue, fg=NRSCWhite}
\setbeamercolor{title in head/foot}{bg=ISROOrange, fg=NRSCWhite}
\setbeamercolor{date in head/foot}{bg=ISROBlue, fg=NRSCWhite}

\defbeamertemplate*{footline}{isro_theme}
{
  \leavevmode%
  \hbox{%
  \begin{beamercolorbox}[wd=.333333\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}%
    \usebeamerfont{author in head/foot}\insertshortauthor
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.333333\paperwidth,ht=2.25ex,dp=1ex,center]{title in head/foot}%
    \usebeamerfont{title in head/foot}\insertshortinstitute
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.333333\paperwidth,ht=2.25ex,dp=1ex,right]{date in head/foot}%
    \usebeamerfont{date in head/foot}\insertshortdate{}\hspace*{2em}
    \insertframenumber{} / \inserttotalframenumber\hspace*{2ex} 
  \end{beamercolorbox}}%
  \vskip0pt%
}

% --- NEW: Command to set the footer logo path ---
\newcommand{\footerlogopath}{} % Create an empty container
\newcommand{\setfooterlogo}[1]{\renewcommand{\footerlogopath}{#1}}

% --- Background Logo Template ---
\makeatletter
\addtobeamertemplate{background}{%
  \ifbeamer@plainframe\else% Only show on non-plain frames
    \ifx\footerlogopath\@empty\else% Only show if path is set
      \begin{tikzpicture}[remember picture, overlay]
          \node[anchor=south east, xshift=-0.50ex, yshift=1.50ex, opacity=0.25] 
          at (current page.south east) 
          {\includegraphics[height=0.50cm]{\footerlogopath}};
      \end{tikzpicture}%
    \fi%
  \fi%
}
\makeatother

% --- Custom User Commands ---
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\email}[1]{\def\@email{\href{mailto:#1}{\texttt{#1}}}}
\def\@department{}
\def\@email{}

\newcommand{\infobox}[1]{\begin{tcolorbox}[colback=NRSCWhite,colframe=ISROInfoBlue,boxrule=1pt,sharp corners,boxsep=4pt,left=4pt,right=4pt,top=4pt,bottom=4pt]#1\end{tcolorbox}}
\newcommand{\successbox}[1]{\begin{tcolorbox}[colback=NRSCWhite,colframe=ISROExampleGreen,boxrule=1pt,sharp corners,boxsep=4pt,left=4pt,right=4pt,top=4pt,bottom=4pt]#1\end{tcolorbox}}
\newcommand{\alertbox}[1]{\begin{tcolorbox}[colback=NRSCWhite,colframe=ISROAlertRed,boxrule=1pt,sharp corners,boxsep=4pt,left=4pt,right=4pt,top=4pt,bottom=4pt]#1\end{tcolorbox}}

\newcommand{\source}[1]{\caption*{\textcolor{NRSCGray}{\footnotesize Source: #1}}}

\newcommand{\framebackground}[2][1]{%
    \begin{tikzpicture}[remember picture, overlay]
        \node[at=(current page.center), opacity=#1] {
            \includegraphics[width=\paperwidth, height=\paperheight, keepaspectratio]{#2}
        };
    \end{tikzpicture}%
}

% --- Title Page Layout ---
\setbeamertemplate{title page}
{
  \vbox{}
  \vfill
  \begingroup
    \centering
    \begin{beamercolorbox}[sep=8pt,center]{title}
      \usebeamerfont{title}\inserttitle\par\medskip
    \end{beamercolorbox}
    \ifx\insertsubtitle\@empty\else
    \begin{beamercolorbox}[sep=4pt,center]{subtitle}
      \usebeamerfont{subtitle}\insertsubtitle\par
    \end{beamercolorbox}
    \fi
    \bigskip\bigskip
    \usebeamerfont{author}\insertauthor\par
    \ifx\@department\@empty\else
        \usebeamerfont{institute}\@department\par
    \fi
    \ifx\insertinstitute\@empty\else
        \usebeamerfont{institute}\insertinstitute\par
    \fi
    \ifx\@email\@empty\else
        \usebeamerfont{institute}\@email\par
    \fi
    \vspace{0.5cm}
    \usebeamerfont{date}\insertdate
  \endgroup
  \vfill
}

% --- Code Listing Style ---
\lstdefinestyle{ISROStyle}{
    backgroundcolor=\color{NRSCWhite},   
    commentstyle=\color{ISROExampleGreen},
    keywordstyle=\color{ISROBlue},
    numberstyle=\tiny\color{NRSCGray},
    stringstyle=\color{ISROOrange},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                   
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}
\lstset{style=ISROStyle}

\mode<all>
\endinput