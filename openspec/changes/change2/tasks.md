## 1. Database & Auth Setup

- [ ] 1.1 在 Supabase `profiles` 表新增 `role` 欄位（`admin` | `editor` | `user`，預設 `user`）
- [ ] 1.2 新增 `analytics_events` 表（id, user_id, event_type, product_id, created_at）
- [ ] 1.3 建立 `sales_overview` PostgreSQL View（每日訂單數 + 營收聚合）
- [ ] 1.4 新增 `top_products` RPC 函數（依銷售量排序，支援時間範圍參數）
- [ ] 1.5 設定所有 admin 相關 RLS policies（admin/editor 角色才能 SELECT/INSERT/UPDATE/DELETE）
- [ ] 1.6 在 Supabase Storage 建立 `admin-uploads` bucket，設定存取政策（僅 admin/editor 可上傳）
- [ ] 1.7 為 `analytics_events.product_id` 和 `analytics_events.created_at` 建立索引
- [ ] 1.8 為 `orders.status` 和 `orders.created_at` 建立索引（加速訂單查詢）

## 2. Auth & Middleware

- [ ] 2.1 更新 Next.js `middleware.ts`：攔截 `/admin/*` 路由，呼叫 Supabase Server-Side Auth 驗證 session
- [ ] 2.2 在 middleware 中讀取 `profiles.role`，非 admin/editor 角色重導至 `/`
- [ ] 2.3 建立 `lib/auth/admin.ts`：封裝 `requireAdmin()` 和 `requireEditor()` Server Action helpers
- [ ] 2.4 更新 `user-auth` 相關邏輯：註冊時預設 role 為 `user`，移除 `role` 欄位的前台可寫入性

## 3. Admin Layout & Navigation

- [ ] 3.1 建立 `app/(admin)/layout.tsx`：Admin Shell layout，含 sidebar 和 topbar
- [ ] 3.2 建立 Sidebar 元件：顯示 Dashboard / Products / Orders / Users / Analytics 導航項目，Active 狀態高亮
- [ ] 3.3 建立 Admin Topbar：顯示當前用戶名稱、角色 badge、登出按鈕
- [ ] 3.4 實作 Sidebar 響應式收折（桌面展開、平板圖示模式）
- [ ] 3.5 建立 Admin 儀表板首頁 `app/(admin)/admin/page.tsx`：概覽卡片（今日訂單數、今日營收、活躍用戶、庫存警示）

## 4. Product Management (admin-product-mgmt)

- [ ] 4.1 建立商品列表頁 `app/(admin)/admin/products/page.tsx`：表格顯示所有商品（名稱、分類、稀有度、售價、庫存、狀態），支援搜尋與分頁
- [ ] 4.2 建立新增商品頁 `app/(admin)/admin/products/new/page.tsx`：表單含所有 `products` 欄位，含圖片上傳（react-dropzone）
- [ ] 4.3 建立編輯商品頁 `app/(admin)/admin/products/[id]/edit/page.tsx`：預填現有資料的編輯表單
- [ ] 4.4 實作圖片上傳元件：拖曳上傳、預覽、5MB 大小限制、WebP 格式轉換、上傳至 Supabase Storage `admin-uploads`
- [ ] 4.5 實作商品新增 Server Action（含 Supabase insert + Storage URL 更新）
- [ ] 4.6 實作商品編輯 Server Action（含 Supabase update）
- [ ] 4.7 實作商品軟刪除 Server Action（設定 `is_deleted = true` 而非硬刪除）
- [ ] 4.8 實作批量庫存調整功能：在列表頁選取多個商品後，批量更新 `stock` 欄位
- [ ] 4.9 實作商品上架/下架切換（更新 `featured` 欄位或新增 `status` 欄位）

## 5. Order Management (admin-order-mgmt)

- [ ] 5.1 建立訂單列表頁 `app/(admin)/admin/orders/page.tsx`：表格顯示所有訂單（ID、用戶、金額、狀態、建立時間），支援狀態篩選與日期範圍篩選
- [ ] 5.2 建立訂單詳情頁 `app/(admin)/admin/orders/[id]/page.tsx`：顯示訂單明細（商品列表、數量、小計）與用戶資訊
- [ ] 5.3 實作訂單狀態更新 Server Action：允許 Admin 將訂單狀態更新為 `processing / shipped / completed / cancelled`
- [ ] 5.4 在訂單詳情頁實作狀態更新 UI（下拉選單 + 確認按鈕）
- [ ] 5.5 實作訂單列表伺服器端分頁（每頁 20 筆，Supabase `.range()`）

## 6. Analytics Dashboard (admin-analytics)

- [ ] 6.1 安裝 `recharts` 並設定 dynamic import（`ssr: false`）避免 SSR 問題
- [ ] 6.2 建立分析頁面 `app/(admin)/admin/analytics/page.tsx`
- [ ] 6.3 實作銷售趨勢折線圖（過去 30 天每日營收，使用 `sales_overview` view）
- [ ] 6.4 實作熱銷商品 Top 10 橫條圖（使用 `top_products` RPC）
- [ ] 6.5 實作每日活躍用戶（DAU）圖表（基於 `analytics_events` 聚合）
- [ ] 6.6 建立庫存健康度報告：顯示庫存 ≤ 5 的商品列表（警示色標記）
- [ ] 6.7 在前台商品頁、購物車觸發 `analytics_events` 記錄（view, add_to_cart, purchase）
- [ ] 6.8 實作儀表板概覽卡片資料查詢（今日訂單數、今日營收、總用戶數、低庫存商品數）

## 7. User Management (admin-user-mgmt)

- [ ] 7.1 建立用戶列表頁 `app/(admin)/admin/users/page.tsx`：表格顯示所有用戶（用戶名、email、角色、建立時間、狀態），支援搜尋
- [ ] 7.2 建立用戶詳情頁 `app/(admin)/admin/users/[id]/page.tsx`：顯示用戶基本資料與訂單歷史列表
- [ ] 7.3 實作帳號封鎖/解封 Server Action（在 profiles 表新增 `is_banned` 欄位，並透過 Supabase Admin API 處理 Auth 層封鎖）
- [ ] 7.4 實作角色變更 Server Action（Admin 可將用戶提升為 editor 或降回 user）

## 8. RBAC Enforcement (admin-rbac)

- [ ] 8.1 Editor 角色：僅能存取 Products 和 Orders 管理，無法存取 Users 和 Analytics
- [ ] 8.2 在 Sidebar 根據當前用戶角色動態顯示/隱藏導航項目
- [ ] 8.3 在 Server Actions 中加入 `requireAdmin()` 守衛（角色不符則拋出 403）
- [ ] 8.4 在 RLS policies 中區分 admin 與 editor 的寫入權限（editor 不能刪除商品或封鎖用戶）

## 9. UI Polish & Testing

- [ ] 9.1 Admin 所有表格加入 Loading skeleton 狀態
- [ ] 9.2 Server Action 成功/失敗後顯示 Toast 通知（使用現有 shadcn/ui toast）
- [ ] 9.3 危險操作（刪除、封鎖帳號）加入確認對話框（shadcn/ui AlertDialog）
- [ ] 9.4 所有表單加入 Zod 驗證（商品表單、訂單狀態更新）
- [ ] 9.5 桌面版（1280px+）佈局測試與 bug 修復
- [ ] 9.6 Admin 路由 E2E 保護測試：確認未登入用戶和一般用戶無法存取 `/admin/*`
