Import("\\script\\ksgvn\\lib.lua")

NewPlayerAward = {}

function NewPlayerAward:Gem(nLevel, nNum)
    KsgAward:ReceiveGem(nLevel, nNum)
end

function NewPlayerAward:ChienCuong(nLevel)
    nLevel = nLevel or 9
    KsgAward:SetChienCuong(nLevel)
end

function NewPlayerAward:SetVanSuc(nLevel)
    KsgAward:SetVanSuc(nLevel)
end

function NewPlayerAward:ThuongHaiChau(nLevel, nCount)
    KsgAward:ThuongHaiChau(nLevel, nCount)
end

function NewPlayerAward:ActiveHoaCanh()
    KsgPlayer:OpenFair()
end

function NewPlayerAward:VSCTRandom()
    KsgAward:Give({
        { nFunc = "KsgItem:AddCapByBody(30651)", nRate = 33 },
        { nFunc = "KsgItem:AddClothByBody(30651)", nRate = 33 },
        { nFunc = "KsgItem:AddShoeByBody(30651)", nRate = 34 },
    }, "VSCT_Award_Random")
end

function NewPlayerAward_Mach2()
    -- callback k th” g‰i Æc hµm c„ d u :, v◊ th’ ph∂i vi’t li“n
    KsgPlayer:MeridianLevelUp(2)
end

