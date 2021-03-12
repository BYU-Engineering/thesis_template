\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{byuthesisfancy}
% Written by Tim McLain and Andrew Ning. September 2020.

% TO DO:
%	- figure out why algorithm \toprule and \bottomrule have gone royal in color
%	- center BYU-required title page
%		

% -------- set main options to class -------------
\LoadClass{byuthesis}

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

\usepackage[citestyle=verbose-ibid,maxcitenames=1,giveninits=true,bibstyle=numeric,sorting=none]{biblatex}
\DeclareFieldFormat{labelnumberwidth}{\color{primary}#1}%
\setlength{\biblabelsep}{8pt}%
\renewbibmacro{in:}{}

\bibliography{references}

% ---------- for testing ---------------
\newcommand{\myshorttext}{{\color{mediumgray} Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam lobortis facilisis sem. Nullam nec mi et neque pharetra sollicitudin. Praesent imperdiet mi nec ante. Donec ullamcorper, felis non sodales commodo, lectus velit ultrices augue, a dignissim nibh lectus placerat pede. Vivamus nunc nunc, molestie ut, ultricies vel, semper in, velit.}}
% -------------------------------------

