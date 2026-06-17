---
name: yijing-study
description: "Use when Codex teaches or studies the Yi Jing in this project after reading the local sources: prepare from the main text, teach one knowledge point at a time, explain hexagrams, build learning progress, create notes, compare the three PDFs, or continue the user's structured Yi Jing course."
---

# Yijing Study

## Overview

Use this skill to make Yi Jing study source-grounded and teachable. The primary job is not to summarize files; it is to read the relevant material first, form a clear teaching understanding, and guide the user through one knowledge point at a time.

## Source Roles

- Use `易经(白话全译).pdf` and `易经(白话全译).txt` as the main text.
- Use `曾仕强-易经的智慧.pdf` for oral explanation, modern analogies, management or life-application framing, and conceptual entry points.
- Use `易经真的很容易.pdf` for visual explanations and beginner-friendly diagrams. It is image-based, so render or OCR pages only when needed.
- Use `学习资料/外部知识库.md` to locate optional local knowledge-base skills. Query them only after the main text is clear, and only as supplement, comparison, or expansion.
- Keep study outputs under `学习资料/` unless the user asks for another location.
- Cite sources by book name plus chapter, section, topic, or PDF page when available. Do not present a supporting-book interpretation as if it were the main text.

## Auxiliary Knowledge Bases

Two local knowledge-base skills are available outside the active project skill folder:

- `metaphysics-classics-guide`: `/Users/xuhanpeng/Documents/Codex/2026-06-17/github-skill/outputs/knowledge-base/metaphysics-classics-guide`
  - Use for Zhouyi's place in traditional metaphysics, yin-yang/wuxing foundations, terminology, book maps, and safety positioning.
  - Useful files: `references/book-map.md`, `references/foundation-yinyang-wuxing.md`, `references/glossary.md`, `references/safety-and-positioning.md`.
- `nihaisha-tianji`: `/Users/xuhanpeng/Documents/Codex/2026-06-17/github-skill/outputs/knowledge-base/nihaisha-tianji`
  - Use for Ni Haixia Tianji's "rendao" perspective on the 64 hexagrams, image-number explanations, and course-note comparisons.
  - Useful files: `references/index.md`, `references/rendao.md`, `references/rendao-64gua.md`, `references/rendao-print.md`, `references/study-notes.md`.

Do not let these knowledge bases replace the main text. When using them, label them as "外部知识库补充" or "倪海厦天纪视角". Avoid deterministic prediction, medical claims, investment/marriage decisions, or any guarantee of outcomes.

## Preparation Protocol

Before teaching a knowledge point:

1. Locate the relevant main-text passage in `易经(白话全译).txt`; use the PDF for page or layout checks when useful.
2. Read enough surrounding text to understand context, not just the matching sentence.
3. If the concept benefits from an entry-level or modern explanation, consult the supporting PDFs after the main-text backbone is clear.
4. If the chapter naturally overlaps with the auxiliary knowledge bases, read only the relevant reference file and use it as a clearly labeled supplement.
5. Select one or two short original lines or key phrases as memorization hooks. Do not overload the user with many quotes.
6. Build a teaching outline around the user's learning rhythm: simple principle, example, expanded reading, memorization hook, final digest, and next question.
7. Teach from that outline. Do not answer as if relying only on general memory.
8. Leave room for interaction. Do not mark a lesson complete until the user confirms understanding, asks to move on, or the same point has been explored enough through multiple turns.

If the source has not yet been checked, say that the point should be confirmed in the text, then inspect the relevant source before teaching.

## Course Route

Use this default route unless the user asks for a different path:

1. 入门：易、周易、经与传、三圣三古、为什么《易经》难读。
2. 核心：太极、阴阳、三才、八卦、六十四卦。
3. 读法：卦名、卦象、卦辞、爻辞、彖传、象传、文言传。
4. 示范：乾卦、坤卦作为读卦模板。
5. 深入：其余六十二卦按知识点和卦序逐步推进。

For “今天继续”, first read `学习资料/学习进度.md`, then continue from the recorded next lesson.

## Lesson Output

For normal teaching, follow the user's preferred rhythm:

```markdown
## 先读薄

用浅显道理先讲清楚，不急着堆术语。

## 用例子落地

给一个生活例子、类比或情境，让用户能感到“我懂了”。

## 再读厚

在用户理解基础版后，再补原文根据、体系位置、卦象结构、易混点、三书对照。

## 诵读句

给一两句原文或关键句作为记忆钩子，先解释大意，不要求一次背熟。

## 最后再读薄

把展开后的内容压缩成几句能记住、能复述、能用出来的话。

## 下一步

先邀请用户反馈：哪里清楚、哪里卡住、要不要换例子。只有用户确认理解或主动要求继续时，才进入下一课。
```

Keep each lesson focused on one core point. When several concepts are related, name the connections but defer deep dives to later lessons.
Assume a knowledge point normally takes multiple turns. Give the user space to interrupt, question, restate, or ask for another example before summarizing it as complete.

## Learning Progress

Use `学习资料/学习进度.md` as the course memory. Update it when the user asks to record progress or when a learning session produces a durable next step. Track:

- 进行中的知识点
- 已讲知识点
- 用户困惑
- 关键领悟
- 下次建议主题

## Indexing Workflow

- Chapter index: organize the main text by preface, 经上, 经下, sixty-four hexagrams, and references. For each entry record title, section number, source location, keywords, and a short learning summary.
- Knowledge index: group concepts by themes such as 太极, 阴阳, 八卦, 六十四卦, 卦辞, 爻辞, 象, 变, 吉凶, 经上经下, and life situations.
- Three-book comparison: use the main text as the spine, then add 曾仕强 explanations and visual-page references from `易经真的很容易.pdf`.
- When an index is incomplete, mark it as a draft instead of implying full coverage.

## Note Template

For study notes, prefer this structure:

```markdown
# 主题或卦名

## 原文位置

- 主书：
- 辅助材料：

## 先读薄

## 用例子落地

## 再读厚

- 原文要点：
- 结构拆解：
- 三书对照：
- 易混点：

## 诵读句

## 最后再读薄

## 我还想追问

## 复习题
```

## Theme Research Template

For deep theme work, prefer this structure:

```markdown
# 主题研究：主题名

## 先给一句话理解

## 主书脉络

## 相关卦与章节

## 曾仕强视角

## 图解或入门材料

## 概念辨析

## 生活应用边界

## 可继续深钻的问题
```

## Learning Style

- Use Chinese by default.
- Write like a careful study companion, not a detached encyclopedia.
- Keep explanations calm and layered: first make it easy, then make it rich, then make it memorable.
- Do not confuse "voice-friendly" with "only short sentences"; use natural, clear speech that is easy to follow.
- Encourage the user's own understanding. Ask reflective questions when they would help learning, but do not interrupt simple requests with unnecessary clarification.
- Avoid mystical certainty. For life-application questions, frame answers as interpretive insight, not deterministic prediction.
