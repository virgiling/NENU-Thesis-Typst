---
title: 在论文中进行批注
---

我们推荐使用 [drafting](https://typst.app/universe/package/drafting/) 来做批注

本人的一般使用场景为写上一些 `todo` 或者 `fixme` 之类的提示，让自己看论文的时候能醒目一点，毕竟也不是时刻想盯着 `Typst` 代码

使用方式如下：

```typ ins={1} {"引入一个方便的函数": 3-7}
#import "@preview/drafting:0.2.2": inline-note, margin-note
// ...

#let todo(which_block, body) = margin-note(fill: orange.lighten(80%))[#if which_block == [] { "Start" } else {
  which_block
}][#text(
  size: .8em,
)[TODO: #body]]
```

然后，我们可以直接调用这个 `todo` 函数，如下所示：

```typ
#todo[这是一段被批注的文字][
  这是我的批注
]
```

展示效果如下

![image.png](https://virgil-civil-1311056353.cos.ap-shanghai.myqcloud.com/img/20251122222722470.png)


更多的使用可以查看包的文档，这里不再赘述。
