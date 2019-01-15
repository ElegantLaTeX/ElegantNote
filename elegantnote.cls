%% start of file `elegantnote.cls'.
%% Copyright 2013-2019 ddswhu (ddswhu@gmail.com).
%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantnote}[2013/07/18 v1.00 elegant note document class]

\RequirePackage{color,xcolor}

\newcommand*{\base}[1]{
 \def\@base{\includegraphics[scale=0.3]{#1}
 }
}

\DeclareOption{green}{
   \definecolor{main}{RGB}{210,168,75}
   \definecolor{seco}{RGB}{9,80,3}
   \definecolor{thid}{RGB}{0,175,152}
	\base{greenbase.pdf}
}

\DeclareOption{cyan}{
   \definecolor{main}{RGB}{239,126,30}
   \definecolor{seco}{RGB}{0,175,152}
   \definecolor{thid}{RGB}{236,74,53}
   \base{cyanbase.pdf}
}

\DeclareOption{blue}{
   \definecolor{main}{RGB}{127,191,51}
   \definecolor{seco}{RGB}{0,145,215}
   \definecolor{thid}{RGB}{180,27,131}
   \base{bluebase}
}

\DeclareOption{times}{
 \AtBeginDocument{
	\RequirePackage{times}
	}
}

\DeclareOption{mtpro}{
 \AtBeginDocument{
    \RequirePackage{mtpro2}
    }
}


%%载入基础类
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{book}
}

\ExecuteOptions{green}

\ProcessOptions\relax

\LoadClass[12pt,a4paper,openany]{book}


\newtoks\zhtitle
\newtoks\entitle
\newtoks\email
\newtoks\version

%%数学字体宏包

%% 常用宏包
\RequirePackage{graphicx}
\RequirePackage{enumerate}
\RequirePackage{amsmath,mathrsfs,amsfonts}
\RequirePackage{booktabs}
\linespread{1.3}

\graphicspath{{./figure/}{./figures/}{./image/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\newcommand*{\myquote}[1]{\def\@myquote{#1}}

\newcommand*{\logo}[1]{
 \def\@logo{\includegraphics[height=5.8cm]{#1}
 }
}

%\newcommand*{\base}[1]{
% \def\@base{\includegraphics[scale=0.3]{#1}
% }
%}

%
%\newsavebox{\mylogo}
%\sbox{\mylogo}{%
%\centering
%\includegraphics[scale=0.3]{base.pdf}}

\newcommand*{\cover}[1]{\def\@cover{
  \ThisTileWallPaper{\paperwidth}{\paperheight}{#1}
 }
}


%% 页面设置
\RequirePackage{hyperref}

\hypersetup{
 breaklinks,
 baseurl            =http://,
 unicode,                
 bookmarksnumbered  =true,
 bookmarksopen      =true, 
 pdfauthor          =\@author, 
 pdftitle           =\@title note,
 pdfsubject         =\@author \@title note,
 pdfkeywords        ={notes},
 pdfcreator         ={XeLaTeX with elegantnote class},
 colorlinks,
 linkcolor          =seco,
 plainpages         =false,
 pdfstartview       =FitH,
 pdfborder={0 0 0},
 linktocpage
 }
 
\RequirePackage{geometry}
\geometry{
    a4paper,
   left=27mm,  %% or inner=23mm
   right=27mm, %% or outer=18mm
   top=25.4mm, bottom=25.4mm,
   headheight=2.17cm,
   headsep=4mm,
   footskip=12mm
}

%%%  base 
%\newsavebox{\mylogo}
%\sbox{\mylogo}{%
%\centering
%\includegraphics[scale=0.3]{base.pdf}} %需要修改尺寸和文件名

\RequirePackage{wallpaper}

%%   章节设置
\RequirePackage[center,pagestyles]{titlesec}
\renewcommand{\chaptername}{第 \thechapter 章}

\titleformat{\chapter}[display]{\normalfont}
{\bfseries\filcenter\LARGE\enspace \color{seco}\chaptername\enspace}{1pt}{\color{seco}\LARGE\bfseries\filcenter}[\@base]

\titleformat{\section}[hang]{\sffamily}
{\hspace{-2.45em}\Large\bfseries{\color{seco}\thesection}\enspace}{1pt}{\color{seco}\Large\bfseries\filright}

\titleformat{\subsection}[hang]{\sffamily}
{\large\bfseries\color{seco}\thesubsection\enspace}{1pt}{\color{seco}\large\bfseries\filright}

\titlespacing{\chapter}{0pt}{0pt}{1.5\baselineskip}
%\titlespacing{\subsection}{0pt}{0.5\baselineskip}{-\baselineskip}


%%中文结构名字
\renewcommand{\contentsname}{\bfseries 目\hspace{2em}录}
\renewcommand{\figurename}{\textbf{图}}
\renewcommand{\tablename}{\text{表}}
\renewcommand{\partname}{部分}
\renewcommand{\listfigurename}{\bfseries 插图目录}
\renewcommand{\listtablename}{\bfseries 表格目录}
\renewcommand{\bibname}{\bfseries 参考文献}
\renewcommand{\appendixname}{\bfseries 附\hspace{2em}录}
\renewcommand{\indexname}{\bfseries 索\hspace{2em}引}



%%字体设置
%\RequirePackage{lmodern,fix-cm,type1cm}
\RequirePackage{fontenc}
\RequirePackage[no-math,cm-default]{fontspec}
\defaultfontfeatures{Mapping=tex-text} 
\RequirePackage{xunicode}
\RequirePackage{xltxtra} 
\setmainfont[Ligatures=TeX]{Minion Pro} %  (\textrm)
\setsansfont{Myriad Pro} %  (\textsf)
\setmonofont{Adobe Garamond Pro}%Palatino Linotype
%-中文字体设置-%
\RequirePackage{xeCJK}
\setCJKmainfont[BoldFont={黑体},ItalicFont={楷体}]{华文中宋}%方正书宋_GBK Adobe Song Std L
\setCJKsansfont[BoldFont={黑体}]{方正中等线简体}
\setCJKmonofont{方正启体简体}
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt

\setCJKfamilyfont{new}{方正苏新诗柳楷简体}

%% 定理\引理\定义样式设置
\RequirePackage{environ}
\RequirePackage{tikz}
\usetikzlibrary{shapes,decorations}

%define the main and seco color in document
%\definecolor{main}{RGB}{210,168,75}
%\definecolor{seco}{RGB}{9,80,3}
%\definecolor{thid}{RGB}{0,175,152}


%\definecolor{main}{RGB}{239,126,30}
%\definecolor{seco}{RGB}{0,175,152}
%\definecolor{thid}{RGB}{236,74,53}

%\definecolor{main}{RGB}{127,191,51}
%\definecolor{seco}{RGB}{0,145,215}
%\definecolor{thid}{RGB}{180,27,131}





\definecolor{bule}{RGB}{18,29,57}
\definecolor{bablue}{RGB}{248,248,248}

%define the style of tikz newthemsty

\tikzstyle{newthemsty} 
          =[draw=seco, fill=blue!10,very thick,rectangle,
           rounded corners, inner sep=10pt, inner ysep=20pt]
\tikzstyle{newthemstytitle}
          =[fill=seco, text=blue!10]

\tikzstyle{newdefinitionsty} 
          =[draw=main, fill=yellow!20,very thick,rectangle,
           rounded corners, inner sep=10pt, inner ysep=20pt,
           text=black,fill opacity=0.9]
\tikzstyle{newdefinitionstytitle} 
         =[fill=main, text=white]
         
\tikzstyle{newpropositionsty} 
          =[draw=thid, fill=bablue,very thick,rectangle,
           rounded corners, inner sep=10pt, inner ysep=20pt,
           text=black,fill opacity=0.9]
\tikzstyle{newpropositionstytitle} 
         =[fill=thid, text=white]

%%define the "newthem" environment
\newcounter{Newthem}[chapter]
\renewcommand{\theNewthem}{\thechapter.\arabic{Newthem}}
\NewEnviron{newthem}[1][{}]{%
\noindent\centering
\begin{tikzpicture}
\node[newthemsty] (box){
     \begin{minipage}{0.93\columnwidth}
        \sffamily\BODY
     \end{minipage}};
\node[newthemstytitle,right=10pt] at (box.north west){
     \bf\textsf{Theorem \stepcounter{Newthem}\theNewthem\; #1}};
\node[newthemstytitle, rounded corners] at (box.east) {$\clubsuit$};
\end{tikzpicture}
}[\par\vspace{.5\baselineskip}]

%%define the "newlemma" environment
\newcounter{Newlemma}[chapter]
\renewcommand{\theNewlemma}{\arabic{Newlemma}}
\NewEnviron{newlemma}[1][{}]{%
\noindent\centering
\begin{tikzpicture}
\node[newthemsty] (box){
     \begin{minipage}{0.93\columnwidth}
        \sffamily\BODY
     \end{minipage}};
\node[newthemstytitle,right=10pt] at (box.north west){
     \bf\textsf{Lemma \stepcounter{Newlemma}\theNewlemma\; #1}};
\node[newthemstytitle, rounded corners] at (box.east) {$\clubsuit$};
\end{tikzpicture}
}[\par\vspace{.5\baselineskip}]

%%define the "newcorol" environment
\newcounter{Newcorol}[chapter]
\renewcommand{\theNewcorol}{\arabic{Newcorol}}
\NewEnviron{newcorol}[1][{}]{%
\noindent\centering
\begin{tikzpicture}
\node[newthemsty] (box){
     \begin{minipage}{0.93\columnwidth}
        \sffamily\BODY
     \end{minipage}};
\node[newthemstytitle,right=10pt] at (box.north west){
     \bf\textsf{Corollary \stepcounter{Newcorol}\theNewcorol\; #1}};
\node[newthemstytitle, rounded corners] at (box.east) {$\clubsuit$};
\end{tikzpicture}
}[\par\vspace{.5\baselineskip}]

%% define the "proposition" environment
\newcounter{Newprop}[chapter]
\renewcommand{\theNewprop}{\thechapter.\arabic{Newprop}}
\NewEnviron{newprop}[1][{}]{%
\noindent\centering
\begin{tikzpicture}
\node[newpropositionsty] (box){
     \begin{minipage}{0.93\columnwidth}
        \sffamily\BODY
     \end{minipage}};
\node[newpropositionstytitle,right=10pt] at (box.north west){
     \bf\textsf{Proposition \stepcounter{Newprop}\theNewprop\; #1}};
\node[newpropositionstytitle, rounded corners] at (box.east) {$\spadesuit$};
\end{tikzpicture}
}[\par\vspace{.5\baselineskip}]


%%define the "newdef" environment
\newcounter{Newdefinition}[chapter]
\renewcommand{\theNewdefinition}{\thechapter.\arabic{Newdefinition}}
\NewEnviron{newdef}[1][{}]{%
\noindent\centering
\begin{tikzpicture}
\node [newdefinitionsty] (dbox){\begin{minipage}{0.93\textwidth}\itshape\BODY\end{minipage}};
\node[newdefinitionstytitle, right=10pt] at (dbox.north west) {\bf\textsf{Definition \stepcounter{Newdefinition}\theNewdefinition\; #1}};
\node[newdefinitionstytitle, rounded corners] at (dbox.east) {$\heartsuit$};
\end{tikzpicture}
}[\par\vspace{.5\baselineskip}]



%%define the note and newproof environment
\RequirePackage{pifont,manfnt}
\newenvironment{note}{\par\ttfamily\itshape\noindent{\makebox[0pt][r]{\scriptsize\color{red!90}\textdbend\quad}\textbf{Note:}}}{\par\vspace{.5\baselineskip}}

\newenvironment{example}{\par\noindent\textbf{Example: }\color{black!90}}{\par\vspace{.5\baselineskip}}

\newenvironment{assumption}{\par\noindent\textbf{Assumptions: }\color{black!90}}{\par\vspace{.5\baselineskip}}

\newenvironment{conclusion}{\par\noindent\textbf{Conclusions: }\color{black!90}}{\par\vspace{.5\baselineskip}}

\newenvironment{newproof}{\par\noindent{\makebox[0pt][r]{\color{seco}\ding{43}\;\;}\textbf{Proof:}}\color{black!90}\small}{\hfill$\Box$\quad\par\vspace{.5\baselineskip}}

%页眉页脚

\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\fancyhf{}
\fancyhead[EL,OR]{\color{seco}--\thepage/\pageref{LastPage}--}
\fancyhead[ER]{\color{seco}\em\nouppercase\leftmark{}}
\fancyhead[OL]{\color{seco}\em\nouppercase\rightmark}
\fancyfoot[c]{\@base}
\renewcommand{\headrule}{\color{seco}\hrule width\textwidth}
\pagestyle{fancy}

\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}\renewcommand{\headrule}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\; #1}{} }
\renewcommand{\chaptermark}[1]{\markboth{\chaptername \; #1\;}{}}


%\let\origdoublepage\cleardoublepage
%\newcommand{\clearemptydoublepage}{%
%  \clearpage
%  {\pagestyle{empty}\origdoublepage}%
%}
%\let\cleardoublepage\clearemptydoublepage

%\RequirePackage{nextpage}
%\cleartooddpage[\thispagestyle{empty}]
%\cleartoevenpage[\thispagestyle{empty}]
%%封面

\def\maketitle{%
\thispagestyle{empty}
\@cover
\vfill
\vspace*{2cm}
\begin{center}
\color{main}
\rule{0.8\textwidth}{2pt}\\
\Huge {\color{seco} \bfseries \the\entitle } {\color{main} \bfseries Note}\\
{\Huge \CJKfamily{new}{\color{seco} \the\zhtitle } 笔记}\\
\rule{0.8\textwidth}{2pt}
\end{center}
\vskip3ex
\begin{figure}[htp]
\centering
\@logo
\end{figure}
\begin{center}
\begin{minipage}{0.65\textwidth}
\Eindent\color{bule}\@myquote
\end{minipage}
\end{center}
\vfill
\vspace{2cm}
\begin{flushright}
\color{main}
\rule{0.45\textwidth}{1pt}\\
整理：{\color{seco}\@author}\\
整理时间：{\color{seco}\today}\\
Email: \hyperlink{\the\email}{\the\email}\\
\rule{0.45\textwidth}{1pt}
\end{flushright}
\vfill
\begin{center}
\color{main} Version: \the\version
\end{center}
\vfil\eject
}


%%中文两个字符缩进
%----字宽/缩进-----
%----CJK字符宽度
%\f@size = 当前字符大小数值（pt/pt）
%\p@ = 1pt
\def\elegant@CJKChar@size{\hskip \f@size \p@}
%----定义字宽
%字宽 = 字符宽度 + 字符间距 = 相邻字符中心的间距
\newdimen\elegant@CJKChar@size@dimen
\settowidth\elegant@CJKChar@size@dimen{\elegant@CJKChar@size\CJKglue}
%----用户接口
%负责刷新字宽和段落缩进
\newcommand{\CJKsetfontspace}{%
%刷新字宽
\settowidth\elegant@CJKChar@size@dimen{\elegant@CJKChar@size\CJKglue}%
%刷新段落缩进
%判断段落缩进是否被设置为0（如果是表示要求不缩进）
\ifdim\parindent=0pt%
\relax%
\else%
\parindent2\elegant@CJKChar@size@dimen%
\fi%
}
\newcommand{\Eindent}{\CJKsetfontspace\parindent2\elegant@CJKChar@size@dimen}
\newcommand{\Enoindent}{\parident\z@}
%----自动执行
\AtBeginDocument{\Eindent}

