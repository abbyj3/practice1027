@echo off
chcp 65001 >nul
echo ==============================================
echo   正在啟動 Flask Hello World 一頁式網站...
echo ==============================================

if exist .venv\Scripts\python.exe (
    echo [1/2] 檢查虛擬環境... OK
    echo [2/2] 正在安裝 / 確認依賴套件...
    .venv\Scripts\python.exe -m pip install -r requirements.txt
    echo.
    echo 啟動伺服器中... 請在瀏覽器開啟 http://127.0.0.1:5000
    .venv\Scripts\python.exe app.py
) else (
    echo [1/2] 正在使用系統 Python...
    python -m pip install -r requirements.txt
    echo.
    echo 啟動伺服器中... 請在瀏覽器開啟 http://127.0.0.1:5000
    python app.py
)
pause
