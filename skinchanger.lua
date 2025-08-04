local TARGET_PROCESS    = "HD-Player.exe" -- bluestacks5
local OLD_SKIN_ID = tonumber(inputQuery("skinchanger", "OLD ID", "43401"))
local NEW_SKIN_ID = tonumber(inputQuery("skinchanger", "NEW ID", "240121"))

-- id to hex
function intToBytes(num)
    return string.char(
        num & 0xFF,
        (num >> 8) & 0xFF,
        (num >> 16) & 0xFF,
        (num >> 24) & 0xFF
    )
end

-- only for guns and knives (not for graffity & stickers)
function changeSkin()
    local oldBytes = intToBytes(OLD_SKIN_ID)
    local newBytes = intToBytes(NEW_SKIN_ID)

    local aobPattern = ''
    for i = 1, #oldBytes do
        aobPattern = aobPattern .. string.format('%02X ', oldBytes:byte(i))
    end
    aobPattern = aobPattern .. '01 00 00 00 ?? ?? ?? ??' -- new legendary pattern :3 by psychobye

    local scan = AOBScan(aobPattern, "+W+X", 0x0000000000000000, 0x7fffffffffff)
    if scan == nil then
        print("adress not found!")
        return
    end

    local count = scan.Count
    for i = 0, count - 1 do
        local address = scan[i]
        writeBytes(address, newBytes:byte(1), newBytes:byte(2), newBytes:byte(3), newBytes:byte(4))
        print(string.format("[+] addres: %s", address))
    end
    scan.Destroy()
    print(string.format("\n[+] replaced '%d' skins", count))
end

-- lets gooo
print("search: " .. string.format('%02X %02X %02X %02X 01 00 00 00 ?? ?? ?? ??',
    OLD_SKIN_ID & 0xFF, (OLD_SKIN_ID >> 8) & 0xFF, (OLD_SKIN_ID >> 16) & 0xFF, (OLD_SKIN_ID >> 24) & 0xFF))
changeSkin()