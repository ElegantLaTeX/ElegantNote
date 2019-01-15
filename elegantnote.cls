\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantnote}[2018/01/06 ElegantNote v2.00 class]
\LoadClass[12pt,final]{article}

\RequirePackage{kvoptions}
\RequirePackage{ifthen}
\RequirePackage{ifxetex}
\RequirePackage{etoolbox}
\RequirePackage{calc}
\AtEndOfClass{\RequirePackage{microtype}}


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

\DeclareVoidOption{pc}{\ekv{device = pc}}
\DeclareVoidOption{pad}{\ekv{device = pad}}
\DeclareVoidOption{kindle}{\ekv{device = kindle}}
\DeclareVoidOption{normal}{\ekv{device = normal}}

\DeclareVoidOption{cn}{\ekv{lang = cn}}
\DeclareVoidOption{en}{\ekv{lang = en}}

\DeclareVoidOption{geye}{\ekv{mode = geye}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%\ExecuteOptions{12pt}
\ProcessKeyvalOptions*\relax
\ProcessOptions*

% 字体设置
\RequirePackage{ifxetex}
\ifxetex
	\RequirePackage{fontspec}
	\RequirePackage{type1cm}
	\setmainfont{Times New Roman}
	\setsansfont{Arial}
	\setmonofont{Microsoft YaHei}
	\RequirePackage{xeCJK}
	\RequirePackage{fontspec, xunicode, xltxtra}
	\setCJKmainfont[BoldFont={黑体},ItalicFont={楷体}]{宋体}
	\setCJKsansfont[BoldFont={黑体},ItalicFont={楷体}]{楷体}
	\setCJKmonofont[BoldFont={黑体},ItalicFont={楷体}]{微软雅黑}
	\XeTeXlinebreaklocale "zh"
	\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt
\else
	\RequirePackage[UTF8, scheme=plain]{ctex}
	\RequirePackage{newtxtext}
\fi

% 常用宏包
\RequirePackage{indentfirst}
\RequirePackage{anyfontsize}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{amsthm}
\RequirePackage{newtxmath}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage{xpatch}
\definecolor{winered}{rgb}{0.5,0,0}

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

% graphics path
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}


\newtheoremstyle{plain}{3pt}{3pt}{\itshape}{}{\color{ecolor}\bfseries}{}{0.5em}{\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}
\newtheoremstyle{definition}{3pt}{3pt}{\itshape}{}{\color{ecolor}\bfseries}{}{0.5em}{}
\newtheoremstyle{remark}{3pt}{3pt}{\itshape}{}{\color{ecolor}\bfseries}{}{0.5em}{}

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
	\renewcommand*{\proofname}{\normalfont\bfseries\color{ecolor}Proof}
}{\relax}


% caption settings 
\RequirePackage[font=small,labelfont={bf,color=ecolor}]{caption} 
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

% list/itemize/enumerate setting
\RequirePackage[shortlabels]{enumitem}
\setlist{nolistsep}


% headings
\RequirePackage{fancyhdr}
\fancyhf{}
\pagestyle{fancy}
\cfoot{\footnotesize\textcolor{gray}{\thepage}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{plain}{%
  \renewcommand{\headrulewidth}{0pt}%
  \fancyhf{}%
  \fancyfoot[C]{\footnotesize \textcolor{gray}{\thepage}}%
}

% bib-settings
\RequirePackage{natbib}
\setlength{\bibsep}{0.0pt}
\def\bibfont{\footnotesize}

\RequirePackage{sectsty}

\ifdefstring{\ELEGANT@color}{green}{
  	\definecolor{ecolor}{RGB}{0,120,2}%
}{\relax}
\ifdefstring{\ELEGANT@color}{cyan}{
  \definecolor{ecolor}{RGB}{0,175,152}%
}{\relax}
\ifdefstring{\ELEGANT@color}{blue}{
  \definecolor{ecolor}{RGB}{20,50,104}%
}{\relax}
\ifdefstring{\ELEGANT@color}{sakura}{
  \definecolor{ecolor}{RGB}{255,183,197}%
}{\relax}
\ifdefstring{\ELEGANT@color}{black}{
  \definecolor{ecolor}{RGB}{0,0,0}%
}{\relax}

%% device settings
%% default = pad
\ifdefstring{\ELEGANT@device}{pc}{
	\RequirePackage[margin=8mm, paperwidth=6.2in, paperheight=6in,includefoot]{geometry}
}{\relax}
\ifdefstring{\ELEGANT@device}{pad}{
	\RequirePackage[margin=8mm, paperwidth=6in, paperheight=8in,includefoot]{geometry}
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

\RequirePackage{tikz}
\usetikzlibrary{shadows}
\newcommand*{\eBall}{\tikz \draw [baseline, ball color=ecolor, draw=ecolor] circle (2pt);}
\newcommand*{\eShadow}{\tikz \draw [baseline, fill=ecolor,draw=ecolor,circular drop shadow] circle (2pt);}
\setlist[enumerate,1]{label=\color{ecolor}(\arabic*).}
\setlist[enumerate,2]{label=\color{ecolor}(\Roman*).}
\setlist[enumerate,3]{label=\color{ecolor}(\Alph*).}
\setlist[enumerate,4]{label=\color{ecolor}(\roman*).}
\setlist[itemize,1]{label={\eBall}}
\setlist[itemize,2]{label={\eShadow}}
%source1: https://tex.stackexchange.com/questions/41408/a-five-level-deep-list
%source2: https://tex.stackexchange.com/questions/318199/change-color-of-itemize-bullet 

\DeclareSymbolFont{cmlargesymbols}{OMX}{cmex}{m}{n}
\DeclareMathSymbol{\intop}{\mathop}{cmlargesymbols}{"5A}
  \def\int{\intop\nolimits}
\DeclareMathSymbol{\ointop}{\mathop}{cmlargesymbols}{"49}
  \def\oint{\ointop\nolimits}
\DeclareMathSymbol{\sumop}{\mathop}{cmlargesymbols}{"58}
  \let\sum\sumop
\DeclareMathSymbol{\prodop}{\mathop}{cmlargesymbols}{"59}
  \let\prod\prodop
