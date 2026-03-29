## Why

打造一個遊戲虛寶交易平台「Nexus Vault」作為前端工程師面試作品。此專案同時作為學習 AI IDE 開發工作流的練習，展示使用 Next.js + Supabase 技術棧快速建立現代電商應用的能力。目標是在一週衝刺內完成一個具備 AI 推薦、即時庫存等亮點功能的精緻作品。

## What Changes

This is a greenfield project. The following capabilities will be built from scratch:

- **商品瀏覽系統**：首頁、商品列表（含分類/稀有度篩選、搜尋、排序）、商品詳情頁
- **購物車與結帳**：Client-side 購物車狀態管理、模擬結帳流程
- **即時庫存系統**：透過 Supabase Realtime 訂閱庫存變動，即時反映在 UI 上
- **AI 推薦系統**：Phase 1 使用前端 mock 算法，Phase 2 遷移至 Supabase Edge Functions
- **使用者驗證**：Supabase Auth 實現登入/註冊
- **暗色科幻主題 UI**：Glassmorphism 卡片、稀有度發光效果、微動畫互動
- **AI 批量生成產品資料**：50+ 遊戲虛寶商品（武器、造型、寶石、卡牌等）

## Capabilities

### New Capabilities
- `product-catalog`: 商品目錄系統 — 商品資料模型、分類、篩選、搜尋、排序、商品詳情展示
- `shopping-cart`: 購物車與結帳 — Client-side 購物車狀態管理、模擬結帳流程
- `realtime-inventory`: 即時庫存 — Supabase Realtime 訂閱庫存變動、即時 UI 更新、庫存不足提示
- `ai-recommendation`: AI 推薦系統 — 基於瀏覽紀錄的商品推薦、Phase 1 mock 算法 / Phase 2 Edge Functions
- `user-auth`: 使用者驗證 — Supabase Auth 登入/註冊、受保護路由、用戶狀態管理

### Modified Capabilities
<!-- No existing capabilities to modify — this is a greenfield project -->

## Impact

- **新增專案結構**：Next.js App Router 專案、Tailwind CSS + shadcn/ui 設計系統
- **外部依賴**：Supabase (Auth, Database, Realtime, Storage)、shadcn/ui 元件庫
- **部署**：Vercel 部署，需設定 Supabase 環境變數
- **資料庫**：Supabase PostgreSQL — 商品表、用戶表、訂單表、庫存表
- **API**：Next.js API Routes / Server Actions 與 Supabase 互動
