import asyncio
import websockets
from config import WS_PORT

clients = set()

async def ws_server_handler(ws):
    clients.add(ws)
    try:
        async for msg in ws:
            for client in clients:
                if client != ws:
                    await client.send(msg)
    finally:
        clients.remove(ws)

async def start_ws_server():
    async with websockets.serve(ws_server_handler, "localhost", WS_PORT):
        await asyncio.Future()

async def broadcast(msg):
    for ws in clients.copy():
        try:
            await ws.send(msg)
        except:
            clients.remove(ws)
