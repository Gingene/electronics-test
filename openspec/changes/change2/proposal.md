## Why

在 Nexus Vault 遊戲虛寶電商平台上線後，需要一套後台管理儀表板，讓平台維運人員能夠管理商品庫存、追蹤訂單狀態與分析營運數據。目前所有資料操作須直接透過 Supabase 控制台進行，效率低且容易出錯。此 change 旨在提供一個安全、直覺的 Admin Dashboard 介面，加速日常維運作業。

## What Changes

基於現有 Nexus Vault 專案（change1）擴充後台管理功能：

- **商品管理（CRUD）**：新增、編輯、下架商品，上傳商品圖片，批量調整庫存
- **訂單管理**：檢視所有訂單列表、篩選訂單狀態、手動更新訂單狀態（處理中 / 已出貨 / 已完成 / 已取消）
- **數據分析儀表板**：銷售額趨勢圖、最暢銷商品 Top 10、每日活躍用戶（DAU）、庫存健康度報告
- **用戶管理**：列出所有註冊用戶、查看用戶訂單歷史、封鎖/解封帳號
- **角色與權限控制**：區分 Admin / Editor 角色，Editor 僅能編輯商品，Admin 有完整存取權限

## Capabilities

### New Capabilities
- `admin-product-mgmt`: 商品後台管理 — CRUD 操作、圖片上傳、庫存批量調整、商品狀態管理（上架/下架）
- `admin-order-mgmt`: 訂單後台管理 — 訂單列表、狀態篩選與更新、訂單詳情展開
- `admin-analytics`: 數據分析儀表板 — 銷售趨勢圖、熱銷商品排行、用戶活躍數據、庫存警示
- `admin-user-mgmt`: 用戶後台管理 — 用戶列表、訂單歷史查詢、帳號封鎖管理
- `admin-rbac`: 角色權限控制 — Admin / Editor 角色定義、路由保護、功能存取限制

### Modified Capabilities
- `user-auth`（來自 change1）：擴充支援 Admin 角色識別，在 profiles 表新增 `role` 欄位

## Impact

- **路由新增**：`/admin/*` 路由群組，受 Admin 角色保護
- **資料庫異動**：profiles 表新增 `role` 欄位；新增 `analytics_events` 表記錄用戶行為
- **外部依賴**：新增 `recharts`（或 `chart.js`）繪製數據圖表；`react-dropzone` 處理圖片上傳
- **Supabase Storage**：需要 `admin-uploads` bucket 供後台圖片管理使用
- **安全性**：所有 Admin API 需透過 RLS 與 Supabase Server-Side Auth 雙重驗證
