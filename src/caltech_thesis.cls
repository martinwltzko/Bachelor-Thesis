\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{caltech_thesis}[2021/05/05 v0.4 Caltech thesis class]

% Load memoir
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\LoadClass[oneside,12pt]{memoir}
\RequirePackage{etoolbox}
\RequirePackage{graphicx}

% Overleaf 28 Jan: Page geometry
\RequirePackage[letterpaper,
    top=1in,
    bottom=1in,
    left=1.25in,
    right=1.0in,
    headsep=\dimexpr 0.25in-1em,
    marginparwidth=1.25in
]{geometry}

% Page style
\RequirePackage{fancyhdr}
% Modern font
%\usepackage[sfdefault,light]{FiraSans}
\usepackage{helvet}
% Alternative modern fonts:
% \RequirePackage{tgpagella} % TeX Gyre Pagella (serif, softer look)
% \RequirePackage{tgheros}   % TeX Gyre Heros (sans-serif)
\renewcommand{\rmdefault}{qpl} % Optional: sans-serif for main text

\Spacing{1.1}

\makeatletter
\makechapterstyle{hangnumclean}{%
    % Basis: hangnum, aber ohne Nummer im Rand
    \chapterstyle{hangnum}%
    \setlength{\beforechapskip}{0pt}%
    \setlength{\midchapskip}{0pt}%
    \setlength{\afterchapskip}{0pt}%
    \renewcommand{\printchaptername}{}%
    \renewcommand{\chapternamenum}{}%
    \renewcommand{\printchapternum}{}% Nummer vollständig unterdrücken
    \renewcommand{\afterchapternum}{}% keinen Extraabstand nach (nicht vorhandener) Nummer
    % Behalte deine Titelgestaltung:
    \renewcommand{\printchaptertitle}[1]{\chaptitlefont\MakeUppercase{##1}}%
  }
\chapterstyle{hangnumclean}
\makeatother


% Safe chapter title storage
\newcommand{\thechaptertitle}{}
\renewcommand{\chaptermark}[1]{%
  \markboth{#1}{}%
  \gdef\thechaptertitle{#1}%
}

\fancypagestyle{fancy}{
    \fancyhf{}
    \fancyhead[L]{%
      \ifnum\value{chapter}>0
        Chapter \thechapter: \thechaptertitle
      \fi
    }
    \fancyhead[R]{\thepage}
    \renewcommand{\headrulewidth}{0.4pt}
}
\pagestyle{fancy}


%% Overleaf 24 Jan: Formatting of ToC and lists
\setcounter{tocdepth}{2}
\let\listoffigurestables\listoffigures
\appto{\tableofcontents}{\clearpage}
\appto{\listoffigurestables}{\clearpage}
\appto{\listoffigures}{\clearpage}
\appto{\listoftables}{\clearpage}
\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\listfigurename}{List of Illustrations}
\renewcommand{\listtablename}{List of Tables}

% \renewcommand{\listfigurename}{List of Illustrations and/or Tables}

\addtocontents{toc}{\protect\vskip 35pt}
\addtocontents{toc}{\protect\SingleSpacing}
\addtocontents{lof}{\protect\vskip 35pt}
%% In case single spacing is desired later
% \addtocontents{lof}{\protect\SingleSpacing}
% \addtocontents{lot}{\protect\SingleSpacing}
\addtocontents{lof}{{\protect\itshape Number}\protect\hfill{\protect\itshape Page}\protect\par}
\addtocontents{lot}{{\protect\itshape Number}\protect\hfill{\protect\itshape Page}\protect\par}

\setlength{\cftbeforechapterskip}{0pt}

%% For formatting chapter numbers as Roman but
%% not touch appendix alphabets
\RequirePackage{xstring}
\newcommand*{\IsInteger}[3]{%
    \IfStrEq{#1}{ }{#3}{%
        \IfInteger{#1}{#2}{#3}%
    }%
}%
\newcommand{\formatchapternumber}[1]{%
  \IsInteger{#1}{\uppercase\expandafter{\romannumeral #1\relax}}{#1}%
}
\renewcommand{\chapternumberline}[1]{\formatchapternumber{#1}:\space}
\patchcmd{\cftchapterleader}{\bfseries}{\normalfont}{}{}

% font
\renewcommand{\cftchapterfont}{\normalsize\bfseries}
\renewcommand{\cftchapterpagefont}{\normalsize\bfseries}
\renewcommand{\cftsectionfont}{\small}
\renewcommand{\cftsubsectionfont}{\small\itshape}

\renewcommand{\cftchapterpagefont}{\normalfont}
\renewcommand{\cftchapterdotsep}{\cftdotsep}
\setlength{\cftsectionnumwidth}{2em}

\setlength{\cftbeforechapterskip}{8pt}
\setlength{\cftbeforesectionskip}{2pt}


% Merged list of figures and tables -- not needed
% \def\table{\def\figurename{Table}\figure}
% \let\endtable\endfigure

\setlength{\cftbeforefigureskip}{0pt}
\renewcommand{\cftfiguredotsep}{\cftdotsep}
\settowidth\cftfigurenumwidth{\itshape Number}
\renewcommand\cftfigurepresnum{\hfill}
\renewcommand\cftfigureaftersnum{\hskip1em}

\setlength{\cftbeforetableskip}{0pt}
\renewcommand{\cfttabledotsep}{\cftdotsep}
\settowidth\cfttablenumwidth{\itshape Number}
\renewcommand\cfttablepresnum{\hfill}
\renewcommand\cfttableaftersnum{\hskip1em}

\apptocmd{\appendix}{%
  \addtocontents{toc}{%
    \protect\renewcommand{\protect\chaptername}{Appendix}
  }%
}{}{}

% Overleaf, 22 January 2016: \subsection and onwards shouldn't be numbered
\setcounter{secnumdepth}{3}
\RequirePackage{letterspace} % not so heavy...
\RequirePackage{setspace}

% Chapter headings
\renewcommand{\insertchapterspace}{}
\setlength{\midchapskip}{\onelineskip}
\setlength{\afterchapskip}{1.5\onelineskip}
\renewcommand{\chapternamenum}{\space\space}
\renewcommand{\chapterheadstart}{\clearforchapter}
\renewcommand{\chapnamefont}{\SingleSpacing\centering\normalfont\normalsize\itshape\textls[250]}
\renewcommand{\chapnumfont}{\normalfont\normalsize\itshape}
\renewcommand{\chaptitlefont}{\SingleSpacing\centering\normalfont\large}
\renewcommand{\printchaptertitle}[1]{\chaptitlefont\MakeUppercase{#1}}



% Add a command to create an extra chapter with TOC entry.
\makeatletter
\newcommand{\extrachapter}[2][\@empty]{%
  \chapter*{#1}%
  \addcontentsline{toc}{chapter}{\ifx#1\@empty{#2}\else{#1}\fi}}
\makeatother

% Section headings
\setsecheadstyle{\normalfont\bfseries}
\setbeforesecskip{\onelineskip}
\setaftersecskip{\baselineskip}
\setsubsecheadstyle{\normalfont\bfseries}
\setbeforesubsecskip{\onelineskip}
\setaftersubsecskip{1pt}


%
% Define spacing for use on titlepage
%
\def\titleskip{\vskip 4\bigskipamount}      %% Whitespace after title
\def\authorskip{\vskip 2\bigskipamount}     %% Whitespace after author
\def\miniskip{\vskip 1\bigskipamount}     %% Whitespace after something

%
% Additional titlepage definitions
%
\makeatletter
\newcommand{\faculty}{\gdef\@faculty}
\faculty{Default Faculty}     

\newcommand{\group}{\gdef\@group}
\faculty{Default Group}    

\newcommand{\university}{\gdef\@university}
\university{RWTH Aachen University}     % Default is Caltech

\newcommand{\unilogo}{\gdef\@unilogo}
\unilogo{null}                                  % Caltech logo

\newcommand{\copymonth}{\gdef\@copymonth}
\newcommand{\copyyear}{\gdef\@copyyear}
% \newcommand{\defenddate}{\gdef\@defenddate}
% Overleaf: Updated 21 January 2016; don't put in a default year value
\copyyear{!!!!}
% \defenddate{!!!!}

% -------------------------------------------------
%  Supervisor / second-examiner fields
% -------------------------------------------------
\newcommand{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand{\secondexaminer}[1]{\gdef\@secondexaminer{#1}}

% leave them empty by default, so the extra lines
% disappear automatically if the user does not set them
\supervisor{}
\secondexaminer{}
% -------------------------------------------------

\renewcommand{\maketitle}[1][]{%
  \begin{titlingpage}
   % Remove old spacing
    %\OnehalfSpacing
    % Add tighter spacing

   \let\footnotesize\small \let\footnoterule\relax \setcounter{page}{1}
   \vskip-\headsep
   \begin{center}
     
     {\SingleSpacing\Large\@title\par}
     \titleskip
     B A C H E L O R  \ T H E S I S
     \miniskip
     {\large \@author}\par
     \@copymonth \ \@copyyear {\vfill}
     \authorskip
     {\footnotesize prepared at the} \par
     {\scshape \large \@group} \miniskip
     {\footnotesize submitted to the} \par
     {\scshape \large \@faculty} \par
     of the \MakeUppercase{\@university} \par
     \authorskip
     
     % ---------- Supervisor / second examiner (NEW) ----------
    \ifx\@supervisor\@empty\else
      \vspace{2\bigskipamount}
      {\footnotesize written under the supervision of \par
      \normalsize \@supervisor\par}
    \fi
    
    \ifx\@secondexaminer\@empty\else
      \vspace{\bigskipamount}
      {\footnotesize Second Examiner:\par
      \normalsize \@secondexaminer\par}
    \fi
    % ---------------------------------------------------------
   \end{center}
   \vspace*{.5in}
 \pagenumbering{roman}
 \end{titlingpage}
 \setcounter{page}{2}
}              
%% End of \maketitle



% The abstract and acknowledgments are treated as unnumbered chapters
% with Table of Contents entries.
\renewenvironment{abstract}
  {\chapter*{Abstract}}
  {\clearpage}
\newenvironment{acknowledgments}
  {\chapter*{Acknowledgments}}
  {\clearpage}
% although `acknowledgments' is preferred
\newenvironment{acknowledgements}
  {\chapter*{Acknowledgements}}
  {\clearpage}

% Overleaf: 22 January 2016 -- non-zero paragraph skip
\nonzeroparskip
\setlength{\parindent}{0pt}



\nobibintoc



%%% 1 Mar 2017: Need to accommodate bibtex AND biblatex
\AtBeginDocument{%
  % Define chapter style after document begins
  
  \@ifpackageloaded{biblatex}   
  {%\usepackage[backend=biber,natbib,style=authoryear]{biblatex}
  \DeclareFieldFormat{addendum}{}
  \AtBeginBibliography{\SingleSpacing}
  \setlength{\bibitemsep}{\parskip}
  \defbibheading{publishedcontent}{\extrachapter{Published Content and Contributions}}
  \defbibnote{pcinstructions}{[Include a bibliography of published articles or other material that are included as part of the thesis.  Describe your role with the each article and its contents.  Citations must include DOIs or publisher URLs if available electronically.

If you are incorporating any third-party material in the thesis, including works that you have authored/co-authored but for which you have transferred copyright, you must indicate that permission has been secured to use the material. For example: ``Fig.~2 reprinted with permission from the copyright holder, {holder name}''

Add the option \texttt{iknowwhattodo} to this environment to dismiss this message.]}

  \newenvironment{publishedcontent}[1][]{
    \newtoggle{printinstr}
    \ifstrequal{#1}{iknowwhattodo}
         {\togglefalse{printinstr}}
         {\toggletrue{printinstr}}
    \DeclareFieldFormat{addendum}{\\##1}
    \begin{refsection}
    %% Nov 18, 2016: list in reverse chronological order
    \begin{refcontext}[sorting=ydnt]{}
  }{
     \iftoggle{printinstr}{
\printbibliography[heading=publishedcontent,prenote=pcinstructions]
     }{
\printbibliography[heading=publishedcontent]
     }
     \end{refcontext}
     \end{refsection}
     \citereset
  }

  \newcommand{\publishedas}[1]{
    \begin{refsection}
    \nocite{#1}
    \printbibliography[heading=none]
    \end{refsection}
    \citereset
  }
}{%%%%% so if not using biblatex
  \@ifpackageloaded{natbib}{}{\PackageError{caltech-thesis}{Using bibtex without natbib! PLEASE load natbib, or even better, use biblatex (and the relevant template for that!}{}}
  \apptocmd{\thebibliography}{\phantomsection\addcontentsline{toc}{chapter}{\bibname}}{}{}
  
  \@ifpackageloaded{bibunits}{
    \newenvironment{publishedcontent}[1][]{%
      \ifstrequal{#1}{iknowwhattodo}{}
        {\renewcommand{\bibpreamble}{
          Include a bibliography of published articles or other material that are included as part of the thesis.  Describe your role with the each article and its contents.  Citations must include DOIs or publisher URLs if available electronically.\par
If you are incorporating any third-party material in the thesis, including works that you have authored/co-authored but for which you have transferred copyright, you must indicate that permission has been secured to use the material. For example: ``Fig.~2 reprinted with permission from the copyright holder, {holder name}''\par
Add the option \texttt{iknowwhattodo} to this environment to dismiss this message.\par}}

      \renewcommand{\bibsection}{}%
      \ifdef{\stdthebibliography}{%
        \patchcmd{\stdthebibliography}{\addcontentsline{toc}{chapter}{\bibname}}{}{}{}%
      }{
        \patchcmd{\thebibliography}{\addcontentsline{toc}{chapter}{\bibname}}{}{}{}%
      }%
      \begin{bibunit}
    }{\end{bibunit}}}
  { %% no bibunit; raise warning
    \PackageWarning{caltech_thesis}{Sorry, publishedcontent is only available with biblatex! Please format the list manually instead.}
    \textbf{Sorry, publishedcontent is only available  with biblatex! Please format the list manually instead.}\par
  }
  
  
  \@ifpackageloaded{bibunits}{
     \newcommand{\publishedas}[2]{%
        \begin{bibunit}%
        \renewcommand{\bibsection}{}%
        \renewcommand{\bibnumfmt}[1]{}%
        \ifdef{\stdthebibliography}{%
          \patchcmd{\stdthebibliography}{\addcontentsline{toc}{chapter}{\bibname}}{}{}{}%
        }{
          \patchcmd{\thebibliography}{\addcontentsline{toc}{chapter}{\bibname}}{}{}{}%
        }
        \nocite{#2}\putbib[#1]
        \end{bibunit}%
     }
  }{%
    \newcommand{\publishedas}[1]{%
      \PackageWarning{caltech_thesis}{Sorry, \textbackslash publishedas is only available with biblatex or bibtex+bibunits! Please format the "published as" statement manually instead.}
      \textbf{Sorry, \textbackslash publishedas is only available  with biblatex or bibtex+bibunits! Please format the ``published as'' statement manually instead.}\par}
  }

  \setlength{\bibitemsep}{\parskip}
  \renewcommand{\bibfont}{\SingleSpacing}
  
  }% END if not using biblatex

} %% END AtBeginDocument

% Overleaf: 25 January 2016 -- for nomenclature
\RequirePackage[intoc]{nomencl}
\makenomenclature
\renewcommand{\nompreamble}{\SingleSpacing\itemindent 0pt}
\renewcommand{\nomlabel}[1]{\bfseries #1.}
\renewcommand{\nomentryend}{.}

% Overleaf: 25 January 2016 -- for index
\RequirePackage{imakeidx}
\makeindex[columns=1,options=-s simple_letters]

% Overleaf: 25 January 2016 -- for endnotes
\RequirePackage{endnotes}
\renewcommand{\notesname}{}
\pretocmd{\theendnotes}{\clearpage}{}{}

% Overleaf: 28 January 2016 -- no more pagenumbers in the TOC
\newcommand{\pocketmaterial}{\addtocontents{toc}{\cftpagenumbersoff{chapter}}}

\makeatother
\endinput