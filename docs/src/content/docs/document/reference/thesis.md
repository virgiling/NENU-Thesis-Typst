---
title: thesis 参数说明
---


:::note
有关 `info` 的相关说明，请参考 [info的各个选项说明](/document/reference/info/)
:::

# thesis 参数说明

1. doctype: str, 文档类型，可选择的值为 "bachelor" | "master" | "doctor"，分别表示本科 | 硕士 | 博士

2. degree: str, 学位类型，只有硕士以上的学位才可以选择，值为 "academic"（学术型）| "professional"（专业型）

3. twoside: bool, 双面模式，会在每一个部分后加入空白页，便于打印

4. anonymous: bool, 盲审模式，隐藏学校/作者/导师等一切信息，满足盲审要求

5. print: bool, 启用打印选项，启用后会使用适合打印的页面设置，如页边距等

6. bibliography: function, 参考文献函数，一般传入值为 `bibliography.with("ref.bib")`，其中 `ref.bib` 是 biblatex 文件的路径

7. fonts: dictionary, 自定义字体。在模板中我们加入了一些默认值，这里用于添加自定义的字体，但注意需要满足以下格式：`fonts = ( 宋体: ("Times New Romans"), 黑体: ("Arial"), 楷体: ("KaiTi"), 仿宋: ("FangSong"), 等宽: ("Courier New"))`

8. info: dictionary, 论文以及个人信息

    - title: str, 论文中文题目
    - title-en: str, 论文英文题目
    - grade: str, 年级
    - student-id: str, 学号
    - author: str, 作者中文名
    - author-en: str, 作者英文名
    - secret-level: str, 密级中文
    - secret-level-en: str, 密级英文
    - department: str, 院系中文名
    - department-en: str, 院系英文名
    - discipline: str, 一级学科中文名
    - discipline-en: str, 一级学科英文名
    - major: str, 二级学科中文名
    - major-en: str, 二级学科英文名
    - field: str, 研究方向中文
    - field-en: str, 研究方向英文
    - supervisor: array, 导师信息(姓名, 职称)
    - supervisor-en: array, 导师英文信息
    - submit-date: str, 提交日期
    - school-code: str, 学校代码
    - reviewers: array, 论文评阅人，每个条目需包含以下字段：
      - name: str, 姓名
      - workplace: str, 工作单位/职称
      - evaluation: str, 总体评价
    - committee-members: array, 答辩委员会成员，每个条目需包含以下字段：
      - name: str, 姓名
      - workplace: str, 工作单位/职称
      - title: str, 职务

