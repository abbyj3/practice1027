import unittest
from app import app


class TestApp(unittest.TestCase):
    def setUp(self):
        self.app = app
        self.client = self.app.test_client()

    def test_index_route(self):
        """測試首頁 (/) 是否能正常回傳 200 狀態碼"""
        response = self.client.get("/")
        self.assertEqual(response.status_code, 200)

    def test_index_content(self):
        """測試首頁內容是否包含 Flask 或相關頁面關鍵字"""
        response = self.client.get("/")
        self.assertIn(b"Flask", response.data)


if __name__ == "__main__":
    unittest.main()

