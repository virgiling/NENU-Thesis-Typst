---
title: pubs 参数说明
---

# pubs 参数

论文创新性成果列表，支持数组嵌套格式，每个成果项为一个字典，包含以下字段:

1. name: str, 成果名称

2. class: str, 成果类别，如"学术论文"、"专利"等

3. publisher: str, 发表单位/期刊名称

4. public-time: str, 发表时间，格式为"YYYY-MM"

5. author-order: str, 作者排序，如"1"表示第一作者

# 示例

```typst
pubs: (
  (
    name: "论文名称1",
    class: "学术论文",
    publisher: "NENU",
    public-time: "2025-09",
    author-order: "1",
  ),
  (
    name: "论文名称2",
    class: "学术论文",
    publisher: "NENU",
    public-time: "2025-10",
    author-order: "3",
  ),
)
```

此示例定义了两篇论文成果。支持添加多个成果项，每项需包含上述所有必要字段。
