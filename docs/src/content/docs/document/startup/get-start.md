---
title: 开始使用
sidebar:
    order: 3
---

我们通过向 [thesis](/document/reference/thesis) 输入论文的参数，得到对应的返回页面，并通过类似 `React` 的方式将这些页面组装起来，例如：

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

:::note
  注意，有一些页面是通过 `doctype` 以及 `degree`  来进行分发的，具体页面为：

  - `commitee-page` 只存在与硕博论文中
  - `decision` 只存在于博士论文中
:::

这里具体的参数含义以及要求可以见 [thesis() 参数文档](/document/reference/thesis) 以及 [info 中各个名词的意义](/document/reference/info.md)。

:::tip
你可以将自己的信息用文本写完后，例如：

  ```txt
  标题：这是论文标题
  作者：张三
  ...
  ```

然后把文档和信息一起丢给 AI，让 AI 帮忙补全，这样可以节省很多时间（指阅读文档的时间）
:::

除去这些特定学位论文才有的页面，其余页面可以根据需求自己选择是否加入到论文中。

在开始搭配页面前，我们需要明确文档的设置以及页面构成的顺序，这些都需要去阅读论文装订规范。

一般而言，设置的顺序为：

+ 页面 & 元数据设置
+ 封面页
+ 扉页
+ 前言设置
+ 摘要
+ 目录
+ 正文设置
+ 参考文献
+ 附录设置
+ 后记
+ ...

我们将通过页面设置的顺序一一 [解释如何使用我们的模板](/document/guides/detail)（*指得注意的是，由于本科生论文的模板要求较少，因此正文部分的诸多要求参照研究生学位论文进行编写*）

:::note
由于这本就是一个二次开发的版本，因此所有设置都遵循了 NENU 的论文标准，这里不提供文档来指引如何进行二次开发，如果有任何问题，请在仓库中提出 [Issue](https://github.com/virgiling/NENU-Thesis-Typst/issues)
:::
