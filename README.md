# FoxClaw Wyckoff Stock Analysis

<p align="center">
  <img src="https://img.shields.io/badge/version-2.0.1-blue.svg" alt="Version">
  <img src="https://img.shields.io/badge/license-MIT-green.svg" alt="License">
  <img src="https://img.shields.io/badge/language-中文|English|日本語|한국어-orange.svg" alt="Languages">
</p>

<p align="center">
  <b>基于威科夫理论的股票分析方法</b><br>
  <i>Supply & Demand · Volume-Price Analysis · Market Structure Recognition</i>
</p>

---

## 🌍 多语言文档 | Multi-Language Documentation

| 语言 | Language | 文档链接 | Document Link |
|------|----------|----------|---------------|
| 🇨🇳 简体中文 | Simplified Chinese | [README.zh-CN.md](./README.zh-CN.md) | 主文档 |
| 🇺🇸 English | English | [README.en.md](./README.en.md) | Main Document |
| 🇯🇵 日本語 | Japanese | [README.ja.md](./README.ja.md) | メインドキュメント |
| 🇰🇷 한국어 | Korean | [README.ko.md](./README.ko.md) | 주요 문서 |

---

## 📖 简介 | Introduction

**FoxClaw 威科夫股票分析** 是一个基于威科夫理论（Wyckoff Method）的股票分析框架，专注于：

- 📊 **量价分析** - Volume-Price Analysis
- 🎯 **市场结构识别** - Market Structure Recognition  
- 💰 **主力资金动向** - Smart Money Flow Tracking
- 📈 **交易机会识别** - Trading Opportunity Identification

### 核心原则 | Core Principles

1. **供求关系** - Supply & Demand drives price movement
2. **量价分析** - Volume validates price action
3. **市场本质** - Identify accumulation/distribution phases

> "威科夫是核心，大资金动向是参考辅助" — 江哥指导

---

## 🚀 快速开始 | Quick Start

### 安装 | Installation

```bash
# Clone the repository
git clone https://github.com/huangjiang1980/foxclaw-stock-wyckoff-analysis.git

# Navigate to the skill directory
cd foxclaw-stock-wyckoff-analysis/skills/wyckoff-stock-analysis
```

### 使用方法 | Usage

作为 OpenClaw Skill 使用：

```yaml
# 在您的 OpenClaw 配置中引用
skills:
  - path: ./skills/wyckoff-stock-analysis
```

---

## 📊 分析框架 | Analysis Framework

### 多周期分析 | Multi-Timeframe Analysis

| 周期 | Timeframe | 作用 | Purpose |
|------|-----------|------|---------|
| 月线 | Monthly | 看长期趋势 | Long-term trend |
| 周线 | Weekly | 看当前阶段 | Current phase |
| 日线 | Daily | 看进场点 | Entry points |

### 关键形态 | Key Patterns

**底部形态 (Accumulation):**
- **Spring** — 弹簧形态
- **UT** — 上冲测试
- **SOS** — 强势信号
- **LPS** — 最后支撑点

**顶部形态 (Distribution):**
- **UTAD** — 上冲后派发
- **SOW** — 弱势信号

---

## 📁 项目结构 | Project Structure

```
foxclaw-stock-wyckoff-analysis/
├── README.md                 # 本文件 (多语言导航)
├── README.zh-CN.md          # 简体中文文档
├── README.en.md             # English Documentation
├── README.ja.md             # 日本語ドキュメント
├── README.ko.md             # 한국어 문서
├── SKILL.md                 # OpenClaw Skill 定义
├── skills/
│   └── wyckoff-stock-analysis/
│       ├── README.md        # Skill 说明
│       └── SKILL.md         # Skill 配置
└── docs/                    # 补充文档
```

---

## 🤝 贡献 | Contributing

欢迎贡献！请阅读 [CONTRIBUTING.md](./CONTRIBUTING.md) 了解如何参与项目。

Contributions are welcome! Please read [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

---

## 📄 许可证 | License

本项目采用 [MIT License](./LICENSE) 许可证。

This project is licensed under the [MIT License](./LICENSE).

---

## 🙏 致谢 | Acknowledgments

- **江哥指导** - 威科夫理论实战指导
- **Richard D. Wyckoff** - 威科夫方法创始人
- **OpenClaw Community** - 技术支持与反馈

---

<p align="center">
  <b>🦞 FoxClaw — 智能分析，明智决策</b><br>
  <i>Smart Analysis, Wise Decisions</i>
</p>

---

**版本:** 2.0.1 | **更新:** 2026-03-12
