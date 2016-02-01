
\ProvidesClass{note}[2015/11/19 Classe pour des notes par E. de Saint Germain]
% classe de base

\LoadClass[a4paper,11pt,twoside]{article}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[francais]{babel}

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
% Pour du pseudo-code
\usepackage[french]{algorithm2e}
\setlength{\algomargin}{0em}

% Pour les tableaux
\usepackage{array} % Centrer les tableaux
\usepackage{multirow} % multiligne et multicolonne
\usepackage{arydshln} % ligne en pointillé
\usepackage[hang, small,labelfont=bf,up,textfont=it,up]{caption} % Nom des tables personnalisés
\usepackage{booktabs} % Tables avec des lignes marquées

% On définit l'environnement propre au théorème
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


% Raccourci utile
\newcommand{\red}[1]{\textcolor{red}{#1}} % texte en rouge


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%                                                          %%%%%
%%%%% Titre, en-t\^{e}te et pied de page du document           %%%%%
%%%%%                                                          %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Variables contenant respectivement la date de création, le résumé, les mots-clés
\def\CreationDate#1{\gdef\@CreationDate{#1}}
\def\abstract#1{\gdef\@abstract{#1}}
\def\keywords#1{\gdef\@keywords{#1}}

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
    \textit{\@CreationDate}
    \vskip .1em%
    \textit{(dernière révision : \today)}
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
  \noindent\rule{\textwidth}{.5pt}
  \vskip .1em%
  {\textbf{Résumé} : \itshape \@abstract \normalfont}
  \vskip .5em%
  {\textbf{Mots-clés} : \itshape \@keywords \normalfont}
  \vskip 0em%
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
%%%%%                                                          %%%%%
%%%%% Commandes math\'{e}matiques                              %%%%%
%%%%%                                                          %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\cA}{\mathcal{A}}
\newcommand{\cB}{\mathcal{B}}
\newcommand{\cC}{\mathcal{C}}
\newcommand{\cD}{\mathcal{D}}
\newcommand{\cE}{\mathcal{E}}
\newcommand{\cF}{\mathcal{F}}
\newcommand{\cG}{\mathcal{G}}
\newcommand{\cH}{\mathcal{H}}
\newcommand{\cI}{\mathcal{I}}
\newcommand{\cJ}{\mathcal{J}}
\newcommand{\cK}{\mathcal{K}}
\newcommand{\cL}{\mathcal{L}}
\newcommand{\cM}{\mathcal{M}}
\newcommand{\cN}{\mathcal{N}}
\newcommand{\cO}{\mathcal{O}}
\newcommand{\cP}{\mathcal{P}}
\newcommand{\cQ}{\mathcal{Q}}
\newcommand{\cR}{\mathcal{R}}
\newcommand{\cS}{\mathcal{S}}
\newcommand{\cT}{\mathcal{T}}
\newcommand{\cU}{\mathcal{U}}
\newcommand{\cV}{\mathcal{V}}
\newcommand{\cW}{\mathcal{W}}
\newcommand{\cX}{\mathcal{X}}
\newcommand{\cY}{\mathcal{Y}}
\newcommand{\cZ}{\mathcal{Z}}

\newcommand{\BB}{\mathbb{B}}
\newcommand{\CC}{\mathbb{C}}
\newcommand{\DD}{\mathbb{D}}
\newcommand{\EE}{\mathbb{E}}
\newcommand{\FF}{\mathbb{F}}
\newcommand{\GG}{\mathbb{G}}
\newcommand{\HH}{\mathbb{H}}
\newcommand{\II}{\mathbb{I}}
\newcommand{\JJ}{\mathbb{J}}
\newcommand{\KK}{\mathbb{K}}
\newcommand{\LL}{\mathbb{L}}
\newcommand{\MM}{\mathbb{M}}
\newcommand{\NN}{\mathbb{N}}
\newcommand{\OO}{\mathbb{O}}
\newcommand{\PP}{\mathbb{P}}
\newcommand{\QQ}{\mathbb{Q}}
\newcommand{\RR}{\mathbb{R}}
\newcommand{\TT}{\mathbb{T}}
\newcommand{\UU}{\mathbb{U}}
\newcommand{\VV}{\mathbb{V}}
\newcommand{\WW}{\mathbb{W}}
\newcommand{\XX}{\mathbb{X}}
\newcommand{\YY}{\mathbb{Y}}
\newcommand{\ZZ}{\mathbb{Z}}


\def\mathscr{\EuScript}

%%%%% Pour indiquer qu'un sujet continue apres la page indexee
%%%%% (voir l'index de Rockafellar-Wets : Variational Analysis)

\newcommand{\suiv}[1]{#1+}

%%%%% Notations pour la mod\'{e}lisation des probl\`{e}mes d'optimisation

\newcommand{\dynamics}{f}                                   % Dynamique
\newcommand{\criterion}{\jmath}                             % Crit\`{e}re
\newcommand{\Criterion}{J}                                  % Crit\`{e}re apres esperance
\newcommand{\feedback}{\gamma}                              % Feedback
\newcommand{\Feedback}{\Gamma}                              % Ensemble des feedbacks

%%%%% Math\'{e}matiques g\'{e}n\'{e}rales

\newcommand{\defegal}{:=}                                   % D\'{e}finition

\newcommand{\IFF}{iff~}                                     % if and only if

\newcommand{\abs}[1]{\left|#1\right|}                       % Valeur absolue
\newcommand{\norm}[1]{\left\|#1\right\|}                    % Norme
\newcommand{\sqnorm}[1]{\left\|#1\right\|^{2}}              % Norme au carr\'{e}

\newcommand{\derpar}[2]{\frac{\partial#1}{\partial#2}}      % D\'{e}riv\'{e}e partielle
\newcommand{\dertot}[2]{\frac{\mathrm{d}#1}{\mathrm{d}#2}}  % D\'{e}riv\'{e}e totale
\newcommand{\diff}{\mathrm{d}}                              % Diff\'{e}rentielle

\newcommand{\projop}[1]{\mathrm{proj}_{#1}}                 % Op\'{e}rateur projection
\newcommand{\proj}[2]{\projop{#1}\left(#2\right)}           % Projection
\newcommand{\dist}[2]{\mathrm{dist}_{#1}\left(#2\right)}    % Distance

\newcommand{\procar}{\mathop{\times}}                       % Produit cart\'{e}sien

%%%%% Superscripts

\newcommand{\ortho}{^{\bot}}                                % Orthogonalit\'{e}
\newcommand{\transp}{^{\top}}                               % Transposition
\newcommand{\dual}{^{\star}}                                % Dualit\'{e}
\newcommand{\bidual}{^{\star\star}}                         % Dualit\'{e}
\newcommand{\opt}{^{\sharp}}                                % Optimalit\'{e}
\newcommand{\ad}{^{\mathrm{ad}}}                            % Admissibilit\'{e}
\newcommand{\co}{^{\mathrm{co}}}                            % Convexit\'{e}
\newcommand{\compl}{^{\mathrm{C}}}                          % Compl\'{e}mentarit\'{e}
\newcommand{\compo}{\mathop{\scriptstyle\circ}}             % Composition

\newcommand{\comp}{\compo}                                  % Compatibilit\'{e} ant\'{e}rieure

%%%%% Parenth\`{e}ses, crochets et accolades

\newcommand{\bracket}[1]{\left(#1\right)}                   % Parenth\`{e}se
\newcommand{\sqbracket}[1]{\left[#1\right]}                 % Crochet normal
\newcommand{\crbracket}[1]{\left\{#1\right\}}                   % Accolade normal

%%%%% Parenth\`{e}ses, crochets et accolades taille fixe

\newcommand{\nnorm}[1]{\|#1\|} 
\newcommand{\bnorm}[1]{\big\|#1\big\|}
\newcommand{\Bnorm}[1]{\Big\|#1\Big\|}
\newcommand{\bgnorm}[1]{\bigg\|#1\bigg\|}
\newcommand{\Bgnorm}[1]{\Bigg\|#1\Bigg\|}

\newcommand{\np}[1]{(#1)}                                   % Parenth\`{e}se normal
\newcommand{\bp}[1]{\big(#1\big)}                           % Parenth\`{e}se big
\newcommand{\Bp}[1]{\Big(#1\Big)}                           % Parenth\`{e}se Big
\newcommand{\bgp}[1]{\bigg(#1\bigg)}                        % Parenth\`{e}se bigg
\newcommand{\Bgp}[1]{\Bigg(#1\Bigg)}                        % Parenth\`{e}se Bigg

\newcommand{\nc}[1]{[#1]}                                   % Crochet normal
\newcommand{\bc}[1]{\big[#1\big]}                           % Crochet big
\newcommand{\Bc}[1]{\Big[#1\Big]}                           % Crochet Big
\newcommand{\bgc}[1]{\bigg[#1\bigg]}                        % Crochet bigg
\newcommand{\Bgc}[1]{\Bigg[#1\Bigg]}                        % Crochet Bigg

\newcommand{\na}[1]{\{#1\}}                                 % Accolade normal
\newcommand{\ba}[1]{\big\{#1\big\}}                         % Accolade big
\newcommand{\Ba}[1]{\Big\{#1\Big\}}                         % Accolade Big
\newcommand{\bga}[1]{\bigg\{#1\bigg\}}                      % Accolade bigg
\newcommand{\Bga}[1]{\Bigg\{#1\Bigg\}}                      % Accolade Bigg

%%%%% Versions avec s\'{e}parateur

\newcommand{\nps}[2]{\np{#1\mid#2}}                         % Parenth\`{e}se normal
\newcommand{\bps}[2]{\bp{#1\ \big|\ #2}}                    % Parenth\`{e}se big
\newcommand{\Bps}[2]{\Bp{#1\ \Big|\ #2}}                    % Parenth\`{e}se Big
\newcommand{\bgps}[2]{\bgp{#1\ \bigg|\ #2}}                 % Parenth\`{e}se bigg
\newcommand{\Bgps}[2]{\Bgp{#1\ \Bigg|\ #2}}                 % Parenth\`{e}se Bigg

\newcommand{\ncs}[2]{\nc{#1\mid#2}}                         % Crochet normal
\newcommand{\bcs}[2]{\bc{#1\ \big|\ #2}}                    % Crochet big
\newcommand{\Bcs}[2]{\Bc{#1\ \Big|\ #2}}                    % Crochet Big
\newcommand{\bgcs}[2]{\bgc{#1\ \bigg|\ #2}}                 % Crochet bigg
\newcommand{\Bgcs}[2]{\Bgc{#1\ \Bigg|\ #2}}                 % Crochet Bigg

\newcommand{\nas}[2]{\na{#1\mid#2}}                         % Accolade normal
\newcommand{\bas}[2]{\ba{#1\ \big|\ #2}}                    % Accolade big
\newcommand{\Bas}[2]{\Ba{#1\ \Big|\ #2}}                    % Accolade Big
\newcommand{\bgas}[2]{\bga{#1\ \bigg|\ #2}}                 % Accolade bigg
\newcommand{\Bgas}[2]{\Bga{#1\ \Bigg|\ #2}}                 % Accolade Bigg

%%%%% Optimisation

\newcommand{\espace}[1]{\mathbb{#1}}                        % Espace de Hilbert
\newcommand{\partie}[1]{#1}                                 % Sous-ensemble
\newcommand{\cone}[1]{#1}                                   % C\^{o}ne
\newcommand{\fident}[1]{\mathrm{I}_{#1}}                    % Fonction identit\'{e}
\newcommand{\fcara}[1]{\chi_{{}_{#1}}}                      % Fonction caract\'{e}ristique
\newcommand{\findi}[1]{\mathbf{1}_{#1}}                     % Fonction indicatrice
\newcommand{\argmin}{\mathop{\arg\min}}                     % Arg-min
\newcommand{\argmax}{\mathop{\arg\max}}                     % Arg-max
\newcommand{\gradi}[2][]{\nabla_{#1}#2}                     % Gradient partiel
\newcommand{\hessi}[1]{\nabla^{2}#1}                        % Hessien

%%%%% Probabilit\'{e}s

\newcommand{\espacea}[1]{\mathbb{#1}}                       % Espace d'arriv\'{e}e
\newcommand{\espacef}[1]{\mathcal{#1}}                      % Espace fonctionnel
\newcommand{\tribu}[1]{\mathscr{#1}}                        % Tribu
\newcommand{\borel}[1]{\tribu{B}_{#1}^{\mathrm{o}}}         % Tribu borelienne
\newcommand{\omeg}{\Omega}                                  % espace du triplet
\newcommand{\trib}{\tribu{A}}                               % tribu  du triplet
\newcommand{\partset}[1]{\mathfrak{P}\left(#1\right)}       % Ensemble des partitions
\newcommand{\prbt}{\mathbb{P}}                              % proba  du triplet
\newcommand{\espe}{\mathbb{E}}                              % Symbole esp\'{e}rance
\newcommand{\variold}{\mathbb{V}}                           % Ancien symbole variance
\newcommand{\vari}{\mathrm{Var}}                            % Symbole variance
\newcommand{\espaceva}[3][]{L_{#1}^{2}\left(#2;#3\right)}   % Espace L2

%%%%% Variable al\'{e}atoire

\makeatletter
\def\va@a{\boldsymbol{\va@arg^{\textstyle\text{\unboldmath$\scriptstyle\va@expo$}}_{\textstyle\text{\unboldmath$\scriptstyle\va@index$}}}}
\def\va#1{\def\va@expo{}\def\va@index{}\def\va@arg{\uppercase{#1}}%
  \@ifnextchar^{\va@h}{\@ifnextchar_\va@u\va@a}}
\def\va@h^#1{\def\va@expo{#1}\@ifnextchar_\va@hu\va@a}
\def\va@u_#1{\def\va@index{#1}\@ifnextchar^\va@uh\va@a}
\def\va@hu_#1{\def\va@index{#1}\va@a}
\def\va@uh^#1{\def\va@expo{#1}\va@a}
\makeatother

%%%%% Choix du delimiteur (parenth\`{e}se) pour probabilit\'{e}, esp\'{e}rance...

\newcommand{\normdelim}[1]{\nc{#1}}                         % Taille ``normal''
\newcommand{\bigdelim}[1]{\bc{#1}}                          % Taille ``big''
\newcommand{\Bigdelim}[1]{\Bc{#1}}                          % Taille ``Big''
\newcommand{\biggdelim}[1]{\bgc{#1}}                        % Taille ``bigg''
\newcommand{\Biggdelim}[1]{\Bgc{#1}}                        % Taille ``Bigg''
\newcommand{\vardelim}[1]{\left[#1\right]}                  % Taille ``variable''

\newcommand{\normdelims}[2]{\normdelim{#1\mid#2}}           % avec s\'{e}parateur
\newcommand{\bigdelims}[2]{\bigdelim{#1\ \big|\ #2}}        %
\newcommand{\Bigdelims}[2]{\Bigdelim{#1\ \Big|\ #2}}        %
\newcommand{\biggdelims}[2]{\biggdelim{#1\ \bigg|\ #2}}     %
\newcommand{\Biggdelims}[2]{\Biggdelim{#1\ \Bigg|\ #2}}     %
\newcommand{\vardelims}[2]{\vardelim{#1\mid#2}}             %

%% Esp\'{e}rance

\newcommand{\nesp}[2][]{\espe_{#1}\normdelim{#2}}           % Esp\'{e}rance normal
\newcommand{\besp}[2][]{\espe_{#1}\bigdelim{#2}}            % Esp\'{e}rance big
\newcommand{\Besp}[2][]{\espe_{#1}\Bigdelim{#2}}            % Esp\'{e}rance Big
\newcommand{\bgesp}[2][]{\espe_{#1}\biggdelim{#2}}          % Esp\'{e}rance bigg
\newcommand{\Bgesp}[2][]{\espe_{#1}\Biggdelim{#2}}          % Esp\'{e}rance Bigg

%% Esp\'{e}rance conditionnelle

\newcommand{\nespc}[3][]{\espe_{#1}\normdelims{#2}{#3}}     % Esp\'{e}rance cond. normal
\newcommand{\bespc}[3][]{\espe_{#1}\bigdelims{#2}{#3}}      % Esp\'{e}rance cond. big
\newcommand{\Bespc}[3][]{\espe_{#1}\Bigdelims{#2}{#3}}      % Esp\'{e}rance cond. Big
\newcommand{\bgespc}[3][]{\espe_{#1}\biggdelims{#2}{#3}}    % Esp\'{e}rance cond. bigg
\newcommand{\Bgespc}[3][]{\espe_{#1}\Biggdelims{#2}{#3}}    % Esp\'{e}rance cond. Bigg

%% Probabilit\'{e}

\newcommand{\nprob}[1]{\prbt\normdelim{#1}}                 % Probabilit\'{e} normal
\newcommand{\bprob}[1]{\prbt\bigdelim{#1}}                  % Probabilit\'{e} big
\newcommand{\Bprob}[1]{\prbt\Bigdelim{#1}}                  % Probabilit\'{e} Big
\newcommand{\bgprob}[1]{\prbt\biggdelim{#1}}                % Probabilit\'{e} bigg
\newcommand{\Bgprob}[1]{\prbt\Biggdelim{#1}}                % Probabilit\'{e} Bigg

%% Variance

\newcommand{\nvar}[2][]{\vari_{#1}\normdelim{#2}}           % Variance normal
\newcommand{\bvar}[2][]{\vari_{#1}\bigdelim{#2}}            % Variance big
\newcommand{\Bvar}[2][]{\vari_{#1}\Bigdelim{#2}}            % Variance Big
\newcommand{\bgvar}[2][]{\vari_{#1}\biggdelim{#2}}          % Variance bigg
\newcommand{\Bgvar}[2][]{\vari_{#1}\Biggdelim{#2}}          % Variance Bigg

%% Compatibilit\'{e} ant\'{e}rieure

\newcommand{\proba}[1]{\prbt\vardelim{#1}}                  % Probabilit\'{e}
\newcommand{\esper}[2][]{\espe_{#1}\vardelim{#2}}           % Esp\'{e}rance avec argument optionnel
\newcommand{\espcond}[3][]{\espe_{#1}\vardelims{#2}{#3}}    % Esp\'{e}rance cond.
\newcommand{\varian}[2][]{\vari_{#1}\vardelim{#2}}          % Variance
\newcommand{\sequence}[2]{\left\{#1\right\}_{#2}}           % Suite
\newcommand{\proscal}[2]{\left\langle#1\:,#2\right\rangle}  % Produit scalaire

%%%%% Suite

\newcommand{\nsuit}[2]{\na{#1}_{#2}}                        % Suite normal
\newcommand{\bsuit}[2]{\ba{#1}_{#2}}                        % Suite big
\newcommand{\Bsuit}[2]{\Ba{#1}_{#2}}                        % Suite Big
\newcommand{\bgsuit}[2]{\bga{#1}_{#2}}                      % Suite bigg
\newcommand{\Bgsuit}[2]{\Bga{#1}_{#2}}                      % Suite Bigg

%%%%% Projection

\newcommand{\nproj}[2]{\projop{#1}\np{#2}}                  % Projection normal
\newcommand{\bproj}[2]{\projop{#1}\bp{#2}}                  % Projection big
\newcommand{\Bproj}[2]{\projop{#1}\Bp{#2}}                  % Projection Big
\newcommand{\bgproj}[2]{\projop{#1}\bgp{#2}}                % Projection bigg
\newcommand{\Bgproj}[2]{\projop{#1}\Bgp{#2}}                % Projection Bigg

%%%%% Produit scalaire

\newcommand{\nscal}[2]{\langle#1\:,#2\rangle}               % Produit scalaire
\newcommand{\bscal}[2]{\big\langle#1\:,#2\big\rangle}       % Produit scalaire
\newcommand{\Bscal}[2]{\Big\langle#1\:,#2\Big\rangle}       % Produit scalaire
\newcommand{\bgscal}[2]{\bigg\langle#1\:,#2\bigg\rangle}    % Produit scalaire
\newcommand{\Bgscal}[2]{\Bigg\langle#1\:,#2\Bigg\rangle}    % Produit scalaire

%%%%% Valeur absolue, norme

\newcommand{\nabs}[1]{|#1|}                                 % Valeur absolue
\newcommand{\babs}[1]{\big|#1\big|}                         % Valeur absolue
\newcommand{\Babs}[1]{\Big|#1\Big|}                         % Valeur absolue
\newcommand{\bgabs}[1]{\bigg|#1\bigg|}                      % Valeur absolue
\newcommand{\Bgabs}[1]{\Bigg|#1\Bigg|}                      % Valeur absolue

%%%%% Abbr\'{e}viations

\newcommand{\dom}{\mathop{\mathrm{dom}}}                    % Domaine
\newcommand{\relint}{\mathop{\mathrm{ri}}}                  % Int\'{e}rieur relatif
%\newcommand{\conv}{\mathop{\mathrm{co}}}                    % Enveloppe convexe
\newcommand{\convf}{\mathop{\overline{\mathrm{co}}}}        % Enveloppe convexe ferm\'{e}e
\newcommand{\epi}{\mathop{\mathrm{epi}}}                    % ``epi''

\newcommand{\lsc}{\text{l.s.c.}}                            % ``l.s.c.''
\newcommand{\usc}{\text{u.s.c.}}                            % ``u.s.c.''
\newcommand{\iid}{\text{i.i.d.}}                            % ``i.i.d.''
\newcommand{\as}{\text{a.s.}}                               % ``a.s.''
\newcommand{\Pps}{\text{$\prbt$-}\as}                       % ``P-a.s.''
\multilangnewcommand{\st}{\mathrm{s.t.}}{\mathrm{s.c.}}     % ``s.c.''


%%%%% Grilles

\newcommand{\grid}[1]{\boldsymbol{\lowercase{#1}}}          % Grille
\newcommand{\gridop}[1]{\mathfrak{#1}}                      % Operateur sur grille

%%%%% Sample et realisation de W

\newcommand{\sW}[1]{\va{w}^{(#1)}}
\newcommand{\rW}[1]{w^{(#1)}}

%%%%% Ponctuation dans les equations

\def\eqsepv{\; , \enspace}                                  % Virgule dans une \'{e}quation
\def\eqfinv{\; ,}                                           % Virgule en fin d'\'{e}quation
\def\eqfinp{\; .}                                           % Point en fin d'\'{e}quation
\def\eqfinpv{\; ;}                                          % Point-virgule en fin d'\'{e}quation

%%%%% Commandes provisoires

%% Lin\'{e}airement born\'{e}

\newcommand{\LB}[1]{\mathcal{L}_{\mathrm{B}}\left(#1\right)}

%%%%% Exemples de commandes compos\'{e}es

%% Sous-ensemble admissible d'un espace et projection associ\'{e}e

\newcommand{\Uad}{\partie{U}\ad}
\newcommand{\Pad}[1]{\proj{\Uad}{#1}}




