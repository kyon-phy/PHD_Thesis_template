# PhD_thesis_template

从博士论文排版工程整理出的独立 LaTeX 模板，基于 Krishna Kumar 的
[CUED PhD thesis template](https://github.com/kks32/phd-thesis-template)。
保留英文／日文封面、字体、页边距、页眉、目录、图表目录、数字引用和参考文献回链。

保留原论文的 chapter、section 及下级标题，包括附录标题和章节层级。
论文封面标题、作者、单位、日期、正文、附录正文、摘要、致谢和参考文献均已替换为
`OOOO` 或明确标注的占位示例。仓库只包含模板源码，不包含原论文 PDF、研究图表、
分析数据、备份或原论文的 Git 历史。

## 编译

使用带有 `latexmk`、BibTeX、CJKutf8 和 IPAex Mincho 字体支持的完整
TeX Live / MacTeX。当前模板按 **pdfLaTeX** 配置。

在仓库根目录运行：

```sh
latexmk -pdf thesis.tex
```

输出为 `build/thesis.pdf`。也可以使用：

```sh
./compile-thesis.sh
make
```

Windows 安装 TeX Live 后运行 `compile-thesis-windows.bat`。
若上传至 Overleaf，选择 `thesis.tex` 为主文件，编译器选择 pdfLaTeX。

清理辅助文件并保留 PDF：

```sh
./compile-thesis.sh clean
# 或者
make clean
```

## 从哪里开始填写

| 文件／目录 | 用途 |
| --- | --- |
| `thesis-info.tex` | 标题、作者、单位、学位、日期及 PDF 元数据 |
| `thesis.tex` | 章节顺序、附录顺序及前置页面的开关 |
| `Preamble/preamble.tex` | 宏包、目录深度、图表设置和自定义命令 |
| `Chapters/CH1.tex` 至 `CH11.tex` | 11 个保留原标题与层级的章节 |
| `Chapters/Chapter6/section1.tex` 至 `section10.tex` | 拆分章节的子文件示例 |
| `Chapters/Chapter8/figure1.tex` 至 `figure12.tex` | 独立图环境子文件示例 |
| `Chapters/Appendix/Appendix1.tex` 至 `Appendix9.tex` | 9 个保留原标题的附录源码 |
| `Abstract/`、`Acknowledgement/`、`Declaration/`、`Dedication/` | 摘要、致谢、声明和献词 |
| `References/references.bib` | 三条虚构占位条目，填写真实参考文献时替换 |
| `References/thesis-unsrtnat.bst` | 按首次引用顺序编号的本地 BibTeX 样式 |
| `Figs/placeholder.tex` | 无需外部图片的占位图 |
| `Classes/`、`sty/` | 保留的文档类、字形映射及样式源码 |

先填写 `thesis-info.tex` 顶部的 `\Thesis...` 命令，再修改各 `.tex` 正文和
`.bib` 条目。封面和 PDF 元数据共享英文标题与作者字段。
`\subject{OOOO}` 和 `\keywords{OOOO}` 也需要填写。

Chapter 1 演示图、表、公式、短标题、交叉引用及压缩数字引用。
Chapter 6 按原论文顺序使用 `\input` 拆分章节，Chapter 8 演示独立图文件。
可按新论文的需要调整现有标题，标题下的正文仍需自行填写。
默认保留 7 个启用的附录，另外 2 个附录及声明、献词的 `\include` 行已注释，
需要时取消注释即可。未启用的 `.tex` 文件仍保存在仓库中。

`OOOO` 只是占位文本，不是提交用的正文或参考文献。提交前请自行核对学校的
封面和格式要求，并全文搜索 `OOOO` 和 `placeholder`。

## 排版与构建说明

[格式命令说明](docs/formatting-notes.md) 列出了整理时改变的命令、参数及其效果。
原有双面排版会让章节从右页开始，因此短占位章节之间出现空白页属于正常现象。

## 许可与来源

保留原模板的 [MIT 许可](LICENSE) 及作者署名。
`References/thesis-unsrtnat.bst` 是 `unsrtnat.bst` 的修改版，
`sty/breakurl.sty` 是随模板保留的样式文件，两者各自文件头中的
LaTeX Project Public License 声明继续适用。
`Classes/glyphtounicode.tex` 保留其原有来源说明。
