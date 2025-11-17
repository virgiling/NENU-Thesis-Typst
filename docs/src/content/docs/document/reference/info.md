---
title: info 选项解释
---

# Info 参数

1. title: str | array, 论文中文题目，当需要换行/过长时可以使用字符数组传入

2. title-en: str, 论文英文题目

3. grade: str, 年级

4. student-id: str, 学号

5. author: str, 作者中文名

6. author-en: str, 作者英文名

7. secret-level: str, 密级中文

8. secret-level-en: str, 密级英文

9. department: str, 院系中文名

10. department-en: str, 院系英文名

11. discipline: str, 一级学科中文名

12. discipline-en: str, 一级学科英文名

13. major: str, 二级学科中文名

14. major-en: str, 二级学科英文名

15. field: str, 研究方向中文

16. field-en: str, 研究方向英文

17. supervisor: array, 导师信息(姓名, 职称)

18. supervisor-en: array, 导师英文信息

19. submit-date: str, 提交日期

20. school-code: str, 学校代码

21. reviewers: array, 论文评阅人，每个条目需包含以下字段:

    - name: str, 姓名
    - workplace: str, 工作单位/职称
    - evaluation: str, 总体评价

22. committee-members: array, 答辩委员会成员，每个条目都需包含以下字段:

    - name: str, 姓名
    - workplace: str, 工作单位/职称
    - title: str, 职务
