# Totem
This mod gives a +1 in all stats and displays a custom message when a flag is set. 
The mod also clears the configured flag once it's done.

## How to insert
This tool requires:
- python (tested with 3.8.3)
- [devkitARM](https://devkitpro.org/wiki/devkitARM)

Once you have all the necessary software installed and ready to go, just navigate to the root of this project and copy/paste your ROM there. Rename the file to `BPRE0.gba`.  
Open the terminal, navigate to the root of the project, then run `python scripts/build.py 0xFFFFFFFF`, where `0xFFFFFFFF` is the free space in your ROM, and the script should insert everything, creating two new files:
- `multi.gba`: the updated ROM
- `symbols.txt`: a text file containing all the addresses known to the compiler. Conserve this file to know where everything in your ROM was inserted

## How to use
To customize the flag just open the `main.h` file and change the defined `CONFIGURED_FLAG`. It is also necessary to open the `main.s` file and change the `flag equ` value.  
The message is customizable in the `main.s` file. Please note that the origina `0xFB` (show red arrow and close msgbox onkeypress) is replaced to a `0xFA` (show red arrow and scroll to the following message on keypress) in the default implementation.  
Once the routine is inserted, just set the flag before the needed battle and the effects will take place.

## TODO
- insert GFX of stat increasing

## Internal info
First hijack is at `0x08013194`. This is where the game would normally initialize both the player's and the opponent's pokemon stat increases.  
Normally the stat increases are set to `6` (a value of `0` would be interpreted as a -6 in the stat, a value of `6` is default, a value of `12` as a +6 in the stat), here we just check if the pokemon being initialized is the opposing one and if the flag is set: if both are true we just initialize to `7` (+1) instead of `6`.

Second hijack is at `0x08032b18`. This is run every time a message needs to be displayed in battle, specifically after the message has been prepared and written to `0x0202298C` (we will refer to this address as `buffer` from here on).   
The first time this is run, the buffer contains the "Wild X appeared!" message. Here we just modify the buffer to append our custom message to the original one (the buffer has 300 bytes of reserved space, we can write pretty much anything here).  
The second hijack always runs chronologically after the first one, so this is also where we unset the flag. 