[中文](README.md) | [English](README.en.md)

![finesse-skill cover](assets/cover.jpg)

<div align="center">

# finesse-skill

**绝不廉价的高级界面 —— 品牌惊艳 · 产品精密 · 手机原生**

给 AI 编码助手用的设计技能。它不生成"还行"的页面，它生成有灵魂、有工艺、经得起看的页面。

[![version](https://img.shields.io/badge/version-0.19.0-111?style=flat-square)](https://github.com/mouse-lin/finesse-skill/releases)
[![license](https://img.shields.io/badge/license-MIT-111?style=flat-square)](LICENSE)
[![rules](https://img.shields.io/badge/设计规则-27_篇-c9863f?style=flat-square)](skills/finesse-ui/references)
[![examples](https://img.shields.io/badge/示例页面-22_个-5ee9c8?style=flat-square)](skills/finesse-ui/examples)

[快速开始](#快速开始) · [四条路线](#四条路线register) · [核心能力](#核心能力) · [示例作品](#示例作品) · [安装](#安装--工具支持) · [使用清单](USAGE.md)

</div>

---

## 快速开始

```bash
npx skills add https://github.com/mouse-lin/finesse-skill
```

然后在对话里直接说话就行：

> "用 finesse 做一个精品咖啡的落地页"
> "做个团队数据仪表台"
> "设计一个记账 app 的界面"

它会**先回你一句它打算做什么**（用你看得懂的话），等你点头才开始写代码。

> [!TIP]
> 第一次用、又没有设计背景？先看 **[使用清单 USAGE.md](USAGE.md)** —— 教你怎么提需求、怎么否决、怎么迭代。

---

## 四条路线（register）

同一个 brief，不同的路线走出来是**完全不同的设计语言**。finesse 先判定路线，再决定一切。

| 路线 | 什么页面 | 优化什么 | 核心手法 |
|:---|:---|:---|:---|
| **brand**<br><sub>设计即产品</sub> | 落地页 · 品牌站 · 发布页<br>作品集 · 行业 hero 页 | 惊艳 + 灵魂<br>第一印象 | 选一个灵魂 + 造**一个**真视觉引擎<br><sub>Three.js / GLSL / Canvas / WebGL / GSAP</sub> |
| **product**<br><sub>设计服务产品</sub> | 仪表盘 · 后台 · analytics<br>数据表 · app shell · 设置 | 清晰 + 密度<br>可用性 | 组件系统 + 数据可视化<br><sub>先定配色，否则每个仪表盘都是蓝的</sub> |
| **commerce**<br><sub>混合</sub> | 商详 · 列表 · 购物车 · 结算 | 转化<br>不玩阴的 | 按这页在做什么，归到上面两路<br><sub>卖单品像 brand，筛列表像 product</sub> |
| **h5**<br><sub>容器路线</sub> | H5 · 移动端页面 · 活动页<br>小程序页 · app 原型 · 移动商详 | 手上的手感 | **先钉死手机框架**，再套上面三路之一<br><sub>移动商详 = h5 + commerce</sub> |

四条路共享同一底色：**高级感物理层 + 反廉价审查**。仪表盘不许长得廉价，H5 也一样。

<details>
<summary><b>它具体怎么跑（五步）</b></summary>

<br>

1. **先读 brief** —— 先问"这页有没有桌面形态"，没有就是 h5；再分 brand / product / commerce。输出一句 Design Read 定方向，**停下来等你确认**。
2. **拧三个旋钮** —— SOUL（风格辨识度）· SPECTACLE（视觉炫技，招牌旋钮）· DENSITY（信息密度）。product 模式 SPECTACLE 压低、DENSITY 拉高。
3. **铺物理层** —— grain 噪点 · vignette 暗角 · 字重张力 · 半透明边框 · OKLCH 色彩锁定。h5 则**先立框架**，再铺所套 register 的物理层。
4. **分流**
   - **brand** → 选灵魂（行业→风格人格）+ 造一个 hero 引擎，五类选一，**100% 做透**（不做五个半成品）
   - **product** → 组件系统 + 数据可视化（信息架构 · 表格 · 图表 · 表单 · 交互状态全集）
   - **h5** → 选六种手机形态之一（app 壳 / 翻页 deck / snap 叙事 / 移动商详 / 手机官网 / 沉浸单屏）+ 照抄原生家具
5. **反廉价黑名单 + 起飞前自检**，再交付。

</details>

---

## 核心能力

<table>
<tr>
<td width="50%" valign="top">

**视觉工艺**

- **高级感物理层** — grain / vignette / 字重张力 / 配色家族<br><sub>提炼自 53 页行业展示页语料</sub>
- **五类 hero 视觉引擎** — Three.js · Canvas · WebGL-FBO · GSAP · CSS-only，各含 reduced-motion 降级骨架
- **3D 效果谱系** — CSS 伪 3D（倾斜 / 翻转 / coverflow / 景深）+ Three.js 真 3D
- **OKLCH 配色阶梯** — restrained / committed / full / drenched 四档承诺

</td>
<td width="50%" valign="top">

**决策与防错**

- **反同质化引擎** — 五轴组合造灵魂，而不是从清单里挑<br><sub>带跨次构建记忆，"别重复"这条规则才真的会触发</sub>
- **反廉价黑名单** — 经生产验证的 AI tells + 绝对禁区 + reflex-reject 字体/配色清单
- **起飞前自检** — 承诺兑现 · 廉价扫描 · a11y · 移动地板
- **本地检测器** — `detect.mjs` 机械扫 slop 与"宣称了没做到"

</td>
</tr>
<tr>
<td width="50%" valign="top">

**product 路线**

- 仪表盘信息架构 · 六种 shell 形态
- 25 种图表选型 × a11y 分级 × 库推荐
- 手搓图表实现层（零依赖 SVG 配方）
- 数据表 · 表单 · 交互状态全集
- **product 专属配色库** — 5 套中性色阶 + 16 个强调色 + 12 套可直接粘贴的组合
- **AI 工作台**（你委派、然后盯着的页面）—— 三时态同屏 · 运行流取代图表 · 九种运行态 · 常驻停止 · 人在回路审批卡 · 成本回执<br><sub>它不像仪表盘那样死于看不懂，也不像流程页那样死于走不完 —— 它死于不可信</sub>

</td>
<td width="50%" valign="top">

**h5 路线**

- 视口契约 · `body` 锁死 / 容器滚动的**架构反转**
- 560px 桌面手机画框 · 安全区数学
- **拇指区反转** —— 主操作一律放底部
- 触摸法则（`passive` / `pointercancel` / tap-highlight / 44px）
- 六种手机形态 + 原生家具配方<br><sub>状态栏 · TabBar · 底部 sheet · FAB · push 与手写 FLIP 转场</sub>

</td>
</tr>
</table>

---

## 示例作品

出自同一设计基因，却刻意长得毫不相干 —— 这正是反同质化引擎在做的事。

<details open>
<summary><b>brand 路线</b> —— 视觉引擎 · 灵魂驱动 · 多行业覆盖</summary>

<br>

| | |
|:---:|:---:|
| ![Nexus — Three.js 粒子轨道环，分布式智能平台](assets/examples/nexus.png) | ![Drift — Canvas 2D 流场粒子，品牌落地页](assets/examples/drift.png) |
| **Nexus** · Three.js 粒子轨道环 | **Drift** · Canvas 2D 流场粒子 |
| ![Forge — Three.js 粒子火焰，游戏工作室](assets/examples/forge.png) | ![Volt — 纯电汽车，粗体排版](assets/examples/volt.png) |
| **Forge** · Three.js 粒子火焰 | **Volt** · 粗体排版 · 纯电汽车 |
| ![Morning Ritual — 精品咖啡，editorial 浅色主题](assets/examples/coffee.png) | ![Eclipse — 数据引力平台，粗体排版](assets/examples/eclipse.png) |
| **Morning Ritual** · editorial 浅色 | **Eclipse** · 数据引力平台 |

</details>

<details>
<summary><b>product 路线</b> —— 组件系统 · 数据可视化 · 六种 shell 形态</summary>

<br>

| | |
|:---:|:---:|
| ![Buildly — AI 增长分析，经典侧边栏 shell + 面积图描线 + 甜甜圈](assets/examples/buildly.jpg) | ![Pulsegrid — 基础设施监控，发光 sparkline + 高级自定义滑块](assets/examples/stakent.jpg) |
| **Buildly** · 经典侧边栏 + 面积图描线 | **Pulsegrid** · 发光 sparkline + 自定义滑块 |
| ![ACRU — 团队效率，侧边栏经典 shell + 悬停 tooltip 柱状图](assets/examples/acru.jpg) | ![PawCare+ — 宠物健康看护，真实照片热点标注 + 主题色切换](assets/examples/pawcare.jpg) |
| **ACRU** · 浅色侧边栏 + tooltip 柱状图 | **PawCare+** · 照片热点标注 + 主题色切换 |
| ![Nodeflux — API 控制台，浮层面板 + 真 bento + 同心用量环](assets/examples/nodeflux.jpg) | ![Inkline — 内容发布 CMS，三栏 triptych + 浏览器预览热点标注](assets/examples/inkline.jpg) |
| **Nodeflux** · 浮层面板 + 真 bento | **Inkline** · 三栏 triptych + 浏览器预览 |
| ![Huddle — 团队协作，顶部导航 bento + 撞色任务卡 + 多弧甜甜圈 + 语音波形](assets/examples/huddle.jpg) | ![Threadline — 客服运营，浮层面板 + 不对称 bento + 环形仪表盘](assets/examples/ledgerio.jpg) |
| **Huddle** · 顶导 bento + 多弧甜甜圈 | **Threadline** · 不对称 bento + 环形仪表 |

</details>

<details open>
<summary><b>h5 路线</b> —— 竖屏 390×844，桌面上自动套一层手机画框</summary>

<br>

<table>
<tr>
<td width="50%" align="center" valign="top">
<img src="assets/examples/h5-pawpal.jpg" width="270" alt="PAWPAL 毛毛档案 — 宠物养护 App，悬浮胶囊 TabBar + 中间凸起 FAB + 三段粗圆环 + 白色底部 sheet"><br><br>
<b>形态 A · app 壳</b> &nbsp;<sub>（包 product）</sub><br>
<sub>悬浮胶囊 TabBar + 凸起 FAB · 三段粗圆环<br>胶囊柱状图 · 白色底部 sheet<br><b>切换宠物整页重绘，而家具一动不动</b></sub>
</td>
<td width="50%" align="center" valign="top">
<img src="assets/examples/h5-brew.jpg" width="270" alt="烘豆日记 — 挂耳咖啡商品详情，scroll-snap 图集 + SKU 面板 + 吸底四段购买栏"><br><br>
<b>形态 D · 移动商详</b> &nbsp;<sub>（包 commerce）</sub><br>
<sub>scroll-snap 图集 + 页码 · SKU 面板联动改价<br>加购小球抛物线飞入 + 角标弹跳<br><b>吸底购买栏，安全区算进 padding</b></sub>
</td>
</tr>
</table>

> 这两页也在 `skills/finesse-ui/examples/` 里，**打开就能跑**。图片是代码生成的 SVG 占位符（`PH()`），换成真实图片 URL 即可 —— 周围的 CSS 一行都不用改。

</details>

---

## 安装 & 工具支持

> [!NOTE]
> 推荐用 `npx skills`，一条命令通用于所有 agent。其他工具的手动装法在下面的折叠区里。

```bash
# 安装全部 skill（运行时会让你选装到哪个 agent）
npx skills add https://github.com/mouse-lin/finesse-skill

# 只装 finesse-ui
npx skills add https://github.com/mouse-lin/finesse-skill --skill "finesse-ui"
```

安装后在对话里说"用 finesse 做一个 …"或 `/finesse` 即可触发。

| 工具 | 深度 | 装法 |
|:---|:---|:---|
| **Claude Code** | 完整 | `npx skills` 或原生插件 `.claude-plugin/plugin.json` |
| **Trae / Trae 国内版** | 完整镜像 | 复制整个 `.trae/skills/finesse-ui/` 目录 |
| **CodeBuddy** | 完整镜像 | 复制整个 `.codebuddy/skills/finesse-ui/` 目录 |
| **Cursor** | 单文件规则 | 复制 `.cursor/rules/finesse-ui.mdc` |
| **OpenAI Codex** | 单文件指令 | 复制 `AGENTS.md` 到项目根目录 |
| **GitHub Copilot** | 单文件指令 | 复制 `.github/copilot-instructions.md` |
| **其他（ChatGPT / API）** | 手动 | 把 `SKILL.md` 粘进 system prompt |

<details>
<summary><b>各工具的具体命令</b></summary>

<br>

### Cursor

```bash
cp .cursor/rules/finesse-ui.mdc your-project/.cursor/rules/
```

编辑 HTML / CSS / JS / TS / Vue / Svelte 文件时会自动加载。

### OpenAI Codex

```bash
cp AGENTS.md your-project/AGENTS.md
```

或直接把 `skills/finesse-ui/SKILL.md` 的内容粘进 Codex 对话。

### GitHub Copilot

```bash
cp .github/copilot-instructions.md your-project/.github/
```

Copilot 会自动读取并以 finesse 标准生成代码。

### Trae

```bash
cp -r .trae/skills/finesse-ui your-project/.trae/skills/
# 国内版：
cp -r .trae-cn/skills/finesse-ui your-project/.trae-cn/skills/
```

### CodeBuddy

```bash
cp -r .codebuddy/skills/finesse-ui your-project/.codebuddy/skills/
```

> **为什么这三个是"完整镜像"**：Trae / CodeBuddy 的 Skills 目录结构与 Claude Code 原生一致，能按需加载全部 reference 文件，所以直接复制整个目录就拿到完整深度，不是精简版。
>
> **改动请只提 `skills/finesse-ui/`**：那里是唯一真源，其余三份镜像和 Cursor 规则都是从它派生的静态拷贝，由维护者统一同步。直接改镜像的 PR 会在下次同步时被覆盖。

</details>

---

## 仓库结构

<details>
<summary><b>展开完整目录树</b></summary>

<br>

```
finesse-skill/
├── skills/finesse-ui/
│   ├── SKILL.md                  # 主入口：方法论 + 流程 + 路由
│   ├── references/               # 27 篇详细规则，AI 用到哪篇读哪篇
│   └── examples/                 # 22 个打开就能跑的示例页 + 索引
├── .claude-plugin/plugin.json    # Claude Code 原生插件
├── .cursor/rules/finesse-ui.mdc  # Cursor 规则（单文件，自动加载）
├── AGENTS.md                     # OpenAI Codex 指令
├── .github/copilot-instructions.md
├── .trae/ · .trae-cn/ · .codebuddy/   # 完整镜像（脚本同步）
├── USAGE.md · USAGE.en.md        # 给非设计背景用户的使用清单
└── README.md · LICENSE
```

### 那 27 篇规则都写了什么

| 分类 | 文件 |
|:---|:---|
| **方法论** | `divergence.md` 反同质化五轴 · `style-personas.md` 行业→灵魂 · `inspiration-catalog.md` 48 页技法索引 |
| **brand** | `design-dna.md` 物理层 · `hero-engines.md` 五类引擎 · `page-crafting.md` 实现层 · `3d-effects.md` |
| **product** | `product-ui.md` · `product-palettes.md` 配色库 · `workflow-ui.md` 流程页 · **`ai-console.md`** AI 工作台 · `dataviz.md` 图表选型 · `chart-crafting.md` 手搓图表 |
| **commerce / h5** | `commerce-ui.md` · **`h5-mobile.md`** 手机专属全套 |
| **移动端** | `mobile-floor.md` 桌面页在手机上不坏掉的六条 |
| **质量闸门** | `anti-cheap.md` 反廉价 · `preflight.md` 起飞前自检 · `audit.md` 只读诊断 · `redesign-mode.md` 改造模式（审计优先） · `component-scope.md` 单组件八态 |
| **项目记忆** | `init.md` 写 PRODUCT.md · `document.md` 提取现有设计系统 · `design-model.md` 多页一致性 · `theming.md` 主题切换 |
| **表达** | `plain-words.md` 把内部黑话翻成人话 · `asset-sourcing.md` 取图决策 |

</details>

---

## 范围之外

finesse 覆盖 brand、product、commerce 和 h5，范围很宽。只有这两种情况不适合：

- **纯后端 / API / 无界面的数据任务**
- 明确要求"无个性、零打磨"的页面 —— finesse 总会带上工艺，真要平庸是另一种工具

h5 这条线还有一个边界：它管手机页面的**设计**，不管外围的**平台管道**。微信 JS-SDK 接入、分享卡片配置、支付对接、原生 bridge、小程序脚手架都是工程活儿 —— 页面做完，这些交出去。

---

<div align="center">
<sub>

**MIT License** · 作者 西瓜同学

觉得有用的话，点个 ⭐ 让更多人看到

</sub>
</div>
