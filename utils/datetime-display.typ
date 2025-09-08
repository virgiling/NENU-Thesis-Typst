//! Reference: https://github.com/nju-lug/modern-nju-thesis
// 显示中文日期（不包含日期）
#let datetime-display-without-day(date) = {
  date.display("[year] 年  [month]  月")
}

// 显示中文日期
#let datetime-display(date) = {
  date.display("[year] 年 [month] 月 [day] 日 ")
}

// 显示英文日期
#let datetime-en-display(date) = {
  date.display("[year], [month]")
}
