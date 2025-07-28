print("getting modules")
import asyncio
import discord
from commands import dispatch
from config import TOKEN
from ws import start_ws_server
print("setting client intents")

intents = discord.Intents.default()
intents.message_content = True
client = discord.Client(intents=intents)

print("ready.")
@client.event
async def on_message(message):
    if not message.author.bot:
        print("got message:", message)
        await dispatch(message)

async def main():
    await asyncio.gather(
        start_ws_server(),
        client.start(TOKEN)
    )

print("running asyncio thread")
asyncio.run(main())
