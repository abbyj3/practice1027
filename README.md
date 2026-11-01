# Flask Hello World 一頁式網站

這是一個使用 Python Flask 框架建置的現代化、響應式「Hello World」一頁式網站，並已設定 GitHub Actions 與 Render 的 CI/CD 自動化流程。

## 專案目錄結構

```
practice1027/
├── .github/
│   └── workflows/
│       └── deploy.yml   # GitHub Actions CI/CD 工作流程設定
├── .venv/               # Python 虛擬環境
├── templates/
│   └── index.html       # 一頁式網站前端 HTML/CSS 模板
├── tests/
│   └── test_app.py      # 單元測試 (Unit Tests)
├── app.py               # Flask 後端應用主程式
├── render.yaml          # Render 部署設定檔 (Blueprint)
├── requirements.txt     # 依賴套件清單 (Flask、gunicorn)
├── run.bat              # Windows 快速啟動腳本
├── push.bat             # 一鍵推送到 GitHub 腳本
└── README.md            # 專案說明文件
```

## GitHub 儲存庫
- **遠端倉庫**：`https://github.com/abbyj3/practice1027`
- **推送方式**：雙擊 `push.bat` 或在終端機輸入 `git push -u origin main`

## 本機快速啟動方法

### 方法一：使用批次檔（推薦）
在 Windows 檔案總管中，直接雙擊執行 `run.bat` 即可啟動。

### 方法二：使用終端機（PowerShell 或 CMD）
1. 開啟終端機並切換至本專案目錄：
   ```powershell
   cd c:\Users\Abby\Desktop\practice1027
   ```
2. 啟動虛擬環境中的 Flask 網站：
   ```powershell
   .\.venv\Scripts\python.exe app.py
   ```
3. 在瀏覽器網址列輸入並前往：
   ```
   http://127.0.0.1:5000/
   ```
   即可看到 Hello World 頁面！

### 執行單元測試
```powershell
.\.venv\Scripts\python.exe -m unittest discover -s tests
```

---

## CI/CD 自動化流程（GitHub Actions + Render）

專案內建了完整的 CI/CD Pipeline：
1. **CI（持續整合）**：當程式碼推送（Push）或發起 PR 至 `main` 分支時，GitHub Actions 會自動執行環境建置、代碼語法檢查與單元測試。
2. **CD（持續部署）**：當單元測試全數通過，且目標為 `main` 分支時，GitHub Actions 會自動觸發 Render 的 Deploy Hook 進行雲端無縫更新。

### 如何完成 Render 雲端部署設定：

#### 步驟 1：在 Render 上建立 Web Service
1. 註冊 / 登入 [Render](https://render.com/)。
2. 點選右上角 **New +** -> 選擇 **Web Service**。
3. 連結您的 GitHub 帳號並選擇 `abbyj3/practice1027` 儲存庫。
4. 設定基本參數：
   - **Name**: `practice1027`（或自訂）
   - **Environment**: `Python 3`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `gunicorn app:app`
   - **Auto-Deploy**: 建議設為 **No**（因為我們要交由 GitHub Actions 在測試通過後觸發）
5. 點擊 **Create Web Service**。

#### 步驟 2：取得 Render Deploy Hook 網址
1. 在 Render 的 Web Service 頁面，點選左側選單的 **Settings**。
2. 向下滾動找到 **Deploy Hook** 區塊。
3. 點選 **Add Deploy Hook**（若尚未建立），並複製產生的 Hook URL（格式如：`https://api.render.com/deploy/srv-xxxxxx?key=yyyyyy`）。

#### 步驟 3：在 GitHub 設定 Secrets
1. 開啟您的 GitHub 倉庫：`https://github.com/abbyj3/practice1027`
2. 點選上方頁籤 **Settings** -> 左側選單 **Secrets and variables** -> **Actions**。
3. 點擊 **New repository secret**：
   - **Name**: `RENDER_DEPLOY_HOOK_URL`
   - **Secret**: 貼上剛才從 Render 複製的 Deploy Hook 完整網址。
4. 點擊 **Add secret** 儲存。

完成後，每次推送到 `main` 分支，GitHub Actions 都會自動跑測試並部署到 Render！
