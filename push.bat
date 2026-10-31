@echo off
chcp 65001 >nul
echo ==============================================
echo   正在推送到 GitHub: abbyj3/practice1027 ...
echo ==============================================
echo.
echo 若首次推送，系統會跳出 GitHub 登入授權視窗，請完成驗證。
echo.
git push -u origin main
echo.
if %errorlevel% equ 0 (
    echo [成功] 程式碼已成功推送到 https://github.com/abbyj3/practice1027 !
) else (
    echo [提示] 推送遇到狀況，請檢查：
    echo 1. GitHub 上是否已建立名為 practice1027 的儲存庫
    echo 2. 您的帳號是否有權限推送到此儲存庫
)
echo.
pause
