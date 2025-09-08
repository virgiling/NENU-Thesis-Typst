#import "../utils/style.typ": fonts_family, fonts_size
#import "../utils/distribute-text.typ": distr

#let declare(
  info: (:),
  fonts: (),
) = {
  fonts = fonts_family + fonts
  let originality-title-font = fonts.宋体
  let originality-title-size = fonts_size.三号
  let originality-content-font = fonts.宋体
  let originality-content-size = fonts_size.小四

  let box-inset = 0.5em
  let box-stroke = 0.5pt + black

  let small-box-height = 1.5em
  let small-box-width = 7em
  let small-box-stroke = 0.5pt + black

  let par_indent = 2em
  let par_leading = 1.5em

  let pad-x = 2em

  set pad(x: pad-x)

  set grid(
    align: center + horizon,
    inset: 0pt,
    columns: (0.7fr, 1fr) * 2,
  )

  box(
    stroke: box-stroke,
    height: 100%,
    width: 100%,
    inset: box-inset,
  )[
    #set text(
      font: originality-content-font,
      size: originality-content-size,
    )
    #set par(first-line-indent: par_indent, leading: par_leading)
    #set box(height: small-box-height, width: small-box-width, stroke: (bottom: small-box-stroke))

    #text(font: originality-title-font, size: originality-title-size, weight: "bold")[
      #v(3em)
      #set par(spacing: 2em)
      #set align(center)
      独　创　性　声　明
    ]

    #text()[
      本人郑重声明：所提交的学位论文是本人在导师指导下独立进行研究工作所取得的成果。据我所知，除了特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果。对本人的研究做出重要贡献的个人和集体，均已在文中作了明确的说明。本声明的法律结果由本人承担。

      #pad(
        grid(
          column-gutter: 0pt,
          grid.cell()[#distr("论文作者签名：")],
          grid.cell()[#box()[#info.author-sign]],
          grid.cell()[#distr("日期：")],
          grid.cell()[#box()[#info.originality-datetime]
          ],
        ),
      )


    ]

    #v(10em)

    #text(
      font: originality-title-font,
      size: originality-title-size,
      weight: "bold",
    )[
      #v(3em)
      #set par(spacing: 2em)
      #set align(center)
      #set align(center)
      学位论文使用授权书
    ]

    #text()[
      本学位论文作者完全了解东北师范大学有关保留、使用学位论文的规定，即：东北师范大学有权保留并向国家有关部门或机构送交学位论文的复印件和电子版，允许论文被查阅和借阅。本人授权东北师范大学可以将学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或其它复制手段保存、汇编本学位论文。

      （保密的学位论文在解密后适用本授权书）

      #pad()[
        #grid(
          [#distr("论文作者签名：")],
          [#box()[#info.author-sign]],
          [#distr("指导教师签名：")],
          [#box()[#info.supervisor-sign]],

          [#distr("日期：")],
          [#box()[#info.author-originality-datetime]],
          [#distr("日期：")],
          [#box()[#info.supervisor-originality-datetime]],
        )
      ]
    ]
  ]
}

#declare(
  fonts: (:),
  info: (
    author-sign: [],
    originality-datetime: [],
    supervisor-sign: [],
    author-originality-datetime: [],
    supervisor-originality-datetime: [],
  ),
)
