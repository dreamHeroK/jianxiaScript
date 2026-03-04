function main()
    local szTitle = "<color=green>C¸i ThÕ<color>: ThÕ giíi ngoµi th«n cã g× vui chø, mäi ng­êi ë bªn nhau míi vui."
    local tbSay = {
        "Më cöa hµnh Âm ThÕ YÕu QuyÕt/TaoYuan_OpenShop",
        "Hñy bá/nothing"
    }
    Say(szTitle, getn(tbSay), tbSay)
end

function TaoYuan_OpenShop()
    SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3101, "Cöa hµnh Âm ThÕ YÕu QuyÕt"))
end