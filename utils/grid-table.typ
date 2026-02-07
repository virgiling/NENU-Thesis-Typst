#import "style.typ": font-family, font-size

// ==========================================
// 1. 基础样式层：控制字体、对齐、段落
// ==========================================
#let gtable(..args) = {
  set grid.cell(align: center)
  // 设置单元格内文字排版：取消首行缩进，设置行间距
  show grid.cell: set par(first-line-indent: 0pt, leading: 1.2em, spacing: 0pt, justify: true)
  show grid.cell: set text(font: font-family.宋体, size: font-size.五号)

  grid(..args)
}

// ==========================================
// 2. 结构样式层：处理三线表逻辑
// ==========================================
#let three-line-table(..args) = {
  let pos-args = args.pos()
  if pos-args.len() == 0 { return }

  let named-args = args.named()

  // 自动计算列数，以确定表头范围
  let cols_arg = named-args.at("columns", default: 1)
  let col-count = if type(cols_arg) == int { cols_arg } else { cols_arg.len() }

  // 提取表头（第一行）和主体
  let header-row = pos-args.slice(0, col-count)
  let body-rows = pos-args.slice(col-count)

  gtable(
    ..named-args,
    stroke: none, // 三线表隐藏默认边框
    // 包装表头：支持跨页自动重复
    grid.header(
      grid.hline(y: 0, stroke: 1.5pt), // 顶线
      ..header-row.map(h => strong(h)),
      grid.hline(y: 1, stroke: 1.5pt), // 栏目线
    ),
    ..body-rows,
    grid.hline(stroke: 1pt), // 底线
  )
}

// 3. 自动化高亮表格：基于 Rule 自动识别与标记
#let highlight-table(
  rules: (:),
  ..args,
) = {
  let pos-args = args.pos()
  let named-args = args.named()
  if pos-args.len() == 0 { return }

  // 解析列数
  let cols_arg = named-args.at("columns", default: 1)
  let col-count = if type(cols_arg) == int { cols_arg } else { cols_arg.len() }

  // 提取 Body 每一行
  let rows = ()
  for i in range(0, pos-args.len(), step: col-count) {
    rows.push(pos-args.slice(i, calc.min(i + col-count, pos-args.len())))
  }
  let headers = rows.at(0)
  let body = rows.slice(1)

  // 辅助函数：提取数值用于比较
  let get-val(cell) = {
    if type(cell) == array { cell.at(0) } else if type(cell) in (int, float) { cell } else { none }
  }

  // 计算每列的最值
  let targets = (:)
  for (col-idx-str, rule) in rules {
    let col-idx = int(col-idx-str)
    let col-values = body.map(r => get-val(r.at(col-idx))).filter(v => v != none)
    if col-values.len() > 0 {
      targets.insert(col-idx-str, if rule == "min" { calc.min(..col-values) } else { calc.max(..col-values) })
    }
  }

  // 格式化单元格并应用高亮
  let processed-body = body.map(row => {
    row
      .enumerate()
      .map(((c-idx, cell)) => {
        let val = get-val(cell)
        let target = targets.at(str(c-idx), default: none)

        let content = if type(cell) == array {
          $#cell.at(0) plus.minus #cell.at(1)$
        } else if type(cell) in (float, int) {
          $#cell$
        } else {
          cell
        }

        // 核心：若值等于计算出的 target 则加粗
        if target != none and val == target { strong(content) } else { content }
      })
  })

  // 渲染
  three-line-table(
    ..named-args,
    ..headers,
    ..processed-body.flatten(),
  )
}