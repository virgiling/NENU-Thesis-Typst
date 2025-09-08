// 前言，重置页面计数器
#import "../utils/style.typ": fonts_family, fonts_size

#let preface(
  // documentclass 传入的参数
  twoside: false,
  ..args,
  it,
) = {
  // 分页
  if twoside {
    pagebreak() + " "
  }
  counter(page).update(0)

  set page(numbering: "I", footer: [
    #set align(center)
    #set text(font: fonts_family.宋体, size: fonts_size.五号)
    #context counter(page).display("I")
  ])

  it
}
