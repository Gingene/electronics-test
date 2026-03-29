## Context

此 change 基於 Nexus Vault 既有專案（Next.js 15 App Router + Supabase + Tailwind CSS + shadcn/ui）新增後台管理模組。現有前台應用已完成商品瀏覽、購物車、Realtime 庫存與 Supabase Auth。Admin Dashboard 以同一 repo 內新增 `/admin` 路由群組的方式實作，共用設計系統與 Supabase 連線。

**約束條件：**
- 與 change1 同一 monorepo，不引入獨立後端服務
- 使用 Supabase RLS + Server-Side Auth 確保安全性
- UI 沿用暗色科幻主題，後台視覺與前台保持一致性

## Goals / Non-Goals

**Goals:**
- 商品 CRUD（含圖片上傳）與庫存批量調整
- 訂單狀態管理（手動更新）
- 數據分析儀表板（銷售圖表、Top 10 商品、DAU）
- 用戶管理（列表、訂單歷史、封鎖）
- Admin / Editor 角色權限控制

**Non-Goals:**
- 自動化庫存補貨系統
- 多層級角色（僅 Admin / Editor 兩種）
- 財務報表 / 發票整合
- 多語言後台介面
- 即時通知系統（如新訂單推播）
- 行動裝置優先設計（後台以桌面為主）

## Decisions

### 1. Admin 路由：Same-Repo Route Group

**選擇**：在現有 Next.js 專案新增 `app/(admin)/` Route Group

**替代方案**：
- 獨立 Next.js 應用（monorepo 子套件）：隔離性佳，但設定複雜、共用元件困難
- 同一路由下 `/admin`（無 Route Group）：與前台路由混在一起，維護困難

**理由**：Route Group `(admin)` 可套用獨立 layout（側邊欄式導航），與前台 `(shop)` layout 完全分離，且共享所有現有 lib、types 與 Supabase client。

### 2. 角色控制：Supabase RLS + Middleware

**選擇**：
- DB 層：`profiles.role` 欄位（`admin` | `editor` | `user`），RLS policy 僅允許 admin/editor 角色存取 admin-scoped tables
- App 層：Next.js `middleware.ts` 攔截 `/admin/*` 請求，透過 Supabase Server-Side Auth 驗證角色

**理由**：雙層保護（DB + App）確保即使前端繞過，API 也無法存取。Supabase RLS 是 PostgreSQL native 機制，效能佳且無需額外 API gateway。

### 3. 圖表庫：Recharts

**選擇**：`recharts`

**替代方案**：
- `chart.js` + `react-chartjs-2`：功能強大但套件較大，設定繁瑣
- `tremor`：UI-first 數據元件庫，整合快速但客製化受限

**理由**：Recharts 是 React-native 圖表庫，與 React 生命週期整合自然，支援 Responsive Container，體積適中，暗色主題客製化容易。

### 4. 圖片上傳：React Dropzone + Supabase Storage

**選擇**：`react-dropzone` + Supabase Storage `admin-uploads` bucket

**替代方案**：
- 直接 `<input type="file">`：UX 較差，無拖曳支援
- Cloudinary / S3：額外付費服務，已有 Supabase Storage 可用

**理由**：react-dropzone 提供拖曳、預覽、檔案驗證等 UX，Supabase Storage 已在 change1 使用，無需新增外部服務。

### 5. 數據查詢：Supabase RPC + Views

**選擇**：建立 Supabase PostgreSQL Views 與 RPC 函數提供聚合數據

**替代方案**：
- 前端拉取全量資料再計算：效能差、資料量大時無法擴展
- 獨立分析服務（如 Metabase）：超出 scope

**理由**：PostgreSQL Views 可封裝複雜聚合查詢（銷售總額、Top 商品），RPC 函數提供參數化查詢（按時間範圍篩選），查詢效率優於前端計算。

### 6. Admin 路由結構

```
src/app/(admin)/
├── layout.tsx              # Admin shell layout（側邊欄 + topbar）
├── admin/
│   ├── page.tsx            # 儀表板首頁（概覽卡片 + 圖表）
│   ├── products/
│   │   ├── page.tsx        # 商品列表（表格 + 搜尋）
│   │   ├── new/page.tsx    # 新增商品
│   │   └── [id]/edit/page.tsx  # 編輯商品
│   ├── orders/
│   │   ├── page.tsx        # 訂單列表（篩選 + 分頁）
│   │   └── [id]/page.tsx   # 訂單詳情
│   ├── users/
│   │   ├── page.tsx        # 用戶列表
│   │   └── [id]/page.tsx   # 用戶詳情 + 訂單歷史
│   └── analytics/
│       └── page.tsx        # 深度分析頁面
```

### 7. 資料庫異動

```sql
-- profiles 表新增 role 欄位
ALTER TABLE profiles ADD COLUMN role TEXT NOT NULL DEFAULT 'user'
  CHECK (role IN ('admin', 'editor', 'user'));

-- 分析事件表
CREATE TABLE analytics_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES profiles(id),
  event_type TEXT NOT NULL,   -- 'view', 'add_to_cart', 'purchase'
  product_id UUID REFERENCES products(id),
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 銷售概覽 View
CREATE VIEW sales_overview AS
  SELECT
    DATE_TRUNC('day', o.created_at) AS date,
    COUNT(o.id) AS order_count,
    SUM(o.total) AS revenue
  FROM orders o
  WHERE o.status != 'cancelled'
  GROUP BY 1;
```

## Risks / Trade-offs

| Risk | Impact | Mitigation |
|------|--------|------------|
| Admin 路由被未授權用戶存取 | 資料洩露 | Middleware 雙重驗證 + RLS policy |
| 大量訂單/商品分頁效能 | 載入緩慢 | 伺服器端分頁（Supabase `.range()`）+ 索引 |
| 圖片上傳大檔案導致 Storage 費用 | 成本上升 | 前端限制 5MB + WebP 轉換壓縮 |
| recharts 在 Next.js SSR 相容問題 | 頁面錯誤 | 使用 `dynamic(() => import(...), { ssr: false })` |
| Editor 角色誤操作刪除資料 | 資料遺失 | 軟刪除（is_deleted 欄位）取代硬刪除，保留 30 天 |
