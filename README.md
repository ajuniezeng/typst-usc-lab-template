# typst-usc-lab-template

Typst 是可用于出版的可编程标记语言，拥有变量、函数与包管理等现代编程语言的特性，注重于科学写作 (science writing)，定位与 LaTeX 相似。

- **语法简洁**：上手难度跟 Markdown 相当，文本源码阅读性高，不会像 LaTeX 一样充斥着反斜杠与花括号。
- **编译速度快**：Typst 使用 Rust 语言编写，即 typ(e+ru)st，目标运行平台是 WASM，即浏览器本地离线运行；也可以编译成命令行工具，采用一种增量编译算法和一种有约束的版面缓存方案，文档长度基本不会影响编译速度，且编译速度与常见 Markdown 渲染引擎渲染速度相当。
- **环境搭建简单**：不需要像 LaTeX 一样折腾几个 G 的开发环境，原生支持中日韩等非拉丁语言，无论是官方 Web App 在线编辑，还是使用 VS Code 安装插件本地开发，都是即开即用。
- **现代编程语言**：Typst 是可用于出版的可编程标记语言，拥有变量、函数、包管理与错误检查等现代编程语言的特性，同时也提供了闭包等特性，便于进行函数式编程。以及包括了 [标记模式]、{脚本模式} 与 $数学模式$ 等多种模式的作用域，并且它们可以不限深度地、交互地嵌套。并且通过 [包管理](https://typst-doc-cn.github.io/docs/packages/)，你不再需要像 TexLive 一样在本地安装一大堆并不必要的宏包，而是按需自动从云端下载。

Typst 中文文档：<https://typst-doc-cn.github.io/docs/chinese/>

Typst 官方文档：<https://typst.app/docs/>

Typst WebApp：<https://typst.app/>

---

_这是一份用于 USC 实验报告的 typst 模板，涵盖封面，目录，标题，代码块，公式等内容。Fork 于原 [typst-nku-lap-template 项目](https://github.com/Starlight0798/typst-nku-lab-template)_

## 使用方法

​ 使用模板方法如下：

1. 创建你的 typst 文件，比如 `main.typ`

2. 将 `template.typ` 和 `fonts.typ` 放入 `main.typ` 同目录下

3. 在 main.typ 插入如下代码, 如有需要（你 USC 就是喜欢每个实验报告模板都不太一样），可以修改 `template.typ` 其中的键值进行增加或注释：

```typst
	#import "template.typ": *
	#import XXX  // 这里引入你需要使用的其他包(若干)，参照 demo.typ

	#show: project.with(
		title: "实验报告",
  	course: "计算机网络实验报告",
  	lab_name: "TCP/IP实验",
  	stu_name: "丁真",
  	stu_id: "2077114514",
		class: "E-ciga 77级 114514 班",
		department: "计算机学院",
		date: (2077, 1, 1),
		teacher: "2.5 条悟",
		show_date: false,
		show_content_figure: true, // 是否在目录页加上图表的索引
		watermark: "USC",	// 水印，不写或写空字符串则无水印
	)
```

4. 编写你自己的代码

另外，实验报告可能需要用到不同样式的表格，图片，流程图，代码块等，这些详见`demo.typ.`，里面都有使用示例，基本都是调用各个库来完成效果，避免重复造轮子。

## 编写

建议使用`vscode` + `tinymist`插件 + `typst preview`插件编写，preview 插件可以让你编写的过程达到**实时同步**的效果(**编译速度优于 Latex**)，tinymist 插件有诸多使用特性，不多赘述。

![image-20240427141053306](assets/image-20240427141053306.png)

## 示例

_<u>此部分针对不熟悉 typst 的用户，熟悉者可以跳过。</u>_

比如你想要画像 demo.typ 里面的这样一个**丰富内容块**：

<img src="assets/image-20240427141309450.png" alt="image-20240427141309450" style="zoom: 80%;" />

那么首先需要在你的 main.typ 中顶部引入包，具体是哪个包，我在 demo 中二级标题都有注明：

```typst
#import "@preview/colorful-boxes:1.3.1": *
```

然后在你需要放置的部分加入以下代码：

```typst
#colorbox(title: [这是一段测试标题], color: "blue")[
  这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字这是一段测试文字
]
```

> 如果你找不到代码，建议使用`typst preview`进行实时预览，这样你直接点击你想要的组件，就会自动跳转到对应的代码。

效果如下，当然 color 可以自己调：

<img src="assets/image-20240427141525685.png" alt="image-20240427141525685" style="zoom: 80%;" />

其余任何组件同理。

目前，Typst 对无 bold 和 italic 变体的中文字体暂不支持粗体和斜体，如常见的黑体，宋体和楷体等，可以考虑引入<https://github.com/csimide/cuti>

**(注：codly 等包在模板文件已经引入，无需再次引入)**
