% Author: Dongsheng Deng
% Homepage: https://ddswhu.me/
% Email: elegantlatex2e@gmail.com
% Lastest Version: https://github.com/ElegantLaTeX/ElegantNote

% --- Class structure: identification part
\ProvidesClass{elegantnote}[2018/04/25 ElegantNote v2.20 class]
\NeedsTeXFormat{LaTeX2e}

\RequirePackage{kvoptions}
\RequirePackage{ifthen}
\RequirePackage{ifxetex}
\RequirePackage{etoolbox}
\RequirePackage{calc}

\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}

% ----- Colors -----
\DeclareStringOption[green]{color}
\DeclareStringOption[pad]{device}
\DeclareStringOption[cn]{lang}
\DeclareStringOption{mode}
% ----- backward compatibility
\DeclareVoidOption{green}{\ekv{color = green}}
\DeclareVoidOption{cyan}{\ekv{color = cyan}}
\DeclareVoidOption{blue}{\ekv{color = blue}}
\DeclareVoidOption{sakura}{\ekv{color = sakura}}
\DeclareVoidOption{black}{\ekv{color = black}}
\DeclareVoidOption{epubblue}{\ekv{color = epubblue}}

\DeclareVoidOption{pc}{\ekv{device = pc}}
\DeclareVoidOption{pad}{\ekv{device = pad}}
\DeclareVoidOption{kindle}{\ekv{device = kindle}}
\DeclareVoidOption{normal}{\ekv{device = normal}}

\DeclareVoidOption{cn}{\ekv{lang = cn}}
\DeclareVoidOption{en}{\ekv{lang = en}}

\DeclareVoidOption{geye}{\ekv{mode = geye}}
\DeclareVoidOption{epub}{\ekv{mode = epub}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*\relax
\LoadClass{article}

\PassOptionsToPackage{no-math}{fontspec}
\ifdefstring{\ELEGANT@lang}{cn}{
\RequirePackage[UTF8, scheme=plain,punct=kaiming]{ctex}
}

\RequirePackage{ifxetex}
\ifxetex
  \RequirePackage{fontenc}
\else
  \RequirePackage[T1]{fontenc}
  \AtEndOfClass{\RequirePackage{microtype}}
\fi

\RequirePackage{newtxtext}
\RequirePackage{newtxmath}

\RequirePackage{listings} 
\renewcommand{\ttdefault}{cmtt}
\lstdefinestyle{mystyle}{
  basicstyle=%
    \ttfamily
    \lst@ifdisplaystyle\footnotesize\fi
}


% 常用宏包
\RequirePackage{indentfirst}
\RequirePackage{anyfontsize}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\let\openbox\relax
\RequirePackage{amsthm}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage{xpatch}
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{epubblue}{RGB}{1,126,218}
\hypersetup{%
    pdfborder = {0 0 0},
    colorlinks,
    citecolor=ecolor,
    filecolor=ecolor,
    linkcolor=ecolor,
    urlcolor=ecolor
}
% 行距设置
\linespread{1.3}
\setlength{\parskip}{3mm}
\setlength{\parindent}{2em}
% 定义护眼模式 geye = true
\RequirePackage{xcolor}

% good for eye color 
\ifdefstring{\ELEGANT@mode}{geye}{
  \definecolor{geyecolor}{RGB}{199,237,204}%
  \pagecolor{geyecolor}
}{\relax}
\ifdefstring{\ELEGANT@mode}{epub}{
  \definecolor{geyecolor}{RGB}{251,250,248}%
  \pagecolor{geyecolor}
}{\relax}


% graphics path
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\let\openbox\relax
\newtheoremstyle{plain}{3pt}{3pt}{\itshape}{}{\color{ecolor}\bfseries}{}{0.5em}{\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}
\newtheoremstyle{definition}{3pt}{3pt}{\itshape}{}{\color{ecolor}\bfseries}{}{0.5em}{}
\newtheoremstyle{remark}{3pt}{3pt}{\itshape}{}{\color{ecolor}\bfseries}{}{0.5em}{}


% caption settings 
\RequirePackage[font=small,labelfont={bf,color=ecolor}]{caption} 
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

% list/itemize/enumerate setting
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nolistsep}


% headings
\RequirePackage{fancyhdr}
\fancyhf{}
\pagestyle{fancy}
\rfoot{\footnotesize\textcolor{gray}{\thepage}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{plain}{%
  \renewcommand{\headrulewidth}{0pt}%
  \fancyhf{}%
  \fancyfoot[R]{\footnotesize \textcolor{gray}{\thepage}}%
}

\RequirePackage[flushmargin]{footmisc}
\setlength{\footnotesep}{12pt}

% bib-settings
\RequirePackage{natbib}
\setlength{\bibsep}{0.0pt}
\def\bibfont{\footnotesize}

\RequirePackage{sectsty}

\ifdefstring{\ELEGANT@color}{green}{
  	\definecolor{ecolor}{RGB}{0,120,2}%
}{\relax}
\ifdefstring{\ELEGANT@color}{cyan}{
  \definecolor{ecolor}{RGB}{31,186,190}%
}{\relax}
\ifdefstring{\ELEGANT@color}{blue}{
  \definecolor{ecolor}{RGB}{60,113,183}%
}{\relax}
\ifdefstring{\ELEGANT@color}{sakura}{
  \definecolor{ecolor}{RGB}{255,183,197}%
}{\relax}
\ifdefstring{\ELEGANT@color}{black}{
  \definecolor{ecolor}{RGB}{0,0,0}%
}{\relax}
\ifdefstring{\ELEGANT@color}{epubblue}{
  \definecolor{ecolor}{RGB}{1,126,218}%
}{\relax}

\definecolor{egreen}{RGB}{0,120,2}
\definecolor{ecyan}{RGB}{0,175,152}
\definecolor{eblue}{RGB}{20,50,104}
\definecolor{sakura}{RGB}{255,183,197}
% \definecolor{black}{RGB}{255,183,197}

%% device settings
%% default = pad
\ifdefstring{\ELEGANT@device}{pc}{
	\RequirePackage[margin=8mm, paperwidth=6.2in, paperheight=6in,includefoot]{geometry}
}{\relax}
\ifdefstring{\ELEGANT@device}{pad}{
	\RequirePackage[paperwidth=6in, paperheight=8in,includefoot,margin=8mm]{geometry}
	%197mm*148mm
}{\relax}
\ifdefstring{\ELEGANT@device}{kindle}{
	\RequirePackage[margin=8mm, paperwidth=3.68in, paperheight=4.92in]{geometry}
	% 160mm*115mm
}{\relax}
\ifdefstring{\ELEGANT@device}{normal}{
	\RequirePackage[margin=1in, a4paper]{geometry}
}{\relax}



\allsectionsfont{\color{ecolor}}
%\sectionfont{\color{ecolor}}
%\subsectionfont{\color{ecolor}}

\ifdefstring{\ELEGANT@lang}{cn}{
  \theoremstyle{plain}% default
	\newtheorem{theorem}{定理}[section] %
	\newtheorem{lemma}[theorem]{引理} %
	\newtheorem{proposition}[theorem]{性质} %
	\newtheorem*{corollary}{推论} %
	\theoremstyle{definition} %
	\newtheorem{definition}{定义}[section] %
	\newtheorem{conjecture}{猜想}[section] %
	\newtheorem{example}{例}[section] %
	\theoremstyle{remark} %
	\newtheorem*{remark}{\normalfont\bfseries 评论} %
	\newtheorem*{note}{\normalfont\bfseries 注} %
	\newtheorem{case}{\normalfont\bfseries 案例} %
	\renewcommand*{\proofname}{\normalfont\bfseries\color{ecolor}证明} %
	\renewcommand\contentsname{\color{ecolor}目录}
	\renewcommand\refname{\color{ecolor}参考文献} %
	\renewcommand\figurename{图} %
	\renewcommand\tablename{表}
	\newcommand\versiontext{版本：}%
	\newcommand\updatetext{更新：}%
	\setlength{\parindent}{2em}
  	\newcommand{\keywords}[1]{\vskip2ex\par\noindent\normalfont{\bfseries 关键词: } #1}
}{\relax}
\ifdefstring{\ELEGANT@lang}{en}{
  \theoremstyle{plain}% default
	\newtheorem{theorem}{Theorem}[section] %
	\newtheorem{lemma}[theorem]{Lemma} %
	\newtheorem{proposition}[theorem]{Proposition} %
	\newtheorem*{corollary}{Corollary} %
	\theoremstyle{definition} %
	\newtheorem{definition}{Definition}[section] %
	\newtheorem{conjecture}{Conjecture}[section] %
	\newtheorem{example}{Example}[section] %
	\theoremstyle{remark} %
	\newtheorem*{remark}{Remark} %
	\newtheorem*{note}{Note} %
	\newtheorem{case}{Case} 
	\renewcommand*{\proofname}{\normalfont\bfseries\color{ecolor} Proof}
	\newcommand\versiontext{Version: }%
	\newcommand\updatetext{Update: }%
}{\relax}



\def\IfEmpty#1{%
  \edef\1{\the#1}
  \ifx\1\empty
}
\newtoks\version
\newtoks\institute
\def \ifempty#1{\def\temp{#1} \ifx\temp\empty }
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@ELEGANT@version\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\ELEGANT@version\relax
}
\def\@maketitle{%
\thispagestyle{empty}
 \color{ecolor}
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE\bfseries \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author\\
        \the\institute
      \end{tabular}\par}%
\vskip 1.5em%
\IfEmpty\version
\else 
	{\small\normalfont\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\kaishu} \versiontext\the\version}
\fi
\ifx\@date\empty
\else
\vskip 0.1em%
 	{\small\normalfont\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\kaishu} \updatetext\@date}%
\fi
  \end{center}%
  \par
}

% \RequirePackage{fancyhdr}

% \pagestyle{fancy}
% \fancyhf{}
% \fancyhead[L]{\@title}
% \fancyhead[R]{\leftmark}
% \renewcommand{\headrulewidth}{0pt}
% \fancyfoot[R]{\thepage}

\RequirePackage{tikz}
\usetikzlibrary{shadows}
\newcommand*{\eitemi}{\tikz \draw [baseline, ball color=ecolor, draw=none] circle (2pt);}
\newcommand*{\eitemii}{\tikz \draw [baseline, fill=ecolor,draw=none,circular drop shadow] circle (2pt);}
\newcommand*{\eitemiii}{\tikz \draw [baseline, fill=ecolor,draw=none] circle (2pt);}
\setlist[enumerate,1]{label=\color{ecolor}\arabic*.}
\setlist[enumerate,2]{label=\color{ecolor}(\alph*).}
\setlist[enumerate,3]{label=\color{ecolor}\Roman*.}
\setlist[enumerate,4]{label=\color{ecolor}\Alph*.}
\setlist[itemize,1]{label={\eitemi}}
\setlist[itemize,2]{label={\eitemii}}
\setlist[itemize,3]{label={\eitemiii}}
%source1: https://tex.stackexchange.com/questions/41408/a-five-level-deep-list
%source2: https://tex.stackexchange.com/questions/318199/change-color-of-itemize-bullet 



\DeclareSymbolFont{CMletters}     {OML}{cmm} {m}{it}%
\DeclareSymbolFont{CMsymbols}     {OMS}{cmsy}{m}{n}%
\DeclareSymbolFont{CMlargesymbols}{OMX}{cmex}{m}{n}%

% \let\sum\relax
% \DeclareMathSymbol{\sum}{\mathop}{CMlargesymbols}{"50}%
% \let\int\relax
% \DeclareMathSymbol{\int}{\mathop}{CMlargesymbols}{"5A}%

\let\intop\relax\let\sumop\relax\let\ointop\relax\let\prodop\relax
\DeclareMathSymbol{\sumop}{\mathop}{CMlargesymbols}{"50}
\DeclareMathSymbol{\intop}{\mathop}{CMlargesymbols}{"52}
\DeclareMathSymbol{\ointop}{\mathop}{CMlargesymbols}{"49}
\DeclareMathSymbol{\prodop}{\mathop}{CMlargesymbols}{"59}

% \let\partial\relax
% \DeclareMathSymbol{\partial}{\mathord}{CMletters}{"40}%
% \let\in\relax
%\DeclareMathSymbol{\in}{\mathrel}{CMsymbols}{"32}%
% \let\pi\relax
% \DeclareMathSymbol{\pi}{\mathord}{CMletters}{"19}



\lstset{basicstyle=\scriptsize\ttfamily,style=mystyle}

\definecolor{lightgrey}{rgb}{0.9,0.9,0.9}
\definecolor{frenchplum}{RGB}{190,20,83}
\lstset{language=[LaTeX]TeX,
	texcsstyle=*\color{winered},
	numbers=none,
	breaklines=true,
	keywordstyle=\color{winered},
	commentstyle=\color{gray},
	emph={elegantpaper,fontenc,fontspec,xeCJK,FiraMono,xunicode,newtxmath,figure,fig,image,img,table,itemize,enumerate,newtxtext,newtxtt,ctex,microtype,description,times,newtx,booktabs,tabular,PDFLaTeX,XeLaTeX,type1cm,BibTeX,device,color,mode,lang,amsthm},
	emphstyle={\color{frenchplum}},
	morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords},
	frame=none,
	tabsize=2,
	% backgroundcolor=\color{lightgrey}
}
