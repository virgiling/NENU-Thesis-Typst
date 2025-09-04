#import "../utils/style.typ": 字体, 字号
#import "../utils/distr.typ": v-distr

#let committee(
  info: (:),
  fonts: (),
) = {
  let font-family = 字体
  let font-size = 字号
  fonts = font-family + fonts
  let long_cell_height = 3em
  let cell_height = 2.7em
  let title_font = fonts.黑体
  let title_size = font-size.三号
  let cell_font = fonts.宋体
  let cell_size = font-size.小四
  let weight_style = "bold"

  [
    #set align(center)
    #set text(font: title_font, size: title_size)
    #set par(leading: 1.5em)
    #v(48pt)
    学位论文评阅专家及答辩委员会人员信息
    #v(24pt)
  ]
  set text(font: cell_font, size: cell_size)
  stack(dir: ttb)[
    #block(inset: 0pt, spacing: 0pt)[
      #table(
        align: center + horizon,
        rows: (long_cell_height,) * 3,
        columns: (3em, 1fr),
        table.cell()[#text(weight: weight_style)[论文 #linebreak() 题目]], [#info.title],
        table.cell()[#text(weight: weight_style)[作者 #linebreak() 姓名]], [#info.author],
        table.cell()[#text(weight: weight_style)[指导 #linebreak() 教师]], [#info.supervisor],
      )]
    #block(inset: 0pt, spacing: 0pt)[
      #table(
        stroke: (top: none),
        align: center + horizon,
        rows: (cell_height,) * 6,
        columns: (3em, 1fr, 1fr, 1fr),
        table.cell(rowspan: 6)[
          #set text(weight: weight_style)
          #v-distr("论文评阅人")
        ],
        table.cell()[#text(weight: weight_style)[姓 名]],
        table.cell()[#text(weight: weight_style)[工作单位/职称]],
        table.cell()[#text(weight: weight_style)[总体评价]],
        table.cell()[#info.reviewers.at(0).name],
        table.cell()[#info.reviewers.at(0).workplace],
        table.cell()[#info.reviewers.at(0).evaluation],
        table.cell()[#info.reviewers.at(1).name],
        table.cell()[#info.reviewers.at(1).workplace],
        table.cell()[#info.reviewers.at(1).evaluation],
        table.cell()[#info.reviewers.at(2).name],
        table.cell()[#info.reviewers.at(2).workplace],
        table.cell()[#info.reviewers.at(2).evaluation],
        table.cell()[#info.reviewers.at(3).name],
        table.cell()[#info.reviewers.at(3).workplace],
        table.cell()[#info.reviewers.at(3).evaluation],
        table.cell()[#info.reviewers.at(4).name],
        table.cell()[#info.reviewers.at(4).workplace],
        table.cell()[#info.reviewers.at(4).evaluation],
      )
    ]
    #block(inset: 0pt, spacing: 0pt)[
      #table(
        stroke: (top: none),
        align: center + horizon,
        rows: (cell_height,) * 8,
        columns: (3em, 1fr, 1fr, 1fr),
        table.cell(rowspan: 8)[
          #set text(weight: weight_style)
          #v-distr("学位论文答辩委员会")
        ],
        table.cell()[#text(weight: weight_style)[姓 名]],
        table.cell()[#text(weight: weight_style)[工作单位]],
        table.cell()[#text(weight: weight_style)[职 称]],
        table.cell(rowspan: 7, colspan: 3, inset: 0pt)[
          #block(inset: 0pt, spacing: 0pt)[
            #table(
              stroke: (top: none, left: none),
              columns: (0.2fr, 0.8fr, 1fr, 1fr),
              align: center + horizon,
              rows: (cell_height,) * 7,
              table.cell()[#text(weight: weight_style)[主#linebreak()席]],
              table.cell()[#info.committee-members.at(0).name],
              table.cell()[#info.committee-members.at(0).workplace],
              table.cell()[#info.committee-members.at(0).title],
              table.cell(rowspan: 6)[#text(weight: weight_style)[委#linebreak() 员]],
              table.cell()[#info.committee-members.at(1).name],
              table.cell()[#info.committee-members.at(1).workplace],
              table.cell()[#info.committee-members.at(1).title],
              table.cell()[#info.committee-members.at(2).name],
              table.cell()[#info.committee-members.at(2).workplace],
              table.cell()[#info.committee-members.at(2).title],
              table.cell()[#info.committee-members.at(3).name],
              table.cell()[#info.committee-members.at(3).workplace],
              table.cell()[#info.committee-members.at(3).title],
              table.cell()[#info.committee-members.at(4).name],
              table.cell()[#info.committee-members.at(4).workplace],
              table.cell()[#info.committee-members.at(4).title],
            )
          ]
        ],
      )
    ]
  ]
}


#committee(
  info: (
    title: "论文题目",
    author: "作者姓名",
    supervisor: "指导教师",
    reviewers: (
      (name: "张三", workplace: "工作单位", evaluation: "总体评价"),
      (name: "李四", workplace: "工作单位", evaluation: "总体评价"),
      (name: "王五", workplace: "工作单位", evaluation: "总体评价"),
      (name: "赵六", workplace: "工作单位", evaluation: "总体评价"),
      (name: "孙七", workplace: "工作单位", evaluation: "总体评价"),
    ),
    committee-members: (
      (name: "张三", workplace: "工作单位", title: "职称"),
      (name: "李四", workplace: "工作单位", title: "职称"),
      (name: "王五", workplace: "工作单位", title: "职称"),
      (name: "赵六", workplace: "工作单位", title: "职称"),
      (name: "孙七", workplace: "工作单位", title: "职称"),
    ),
  ),
  fonts: (:),
)
