\ProvidesClass{note}[2015/11/19 Classe pour des notes par E. de Saint Germain]
% classe de base

\LoadClass[a4paper,11pt,twoside]{article}

\usepackage[utf8]{luainputenc}
\usepackage[T1]{fontenc}
\input{param/lang.param}

\usepackage{etoolbox}

% Pour définir une commande en plusieurs langues
\newcommand{\multilangnewcommand}[3]{%
  \newcommand{#1}{%
    \iflanguage{english}{#2}{%
    \iflanguage{french}{#3}{%
    }}%
  }%
}

\setlength{\textheight}{250mm}  % hauteur texte
\setlength{\topmargin}{-20mm}   % espace au dessus de en-tete
\setlength{\headheight}{12pt}   % hauteur en-tete
\setlength{\headsep}{15mm}      % espace entre en_tete et texte
\setlength{\footskip}{10mm}      %  espace entre texte et pied de page

% largeur
% page impaire : 25+5+155+25=210mm
% page paire : 25+155+5+25=210mm
\setlength{\textwidth}{155mm}       % largeur texte
\setlength{\oddsidemargin}{5mm}     % marge gauche pages impaires
\setlength{\evensidemargin}{0mm}    % marge gauche pages paires

% Pour pouvoir mettre des images
\usepackage{graphicx}

% Pour pouvoir modifier les énumérations
\iflanguage{french}{\frenchbsetup{StandardLists=true}}{}
\usepackage{enumitem}
\usepackage[ampersand]{easylist}
\setlist[]{leftmargin=*}

% Pour souligner sur plusieurs lignes
\usepackage{ulem}
\normalem

% Pour mettre des liens dans le fichier
\usepackage[colorlinks=true,pdfmenubar=false,pdfpagemode=UseNone,urlcolor=black,linkcolor=black,citecolor=black,filecolor=black,pdfstartview=FitH]{hyperref}
\urlstyle{rm}

% Pour plus de maths et de chimie
\usepackage{amsmath,amsfonts,amsthm,dsfont,stmaryrd}
\usepackage[overload]{empheq}
\usepackage[version=3]{mhchem} % Chimie
\usepackage{siunitx}  % Utilisation des unités SI

% Pour que les caractères sous l'accolade soient en taille normale
\newcommand\displayUB[2]{\underbrace{#1}_{\displaystyle #2}}

% Si vous avez besoin de mettre du code source par exemple:
% \begin{lstlisting}
% Put your code here.
% \end{lstlisting}
% Ou:
% \lstinputlisting[language=Python]{source_filename.py}
\usepackage{listings}
\usepackage{color}
\usepackage{setspace}
\definecolor{Code}{rgb}{0,0,0}
\definecolor{Decorators}{rgb}{0.5,0.5,0.5}
\definecolor{Numbers}{rgb}{0.5,0,0}
\definecolor{MatchingBrackets}{rgb}{0.25,0.5,0.5}
\definecolor{Keywords}{rgb}{0,0,1}
\definecolor{self}{rgb}{0,0,0}
\definecolor{Strings}{rgb}{0,0.63,0}
\definecolor{Comments}{rgb}{0,0.63,1}
\definecolor{Backquotes}{rgb}{0,0,0}
\definecolor{Classname}{rgb}{0,0,0}
\definecolor{FunctionName}{rgb}{0,0,0}
\definecolor{Operators}{rgb}{0,0,0}
\definecolor{Background}{rgb}{0.98,0.98,0.98}
\lstdefinelanguage{Python}{
  numbers=left,
  numberstyle=\footnotesize,
  numbersep=1em,
  xleftmargin=1em,
  framextopmargin=2em,
  framexbottommargin=2em,
  showspaces=false,
  showtabs=false,
  showstringspaces=false,
  frame=l,
  tabsize=4,
  columns=flexible,
  % Basic
  basicstyle=\ttfamily\small\setstretch{1},
  backgroundcolor=\color{Background},
  % Comments
  commentstyle=\color{Comments}\slshape,
  % Strings
  stringstyle=\color{Strings},
  morecomment=[s][\color{Strings}]{"""}{"""},
  morecomment=[s][\color{Strings}]{'''}{'''},
  % keywords
  morekeywords = {import,from,class,def,for,while,if,is,in,elif,else,not,and,or,print,break,continue,return,True,False,None,access,as,,del,except,exec,finally,global,import,lambda,pass,print,raise,try,assert},
  keywordstyle={\color{Keywords}\bfseries},
  % additional keywords
  morekeywords={[2]@invariant,pylab,numpy,np,scipy},
  keywordstyle={[2]\color{Decorators}\slshape},
  emph={self},
  emphstyle={\color{self}\slshape},
  % 
}

% Pour du pseudo-code
\iflanguage{english}{%
  \usepackage[english]{algorithm2e}%
}{%
  \iflanguage{french}{\usepackage[french]{algorithm2e}}{}%
}
\setlength{\algomargin}{0em}

% Pour les tableaux
\usepackage{array} % Centrer les tableaux
\usepackage{multirow} % multiligne et multicolonne
\usepackage{arydshln} % ligne en pointillé
\usepackage[hang, small,labelfont=bf,up,textfont=it,up]{caption} % Nom des tables personnalisés
\usepackage{booktabs} % Tables avec des lignes marquées

% On définit l'environnement propre au théorème
\theoremstyle{plain} % default (corps en italique)
\newtheorem{thm}{\iflanguage{english}{Theorem}{\iflanguage{french}{Théorème}{}}}
\newtheorem{lem}[thm]{\iflanguage{english}{Lemma}{\iflanguage{french}{Lemme}{}}}
\newtheorem*{lem*}{\iflanguage{english}{Lemma}{\iflanguage{french}{Lemme}{}}}
\newtheorem{prop}[thm]{\iflanguage{english}{Proposition}{\iflanguage{french}{Proposition}{}}}
\newtheorem{cor}[thm]{\iflanguage{english}{Corollary}{\iflanguage{french}{Corollaire}{}}}
\theoremstyle{definition} % (corps en texte normal)
\newtheorem{conj}{\iflanguage{english}{Conjecture}{\iflanguage{french}{Conjecture}{}}}
\newtheorem*{rmq}{\iflanguage{english}{Remark}{\iflanguage{french}{Remarque}{}}}
\newtheorem{hyp}{\iflanguage{english}{Hypothesis}{\iflanguage{french}{Hypothèse}{}}}

% Pour dessiner
\usepackage{xcolor}
\definecolor{bottle green}{RGB}{9, 106, 9}
\definecolor{kaki}{rgb}{.5,.5,0}
\definecolor{argon orange}{RGB}{237, 128, 0}
\definecolor{argon gray}{RGB}{83, 86, 90}

% Tikzpicture
\usepackage{tikz}
\usetikzlibrary{calc,arrows,automata}
\usetikzlibrary{decorations,decorations.pathreplacing}
\usetikzlibrary{patterns}
\usepackage{tikzscale}

% Gnuplot picture
\usepackage{latexsym, keyval, ifthen, moreverb, gnuplot-lua-tikz}
\usepackage{gnuplottex}


% allows line breaks in \cite
\usepackage{cite}

% Raccourci utile
\newcommand{\red}[1]{\textcolor{red}{#1}} % texte en rouge
\newcommand{\tbc}{\red{\texttt{To be completed}}}
\newcommand{\todo}[1]{\red{\texttt{(TO DO: #1)}}}
\def\ds{\displaystyle}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%                                                          %%%%%
%%%%% Titre, en-t\^{e}te et pied de page du document           %%%%%
%%%%%                                                          %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Variables contenant respectivement la date de création, le résumé, les mots-clés
\def\CreationDate#1{\gdef\@CreationDate{#1}}
\def\abstract#1{\gdef\@abstract{#1}}
\let\@abstract\@empty
\def\keywords#1{\gdef\@keywords{#1}}
\let\@keywords\@empty

% Pour écrire une adresse mail
\newcommand{\email}[1]{{\tt#1}}

% Pour énumérer des instituts d'appartenance
\newcounter{@inst}
\newcommand{\inst}[1]{\unskip$^{#1}$}
\newcommand{\institute}[1]{\gdef\@institute{#1}}
\newcommand{\institutename}{\par
 \begingroup
 \parskip=\z@
 \parindent=\z@
 \setcounter{@inst}{1}%
 \def\and{\par\stepcounter{@inst}%
 \noindent$^{\the@inst}$\enspace\ignorespaces}%
 \setbox0=\vbox{\def\thanks##1{}\@institute}%
 \ifnum\c@@inst=1\relax
   \gdef\fnnstart{0}%
 \else
   \xdef\fnnstart{\c@@inst}%
   \setcounter{@inst}{1}%
   \noindent$^{\the@inst}$\enspace
 \fi
 \ignorespaces
 \@institute\par
 \endgroup}

% Logo
\newcommand{\LogoInstitute}{\includegraphics[height=1cm]{logo_argon_gray.png}\hfill\includegraphics[height=1cm]{logo_ponts.png}}

% Pour créer le titre de la note
\renewcommand\@maketitle{%
  \newpage
  \thispagestyle{empty}
  \null
  \noindent\LogoInstitute
  \vskip 1em%
  \begin{center}%
    {\LARGE    \@title \par}%
    \vskip 1em%
    \textit{\@CreationDate}
    \vskip .1em%
    \textit{(\iflanguage{english}{last version:}{\iflanguage{french}{dernière révision :}{}} \today)}
    \vskip 2em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \par
    \vskip .5em
    {\footnotesize\institutename}
  \end{center}%
  \vskip 0em%
  \ifthenelse{ \equal{\@abstract\@keywords}{\@empty} }{}{
    \noindent\rule{\textwidth}{.5pt}%
    \vskip .1em%
    \ifthenelse{ \equal{\@abstract}{\@empty} }{}%
    {%
      \noindent{\textbf{\iflanguage{english}{Abstract:}{\iflanguage{french}{Résumé :}{}}} \itshape \@abstract \normalfont}%
      \ifthenelse{ \equal{\@keywords}{\@empty} }{}{\vskip .5em}%
    }%
    \ifthenelse{ \equal{\@keywords}{\@empty} }{}
    {\noindent{\textbf{\iflanguage{english}{Keywords:}{\iflanguage{french}{Mots-clés :}{}}} \itshape \@keywords \normalfont}}%
    \vskip 0em%
  }%
  \noindent\rule{\textwidth}{.5pt}
}


% On redéfinit des headers propres
\usepackage{fancyhdr}

% Footers
\lfoot{}
\cfoot{}
\rfoot{}
\fancyfoot[LE,RO]{\thepage}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%                   Mathematic commands                    %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\input{math_command.tex}

