---
title: 在论文中展示证明与推理过程
---

:::note
这个需求可能比较小众，但是因为开发者用了，所以一并写上
:::

我们推荐使用 [curryst](https://typst.app/universe/package/curryst) 来描述证明过程，这个在模板中会被描述为公式，用法如下图所示：

```typ ins={1} {"证明树：归结的定义": 3-6}
#import "@preview/curryst:0.5.1": prooftree, rule
//

$
  #prooftree(rule($C or C^prime$, $C or x$, $overline(x) or C^prime$))
$<resolution>
```

显示的效果如下：

![image.png](https://virgil-civil-1311056353.cos.ap-shanghai.myqcloud.com/img/20251118170831299.png)

可以通过 `@eqt:resolution` 来引用这个公式