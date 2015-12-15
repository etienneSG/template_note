
\ProvidesClass{note}[2015/11/19 Classe pour des notes par E. de Saint Germain]
% classe de base

\LoadClass[a4paper,11pt,twoside]{article}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[francais]{babel}

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
\frenchbsetup{StandardLists=true}
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
\usepackage{amsmath,amsfonts,amsthm,dsfont}
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
% Pour du pseudo-code
\usepackage[french]{algorithm2e}
\setlength{\algomargin}{0em}

% Pour les tableaux
\usepackage{array} % Centrer les tableaux
\usepackage{multirow} % multiligne et multicolonne
\usepackage{arydshln} % ligne en pointillé
\usepackage[hang, small,labelfont=bf,up,textfont=it,up]{caption} % Nom des tables personnalisés
\usepackage{booktabs} % Tables avec des lignes marquées

% On définit l'envirronnement propre au théorème
\theoremstyle{plain} % default (corps en italique)
\newtheorem{thm}{Théorème}
\newtheorem{lem}[thm]{Lemme}
\newtheorem{prop}[thm]{Proposition}
\theoremstyle{definition} % (corps en texte normal)
\newtheorem{conj}{Conjecture}
\newtheorem*{rmq}{Remarque}
\newtheorem{hyp}{Hypothèse}

% Pour dessiner
\usepackage{xcolor}
\definecolor{bottle green}{RGB}{9, 106, 9}
\definecolor{kaki}{rgb}{.5,.5,0}

\usepackage{tikz}
\usetikzlibrary{calc,arrows,automata}
\usetikzlibrary{decorations,decorations.pathreplacing}
\usetikzlibrary{patterns}

% On redéfinit des headers propres
\usepackage{fancyhdr}

% Footers
\lfoot{}
\cfoot{}
\rfoot{}
\fancyfoot[LE,RO]{\thepage}

% Raccourci utile
\newcommand{\red}[1]{\textcolor{red}{#1}} % texte en rouge
\newcommand\RR{\mathbb{R}}           %R de l'ensemble des réels
\newcommand\ZZ{\mathbb{Z}}           %Z de l'ensemble des relatifs
\newcommand\NN{\mathbb{N}}           %N de l'ensemble des naturels

\renewcommand{\abstract}[1]{\textbf{Résumé} : \itshape #1 \normalfont}
\newcommand{\keywords}[1]{\textbf{Mots-clés} : \itshape #1 \normalfont}

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
\newcommand{\LogoInstitute}{\includegraphics[height=1cm]{logo-argon-consulting.jpg}\hfill\includegraphics[height=1.5cm]{logo-cermics.jpg}}

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
    \textit{\today}
    \vskip 2em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
  \par
  \vskip 0.5em
 {\footnotesize\institutename}
  \end{center}%
}





