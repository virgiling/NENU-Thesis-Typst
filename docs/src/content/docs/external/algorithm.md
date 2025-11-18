---
title: 如何在论文中展示算法
---

我们推荐使用 [lovelace](https://typst.app/universe/package/lovelace) 来书写伪代码，主要使用提供的  `pseudocode-list` 函数

在我们的模板中，用法如下：

```typ ins={1} {"伪代码与 Figure 的嵌套": 3-25}
#import "@preview/lovelace:0.3.0": line-label, pseudocode-list
//

#figure(
  kind: "algorithm",
  pseudocode-list(
    indentation: 1em,
    hooks: .5em,
    booktabs: true,
    title: [*@alg:cdcl-algo:*CDCL 算法],
  )[
    - *输入:* 一个 CNF 公式
    - *输出:* 结果 UNSAT 或 SAT，表示公式是否可满足
    + *while* _true_ *do*
      + conf $arrow.l$ _bcp_()
      + *if* conf $eq.not emptyset$ *then*
        + bl $arrow.l$ *analyze*(conf)
        + *if* bl $lt 0$ *then* *return* UNSAT
        + _brackjump_(bl)
      + *else*
        + v $arrow.l$ _decide_()
        + *if* v $eq 0$ *then return* SAT
  ],
  caption: [CDCL 算法框架伪代码],
)<cdcl-algo>
```

其效果如下图所示：

![image.png](https://virgil-civil-1311056353.cos.ap-shanghai.myqcloud.com/img/20251118165007904.png)

:::note
注意，这里我们使用的是 `title: [*@alg:cdcl-algo:*CDCL 算法],`，这是因为如果使用 `numbered-title` 的话会导致编号错误（会是与章节无关的编号）
:::

正如上文所示，我们通过 `@alg:cdcl-algo` 来引用这个伪代码，根据标签的不同，只需要在标签前加上 `alg:` 即可（这是在我们模板内嵌入的）