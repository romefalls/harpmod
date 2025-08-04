# Harpmod source

warning: yap

Writing Harpmod has given me a whole new insight into micro-optimization. 
It has accurately demonstrated a new level of Luau and its inner workings, 
alongside brought a whole new perspective that has forever changed how I write code in my work.

Using Electric State as a playground was a great choice in this case, 
as its anti-exploit systems have holes in them and are flawed. 
The game itself has a few things to keep track of when writing the killaura for example.

You have to keep track of:

1. the player's combat status (pacified, flagged, dangerous,)
2. whether you have a gun out or not,
3. whether the player is in range,
4. whether the player is dead,
5. whether the player can be shot,

and the list keeps going on and on.

The killaura loop is my best work yet; running at a max range of 250 and speed of 0, 
MicroProfiler tests show that on low-end hardware, the loop runs at about 0.5 ms averages, 
whereas on common mid-range hardware, the loop runs at about 0.1 ms averages, 
just about pushing the limit of what your CPU and/or Roblox can do. 

I'm really proud.