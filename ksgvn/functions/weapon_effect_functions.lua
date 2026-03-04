Import("\\script\\ksgvn\\lib.lua")

g_szNpcName = g_szNpcName or "<color=green>T©n Thñ LÖnh:<color> "
TASK_TEMP_WEAPONIDX = 153
_g_tbWeaponEffects = {
    [1] = "ThiÕt Cèt",
    [2] = "L¹c Hµ",
    [3] = "B¸ch ChiÕn",
    [4] = "Ch­íc NhËt",
    [5] = "TuÊn DËt",
    [6] = "§µo Lý",
    [7] = "Danh Tóc",
    [8] = "L¨ng Tiªu",
    [9] = "PhÇn V©n",
    [10] = "§o¹n Giao",
    [11] = "Tinh Di",
    [12] = "Ph¸ Qu©n",
    [13] = "Hµo m«n",
}

_g_tbSoulPowers = {
    [1] = { 1, 1 },
    [2] = { 2, 2 },
    [3] = { 2, 2 },
    [4] = { 2, 2 },
    [5] = { 2, 2 },
    [6] = { 2, 2 },
    [7] = { 2, 2 },
    [8] = { 3, 3 },
    [9] = { 3, 3 },
    [10] = { 3, 3 },
    [11] = { 3, 3 },
    [12] = { 4, 4 },
    [13] = { 4, 4 },
}
function weaponEffect_Show()
    local nWeaponIndex = GetPlayerEquipIndex(2);
    SetTaskTemp(TASK_TEMP_WEAPONIDX, nWeaponIndex)
    local tSay = {
        g_szNpcName .. "H·y chän lo¹i linh ph¸ch mµ c¸c h¹ muèn kÝch ho¹t:<enter><color=red>L­u ý: NÕu vò khÝ ®· tån t¹i linh ph¸ch th× linh ph¸ch cò sÏ bÞ thay thÕ<color>",
    }

    for nEffectId, szEffectName in _g_tbWeaponEffects do
        tinsert(tSay, format("Linh Ph¸ch-%s /#weaponEffect_Active(%d)", szEffectName, nEffectId))
    end
    tinsert(tSay, "T¹m ch­a muèn kÝch ho¹t/no")
    KsgNpc:SayDialog(tSay)
end

function weaponEffect_Active(nEffectId, nBuyType)
    if not _g_tbWeaponEffects[nEffectId] then
        return KsgNpc:Talk("Linh Ph¸ch nµy kh«ng tån t¹i!")
    end
    local tbTypeCfg = {
        [1] = {
            nDay = 7,
            tbCost = { tbProp = { 2, 1, 31507 }, nCount = 1 },
        },
        [2] = {
            nDay = 7,
            tbCost = { tbProp = { 2, 1, 30230 }, nCount = 400 },
        },
        [3] = {
            nDay = 30,
            tbCost = { tbProp = { 2, 1, 30230 }, nCount = 1200 },
        },
    }
    if nBuyType then
        if not tbTypeCfg[nBuyType] then
            return KsgNpc:Talk("Kh«ng thÓ gia h¹n h×nh thøc nµy!")
        end
        if _weaponEffect_isWeaponChanged() then
            return
        end
        local tbCondition = {
            tbItems = {
                tbTypeCfg[nBuyType].tbCost,
            },
        }
        if not KsgLib:PayMaterial(tbCondition) then
            return
        end
        if BindWeaponEffect(_g_tbWeaponEffects[nEffectId], tbTypeCfg[nBuyType].nDay * 86400) == 1 then
            KsgNpc:Talk(g_szNpcName .. format("Chóc mõng c¸c h¹ ®· thµnh c«ng thªm ®Æc hiÖu cho vò khÝ <color=yellow>%s<color>! T¹i <color=yellow>biÓu t­îng gãc d­íi bªn tr¸i cña vò khÝ<color>, bÊm vµo nót mµu ®á ®Ó ho¸n linh, cã thÓ ®¸nh thøc <color=yellow>linh ph¸ch<color>. PhÝm t¾t ®Ó thøc tØnh <color=yellow>linh ph¸ch<color>: <color=red>F<color> !", _g_tbWeaponEffects[nEffectId]))
            AddGlobalNews(format("Giang hå ®ån r»ng, %s dïng tè chÊt thiªn bÈm gäi tØnh linh ph¸ch cña vò khÝ: %s, thËt kh«ng hæ danh v¨n vâ song toµn!", GetName(), _g_tbWeaponEffects[nEffectId]))
        else
            return KsgNpc:Talk("X¶y ra lçi, kh«ng thÓ thøc tØnh lo¹i linh ph¸ch nµy lªn vò khÝ hiÖn t¹i!")
        end
        if AddWeaponEffectAttribute(8, _g_tbSoulPowers[nEffectId][1]) == 1 then
            gf_WriteLogEx("WeaponEffect", format("Thªm linh lùc thø %d cÊp %d", 1, _g_tbSoulPowers[nEffectId][1]), 1, "", 1, "", "Thµnh c«ng");
        else
            gf_WriteLogEx("WeaponEffect", format("Thªm linh lùc thø %d cÊp %d", 1, _g_tbSoulPowers[nEffectId][1]), 1, "", 0, "", "ThÊt b¹i");
        end
        if AddWeaponEffectAttribute(9, _g_tbSoulPowers[nEffectId][2]) == 1 then
            gf_WriteLogEx("WeaponEffect", format("Thªm linh lùc thø %d cÊp %d", 2, _g_tbSoulPowers[nEffectId][2]), 1, "", 1, "", "Thµnh c«ng");
            return 1
        else
            gf_WriteLogEx("WeaponEffect", format("Thªm linh lùc thø %d cÊp %d", 2, _g_tbSoulPowers[nEffectId][2]), 1, "", 0, "", "ThÊt b¹i");
            return 0
        end
        return
    end
    local tSay = {
        g_szNpcName .. format("%s ®· chän linh ph¸ch <color=yellow>%s<color>, %s muèn l­u gi÷ linh ph¸ch trong bao l©u?", gf_GetPlayerSexName(), _g_tbWeaponEffects[nEffectId], gf_GetPlayerSexName())
    }
    for nType, tbCfg in tbTypeCfg do
        local tbCost = tbCfg.tbCost
        tinsert(tSay, format("%d ngµy (Tèn [%s] x %d)/#weaponEffect_Active(%d,%d)", tbCfg.nDay, KsgItem:GetName(tbCost.tbProp), tbCost.nCount, nEffectId, nType))
    end
    tinsert(tSay, "Rêi ®i/no")
    KsgNpc:SayDialog(tSay)
end

function _weaponEffect_isWeaponChanged()
    local nWeaponIndex = GetPlayerEquipIndex(2)
    local nWeaponIndexSaved = GetTaskTemp(TASK_TEMP_WEAPONIDX)
    if nWeaponIndex == 0 then
        KsgNpc:Talk(g_szNpcName .. "Tr­íc tiªn ®¹i hiÖp cÇn trang bÞ mét lo¹i vò khÝ!")
        return 1
    end
    if nWeaponIndexSaved ~= nWeaponIndex then
        KsgNpc:Talk(g_szNpcName .. "¢y da... ®¹i hiÖp tr¸o ®æi vò khÝ nhanh thËt ®Êy, nh­ng kh«ng qua nçi m¾t ta ®©u! Th©n lµ ®¹i hiÖp quang minh lçi l¹c th× ®õng nªn lµm nh÷ng viÖc nh­ vËy nhÐ!")
        return 1
    end
    return nil
end