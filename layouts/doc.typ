#import "../utils/custom-cuti.typ"
#import "@preview/itemize:0.2.0" as el

/// 文稿设置
/// 用于设置 PDF 的全局选项以及元数据
#let doc(
  /// 论文与作者信息，通过 @@thesis() 传入
  info: (:),
  print: false,
  /// 字体设置
  /// 是否在字体缺失时使用 fallback，以防显示豆腐块
  fallback: false,
  /// 论文语言设置
  lang: "zh",
  /// 页面边距设置
  margin: (top: 2cm, bottom: 2cm, left: 2.5cm, right: 2.5cm),
  it,
) = {
  info = (
    (
      title: "基于 Typst 的东北师范大学学位论文模板",
      author: "张三",
    )
      + info
  )

  if type(info.title) == str {
    info.title = info.title.split("\n")
  }

  set text(fallback: fallback, lang: lang)

  // FIXME - 如果系统上存在字体的粗体，不能启用，否则需要启用
  // show strong: custom-cuti.cn-fakebold

  if print {
    set page(paper: "a4", margin: (top: 2cm, bottom: 2cm, inside: 0cm, outside: 2.5cm))
  } else {
    set page(paper: "a4", margin: margin)
  }

  set document(
    title: (("",) + info.title).sum(),
    author: info.author,
  )

  //? 多级列表显示
  set enum(numbering: "(1).(a)")
  show: el.paragraph-enum-list.with(indent: 2em, hanging-indent: -2em)

  it
}
