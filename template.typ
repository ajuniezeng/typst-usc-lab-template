#import "@preview/chic-hdr:0.4.0": *
#import "@preview/codly:0.2.1": *
#import "@preview/i-figured:0.2.4"
#import "@preview/pintorita:0.1.1"
#import "@preview/gentle-clues:0.8.0": *
#import "@preview/cheq:0.1.0": checklist
#import "@preview/unify:0.6.0": num, qty, numrange, qtyrange
#import "fonts.typ": *
#import "@preview/cuti:0.2.1": *


#let indent() = {
  set par(first-line-indent: 2em)
}

#let info_key(body) = {
  rect(width: 100%, inset: 2pt, stroke: none, text(font: Heiti, size: 22pt, body))
}

#let info_value(body) = {
  rect(
    width: 100%,
    inset: 2pt,
    stroke: (bottom: 1pt + black),
    text(font: Heiti, size: 22pt, bottom-edge: "descender")[ #body ],
  )
}

#let project(
  title: "实验报告",
  course: "COURSE",
  lab_name: "LAB NAME",
  stu_name: "NAME",
  stu_id: "1234567",
  class: "CLASS",
  // major: "MAJOR",
  department: "DEPARTMENT",
  teacher: "2.5 GOJO",
  date: (114, 5, 14),
  year: 2077,
  semester: "第一学期",
  show_date: false,
  show_content_figure: false,
  watermark: "",
  body,
) = {
  set page("a4", margin: (x: 7.5em, y: 6em))
  // 封面
  align(center)[
    // 你 USC 计院实验报告千奇百怪，没见过哪一种用图片的，需要的自行添加
    // #image("./img/USC-name.png", width: 70%)
    #v(2em)
    #set text(font: Heiti, size: 22pt)

    #text(font: XK, size: 48pt)[南华大学]

    #v(-1em)

    #text(font: XK, size: 26pt)[计算机学院]

    #v(3em)
    // 课程名
    #text(size: 36pt, font: Heiti)[
      #title
    ]
    #v(1.5em)

    // 报告名
    // #text(size: 22pt, font: Songti)[
    //   #lab_name
    // ]

    #text(font: ("Times New Roman", "SimSun"), size: 14pt)[（ #year \~ #{year+1}学年 #semester ）]

    // 你 USC 计院实验报告感觉从来不用 logo，需要的自行添加
    // #image("./img/NKU-logo.png", width: 40%)
    #v(0.5em)

    // 个人信息
    #grid(
      columns: (120pt, 300pt),
      rows: (40pt, 40pt),
      gutter: 3pt,
      info_key("课程名称"), info_value(course),
      info_key("实验名称"), info_value(lab_name),
      info_key("姓　　名"), info_value(stu_name),
      info_key("学　　号"), info_value(stu_id),
      // info_key("专　　业"), info_value(major),
      info_key("班　　级"), info_value(class),
      info_key("指导老师"), info_value(teacher),
    )
    #v(0.8em)

    // 日期
    #if show_date {
      text(font: Heiti, size: 20pt)[
        #date.at(0) 年 #date.at(1) 月 #date.at(2) 日
      ]
    }
  ]
  pagebreak()

  // 页眉页脚设置
  show: chic.with(
    chic-header(
      // left-side: smallcaps(
      //   text(size: 10pt, font: Songti)[
      //     #course -- #lab_name
      //   ],
      // ),
      // right-side: text(size: 10pt, font: Songti)[
      //   #chic-heading-name(dir: "prev")
      // ],
      // side-width: (60%, 0%, 35%),
      center-side: text(size: 9pt, font: Songti)[
        南华大学#department#title
       ]

    ),
    chic-footer(
      center-side: text(size: 9pt, font: Songti)[
        #counter(page).display(
          "第 1 页/共 1 页",
          both: true,
        )
      ],
    ),
    chic-separator(on: "header", stroke(0.8pt + black)),
    chic-separator(on: "footer", stroke(0.8pt + black)),
    chic-offset(20%),
    chic-height(2.5cm),
  )

  // 目录
  show outline.entry.where(level: 1): it => {
    v(22pt, weak: true)
    show: cn-fakebold
    strong(it)
  }

  show outline.entry.where(level: 2): it => {
    v(2pt, weak: true)
    h(2em)
    it
  }

  show outline.entry: it => {
    set text(
      font: Songti,
      size: 12pt,
    )
    it
  }

  show outline: it => {
    show heading: set align(center)
    it
  }

  outline(
    title: text(font: Songti, size: 16pt)[目　录],
    indent: auto,
  )

  if show_content_figure {
    text(font: Songti, size: 10pt)[
      #i-figured.outline(title: [图表])
    ]
  }
  pagebreak()


  // 正文设置
  set heading(numbering: "1.1.")
  set figure(supplement: [图])
  show heading: i-figured.reset-counters.with(level: 2)
  show figure: i-figured.show-figure.with(level: 2)
  show math.equation: i-figured.show-equation
  set text(
    font: Songti,
    size: font_size.小四,
  )
  set par(    // 段落设置
    justify: false,
    leading: 1.04em,
    first-line-indent: 2em,
  )
  show heading: it => box(width: 100%)[ // 标题设置
    #v(0.5em)
    #set text(font: Songti)
    #show: show-cn-fakebold
    #if it.numbering != none {
      counter(heading).display()
    }
    #h(0.75em)
    #it.body
    #v(0.6em)
  ]
  show link: it => {
    // 链接
    set text(fill: blue.darken(20%))
    it
  }
  show: gentle-clues.with(    // gentle块
    headless: false, // never show any headers
    breakable: true, // default breaking behavior
    header-inset: 0.4em, // default header-inset
    content-inset: 1em, // default content-inset
    stroke-width: 2pt, // default left stroke-width
    border-radius: 2pt, // default border-radius
    border-width: 0.5pt, // default boarder-width
  )
  show: checklist.with(fill: luma(95%), stroke: blue, radius: .2em) // 复选框

  // 代码段设置
  show: codly-init.with()
  codly(
    display-icon: false,
    stroke-color: luma(200),
    zebra-color: luma(240),
    enable-numbers: true,
    breakable: true,
  )
  show raw.where(lang: "pintora"): it => pintorita.render(it.text)

  // 水印
  set page(
    background: rotate(
      -60deg,
      text(100pt, fill: rgb("#faf2f1"))[
        #strong()[#watermark]
      ],
    ),
  )

  body
}