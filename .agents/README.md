# Agent 协作结构

这个项目的 agent 系统不是只有一个文件夹，而是由“项目总规则、课程主 skill、语音执行层、理解校准/复盘层、学习沉淀层、外部配合 skill”一起组成。

## 1. 项目总控层

- 文件：`AGENTS.md`
- 作用：规定整个项目的学习目标、资料边界、默认教学节奏、语音交互规则和学习结束后的沉淀要求。
- 触发场景：项目内所有对话默认遵守。

## 2. 课程主 Agent

- 文件：`.agents/skills/yijing-study/SKILL.md`
- 配置：`.agents/skills/yijing-study/agents/openai.yaml`
- 作用：负责《易经》课程主线、备课协议、文本依据、教学结构、理解校准、课程笔记、学习记录和学习日报。
- 触发场景：继续课程、讲解知识点、解释卦象、比较三本书、更新学习进度。

## 3. TTS 语音层

TTS 不是独立 skill 文件夹，而是课程主 Agent 的语音执行层。

- 项目脚本：`tts/speak_sections.sh`
- 流程说明：`tts/README.md`
- 规则来源：`AGENTS.md` 的“语音交互”部分，以及 `yijing-study/SKILL.md` 的 “Voice Interaction” 部分。
- 本地依赖：`/Users/xuhanpeng/Documents/Codex/2026-06-16/new-chat/outputs/codex-speak-qwen`

仓库上传的是项目内的分段播放脚本、调用规则和学习模式说明；本地 Qwen TTS wrapper 属于机器本地依赖，不复制进本仓库。

## 4. 理解校准与复盘层

理解校准和复盘也不是单独 skill 文件夹，而是课程主 Agent 的固定学习闭环。

- 规则位置：`.agents/skills/yijing-study/SKILL.md`
  - `Understanding Calibration Loop`
  - `Session Closing Loop`
  - `Daily Report Workflow`
- 流程说明：`loop/README.md`
- 日报规则：`loop/日报规则.md`
- 产出位置：
  - `学习资料/课程笔记/`
  - `学习资料/学习记录/`
  - `学习资料/学习日报/`
  - `学习资料/学习进度.md`

这层负责把用户的复述、例子、困惑和流程反馈沉淀下来，避免学习只停留在“听懂”和“继续推进”。

## 5. 学习沉淀层

- `学习资料/学习计划.md`：课程路线和学习模式。
- `学习资料/学习进度.md`：下次从哪里继续。
- `学习资料/课程笔记/`：每课稳定理解。
- `学习资料/学习记录/`：每次学习过程。
- `学习资料/学习日报/`：当天学习复盘。
- `学习资料/资料索引/三书使用地图.md`：三本书和外部知识库的调用顺序。

这层相当于课程记忆。用户说“今天继续”时，Agent 应先读这里，再推进新内容。

## 6. 外部配合 Skill

外部配合 skill 不复制进本仓库，而是在独立目录或独立仓库中维护。本项目只登记用途、路径和调用边界。

- `metaphysics-classics-guide`
  - 用途：补充《周易》在传统术数体系中的位置、阴阳五行基础、术语和安全边界。
  - 登记位置：`学习资料/外部知识库.md`
- `nihaisha-tianji`
  - 用途：补充倪海厦《天纪》人道视角、六十四卦图解和课程解释。
  - 登记位置：`学习资料/外部知识库.md`

外部 skill 只能作为补充、对照和拓展，不能替代主书依据，也不能把传统文化解释说成现实保证。

## 7. 版本同步层

- README 图：`学习资料/资料索引/项目Agent逻辑图.png`
- GitHub 同步：提交 `AGENTS.md`、`.agents/`、学习资料、工具脚本和流程说明。
- 不提交内容：本地原书 PDF、全文 TXT、OCR 结果、生成音频和本地机器依赖。
