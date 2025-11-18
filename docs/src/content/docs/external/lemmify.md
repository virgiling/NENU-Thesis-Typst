---
title: 更好的展示定义与定理
---

我们推荐使用 [lemmify](https://typst.app/universe/package/lemmify)，但在使用前需要进行配置：

```typ {"配置编号格式": 2-21}
#import "@preview/lemmify:0.1.8": *

#let my-thm-style(
  thm-type,
  name,
  number,
  body,
) = block(width: 100%, breakable: true)[#{
  set align(left)

  strong(thm-type) + " "
  if number != none {
    let n = number.split(".").map(s => s.trim()).join(".")
    strong(n) + " "
  }

  if name != none {
    strong[(#name)] + " "
  }
  " " + body
}]

#let (
  theorem,
  lemma,
  proof,
  rules: thm-rules-thm,
) = default-theorems(
  "thm-group-thm",
  lang: "zh",
  thm-numbering: thm-numbering-heading.with(max-heading-level: 1),
  thm-styling: my-thm-style,
)

#let (definition, corollary, proposition, rules: thm-rules-def) = default-theorems(
  "thm-group-def",
  lang: "zh",
  thm-numbering: thm-numbering-heading.with(max-heading-level: 1),
  thm-styling: my-thm-style,
)

#let (
  remark,
  example,
  rules: thm-rules-example,
) = default-theorems(
  "thm-group",
  lang: "zh",
  thm-numbering: thm-numbering-heading.with(max-heading-level: 2),
  thm-styling: my-thm-style,
)
```

后面主要是进行分组，不同组的编号不连续

接着，在每个需要写定理的文件（如果是一个文件的话，在这个文件即可）引入（注意是需要在定义完前文的内容后）：

```typ
#show: thm-rules-thm
#show: thm-rules-def
#show: thm-rules-example
```

这样，我们就可以应用格式了，例如定义：

```typ
#definition(name: "合取范式")[
  *合取范式*（Conjunctive Normal Form，简称 CNF）为子句的
  合取（形如 $c_1 and c_2 and dots and c_m$），一般记作 $psi, cal(F)$ 等符号。
  CNF 满足当且仅当所有其子句都满足。
]
```

展示如下：

![image.png](https://virgil-civil-1311056353.cos.ap-shanghai.myqcloud.com/img/20251118170334859.png)

:::tip
分组是自定义的内容，可以选择自己需要的分类进行分组，也可以删除一些不需要的盒子（有很多多余），例如我就只使用了 `definition`, `example`, `theorem`, `lemma`
:::
