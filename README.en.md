# FoxClaw Wyckoff Stock Analysis

<p align="center">
  <img src="https://img.shields.io/badge/version-2.0.1-blue.svg" alt="Version">
  <img src="https://img.shields.io/badge/license-MIT-green.svg" alt="License">
  <img src="https://img.shields.io/badge/status-active-brightgreen.svg" alt="Status">
</p>

<p align="center">
  <b>Professional Stock Analysis Framework Based on Wyckoff Method</b><br>
  <i>Supply & Demand · Volume-Price Analysis · Market Structure Recognition</i>
</p>

---

## 📖 Table of Contents

1. [Core Principles](#core-principles)
2. [Wyckoff Key Patterns](#wyckoff-key-patterns)
3. [Analysis Framework](#analysis-framework)
4. [Volume-Price Analysis](#volume-price-analysis)
5. [Smart Money Flow](#smart-money-flow)
6. [Trading Strategies](#trading-strategies)
7. [Case Studies](#case-studies)
8. [Output Template](#output-template)

---

## Core Principles

**Three Core Elements of Wyckoff Method:**

1. **Supply & Demand** - Imbalance drives price movement
2. **Volume-Price Analysis** - Volume validates price action
3. **Market Structure** - Identify accumulation/distribution phases

> "Wyckoff is the core; smart money flow is auxiliary reference" — Mentor Jiang

---

## Wyckoff Key Patterns

### Bottom Patterns (Accumulation)

| Pattern | Description |
|---------|-------------|
| **Spring** | Sharp decline with high volume followed by quick recovery, indicating demand entry |
| **UT** (Upthrust) | Test of supply by breaking above previous high |
| **SOS** (Sign of Strength) | Strong upward move with increased volume confirming trend reversal |
| **LPS** (Last Point of Support) | Pullback that doesn't break the previous low |

### Top Patterns (Distribution)

| Pattern | Description |
|---------|-------------|
| **UTAD** (Upthrust After Distribution) | False breakout followed by reversal |
| **SOW** (Sign of Weakness) | Heavy volume decline indicating distribution |

---

## Analysis Framework

### Multi-Timeframe Analysis (Essential!)

| Timeframe | Purpose | Focus |
|-----------|---------|-------|
| **Monthly** | Long-term trend | Overall direction: Bull/Bear/Sideways |
| **Weekly** | Current phase | Opportunity identification: Accumulation/Distribution/Continuation |
| **Daily** | Entry points | Precise timing: Support levels/Pattern confirmation |

**Analysis Sequence:**
1. **Start with Monthly** — Confirm major trend (only trade in uptrend)
2. **Check Weekly** — Find phase opportunities (bottom patterns/breakout patterns)
3. **End with Daily** — Find precise entry points (support + volume breakout)

> "Monthly for trend, Weekly for phase, Daily for entry" — Mentor Jiang

---

## Volume-Price Analysis

### Core Understanding

> **"Volume is the root; price is the floating duckweed"** — Wyckoff

**Key Insight:**
- ❌ Wrong: Price leads, volume follows
- ✅ Correct: **Volume leads, price is the result**

### Volume Characteristics

| Volume Type | Meaning | Logic |
|-------------|---------|-------|
| **High Volume** | 💰 Smart money entering | Institutions genuinely buying/selling |
| **Low Volume** | 😴 Wait-and-see | No conviction, waiting for direction |
| **Extreme Low** | 🛑 Selling exhaustion | Can't sell anymore, possible bottom |
| **Extreme High** | 🎭 Distribution | Large position transfer, watch for traps |

### Volume-Price Relationships

| Pattern | Signal | Interpretation |
|---------|--------|----------------|
| **Price ↑ Volume ↑** | ✅ Healthy rally | Smart money genuinely buying |
| **Price ↑ Volume ↓** | ⚠️ Divergence | Fake rally, distribution (bull trap) |
| **Price ↓ Volume ↑** | ⚠️ Panic selling | Possible bottom, smart money absorbing |
| **Price ↓ Volume ↓** | ✅ Selling easing | Fake decline, no follow-through (Spring) |
| **Price → Volume →** | ⚖️ Consolidation | Balance, waiting for breakout |

---

## Smart Money Flow

**Data Sources:** Main funds, Northbound funds, Margin trading, Dragon List

**Analysis Logic:**

| Signal | Interpretation |
|--------|----------------|
| **Main Fund Inflow** | Large/Ultra-large orders buying > selling |
| **Northbound Inflow** | Shanghai/Shenzhen Stock Connect buying |
| **Margin Increase** | Leveraged funds entering |
| **Consecutive Inflow** | Sustained interest, possible accumulation |
| **Inflow but No Rally** | Possible distribution trap |

---

## Trading Strategies

### Entry Strategies

| Signal | Description | Action |
|--------|-------------|--------|
| **Spring Appears** | Sharp decline with recovery | Test buy |
| **SOS Breakout** | Volume breakout above previous high | Confirm buy |
| **LPS Support** | Pullback holds above previous low | Add position |

### Breakout Definition (Critical!)

**Wyckoff Standard: Close breakout > Intraday breakout**

| Type | Reliability | Note |
|------|-------------|------|
| **Intraday Breakout** | ❌ Unreliable | Possible fake breakout, bull trap |
| **Close Breakout** | ✅ Valid | Confirms genuine demand |

**Breakout Confirmation: 3%+ Volume Rule**
- ✅ Close > Resistance
- ✅ Gain > 3% (significant breakout)
- ✅ Volume increase > 30% (demand confirmation)

### SOS + LPS Stock Selection Strategy (Key!)

**Core Concept:** "Opportunity knocks but once in a bull market"

**Selection Criteria:**
1. **Step 1: Find SOS (Strong Rally)**
   - Volume increase > 50%
   - Gain > 5% or breakout above previous high
   - Indicates institutional commitment

2. **Step 2: Wait for LPS (Pullback)**
   - Volume contracts < 30% of average during pullback
   - Price holds above SOS starting point
   - Selling exhaustion, institutions still holding

3. **Step 3: Buy at LPS (Support)**
   - Enter when pullback reaches support with low volume
   - Stop loss: Below LPS lowest point

### Stop Loss System

| Stop Type | Trigger | Action |
|-----------|---------|--------|
| **Technical Stop** | 7% loss | Must exit |
| **Wyckoff Stop** | Key support broken/SOW | Must exit |
| **Trailing Stop** | 50% profit retracement | Protective reduction |

---

## Case Studies

### Case: EVE Energy (300014)

**Background (March 9 Analysis):**
- Price: ¥63
- Strategy: Buy at ¥62 pullback (10% position), add 30% at ¥60
- Stop loss: ¥58

**Actual Movement:**
- Expected: Pullback to ¥62
- Actual: Direct rally to ¥67.97 (+7.92%), no pullback!

**Lesson Learned:**

| Issue | Improvement |
|-------|-------------|
| Missed pullback entry | Add "missed pullback" contingency |
| Only set pullback buy | Add "breakout buy" alternative |
| Passive waiting | Set alerts/conditional orders |

**✅ Improved Strategy:**

```
Plan A: Wait for Pullback (Conservative)
  → Buy at ¥62, add at ¥60, stop at ¥58

Plan B: Breakout Chase (Aggressive)
  → Buy when breaking ¥63.85 high (10% test position)
  → Stop at ¥62

Plan C: Balanced (Recommended)
  → Use 15% on breakout
  → Add 15% on pullback to ¥62
```

---

## Output Template

```markdown
## 📊 Wyckoff Analysis Report - [Stock Name]([Code])

### 🏷️ Current Phase
[Accumulating/Distributing/Rallying/Declining/Consolidating]

### 📈 Last 3 Days Volume-Price Analysis
| Date | Close | Volume | Change | V-P Relationship |
|------|-------|--------|--------|------------------|
| Day1 | xx.xx | xxxM | +x.xx% | Price ↑ Volume ↑/↓... |
| Day2 | xx.xx | xxxM | -x.xx% | ... |
| Day3 | xx.xx | xxxM | +x.xx% | ... |

**V-P Signal Summary:** [Overall assessment]

### 🏦 Smart Money Flow (Reference)
- Main Funds: [Inflow/Outflow/Flat]
- Interpretation: [Explanation]

### 🎯 Wyckoff Pattern Recognition
- [ ] Spring — [Yes/No]
- [ ] UT — [Yes/No]
- [ ] SOS — [Yes/No]
- [ ] LPS — [Yes/No]

### 📍 Key Levels
- **Support:** [Price]
- **Resistance:** [Price]
- **Stop Loss:** [Price]

### 📋 Trading Strategy
- **Plan A (Conservative):** [Pullback strategy]
- **Plan B (Aggressive):** [Breakout chase strategy]
- **Plan C (Balanced):** [Combined strategy]

### 💡 Conclusion
**Recommendation:** [Buy/Sell/Hold]
**Risk Warning:** [Caution]

---
*Analysis Time: [Time] | Data Source: Sina Finance*
```

---

## 🧠 Trading Psychology & Wisdom

### Institutional Traps (A-Share Characteristics)

**Common Bull Traps:**
| Pattern | Reality | Detection |
|---------|---------|-----------|
| Volume Breakout | Fake breakout | Check next day's follow-through |
| Limit Up Attraction | Hot money distribution | Abnormal volume after limit up |
| Golden Cross | Lagging signal | Wait for pattern confirmation |

### Mental Discipline

> "Trading psychology is crucial: Don't let greed/fear control you. Execute strategy strictly. Admit when wrong."

**Iron Rules:**
1. ✅ **Follow the plan** — No impulsive decisions
2. ✅ **Cut losses quickly** — Decisive action
3. ✅ **Let profits run** — Don't rush to take profit
4. ✅ **Don't chase/rush** — Wait for pullback/breakout
5. ✅ **Think independently** — Ignore rumors, avoid crowds

---

## 📚 Related Resources

- [📖 Full SKILL Documentation](./SKILL.md)
- [🇨🇳 简体中文](./README.zh-CN.md)
- [🇯🇵 日本語版](./README.ja.md)
- [🇰🇷 한국어판](./README.ko.md)

---

<p align="center">
  <b>🦞 FoxClaw — Smart Analysis, Wise Decisions</b>
</p>

---

**Version:** 2.0.1  
**Updated:** 2026-03-12  
**Core Contributors:** Mentor Jiang + Practical Lessons + A-Share Characteristics
