# CN Lottery APP — Website → Mobile Plan

Reference: yiqicai.com (desktop web). Product: Flutter phone APP (not a website clone).

## Screenshot inventory → mobile mapping

| # | Web page | Keep in V1 APP? | Mobile treatment |
|---|----------|-----------------|------------------|
| 1 | Home 首页 — result cards + news + toolbox | **Yes (core)** | Single-column scroll: latest draws first |
| 2–4 | Home lower sections / experts / footer | Later | Skip ads/QR/footer; experts optional V2 |
| 5–6 | 大乐透 detail + prize table + toolbox | **Yes (core)** | Detail screen: numbers → stats → prize table → tool grid |
| 7 | 开奖公告 national/local table | **Yes (core)** | Card list + 全国彩/地方彩 toggle |
| 8 | 走势图 hub | **Yes (shell)** | Category grid → chart placeholder until data ready |
| 9 | 大师方案 | V2 | Needs content API; not from scrape sources |
| 10 | 幸运晒票 | V2 | Social upload; out of scrape scope |
| 11 | 专家推荐 | V2 | Content platform feature |
| 12 | 玩法规则 | **Yes (light)** | Simple rules directory |
| 13 | 专家专题 | V2 | Content |
| 14 | 开机号 | V2 / optional | Card list if source provides |
| 15 | 选号直播 | V2 | Video; not scrape |
| 16 | 出球回放 | V2 | Video; not scrape |

## Mobile information architecture

Bottom tabs (phone APP pattern):

1. **首页** — latest draws for all categories (from both scrape sources)
2. **开奖** — 全国彩 / 地方彩 list → detail → history
3. **走势** — lottery picker → trend views (mock/placeholder first)
4. **我的** — settings, about, refresh/cache (simple)

## Design tokens (from screenshots)

- Primary red: `#E60012` (nav, accents, CTAs)
- Ball red: `#E53935` / ball blue: `#1E88E5`
- Page bg: `#F5F5F5`
- Card: white, light border `#EEEEEE`
- Dense → airy: more padding on phone; one column only

## Core reusable widgets

- `LotteryBall` — red/blue circle number
- `DrawResultCard` — name, issue, time, balls, quick actions
- `SegmentToggle` — 全国彩 / 地方彩
- `PrizeTable` — award rows
- `ToolGrid` — 4-column icon tools on detail

## Data strategy (parallel with scraper)

- Flutter talks only to **our API** (mock JSON now)
- Normalize both scrape sources into one model: `LotteryType`, `Draw`, `PrizeTier`
- Real DB wired when scraper finishes

## Tech

- Flutter + Dart
- `flutter_screenutil` from project start (client request)
- `go_router` / simple Navigator
- Mock repository → swap to Dio API later
- Test on **LDPlayer** (Android)

## Delivery phases

1. **Now** — Flutter shell + Home + Results + Detail + History (mock)
2. **Next** — Backend API contract + connect when DB ready
3. **Later** — Trends real charts, rules content, optional expert/live modules if client insists
