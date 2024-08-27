from fastapi import FastAPI
from mangum import Mangum

app = FastAPI()

@app.get("/")
async def root():
    """ルートエンドポイント: 'Hello World'を返す"""
    return {"message": "Hello World"}

@app.get("/items/{item_id}")
async def read_item(item_id: int):
    """読み取りAPI/Itemエンドポイント: 提供されたIDを返す"""
    return {"item_id": item_id}

@app.get("/test")
async def test():
    """テスト用のAPIエンドポイント: Testメッセージを含むJSONレスポンスを返す"""
    return {"message": "This is a test endpoint"}

# Mangum handler for AWS Lambda, with added comments in Japanese.
handler = Mangum(app)  # FastAPIアプリケーションのマネージャラウンチハンドラを作成します。
