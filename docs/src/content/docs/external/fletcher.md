---
title: 在论文中绘制流程图
---

这里我们推荐使用 `fletcher`，可以说是 `CeTZ` 的一个简略版本，在论文中，使用方法如下：


```typ ins={1} {"使用 fletcher 绘制流程图":3-29}
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
// Other Code

#figure(
  diagram(
    edge-stroke: 1pt,
    node-stroke: 1pt,
    label-size: .8em,
    {
      node((2, 0.3), name: <input>)
      node((2, 1), name: <bcp>)[单元传播]
      node((0, 2.3), name: <decide>)[决策]
      node((2, 2.3), name: <conf>)[冲突分析]
      node((4, 2.3), name: <bl>)[回跳]
      node((0, 3.5), stroke: none, name: <sat>)[SAT]
      node((2, 3.5), stroke: none, name: <unsat>)[UNSAT]

      edge(<input>, <bcp>, "->")
      edge(<bcp>, <conf>, "->", label-side: center)[存在冲突]
      edge(<bcp>, <decide>, "->", label-side: center)[无冲突]
      edge(<decide>, (0, 1), <bcp>, "->", label-side: left, label-pos: 55%)[选择一个自由变量赋值]
      edge(<decide>, <sat>, "->", label-side: center)[无自由变量]
      edge(<conf>, <unsat>, "->", label-side: center)[$"bl" lt 0$]
      edge(<conf>, <bl>, "->")[$"bl" gt.eq 0$]
      edge(<bl>, (4, 1), <bcp>, "->", label-side: right, label-pos: 55%)[撤销一组变量的赋值]
    },
  ),
  caption: [CDCL 算法框架],
)<cdcl-diagram>
```

其效果如下图所示：

![fletcher 效果图](https://virgil-civil-1311056353.cos.ap-shanghai.myqcloud.com/img/20251118012802677.png)

我们如果要引用这个流程图，与正常的引用图片一样：`@fig:cdcl-diagram` 


:::note
除去流程图外，还可以绘制很多其他图片，使用这个主要是比直接用 `CeTZ` 简单，但想要更多自定义的图像的话，还是选用自由度更高的 [CeTZ](https://typst.app/universe/package/cetz)
:::

更多的内容参考 [文档](https://typst.app/universe/package/fletcher/)


