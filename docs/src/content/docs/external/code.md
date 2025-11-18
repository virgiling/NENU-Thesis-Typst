---
title: 在论文中展示代码
---

我们推荐使用 [Codly](https://typst.app/universe/package/codly) 来展示代码，这个包提供了更美观以及更多自定义的选项（虽然我们可能会禁用很多图标，但是不影响我们选择它）

其使用方式如下所示：

```typ ins={1-4} {"在论文模板中的使用": 6-15}
#import "@preview/codly:1.3.0": codly, codly-init
#import "@preview/codly-languages:0.1.8": *
#show: codly-init.with()
#codly(languages: codly-languages, display-icon: false, display-name: false)
//

#figure(
  ```CNF
  c comment
  p cnf 3 2
  1 3 0
  -1 2 0
  ```,
  caption: [DIMACS 文件格式],
)<dimacs-format>
```

效果如下：

![image.png](https://virgil-civil-1311056353.cos.ap-shanghai.myqcloud.com/img/20251118165628212.png)

我们禁用了图标（在论文中会显得过于花哨）

如果我们需要引用，那么需要加上 `lst:`，例如这里为 `@lst:dimacs-format`