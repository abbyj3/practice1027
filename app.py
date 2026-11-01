from flask import Flask, render_template

# 初始化 Flask 應用程式 測試修改
app = Flask(__name__)


@app.route("/")
def index():
    """首頁路由：渲染一頁式 Hello World 網站"""
    return render_template("index.html")


if __name__ == "__main__":
    # 啟動本機開發伺服器。
    print("啟動 Flask 網站伺服器：http://127.0.0.1:5000/")
    app.run(host="127.0.0.1", port=5000)
