#import "@preview/itemize:0.2.0" as el

//! Reference: https://github.com/nju-lug/modern-nju-thesis
/// 字号
/// 由 Word中的单位映射到磅数
/// -> dictionary
#let font-size = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  中四: 13pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  小七: 5pt,
)

/// 字体默认值
/// -> dictionary
#let font-family = (
  //! 宋体，属于「有衬线字体」，一般可以等同于英文中的 Serif Font
  //? 这一行分别是「新罗马体（有衬线英文字体）」、「思源宋体（简体）」、「思源宋体」、「宋体（Windows）」、「宋体（MacOS）」
  宋体: (
    (name: "Times New Roman", covers: "latin-in-cjk"),
    "Source Han Serif SC",
    "Source Han Serif",
    "Noto Serif CJK SC",
    "SimSun",
    "Songti SC",
    "STSongti",
  ),
  //! 黑体，属于「无衬线字体」，一般可以等同于英文中的 Sans Serif Font
  //? 这一行分别是「Arial（无衬线英文字体）」、「思源黑体（简体）」、「思源黑体」、「黑体（Windows）」、「黑体（MacOS）」
  黑体: (
    (name: "Arial", covers: "latin-in-cjk"),
    "Source Han Sans SC",
    "Source Han Sans",
    "Noto Sans CJK SC",
    "SimHei",
    "Heiti SC",
    "STHeiti",
  ),
  //! 楷体
  楷体: ((name: "Times New Roman", covers: "latin-in-cjk"), "KaiTi", "Kaiti SC", "STKaiti", "FZKai-Z03S"),
  //! 仿宋
  仿宋: ((name: "Times New Roman", covers: "latin-in-cjk"), "FangSong", "FangSong SC", "STFangSong", "FZFangSong-Z02S"),
  //! 等宽字体，用于代码块环境，一般可以等同于英文中的 Monospaced Font
  //? 这一行分别是「Courier New（Windows 等宽英文字体）」、「思源等宽黑体（简体）」、「思源等宽黑体」、「黑体（Windows）」、「黑体（MacOS）」
  等宽: (
    (name: "Courier New", covers: "latin-in-cjk"),
    (name: "Menlo", covers: "latin-in-cjk"),
    (name: "IBM Plex Mono", covers: "latin-in-cjk"),
    "Source Han Sans HW SC",
    "Source Han Sans HW",
    "Noto Sans Mono CJK SC",
    "SimHei",
    "Heiti SC",
    "STHeiti",
  ),
  //! 隶书
  隶书: (
    "LiSu",
  ),
)


#let master-comm-page(
  info: (:),
  fonts: (:),
  section-1: [],
  section-2: [],
  section-3: [],
  section-4: [],
  section-6: [],
  reference: "reference.bib",
  reference-style: "gb-7714-2005-numeric",
) = {
  show: el.default-enum-list.with(bottom-edge: "baseline")

  info = (
    (
      title: "论文题目",
      author: "作者姓名",
      student-id: "学号",
      major: "专业",
    )
      + info
  )

  fonts = font-family + fonts

  // show strong: fakebold

  let get-stroke(sides: ("top", "bottom", "left", "right")) = {
    let result = (top: none, bottom: none, left: none, right: none)
    for side in sides {
      result.insert(side, .5pt + black)
    }
    result
  }

  show grid: it => {
    set text(font: fonts.宋体, size: font-size.五号)
    set align(center)
    it
  }

  show grid.cell: it => {
    set text(font: fonts.宋体, size: font-size.五号)
    set block(above: 1.5em, below: 1.5em)
    set par(leading: 1.2em, spacing: 1em)
    it
  }

  let info_value = (key, body) => {
    body
  }

  [
    #set align(center)
    #set text(font: fonts.黑体, size: font-size.三号)
    #set par(leading: 1.5em)
    #v(24pt)
    *东北师范大学本科生毕业论文开题报告*
    #v(48pt)
  ]

  grid(
    stroke: get-stroke(sides: ("top", "left", "right", "bottom")),
    columns: (6em, .75fr, 6em, .75fr, 6em, 1fr),
    rows: auto,
    grid.cell(inset: 1em, align: center + horizon)[*学生姓名*],
    grid.cell(inset: 1em, align: center + horizon)[#info_value("author", info.author)],
    grid.cell(inset: 1em, align: center + horizon)[*学号*],
    grid.cell(inset: 1em, align: center + horizon)[#info_value("student-id", info.student-id)],
    grid.cell(inset: 1em, align: center + horizon)[*专业*],
    grid.cell(inset: 1em, align: center + horizon)[#info_value("major", info.major)],

    grid.cell(inset: 1em, align: center + horizon)[*论文题目*],
    grid.cell(colspan: 5, align: center + horizon, info_value("title", info.title)),

    grid.cell(colspan: 6, inset: 1em)[
      #set par(first-line-indent: 2em, justify: true, leading: 1.2em, spacing: 1.2em)
      #set align(left)
      *一、选题依据与意义*

      #section-1
    ],

    grid.cell(colspan: 6, inset: 1em)[
      #set par(first-line-indent: 2em, justify: true)
      #set align(left)
      *二、文献综述（国内外研究现状）、研究问题*

      #section-2
    ],

    grid.cell(colspan: 6, inset: 1em)[
      #set align(left)
      *三、研究目标、研究内容、研究方法和手段*

      #section-3
    ],

    grid.cell(colspan: 6, inset: 1em)[
      #set align(left)
      *四、论文提纲、进度安排*

      #section-4
    ],

    grid.cell(colspan: 6, inset: 1em)[
      #set par(first-line-indent: 2em, justify: true, leading: 0em, spacing: 1em)
      #set align(left)
      *五、参考文献*

      #bibliography(reference, title: none, style: reference-style)
    ],

    grid.cell(colspan: 6, inset: 1em)[
      #set par(first-line-indent: 2em, justify: true)
      #set align(left)
      *六、关于人工智能（AI）工具使用的说明*

      #section-6
    ],
  )
}

#master-comm-page(
  reference: "ref.bib",
  section-1: [
    随着互联网信息的指数级增长，用户正面临严重的认知负荷与信息过载。传统工具（如书签、简单笔记）仅停留在“存储”层面，难以实现信息的深度加工与知识沉淀。近年来，以ChatGPT、GPT-5等为代表的生成式AI大模型在自然语言理解、信息摘要、知识推理和多轮对话方面展现出革命性能力，为智能化信息处理提供了新的技术范式。

    本选题旨在开发一款基于AI大模型的智能网页信息管理与分析浏览器插件。其意义在于：

    + 理论意义： 本研究探索大语言模型（LLM）在个人知识管理（PKM）中的应用边界，提出一种基于语义理解的非结构化数据组织模式，为“人机协同”下的信息处理提供参考。
    + 技术意义： 针对插件环境下的上下文窗口限制、提示词工程优化、多源异构数据结构化等技术瓶颈，探索轻量级端云协同的解决方案。
    + 应用意义： 开发集智能摘要、语义标签、关联检索于一体的工具，将浏览器从“窗口工具”转变为“智能助理”，显著提升科研与学习效率。
  ],
  section-2: [
    *2.1 国内外研究现状*

    当前，以 Glarity、Monica 为代表的智能浏览器插件，标志着网页交互进入了智能化阶段。此类工具主要依托以 Transformer 为核心架构 的大语言模型（LLM）#cite(<li2020survey>)，能够针对单一网页执行高效的摘要提取、多语言翻译及即时问答任务。其核心技术范式高度契合 Brown 等人提出的“少样本学习”（Few-Shot Learning）框架#cite(<mann2020language>)，即通过极少量的示例或指令引导，赋予插件前所未有的自然语言理解与生成能力。然而，深入分析发现，此类工具普遍存在显著的“信息孤岛”缺陷：其功能逻辑大多停留在“即用即走”的单页面处理模式，缺乏对用户跨时段、跨站点全量浏览历史的系统性与长效性语义管理，导致用户大量的数字化阅读行为难以转化为持续沉淀的结构化知识#cite(<vaswani2017attention>)。

    为了解决大模型知识更新滞后及私有数据缺失的问题，Lewis 等人提出的检索增强生成（RAG）技术为 LLM 连接外部大规模知识库提供了成熟的范式[4]。但在个人知识管理领域，如何将 RAG 架构轻量化、个性化地适配至资源受限的浏览器端，仍是一个亟待攻克的课题。特别是在 Google 强制推行的 Manifest V3 插件开发规范下[9]，传统的后台脚本权限与运行机制受到严格限制[5]。因此，如何在遵守浏览器宿主环境安全约束的前提下，设计一种能有效平衡本地计算资源（如本地向量存储）与云端模型服务的高效混合架构，已成为实现个人化智能信息管理的关键路径[6]。

    此外，精准的信息抽取是构建体系化知识库的基石。传统的基于深度学习的命名实体识别（NER）方法过度依赖于领域相关的海量标注数据，而在通用性极强的 Web 环境下显得力不从心。Liu 等人系统总结的提示工程（Prompt Engineering）技术[7]，通过精心设计的指令触发模型潜在知识，为非结构化网页信息的自动化结构化抽取提供了全新路径。然而，面对复杂且高噪声（如广告干扰、HTML 结构混乱）的网页场景，如何通过优化提示策略（如遵循 OpenAI 发布的 GPT 最佳实践[8]）来提升抽取的鲁棒性，仍需在工程实践中深入探索。在系统伦理与体验设计上，既需遵循 Li 与 He 倡导的“以用户为中心”原则[10]，提升人机交互的顺畅度，也必须正视 Bender 等人提出的“随机鹦鹉”预警，防范大模型可能产生的语义偏见或虚假事实，在系统架构中引入必要的透明度检查与人工纠偏机制[11]。

    *2.2 研究问题*

    本研究旨在开发一款能够实现个人网页信息长效语义化管理的智能浏览器插件，并针对上述技术瓶颈，拟重点解决以下三个关键研究问题：

    + 端云协同的轻量级架构优化问题： 如何在浏览器插件受限的沙盒运行环境中，构建一套兼顾响应速度、数据隐私与低资源消耗的架构？本研究将核心探讨基于 Manifest V3 规范下的 Service Worker 调度机制 ，研究如何将高频的向量检索与隐私敏感的预处理任务保留在本地执行，而将高负载的语义推理任务动态分流至云端 API，实现负载均衡。

    + 高噪声环境下的语义提取精准度问题： 针对 Web 页面内容异构、噪声干扰严重的问题，如何构建高效的提示词优化策略？本研究将结合 Liu 等人的 Prompt 范式，研究针对特定 DOM 结构的文本清洗与预处理流程，并参考刘知远与崔安颀对大模型推理链条的系统分析[12]，设计多层级的上下文引导策略，以提升模型在长文本摘要及关键信息提取中的忠实度与准确性。

    + 多源异构信息的深度语义关联问题： 如何突破传统关键词匹配的局限，利用向量嵌入（Embedding）技术实现跨网页、跨时序的知识整合？本研究将探索高效的向量索引与聚类存储方案，不仅要支持基于自然语言的语义检索，更试图通过技术手段识别不同网页信息间的潜在主题演变，构建起一个具备“长期记忆”能力的动态语义网络，从而实现从零散碎片到系统知识的跃迁。
  ],

  section-3: [
    *研究目标：* 开发一款原型插件，实现网页信息的智能捕获、理解、组织与语义检索，验证其在提升个人知识管理效率方面的实用性。

    *研究内容：*设计插件前后端分离架构，前端负责内容交互，后端协调AI模型与向量数据库。
    核心功能实现：

    + *系统架构设计：*采用“原型开发法”与“端云协同技术”。基于 TypeScript 语言，遵循 Chrome Extensions 官方文档规范 ，构建 Manifest V3 架构。其中，前端使用 Vue 构建沉浸式侧边栏；后端利用 Node.js 协调 AI 模型接口。通过这种前后端分离的手段，确保插件的轻量化与高响应速度。

    + *智能感知模块：*采用“提示工程（Prompt Engineering）”与“多维标注法”。参考大语言模型推理优化技术 ，设计针对网页长文本的“Chain-of-Thought（思维链）”提示词模板。其中，通过 LLM 对抓取的网页内容进行自动化实体识别与摘要，利用模型强大的零样本（Zero-shot）学习能力，实现信息的自动分类与动态标签生成。

    + *语义记忆模块：*采用“向量索引技术”与“RAG 检索框架”。引入轻量级向量数据库（如 LanceDB 或 Chrome Local Storage 的分片存储），应用向量嵌入（Embedding）技术。具体而言，将用户历史浏览数据转化为高维语义向量。当用户提问时，系统通过余弦相似度计算匹配最相关的上下文，结合 RAG 框架生成精准答案，从而打破传统关键词检索的局限。

    + *系统验证与调优：*采用“实验评估法”与“黑盒测试”，设置对照试验，选取不同领域的长文本进行信息提取准确率（Precision）与召回率（Recall）的测试。邀请种子用户进行沉浸式体验测试，收集反馈数据以优化交互链路，并根据测试结果对 Prompt 策略进行迭代优化。
  ],

  section-4: [
    *提纲：*

    第 1 章：绪论（背景、意义、现状）。

    第 2 章：核心技术综述（Transformer、RAG、插件开发协议）。

    第 3 章：系统需求分析与架构设计。

    第 4 章：核心模块设计与实现（重点描述 Prompt 优化与向量索引）。

    第 5 章：系统测试与结果分析（对比传统搜索与语义搜索的效果）。

    第 6 章：总结与展望。

    *进度安排：*

    第一阶段（2025.12 — 2026.1）：前期准备与设计
    #pad(left: 4em)[
      + 完成文献综述与市场分析。
      + 确定系统技术栈与整体架构设计方案。
      + 完成核心功能模块的详细设计。
    ]

    第二阶段（2026.2 — 2026.3）：核心功能开发
    #pad(left: 4em)[
      + 实现浏览器插件基础框架与内容抓取模块。
      + 完成大模型提示工程与智能处理模块（摘要、分类等）。
      + 初步构建本地向量索引与语义检索功能。
    ]

    第三阶段（2026.4）：安全性与隐私测试
    #pad(left: 4em)[
      + 完成用户界面开发与前后端集成。
      + 进行系统功能测试、性能调优与用户体验改进。
    ]


    第四阶段（2026.5）：评估与总结
    #pad(left: 4em)[
      + 开展用户测试与功能评估。
      + 完成论文初稿撰写，准备答辩材料。
    ]
  ],
  section-6: [

    在本课题的研究与论文撰写过程中，将负责任地使用人工智能工具：

    + 辅助编程与调试：在插件开发过程中，可能使用GitHub Copilot、ChatGPT等工具辅助生成部分示例代码、进行代码解释和调试建议，但所有核心架构和关键代码均需由本人深入理解、验证并独立完成整合。

    + 辅助文献梳理与思路整理：可能使用AI工具帮助初步汇总研究领域关键词、概述技术概念，但文献的深入阅读、批判性分析、研究缺口的识别由本人完成。

    + 辅助文字润色与语法检查：在论文成稿后，可能使用AI工具进行语言流畅性检查和语法错误修正，但论文的核心论点、实验数据、逻辑结构和学术观点必须源于本人的独立研究。

    + 透明度声明：将在论文的“致谢”或专门部分，明确说明在哪些环节使用了何种AI工具及其具体用途，确保学术研究的诚实与透明。所有引用来源（包括由AI工具提及但未亲自阅读的文献）都将进行严格核查，杜绝不当引用。
  ],
)
