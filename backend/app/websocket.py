from fastapi import WebSocket

active_connections: dict[str, WebSocket] = {}

async def connect_user(username: str, websocket: WebSocket):
    await websocket.accept()
    active_connections[username] = websocket
    print(f"{username} connected")

def disconnect_user(username: str):
    active_connections.pop(username, None)
    print(f"{username} disconnected")

async def send_message(sender: str, receiver: str, message: str):
    if receiver in active_connections:
        await active_connections[receiver].send_json({
            "from": sender,
            "message": message
        })
