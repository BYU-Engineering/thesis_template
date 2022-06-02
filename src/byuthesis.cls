\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{byuthesis}
% Written by Tim McLain and Andrew Ning. September 2020.

% -------- set user options for byuthesis class -----------
% Options are declared by user when specifying the document class such as in the template.tex file
% For example, \documentclass[fancy,phd]{byuthesis}
%.          or \documentclass[simple,masters]{byuthesis}
% Format options: fancy or simple (simple is default)
%\newif\if@simple
%\DeclareOption{simple}{\@simpletrue}
\newif\if@fancy
\DeclareOption{fancy}{\@fancytrue}

% Degree options: masters or phd (masters is default)
%\newif\if@masters
%\DeclareOption{masters}{\@masterstrue}
\newif\if@phd
\DeclareOption{phd}{\@phdtrue}
% -------------------------------------

% -------- set main options to class -------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[letterpaper,11pt,oneside,openright]{memoir}  % based off of memoir class
\RequirePackage{memhfixc}  % fix for hyperref w/ memoir
% ----------------------------------------------

% ----------- page layout -------------
\setlrmarginsandblock{1.75in}{1.75in}{*}
\setulmarginsandblock{1in}{*}{1}
\checkandfixthelayout
% ---------------------------------------

% ----------- typesetting ---------------
\usepackage{microtype}		% this package makes micro adjustments to reduce need for hyphenation
% ---------------------------------------

% ---------- fonts ---------------
% Use T1 font encoding (8-bit) for loaded fonts
\RequirePackage[T1]{fontenc}

%%%% Serif fonts for body text
% mathpazo uses palatino for body text and **math** for a consistent look
% osf option: old style font (for numbers)
% sc option: small caps option
%\RequirePackage[osf,sc]{mathpazo}
\RequirePackage{mathpazo}

%% This font is not part of the standard LaTeX package and requires installation on your computer
%%\usepackage[urw-garamond]{mathdesign}
%%\usepackage{garamondx}

%%%% Monospace fonts for \ttfamily (such as for displaying computer code or computer commands)
\RequirePackage[scaled=0.85]{beramono}

%% This font is not part of the standard LaTeX package and requires installation on your computer
% I like this font more than beramono, however (TWM)
%\RequirePackage{inconsolata}
%
%%%% Sans serif font selection for \sffamily (for chapter and section titles)
\RequirePackage[defaultsans,scale=0.95]{opensans} %% Alternatively
% use the option 'defaultsans' instead of 'default' to replace the
% sans serif font only.
% -------------------------------

% ---------- colors -------------
\RequirePackage{xcolor}
\definecolor{navy}{HTML}{002E5D}
%\definecolor{royal}{HTML}{003DA5}	% university brand guide definition of royal
\definecolor{royal}{HTML}{005CAB}	% royal that matches BYU Engineering logo
%\definecolor{royal}{HTML}{0062B8}	% royal definition from A. Ning
\definecolor{darkgray}{HTML}{141414}
%\definecolor{mediumgray}{HTML}{7C878E}	% slate gray from university brand guide
\definecolor{mediumgray}{HTML}{666666}	% medium gray definition from A. Ning
\definecolor{black}{HTML}{111111}
\definecolor{primary}{HTML}{005CAB}
% -------------------------------

% -------- figures ------------
\RequirePackage{graphicx}
\RequirePackage{rotating}
% ------------------------------

% -------- math ----------
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
% ------------------------------

% -------- algorithms ----------
%\RequirePackage{algorithmic}
%\RequirePackage[chapter]{algorithm}

% ----------- algorithms -------
\RequirePackage[chapter]{algorithm}  % algorithms
\RequirePackage{algpseudocode}  % algorithms
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{return}}
\algrenewcommand\textproc{\texttt}  % don't all caps function name
\newcommand{\algoreturn}{\textbf{return} }
\algrenewcommand{\algorithmiccomment}[1]{\textcolor{primary}{\hfill\sffamily\scriptsize\itshape $\triangleright$ #1}}
\algnewcommand{\LineComment}[1]{\State \textcolor{primary}{\sffamily\scriptsize\itshape $\triangleright$ #1}}
\algnewcommand{\To}{\textbf{to\ }}   % For use in '\For{$i = 1$ \To $n$}' -- replaced $:\ $
\algnewcommand{\By}{\textbf{by\ }}   % For use in '\For{$i = 1$ \To $n$ \By $k$}' -- replaced $:\ $
% -----------------------------

% ------------- nomeclature -------------
\RequirePackage[intoc]{nomencl}
\makenomenclature
\renewcommand{\nomname}{Nomenclature\;}  % hack to get spacing in ToC between name and number right
%\setlength{\nomitemsep}{-\parsep}  % tight single space
\setlength{\nomitemsep}{0pt}  % relaxed spacing (nominal spacing is looser than this)
% ---------------------------------------

% ------------------------------

% -------- Sections -----------
\setsecnumdepth{subsection}  % number chapters, sections, and subsections
\maxsecnumdepth{subsection}

% set up byuchapter style
\newcommand{\hsp}{\hspace{20pt}}
\newcommand*{\colorsectitle}{}
\newcommand*{\colorsubsectitle}{}
\makechapterstyle{byuchapter}{%
	\setlength{\beforechapskip}{54pt}		% Sets vertical space from top of page to baseline of chapter title to 2.2 in.
	\setlength{\afterchapskip}{48pt}		% Sets vertical space from baseline of chapter title to baseline of following text to be 0.87 in.
	\renewcommand*{\printchaptername}{}		% We don't print the word "Chapter"
   	\renewcommand*{\chapternamenum}{}		% No space inserted after "Chapter" and before \chapnum
   	\renewcommand*{\chapnumfont}{\normalfont\LARGE\sffamily\itshape\colorchapnum}
	\renewcommand*{\chaptitlefont}{\normalfont\LARGE\sffamily\itshape\colorchaptitle}
    \renewcommand*{\afterchapternum}{}		% No vertical space after "Chapter" before \chaptertitle
%	\renewcommand*{\printchapternum}{\chapnumfont \thechapter\hsp}
	\renewcommand*{\printchapternum}{%
		\@hangfrom{\chapnumfont \thechapter\hsp}}%	% Aligns second line of chapter title with beginning 
}													% of first line rather than chapter number
\renewcommand*{\colorchapnum}{\color{royal}}
\renewcommand*{\colorchaptitle}{\color{royal}}
\renewcommand*{\colorsectitle}{\color{royal}}

\chapterstyle{byuchapter}

% appendix formatting
\newcommand{\byuappendix}{%
	% commands to format and instantiate appendix divider page (no page number)
  	\begingroup
  	\makeatletter
  	\let\ps@plain\ps@empty		% temporarily redefine appendix divider page style to empty (to get rid of page number)
	\renewcommand{\parttitlefont}{\normalfont\huge\sffamily\itshape\colorchapnum\raggedright}  % format the font
	\appendixpage	% put in the appendix divider page
  	\makeatother
  	\endgroup
  	% commands to format headings of appendices. **** I think these commands are redundant -- they are set up in byuchapter
%  	\renewcommand*{\chapnamefont}{\normalfont\LARGE\sffamily\itshape\colorchapnum}
%	\renewcommand*{\chapnumfont}{\normalfont\LARGE\sffamily\itshape\colorchapnum}
%	\renewcommand*{\printchaptername}{}		% We don't print the word "Appendix"
%	\renewcommand*{\chapternamenum}{}		% No space inserted after "Appendix" and before \chapnum
}

\RequirePackage{etoolbox}		% provides \appto command used below (append to)
\appto\appendix{\byuappendix}

% section heading formatting
\setsecheadstyle{\normalfont\large\sffamily\colorsectitle\raggedright}%
\setbeforesecskip{-18pt plus -4pt minus -1pt}
\setaftersecskip{6pt plus 1pt}

% subsection heading formatting
\setsubsecheadstyle{\normalfont\large\sffamily\colorsectitle\raggedright}%
\setbeforesubsecskip{-12pt plus -3pt minus -1pt}
\setaftersubsecskip{3pt plus 1pt}

% subsection heading formatting
\setsubsubsecheadstyle{\normalfont\sffamily\colorsectitle\raggedright}%
\setbeforesubsubsecskip{-12pt plus -2pt minus -1pt}
\setaftersubsubsecskip{1pt plus 0pt}

% Table of contents formatting (and LoF and LoT)
\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\listfigurename}{List of Figures\;\;}	% hack to get spacing in ToC between name and number right
\renewcommand{\listtablename}{List of Tables\;\;}	% hack to get spacing in ToC between name and number right

%% change title style for toc, lof, lot
% Bold face, size LARGE titles
%\renewcommand{\printtoctitle}[1]{\LARGE\bfseries #1}
%\renewcommand{\printloftitle}[1]{\LARGE\bfseries #1}
%\renewcommand{\printlottitle}[1]{\LARGE\bfseries #1}

% Color, sans serif titles
\renewcommand{\printtoctitle}[1]{\normalfont\LARGE\sffamily\colorchaptitle\itshape #1}
\renewcommand{\printloftitle}[1]{\normalfont\LARGE\sffamily\colorchaptitle\itshape #1}
\renewcommand{\printlottitle}[1]{\normalfont\LARGE\sffamily\colorchaptitle\itshape #1}

% put page number right after in toc, lof, lot
\renewcommand{\cftchapterleader}{}
\renewcommand{\cftchapterafterpnum}{\cftparfillskip}
%\renewcommand{\cftchapterafterpnum}{\hsp}
\renewcommand{\cftsectionleader}{}
\renewcommand{\cftsectionafterpnum}{\cftparfillskip}
\renewcommand{\cftfigureleader}{}
\renewcommand{\cftfigureafterpnum}{\cftparfillskip}
\renewcommand{\cfttableleader}{}
\renewcommand{\cfttableafterpnum}{\cftparfillskip}

% unbold titles in toc
\renewcommand{\cftchapterfont}{}
%\renewcommand{\cftchapterpagefont}{\color{royal}}	% make page entries on ToC, LoF, LoT royal blue in color
%\renewcommand{\cftsectionpagefont}{\color{royal}}
%\renewcommand{\cftfigurepagefont}{\color{royal}}
%\renewcommand{\cfttablepagefont}{\color{royal}}
\renewcommand{\cftchapterpagefont}{\color{black}}   % make page entries on ToC, LoF, LoT black in color
\renewcommand{\cftsectionpagefont}{\color{black}}
\renewcommand{\cftfigurepagefont}{\color{black}}
\renewcommand{\cfttablepagefont}{\color{black}}
% ----------------------------------------

%----------- figure captions -------------
\captionnamefont{\normalfont\small}
\captiontitlefont{\normalfont\small}
% ----------------------------------------

%---------------- header and footer -----------------
%\setlength{\headwidth}{\textwidth}

% create page style for opening pages of chapter that puts
% page number in the lower center of the page
\makepagestyle{byuchaptertitle}
\makeoddfoot{byuchaptertitle}{}{\normalfont\small\slshape\thepage}{}
\makeevenfoot{byuchaptertitle}{}{\normalfont\small\slshape\thepage}{}

% create headers and footers
\makepagestyle{byu}
%\aliaspagestyle{chapter}{byuchaptertitle}
\aliaspagestyle{plain}{byuchaptertitle}
\makerunningwidth{byu}[\textwidth]{\textwidth}
\makeheadposition{byu}{flushright}{flushleft}{flushright}{flushleft}
\preto\tableofcontents{\pagestyle{byuchaptertitle}}	% sets page numbering format in frontmatter


\makepsmarks{byu}{%
\nouppercaseheads
%\createmark{chapter}{both}{nonumber}{}{}
\createmark{chapter}{left}{nonumber}{}{}
\createmark{section}{right}{shownumber}{}{. \space}
\createplainmark{toc}{both}{\contentsname}
\createplainmark{lof}{both}{\listfigurename}
\createplainmark{lot}{both}{\listtablename}
\createplainmark{bib}{both}{\bibname}
\createplainmark{index}{both}{\indexname}
\createplainmark{glossary}{both}{\glossaryname}}

%% One-sided printing
% Place page number in top right corner of all pages except chapter title pages
% Place chapter title in top left corner of all pages except chapter title pages
\makeoddhead{byu}%
	{\normalfont\small\slshape\leftmark}{}{\normalfont\small\slshape\thepage}	% include chapter title
%    {}{}{\normalfont\small\slshape\thepage}	% don't include chapter title
\makeoddfoot{byu}%
    {}{}{}

%%% One-sided printing
%% Place page number in bottom right corner of all pages
%% Place section title in top right corner of all pages except
%% chapter title pages
%\makeoddhead{byu}%
%	{\normalfont\small\slshape\leftmark}{}{\normalfont\small\slshape\rightmark}	% include chapter title
%%    {}{}{\normalfont\small\slshape\rightmark}	% don't include chapter title
%\makeoddfoot{byu}%
%    {}{}{\normalfont\small\slshape\thepage}

%% Two-sided printing for simple format only
%\makeoddhead{byu}%
%    {}{}{\normalfont\small\slshape\leftmark}
%\makeevenhead{byu}%
%    {\normalfont\small\slshape\rightmark}{}{}
%\makeoddfoot{byu}%
%    {}{}{\normalfont\small\slshape\thepage}
%\makeevenfoot{byu}%
%    {\normalfont\small\slshape\thepage}{}{}

\pagestyle{byu}
\appto\mainmatter{\pagestyle{byu}}
% -----------------------------------------------


% -------------- hyperlinks -------------
%\RequirePackage[colorlinks,bookmarks,bookmarksnumbered,allcolors=royal,breaklinks]{hyperref}  % make hyperlinks royal
\RequirePackage[colorlinks,bookmarks,bookmarksnumbered,allcolors=black,breaklinks]{hyperref}	   % make hyperlinks black
% ---------------------------------------

% ---------- cross referencing ------------
\RequirePackage[capitalise]{cleveref}
% ---------------------------------------

% ----------- bibliography --------------
\if@fancy
	% do nothing for fancy style here, see fancy style options below
\else
	\usepackage[backend=biber,style=ieee]{biblatex}
\fi
% ---------------------------------------

% ----------- user input --------------
\def\@customtitle{\relax}
\newcommand{\customtitle}[1]{\gdef\@customtitle{#1}}

\def\@bauthor{\relax}
\newcommand{\bauthor}[1]{\gdef\@bauthor{#1}}

\def\@department{\relax}
\newcommand{\department}[1]{\gdef\@department{#1}}

\def\@institution{\relax}
\def\@shortinstitution{\relax}
\newcommand{\institution}[2][]{\gdef\@shortinstitution{\ifstrempty{#1}{#2}{#1}} \gdef\@institution{#2}}

\institution{Brigham Young University}

\def\@degree{\relax}
\newcommand{\degree}[1]{\gdef\@degree{#1}}

\if@phd
	\degree{Doctor of Philosophy}
\else
	\degree{Masters of Science}
\fi

\newcommand*{\@committeelist}{}
\newcommand*{\committeemember}[1]{\listadd{\@committeelist}{#1}}
\newcommand*{\committeechair}[1]{\committeemember{#1, Chair}}

\def\@copyrightyear{\number\the\year}
\newcommand{\copyrightyear}[1]{\gdef\@copyrightyear{#1}}

\def\@keywords{\relax}
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}
% ---------------------------------------

% ----------- title page --------------
\RequirePackage{etoolbox}
\newcommand*{\@printcommitteemember}[1]{#1\\}
\newlength{\titlebottomadjust}  \setlength{\titlebottomadjust}{18pt}	% defined to tweak the length of the title page so that
																		% last line of text is at 1 inch above page bottom
\newcommand{\titlepage}{%
	% for fancy style, set the page margins to be equal to center title on page
	\if@fancy
		\setlrmarginsandblock{1.75in}{1.75in}{*}
		\checkandfixthelayout
	\fi
	\pdfbookmark{TITLE PAGE}{titlepage}
	\pagestyle{empty}
	\begin{Spacing}{2.0}
		\begin{center}
			\@title \\
			\vspace{\fill}
			\@author \\
			\vspace{\fill}
			\begin{SingleSpace}
				A \if@phd dissertation \else thesis \fi submitted to the faculty of \\
				\@institution \\
				in partial fulfillment of the requirements for the degree of \\
			\end{SingleSpace}
			\@degree \\
			\vspace{\fill}
			\begin{SingleSpace}
				\forlistloop{\@printcommitteemember}{\@committeelist}
			\end{SingleSpace}
			\vspace{\fill}
			\@department \\
			\@institution \\
			\vspace{\fill}
			Copyright \textcopyright{} \@copyrightyear{} \@author \\
			All Rights Reserved
			\par
			\enlargethispage{\titlebottomadjust}
			\clearpage
		\end{center}
	\end{Spacing}
	% for fancy style, reset the page layout back for margin notes
	\if@fancy
		\setlrmarginsandblock{1.0in}{2.75in}{*}
		\checkandfixthelayout
		\setmarginnotes{0.125in}{2.0in}{\onelineskip}
	\fi
}
% ----------------------------------------

% -------- custom title page -------------
% This title page follows immediately after the title page required by BYU Grad Studies.
% This title page can be customized as the student desires, but should include the title,
% student name, department, degree, and the BYU Engineering logo.
%

\newcommand{\customtitlepage}{%
	\pagestyle{empty}
	\begin{Spacing}{2.2}
		\vspace*{116pt}
		\noindent
		{\color{royal}\Huge\sffamily\itshape\@customtitle} \\
		\vspace{\fill}
	\end{Spacing}
	\begin{Spacing}{1.4}
		{\Large
		\noindent
		\@author \\
		\@department \\
		\@degree} \\
		\vspace{\fill}
		\begin{figure}[htbp]
			\includegraphics[width=3.5in]{figures/college_logo}
		\end{figure}
	\end{Spacing}
}
% ----------------------------------------

% ------------ abstract ------------------
\renewenvironment{abstract}{%
	\clearpage
	\pdfbookmark[0]{ABSTRACT}{abstract}
	\setlength{\parskip}{\baselineskip}
	\vspace*{35pt}	% spacing set to match chapter header spacing
	\begin{flushleft}
		% {\normalfont\LARGE\bfseries Abstract}    						 % black serif boldface
		{\normalfont\LARGE\sffamily\colorchaptitle\itshape{Abstract}}    % royal sans serif italics
		\par
	\end{flushleft}
	%% The following items should be omitted if the optional custom title page is used
	% \@title \\[\baselineskip]
	% \@author \\
	% \@department, \@shortinstitution \\
	% \@degree
	\vspace*{24pt}  % spacing set to match chapter header spacing
}{%
	\par
	\vspace{\fill}
	\noindent
	Keywords: \@keywords
}
% ----------------------------------------

% ---------- acknowledgments ------------
\newenvironment{acknowledgments}{%
	\clearpage
	\pdfbookmark[0]{ACKNOWLEDGMENTS}{acknowledgments}
	\setlength{\parskip}{\baselineskip}
	\vspace*{35pt}	% spacing set to match chapter header spacing
	\begin{flushleft}
		% {\normalfont\LARGE\bfseries Acknowledgments}    						% black serif boldface
		{\normalfont\LARGE\sffamily\colorchaptitle\itshape{Acknowledgments}}    	% royal sans serif italics
	\end{flushleft}
	\vspace*{24pt}  % spacing set to match chapter header spacing
}
% ----------------------------------------



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- ADD FANCY OPTIONS --- %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@fancy

% ----------- page layout -------------
% change the page layout to allow margin notes
\setlrmarginsandblock{1.0in}{2.75in}{*}
\setulmarginsandblock{1in}{*}{1}
\checkandfixthelayout
% ---------------------------------------

% ------------- marginnotes -------------
% for notes in the margin, define separation from the textblock, max note width and min vertical distance between notes
\setmarginnotes{0.125in}{2.0in}{\onelineskip}
% ---------------------------------------

% -------------- chapter ----------------
% Revise the chapter style to create a fancier heading
\newcommand{\mhsp}{\hspace{10pt}}
\makechapterstyle{byuchapter}{%
	\setlength{\beforechapskip}{54pt}
	\setlength{\afterchapskip}{48pt}
	\renewcommand*{\chapnamefont}{\normalfont\LARGE\itshape}
	\renewcommand*{\chapnumfont}{\normalfont\LARGE\sffamily\itshape\colorchapnum}
	\renewcommand*{\chaptitlefont}{\normalfont\LARGE\sffamily\itshape\colorchaptitle}
	\renewcommand*{\afterchapternum}{}
	\renewcommand*{\printchaptername}{}
	\setlength{\midchapskip}{15mm}
	\renewcommand*{\chapternamenum}{}
	\renewcommand*{\printchapternum}{%
		\sidebar{\raisebox{-76pt}[0pt][0pt]{\makebox[0pt][l]{%
					\resizebox{!}{\midchapskip}{\mhsp\chapnumfont\thechapter}}}}}
	\renewcommand*{\printchaptertitle}[1]{\chaptitlefont ##1}
	\renewcommand*{\afterchaptertitle}%
	{\vskip\afterchapskip}
}
\chapterstyle{byuchapter}
% ---------------------------------------

% ------------- footnotes ----------------
\RequirePackage{marginfix}							% This package fixes the issue of margin notes overflowing the page: it makes them break into the next page instead

% we place footnotes in the side margin and typeset them using the parameters associated with \footnotes
% \sidefootnotes are treated separately
%\renewcommand{\@makefntext}[1]{\makefootmark\raggedright #1}. % allow footnotes to be ragged right
%\renewcommand*{\thefootnote}{\fnsymbol{footnote}}	% use symbols to denote footnotes
\newcommand{\shsp}{\hspace{4pt}}
\footmarkstyle{\color{royal}#1\shsp}
\renewcommand{\foottextfont}{\scriptsize\color{mediumgray}}			% slightly smaller fontsize since we are placing footnotes in margin
\setlength{\footmarkwidth}{0em} 					% space allocated for the width of the mark
\setlength{\footmarksep}{0em}						% space between the mark and the following text
\setlength{\footparindent}{1em}						% paragraph indent for a multi-paragraph footnote
\counterwithout{footnote}{chapter}					% do not restart footnote numbering with each chapter'
\footnotesinmargin									% put footnotes in the side margin
% ---------------------------------------

% ------------- sidenotes ---------------
% create a new footnote series for sidenotes
\newcounter{snote}[chapter]
\newcommand\sidenote[1]{\stepcounter{snote}\textsuperscript{%
		\fnsymbol{snote}}\marginpar{\scriptsize\textsuperscript{%
			\scriptsize\fnsymbol{snote}}#1}}
% ---------------------------------------

% -------- figures ------------
\RequirePackage{graphicx}
\sidecapmargin{right} %this puts the sidecaptions in the right margin
\setsidecappos{b} %this aligns the side caption with the bottom of the figure
\setsidecaps{0.125in}{2.0in} %this controls the spacing from the edge of the text, and then the width of the box the caption sits in.
%this makes the name of the caption (e.g. Figure 1) bold, small, and blue (the number and word are controlled with separate commands)
%
\captionnamefont{\bfseries\footnotesize\color{royal}}
\captiontitlefont{\footnotesize}
% ------------------------------

% ----------- bibliography --------------
% setup biblatex, specify citation and bibliography styles
\usepackage[citestyle=verbose-ibid,maxcitenames=1,mincitenames=1,giveninits=true,backend=biber,bibstyle=ieee,sorting=none]{biblatex}
\DeclareFieldFormat{labelnumberwidth}{\color{primary}#1}%
\setlength{\biblabelsep}{8pt}%
\renewbibmacro{in:}{}
% for citations in side margin, only print author, title, and year
% do not include the following items
\AtEveryCitekey{%
  \clearlist{publisher}%
  \clearfield{edition}%
  \clearfield{type}%
  \clearfield{pages}%
  \clearlist{location}%
  \clearlist{institution}%
  \clearfield{volume}%
  \clearfield{number}%
  \clearfield{journaltitle}%
  \clearfield{booktitle}%
}
% ---------------------------------------

% ---------- for testing ---------------
\newcommand{\myshorttext}{{\color{mediumgray} Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam lobortis facilisis sem. Nullam nec mi et neque pharetra sollicitudin. Praesent imperdiet mi nec ante. Donec ullamcorper, felis non sodales commodo, lectus velit ultrices augue, a dignissim nibh lectus placerat pede. Vivamus nunc nunc, molestie ut, ultricies vel, semper in, velit.}}
% -------------------------------------

\fi

