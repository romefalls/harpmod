from ws import broadcast

async def handle(message):
    content = message.content
    if content.startswith(".say "):
        msg = content[5:]
        await broadcast(f"say:{msg}")
