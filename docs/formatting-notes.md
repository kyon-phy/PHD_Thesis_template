# 模板整理中的命令说明

所有改动均发生在独立模板副本中。以下示例中的尖括号是说明文字，不代表原论文内容。

## 内容占位与源文件路径

```tex
\chapter{OOOO}
\section{OOOO}
\subsection{OOOO}
\caption[OOOO]{OOOO}
```

章节标题和正文改为 `OOOO`。标题命令继续产生章节编号、目录条目和页眉。
`\caption[短标题]{完整标题}` 的两个参数均已占位，分别显示在图表目录和图表下方。
原研究专用的段落、公式、图表和图像路径已移除，Chapter 1 保留独立的格式示例。

```tex
\include{Chapters/CH1}
\include{Chapters/Appendix/Appendix1}
\input{Chapters/Chapter6/section1}
\input{Chapters/Chapter8/figure1}
\includeonly{Chapters/CH1}
```

原来含研究主题的文件名改为通用编号，并同步修改 `\include` / `\input`。
`\include` 仍用于按章分页，`\input` 仍在当前位置插入子文件。
`\includeonly` 修复为实际存在的第一章路径，只在启用 `chapter` 文档类选项时生效。
`\label` / `\ref` / `\cite` 的键也改为通用示例键，保留交叉引用功能。

## 封面和元数据

```tex
\newcommand{\ThesisTitleEN}{OOOO}
\newcommand{\ThesisTitleJA}{OOOO}
\newcommand{\ThesisAuthorEN}{OOOO}
\newcommand{\ThesisAuthorJA}{OOOO}
\newcommand{\ThesisDepartmentEN}{OOOO}
\newcommand{\ThesisUniversityEN}{OOOO}
\newcommand{\ThesisAffiliationJA}{OOOO}
\newcommand{\ThesisDegree}{OOOO}
\newcommand{\ThesisDateEN}{OOOO}
\newcommand{\ThesisSubmissionJA}{OOOO}
\title{\ThesisTitleEN}
\author{\ThesisAuthorEN}
\dept{\ThesisDepartmentEN}
\university{\ThesisUniversityEN}
\degreetitle{\ThesisDegree}
\degreedate{\ThesisDateEN}
\subject{OOOO}
\keywords{OOOO}
```

新增十个字段命令集中存放可填写信息。封面中原来的固定文本改为相应字段，
`\title` 和 `\author` 同时为 PDF 元数据提供内容，避免封面与 PDF 信息不一致。
英文标题内原来针对某一题目的手动换行 `\\` 已移除，新标题按可用宽度自然换行。

封面的以下尺寸命令保持原值：

```tex
\newgeometry{left=27mm,right=27mm,top=25mm,bottom=25mm,bindingoffset=0mm}
\setstretch{1}
\setlength{\parindent}{0pt}
\begin{CJK}{UTF8}{ipxm}
\fontsize{24}{28}\selectfont
\fontsize{22}{24}\selectfont\bfseries
\fontsize{14.5}{19}\selectfont
\begin{minipage}{0.92\textwidth}
\fontsize{16}{18}\selectfont
\fontsize{16}{21}\selectfont
\restoregeometry
```

页边距依次为左右 27 mm、上下 25 mm，封面不额外增加装订偏移。
单倍行距和零首行缩进用于居中封面。
`CJK` 使用 UTF-8 输入及 `ipxm` 日文字体族。
`\fontsize{字号}{基线距离}` 分别保留原封面各区域的字号和行高，
日文题目区域保留为正文宽度的 92%。原来的 `\vspace` / `\vfill` 间距命令也保留。
`\restoregeometry` 在封面后恢复正文页边距。短占位标题比真实题目占用的行数少。

## 占位图、表和公式

```tex
\fbox{\parbox[c][45mm][c]{0.72\linewidth}{\centering OOOO}}
```

`\fbox` 绘制边框。`\parbox` 的两个 `c` 参数分别控制盒子对外和内部的垂直居中，
盒子高 45 mm、宽为当前行宽的 72%，内部文字水平居中。
该占位图不需要图片资源，可用 `\includegraphics[width=...]{...}` 替换。

```tex
\begin{figure}[tbp]
\begin{table}[tbp]
\begin{tabular}{ll}
\toprule
\midrule
\bottomrule
\begin{equation}
  \mathrm{OOOO}
\end{equation}
```

`[tbp]` 允许图表浮动至页顶、页底或浮动页；`{ll}` 创建两列左对齐表格。
`booktabs` 的三个命令绘制表头上方、下方及表尾的横线。
`equation` 为占位公式自动编号，`\mathrm` 将占位字符显示为正体。
这些示例通过 `\label` / `\ref` 检查编号和引用，不含研究结果。

## 导言区与参考文献

研究专用的 `\newcommand` 定义已移除，使用者可在
`Preamble/preamble.tex` 的自定义命令区填写自己的符号。
移除了未被占位模板使用的 `\usepackage{tikz-feynman}`，因此默认编译无需该宏包。
原字体配置、数学花体、`CJKutf8`、目录深度、图目录编号栏宽及参考文献回链保留。

```tex
\documentclass[a4paper,12pt,times,print,index,custombib]{Classes/PhDThesisPSnPDF}
```

移除与 `custombib` 重复的 `numbered` 选项，避免文档类发出参考文献选项冲突警告。
数字引用仍由导言区的 `\RequirePackage[square, sort&compress, numbers]{natbib}`
设置：方括号、排序并压缩连续编号。其余选项继续选择 A4、12 pt、Times 字体、
打印页边距、索引支持和自定义参考文献配置，显示效果不变。

```tex
\bibliographystyle{References/thesis-unsrtnat}
\bibliography{References/references}
\cite{placeholder-one,placeholder-two,placeholder-three}
```

前两个命令及本地 `.bst` 样式保留。`.bib` 正文替换为三条明确标为占位的条目，
演示按首次引用顺序编号、数字压缩及返回引用页的链接。

## 构建命令

新增 `.latexmkrc`：`$pdf_mode = 1` 使用 pdfLaTeX，`$out_dir = 'build'`
集中存放生成文件，`@default_files = ('thesis.tex')` 指定默认入口。
`-interaction=nonstopmode` 避免交互停顿，`-halt-on-error` 在错误时退出。
使用标准 TeX 错误格式，让 latexmk 能识别并自动创建 `\include` 所需的辅助文件子目录。
`add_cus_dep('nlo', 'nls', 0, ...)`
为后续添加术语表时注册 makeindex 规则；`-s nomencl.ist` 指定术语表样式，
`-o` 指定输出文件。
`$max_repeat = 10` 将单次构建最多允许的 LaTeX 轮数设为 10，以便首次编译时
子文件、目录和参考文献回链完成收敛；文件稳定后 latexmk 即停止重编译。

原手动重复调用 pdfLaTeX、BibTeX、makeindex 的脚本，以及大型通用 Makefile，
改为调用 `latexmk -pdf`，由它按依赖自动运行所需步骤。
`Variables.ini` 中 `THESIS`、`BUILD_DIR` 和 `LATEXMK` 分别设置主文件名、
构建目录和命令名，Makefile 的 `-outdir` 将输出写入指定目录。
清理命令改为 `latexmk -c`，仅清理辅助文件并保留生成的 PDF。
Windows 脚本返回 latexmk 的退出码，不再先删除 PDF。
`.gitignore` 排除编译产物、备份及本地工作文件，保留可提交的源文件和图像资源。
