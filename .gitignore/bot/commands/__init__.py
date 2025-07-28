from . import say

handlers = [say.handle]

async def dispatch(message):
    for handler in handlers:
        await handler(message)
