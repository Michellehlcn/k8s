from fastapi import FastAPI
app = FastAPI()

# app.run(port=8080,host='0.0.0.0',debug=True)

@app.get("/")
def read_root():
    return {"Hello" : "World"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}

