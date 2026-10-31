# Flask Hello World 一頁式網站

這是一個使用 Python Flask 框架建置的現代化、響應式「Hello World」一頁式網站。

## 專案目錄結構

```
practice1027/
├── .venv/               # Python 虛擬環境
├── templates/
│   └── index.html       # 一頁式網站前端 HTML/CSS 模板
├── app.py               # Flask 後端應用主程式
├── requirements.txt     # 依賴套件清單 (Flask)
├── run.bat              # Windows 快速啟動腳本
└── README.md            # 專案說明文件
```

## 快速啟動方法

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

## 程式碼說明
- **`app.py`**：建立 Flask 實例並註冊根路徑 `/` 的路由，負責將請求導向渲染 `templates/index.html`。
- **`templates/index.html`**：整合了現代漸層風格、卡片式設計、自適應排版（RWD）以及即時互動點擊效果。
