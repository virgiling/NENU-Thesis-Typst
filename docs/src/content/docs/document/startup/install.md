---
title: 安装
sidebar:
    order: 2
---

:::caution
需要保证你拥有 `LiSu`（隶书）这个字体模板才能够正常渲染，而官方的服务器在字体上对中文支持并不是很好，因此我们推荐第二种方式进行开发
:::

## 在线安装

:::note[更新提示]
目前大多数更新可能不会立刻发布到官方源，推荐完全离线使用，参考[指南](#完全离线)
:::

你可以在 [官方WebAPP](https://typst.app/) 上注册账号免费在线编辑，具体而言：

在 [Typst 的官方库](https://typst.app/universe/) 中搜索 `modern-nenu-thesis` 即可找到模板（或直接访问 [modern-nenu-thesis](https://typst.app/universe/package/modern-nenu-thesis)）

通过官方提供的 `Create project in App` 选项，我们可以创建一个使用此模板的项目，文件仅包含 `template` 中的：

- `fig/`: 用于存放图片文件
- `ref.bib`: 为 `biblatex` 数据库
- `thesis.typ`: 为论文文件

:::tip[如果不想使用单个文件书写]
在 [多文件书写](/document/guides/decompose) 中介绍了如何将论文拆分为多个文件，并统一导入管理
:::

## 本地使用

首先我们需要在本地下载 `Typst` 的编译器，具体操作参考 [官方指引](https://github.com/typst/typst)

这样，我们就可以通过命令（注意版本号），使用这个模板来创建一个项目：

```sh
typst init @preview/modern-nenu-thesis:0.1.0
```

我们推荐使用 `VS Code` 配合插件 `Tinymist` 进行编辑，打开 `template/thesis.typ` 进行预览即可

## 完全离线 (⭐️)

你可以通过 `git` 来克隆本仓库（或者下载压缩包）：

```sh
git clone git@github.com:virgiling/NENU-Thesis-Typst.git modern-nenu-thesis
```

在 `modern-nenu-thesis` 中即可开始编辑，编辑的方式与本地使用一致

:::note
离线使用的话有福利（虽然也不算真的福利），你可以使用 `other` 文件夹中的模板，这些模板都是单页使用（但会使用 `assets` 中的一些文件），你可以直接打开这些模板文件，然后进行预览：

- 实验报告模板 (lab-report.typ)
- 研究生/博士生 开题报告模板 (master-proposal.typ)
:::
