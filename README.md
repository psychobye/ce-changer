# ce-changer

skinchanger for standoff 2
for cheat engine (7.6) lua-table script

---

## how to run

1. open cheat engine 7.6
2. launch the game (or emulator) with process named **HD-Player.exe** (bluestacks5)
3. open this script in cheat engine lua engine
4. run the script
5. input the **old skin id** (default 43401)
6. input the **new skin id** (default 240121)
7. script will scan memory for old skin id pattern and replace it with new skin id
8. check console for replaced addresses count and info

---

## notes

- works only for guns and knives skins (no graffity or stickers)
- make sure game process is running and accessible by cheat engine
- script uses AOB scan with custom pattern to find skin ids in memory
- replace ids carefully, wrong id can cause crashes or no effect

---

enjoy your new skins!
