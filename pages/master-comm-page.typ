#import "../utils/style.typ": fonts_family, fonts_size
#import "../utils/distribute-text.typ": v-distr

#let committee(
  info: (:),
  fonts: (),
) = {
  fonts = fonts_family + fonts
  let long_cell_height = 3em
  let cell_height = 2.7em
  let title_font = fonts.黑体
  let title_size = fonts_size.三号
  let cell_font = fonts.宋体
  let cell_size = fonts_size.小四
  let weight_style = "bold"
  let num_reviewers = info.reviewers.len()
  let num_committee_members = info.committee-members.len()

  // 列宽定义
  let label_col_width = 3em // 标签列宽度（如"论文题目"、"论文评阅人"等）
  let role_col_width = 0.2fr // 角色列宽度（主席、委员）
  let name_col_width = 0.8fr // 姓名列宽度
  let workplace_col_width = 1fr // 工作单位列宽度
  let evaluation_col_width = 1fr // 评价/职称列宽度

  // 网格样式
  let grid_stroke_style = 1pt + black
  let grid_cell_align = center + horizon
  let label_col_grid_cell_inset = (top: 1em, bottom: 1em)
  show grid: it => {
    set text(font: cell_font, size: cell_size)
    set align(grid_cell_align)
    it
  }


  [
    #set align(center)
    #set text(font: title_font, size: title_size)
    #set par(leading: 1.5em)
    #v(48pt)
    学位论文评阅专家及答辩委员会人员信息
    #v(24pt)
  ]

  let get_stroke(sides: ("top", "bottom", "left", "right")) = {
    let result = (top: none, bottom: none, left: none, right: none)
    for side in sides {
      result.insert(side, grid_stroke_style)
    }
    result
  }

  grid(
    rows: (long_cell_height,) * 3 + (cell_height,) * 14,
    columns: (label_col_width, role_col_width, name_col_width, workplace_col_width, evaluation_col_width),
    stroke: get_stroke(sides: ("top", "left", "right", "bottom")),
    grid.cell()[#text(weight: weight_style)[论文 #linebreak() 题目]], grid.cell(colspan: 4)[#info.title],
    grid.cell()[#text(weight: weight_style)[作者 #linebreak() 姓名]], grid.cell(colspan: 4)[#info.author],
    grid.cell()[#text(weight: weight_style)[指导 #linebreak() 教师]], grid.cell(colspan: 4)[#info.supervisor],

    grid.cell(rowspan: 6, inset: label_col_grid_cell_inset)[
      #set text(weight: weight_style)
      #v-distr("论文评阅人")
    ],
    grid.cell(colspan: 2)[#text(weight: weight_style)[姓 名]],
    grid.cell()[#text(weight: weight_style)[工作单位/职称]],
    grid.cell()[#text(weight: weight_style)[总体评价]],
    ..for i in range(0, num_reviewers) {
      (
        grid.cell(colspan: 2)[#info.reviewers.at(i).name],
        grid.cell()[#info.reviewers.at(i).workplace],
        grid.cell()[#info.reviewers.at(i).evaluation],
      )
    },
    grid.cell(rowspan: 8, inset: label_col_grid_cell_inset)[
      #set text(weight: weight_style)
      #v-distr("学位论文答辩委员会")
    ],
    grid.cell(colspan: 2)[#text(weight: weight_style)[姓 名]],
    grid.cell()[#text(weight: weight_style)[工作单位]],
    grid.cell()[#text(weight: weight_style)[职 称]],

    grid.cell()[#text(weight: weight_style)[主#linebreak()席]],
    grid.cell()[#info.committee-members.at(0).name],
    grid.cell()[#info.committee-members.at(0).workplace],
    grid.cell()[#info.committee-members.at(0).title],
    grid.cell(rowspan: 6)[#text(weight: weight_style)[委#linebreak() 员]],

    ..for i in range(1, num_committee_members) {
      (
        grid.cell()[#info.committee-members.at(i).name],
        grid.cell()[#info.committee-members.at(i).workplace],
        grid.cell()[#info.committee-members.at(i).title],
      )
    },
  )
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
