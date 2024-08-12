from fastapi import FastAPI
from mangum import Mangum

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/items/{item_id}")
async def read_item(item_id: int):
    return {"item_id": item_id}

@app.get("/test")
async def test():
    return {"message": "This is a test endpoint"}

# Mangum handler for AWS Lambda
handler = Mangum(app)
