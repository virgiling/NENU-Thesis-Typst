#import "style.typ": module, project

#set text(lang: "zh")

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

= 页面文档

我们通过此文件中定义的函数进行论文的书写，输入参数后，函数会返回对应的模板

#module(
  read("../lib.typ"),
  name: "Lib",
)


= 工具函数与变量

#module(
  read("../utils/style.typ"),
  name: "字体与字号",
)

#module(
  read("../utils/unpairs.typ"),
  name: "aaaa",
)

