#import "../utils/datetime-display.typ": datetime-display-without-day
#import "../utils/style.typ": 字体, 字号

//! 本科生封面
#let bachelor-cover(
  //? thesis 传入的参数
  anonymous: false,
  twoside: false,
  fonts: (:),
  info: (:),
  //? 其他参数
  stoke-width: 0.5pt,
  min-title-lines: 2,
  info-inset: (x: 0pt, bottom: 1pt),
  info-key-width: 72pt,
  info-key-font: "宋体",
  info-value-font: "宋体",
  column-gutter: -3pt,
  row-gutter: 11.5pt,
  anonymous-info-keys: ("grade", "student-id", "author", "supervisor", "supervisor-ii"),
  bold-info-keys: ("title",),
  bold-level: "bold",
  datetime-display: datetime-display-without-day,
) = {
  //! 1.  默认参数
  fonts = 字体 + fonts
  info = (
    (
      title: "基于 Typst 的毕业论文中文题目",
      title-en: "My Title in English",
      grade: "20XX",
      student-id: "1234567890",
      author: "张三",
      department: "某学院",
      major: "某专业",
      supervisor: ("李四", "教授"),
      submit-date: datetime.today(),
    )
      + info
  )

  //! 2.  对参数进行处理
  //! 2.1 如果是字符串，则使用换行符将标题分隔为列表
  if type(info.title) == str {
    info.title = info.title.split("\n")
  }
  //! 2.2 根据 min-title-lines 填充标题
  info.title = info.title + range(min-title-lines - info.title.len()).map(it => "　")
  //! 2.3 处理提交日期
  if type(info.submit-date) == datetime {
    info.submit-date = datetime-display(info.submit-date)
  }

  //! 3.  内置辅助函数
  let info-key(body) = {
    rect(
      width: 100%,
      inset: info-inset,
      stroke: none,
      text(
        font: fonts.at(info-key-font, default: "宋体"),
        size: 字号.三号,
        body,
      ),
    )
  }

  let info-value(key, body) = {
    set align(center)
    rect(
      width: 100%,
      inset: info-inset,
      stroke: (bottom: stoke-width + black),
      text(
        font: fonts.at(info-value-font, default: "宋体"),
        size: 字号.三号,
        weight: if key in bold-info-keys { bold-level } else { "regular" },
        bottom-edge: "descender",
        body,
      ),
    )
  }

  let info-long-value(key, body) = {
    grid.cell(colspan: 2, info-value(
      key,
      if anonymous and (key in anonymous-info-keys) {
        "██████████"
      } else {
        body
      },
    ))
  }

  // 4.  正式渲染

  pagebreak(weak: true, to: if twoside { "odd" })

  pad(left: 2em)[
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 9em,
      text(size: 字号.小四, font: fonts.宋体)[
        *学校代码：#info.school-code*
      ],
      text(size: 字号.小四, font: fonts.宋体)[
        *学号：#info.student-id*
      ],
    )
  ]


  v(22pt)

  set align(center)

  //! 校徽 & 校名 & 类型
  image("../assets/nenu-logo-blue.svg", width: 90pt, format: "svg")

  pad(image("../assets/nenu-title.svg", width: 126pt), top: 0cm, bottom: -0.8cm)


  text(size: 字号.小一, font: fonts.黑体, weight: "medium")[本科毕业论文]

  v(30pt)

  //! 标题
  text(size: 字号.二号, font: fonts.隶书, weight: "bold")[
    #for line in info.title {
      line
    }
  ]

  v(3pt)

  text(size: 字号.三号, font: fonts.宋体)[
    #info.title-en
  ]

  v(40pt)

  //! 作者信息
  pad(
    left: 20pt,
    block(width: 318pt, grid(
      columns: (info-key-width, info-key-width, 1fr),
      rows: 4,
      column-gutter: column-gutter,
      row-gutter: row-gutter,
      info-key("学生姓名："), info-long-value("author", info.author), info-key("指导教师："),
      info-long-value("supervisor", info.supervisor.at(0)),

      info-key("所在学院："), info-long-value("department", info.department), info-key("所学专业："),
      info-long-value("major", info.major),
    )),
  )

  v(70pt)

  grid(
    rows: 2,
    row-gutter: 10pt,
    text(size: 字号.小三, font: fonts.宋体)[
      东北师范大学
    ],
    text(size: 字号.小三, font: fonts.宋体)[
      #info.submit-date
    ],
  )
}
