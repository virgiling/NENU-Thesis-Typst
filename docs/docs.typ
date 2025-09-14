#import "@preview/gentle-clues:1.2.0": *
#import "style.typ": module, project, ref-fn

#let current-version = "1.0.0"

#show: project.with(
  color: rgb("#143f85"),
  title: "NENU毕业论文模板手册",
  top-text: "Start Your Thesis with Typst",
  subtitle: "v" + current-version,
  pic: "/assets/nenu-logo-blue.svg",
  publisher: "NENU IST",
  signature: "Dian Ling <virgiling7@gmail.com>",
)

= 简单使用

我们通过向 #ref-fn("thesis()") 输入论文的参数，得到对应的返回页面，并通过类似 `React` 的方式将这些页面组装起来，例如：

```typ
#let (
  twoside,
  doc,
  preface,
  mainmatter,
  appendix,
  fonts-display-page,
  cover,
  committee-page,
  decl-page,
  abstract,
  abstract-en,
  bilingual-bibliography,
  outline-page,
  list-of-figures,
  list-of-tables,
  notation,
  acknowledgement,
  publication,
  decision,
) = thesis(
  doctype: "master",
  degree: "professional",
  anonymous: false,
  twoside: false,
  info: (
    title: ("毕业论文中文题目", "有一点长有一点长有一点长有一点长有一点长有一点长"),
    title-en: "Analysis of the genetic diversity within and between the XX population revealed by AFLP marker",
    grade: "20XX",
    student-id: "1234567890",
    author: "张三",
    author-en: "San Zhang",
    secret-level: "无",
    secret-level-en: "Unclassified",
    department: "信息科学与技术学院",
    department-en: "School of Information Science and Technology",
    discipline: "计算机科学与技术",
    discipline-en: "Computer Science and Technology",
    major: "计算机科学",
    major-en: "Computer Science",
    field: "人工智能",
    field-en: "Artificial Intelligence",
    supervisor: ("李四", "教授"),
    supervisor-en: "Professor My Supervisor",
    submit-date: datetime.today(),
  ),
  bibliography: bibliography.with("ref.bib"),
)
```

#warning[
  注意，有一些页面是通过 #ref-fn("thesis.doctype") 以及 #ref-fn("thesis.degree") 来进行分发的，具体为：

  - `commitee-page` 只存在与硕博论文中
  - `decision` 只存在于博士论文中
]

除去这些特定学位论文才有的页面，其余页面可以根据需求自己选择是否加入到论文中

== 封面

对于本科生封面，其参数我们可以参考 #ref-fn("bachelor-cover()")

#pagebreak()

= 页面文档

我们通过此文件中定义的函数进行论文的书写，输入参数后，函数会返回对应的模板

== 入口文件

#module(
  read("../lib.typ"),
  name: "Lib",
)

== 封面

#module(
  read("../pages/bachelor-cover.typ"),
  name: "本科生封面",
)

#module(
  read("../pages/master-cover.typ"),
  name: "硕博封面",
)


= 工具函数与变量

#module(
  read("../utils/style.typ"),
  name: "字体与字号",
)

#module(
  read("../utils/datetime-display.typ"),
  name: "日期显示辅助函数",
)

