from fastapi import APIRouter, WebSocket, WebSocketDisconnect
from app.websocket import connect_user, disconnect_user, send_message

router = APIRouter()

@router.websocket("/ws/{username}")
async def websocket_endpoint(websocket: WebSocket, username: str):
    await connect_user(username, websocket)
    try:
        while True:
            data = await websocket.receive_json()
            await send_message(
                sender=username,
                receiver=data["to"],
                message=data["message"]
            )
    except WebSocketDisconnect:
        disconnect_user(username)
