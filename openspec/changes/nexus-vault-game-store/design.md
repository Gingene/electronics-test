## Context

此專案為全新打造的遊戲虛寶電商平台「Nexus Vault」。目前沒有既有程式碼，屬於 greenfield 開發。目標使用者是面試官和技術評審，需要展示前端工程能力、現代技術棧使用、以及 AI 輔助開發的效率。

**約束條件：**
- 一週衝刺時間限制
- 前端工程師面試作品定位
- 需可部署為可互動的 live demo

## Goals / Non-Goals

**Goals:**
- 建立一個具備完整商品瀏覽與購物流程的前端應用
- 展示 Next.js App Router、Supabase Realtime 等現代技術的實作能力
- 實現暗色科幻主題的精緻 UI，含 glassmorphism 和微動畫
- 包含 AI 推薦功能作為技術亮點
- 可一鍵部署至 Vercel

**Non-Goals:**
- 真實金流串接（使用模擬結帳）
- 後台管理系統（CMS）
- 多語系支援（僅中文 + 英文 UI 元素）
- 完整的訂單管理、退貨流程
- SEO 深度優化（基本 meta tags 即可）
- 效能壓力測試

## Decisions

### 1. 框架選擇：Next.js App Router

**選擇**：Next.js 15 with App Router

**替代方案**：
- Vite + React：更輕量，但無 SSR/SSG，面試展示不夠全面
- Remix：同樣支援 SSR，但生態系相對較小

**理由**：App Router 是業界主流方向，展示 Server Components、Server Actions 等前沿概念對面試加分。內建的 API Routes 也可以用來封裝 Supabase 邏輯。

### 2. 樣式方案：Tailwind CSS + shadcn/ui

**選擇**：Tailwind CSS v4 + shadcn/ui

**替代方案**：
- Vanilla CSS：完全控制但開發速度慢
- CSS Modules + 自訂元件：更乾淨但重複造輪子
- MUI / Ant Design：太重，且風格固定

**理由**：Tailwind 與 AI 編碼配合度最高，shadcn/ui 不是 npm 依賴而是複製到專案的元件，面試時可以展示自訂能力。暗色主題用 Tailwind 的 dark mode 機制實作。

### 3. 後端服務：Supabase (BaaS)

**選擇**：Supabase（PostgreSQL + Auth + Realtime + Storage）

**替代方案**：
- Firebase：NoSQL 不適合結構化電商資料
- 自建 Express/Fastify：一週內寫不完前端加後端
- PlanetScale + Auth0：多個服務組合，設定複雜

**理由**：Supabase 一站式解決 DB、Auth、Realtime 三大需求。PostgreSQL 的關聯式資料模型適合電商。Realtime 訂閱功能讓「即時庫存」實作只需幾行程式碼。

### 4. 狀態管理：Zustand

**選擇**：Zustand 管理 client-side 狀態（購物車、UI 狀態）

**替代方案**：
- Redux Toolkit：太重，setup 繁瑣
- React Context：效能問題，re-render 過多
- Jotai：原子化狀態適合但學習曲線在一週內不值得

**理由**：Zustand 極輕量（< 1KB），API 直覺，搭配 `persist` middleware 可自動同步 localStorage，完美解決購物車持久化。

### 5. AI 推薦系統：漸進式實作

**選擇**：Phase 1 前端 mock → Phase 2 Supabase Edge Functions

**Phase 1（Week 1）**：
- 前端基於 tag matching + 協同過濾的簡單算法
- 用 `browsing history` (localStorage) 匹配商品 tags
- 推薦結果在 client-side 計算

**Phase 2（後續）**：
- Supabase Edge Function (Deno runtime)
- 基於用戶行為資料的服務端推薦
- 可選串接 OpenAI API 生成推薦理由

**理由**：Phase 1 保證一週內可交付且能 demo，Phase 2 展示架構擴展能力。面試時可以聊演進策略。

### 6. 資料庫設計

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│   products   │     │    orders    │     │  order_items │
├──────────────┤     ├──────────────┤     ├──────────────┤
│ id (uuid)    │     │ id (uuid)    │     │ id (uuid)    │
│ name         │◄────│ user_id (fk) │     │ order_id(fk) │
│ description  │     │ status       │     │ product_id   │
│ price        │     │ total        │     │ quantity     │
│ category     │     │ created_at   │     │ price        │
│ rarity       │     └──────────────┘     └──────────────┘
│ game         │
│ image_url    │     ┌──────────────┐
│ stock        │     │   profiles   │
│ tags (array) │     ├──────────────┤
│ featured     │     │ id (uuid)    │
│ created_at   │     │ username     │
└──────────────┘     │ avatar_url   │
                     │ browse_hist  │
                     └──────────────┘
```

### 7. 專案結構

```
src/
├── app/                    # Next.js App Router
│   ├── layout.tsx          # Root layout (dark theme, fonts)
│   ├── page.tsx            # 首頁
│   ├── products/
│   │   ├── page.tsx        # 商品列表
│   │   └── [id]/page.tsx   # 商品詳情
│   ├── cart/page.tsx       # 購物車
│   ├── checkout/page.tsx   # 結帳（模擬）
│   └── auth/
│       ├── login/page.tsx
│       └── register/page.tsx
├── components/
│   ├── ui/                 # shadcn/ui 元件
│   ├── layout/             # Header, Footer, Navigation
│   ├── product/            # ProductCard, ProductGrid, RarityBadge
│   ├── cart/               # CartDrawer, CartItem
│   └── recommendation/     # RecommendationCarousel
├── lib/
│   ├── supabase/           # Supabase client + helpers
│   ├── store/              # Zustand stores
│   └── recommendation/     # AI 推薦邏輯
├── types/                  # TypeScript 型別定義
└── data/                   # Seed data (AI 生成的商品資料)
```

## Risks / Trade-offs

| Risk | Impact | Mitigation |
|------|--------|------------|
| 一週時間不夠完成所有功能 | 功能不完整 | 核心功能優先（商品瀏覽 > 購物車 > 結帳），AI 推薦和 Auth 次之 |
| Supabase 免費額度限制 | API 請求受限 | 善用 Next.js SSG/ISR 減少 API 呼叫、client-side caching |
| Realtime 訂閱連線管理 | 記憶體洩漏 | 使用 useEffect cleanup 正確解除訂閱 |
| AI 生成的假資料不夠真實 | demo 觀感差 | 精心設計資料模板，包含稀有度分佈、合理定價、豐富描述 |
| Tailwind + shadcn 學習曲線 | 開發速度受影響 | 用戶有使用經驗，配合 AI IDE 快速查詢 |
| 暗色主題對比度不足 | 無障礙問題 | 使用 WCAG AA 標準的色彩對比值 |
