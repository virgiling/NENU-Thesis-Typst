---
title: comments 参数说明
---

# 参数

1. comments: dict， 博士论文评语与决议书内容配置参数

  1. supervisor: str， 导师评语内容

  2. committee: str， 答辩委员会决议书内容


# 示例

```typst
comments: (
  supervisor: "导师的评语",
  committee: "委员会的评语",
)
```

:::note
此参数仅在博士论文模板中使用，其他类型论文将忽略此参数。
:::