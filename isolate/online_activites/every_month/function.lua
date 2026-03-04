--÷˜“™π¶ƒ‹∂º‘⁄’‚¿Ô µœ÷

Include("\\script\\isolate\\online_activites\\every_month\\head.lua")

function add_material(nType, nNum)
    local t = tConfig.tMaterials[nType]
    local g, d, p = unpack(t[2])
    AddItem(g, d, p, nNum)
    Msg2Player(format("ChÛc mıng Æπt Æ≠Óc %sx%d", t[1], nNum))
end

function get_product_use_count(nType)
    if nType >= 1 and nType <= getn(tConfig.tProducts) then
        return get_task(format("task_use_item%d_count", nType))
    end
    return -1
end
--Modify by trungbt
LIB_Award = {
    szLogTitle = "",
    szLogAction = "",
}
function LIB_Award:Award(tbAwardList)
    --	local nResult = 0
    -- Award Kinh Nghiem
    if type(tbAwardList["nExp"]) == "number" then
        if type(tbAwardList["nCheckExp"]) == "number" and tbAwardList["nCheckExp"] ~= 0 then
            if GetPlayerRebornParam(0) < 1 then
                if tbAwardList["nExp"] > (2000000000 - GetExp()) then
                    Msg2Player("ßi”m kinh nghi÷m Æ∑ Æπt giÌi hπn tËi Æa n™n c∏c hπ kh´ng th” nhÀn th™m!!!")
                    --					return 0
                end
            end
        end
        ModifyExp(tbAwardList["nExp"])
        Msg2Player("ßi”m kinh nghi÷m t®ng th™m " .. tbAwardList["nExp"] .. ".")
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nExp"], "Kinh nghi÷m")
        end
    end
    -- Award Item
    if type(tbAwardList["item"]) == "table" then
        local tbItemSet = tbAwardList["item"]
        for i = 1, getn(tbItemSet) do
            local tbItem = tbItemSet[i]["gdp"]
            -- Add nhieu item co han su dung hoac co dinh hon
            if type(tbItemSet[i]["nExpired"]) == "number" or type(tbItemSet[i]["nDinhhon"]) == "number" then
                for j = 1, tbItemSet[i]["gdp"][4] do
                    local nRet, nItemIdx = 0, 0
                    if tbItemSet[i]["gdp"][5] ~= nil then
                        nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1, tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
                    else
                        nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1)
                    end
                    if nRet == 1 then
                        --Talk(1,"","Item name: " .. tbItemSet[i]["name"])
                        --Talk(1,"","Log Title: " .. self.szLogTitle)
                        -- Set Expired date
                        if type(tbItemSet[i]["nExpired"]) == "number" then
                            SetItemExpireTime(nItemIdx, tbItemSet[i]["nExpired"])
                        end
                        -- Set dinh hon
                        if type(tbItemSet[i]["nDinhhon"]) == "number" then
                            Msg2Player("Set dinh hon: -- " .. tbItemSet[i]["nDinhhon"])
                            if tbItemSet[i]["nDinhhon"] == 7 then
                                SetItemSpecialAttr(nItemIdx, "DING7", 1)
                            else
                                SetItemSpecialAttr(nItemIdx, "DING10", 1)
                            end
                        end
                    end
                end
            else
                -- Add nhieu item xep chong
                if tbItemSet[i]["gdp"][5] ~= nil then
                    nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4], tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
                else
                    nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4])
                end
            end
            -- WriteLog
            if self.szLogTitle ~= "" then
                if tbItemSet[i]["name"] == nil then
                    local szItemName = GetItemName(tbItemSet[i]["gdp"][1], tbItemSet[i]["gdp"][2], tbItemSet[i]["gdp"][3])
                    gf_WriteLogEx(self.szLogTitle, self.szLogAction, 1, szItemName)
                    Msg2Player("Bπn nhÀn Æ≠Óc " .. tbItemSet[i]["gdp"][4] .. " " .. szItemName .. ".")
                else
                    gf_WriteLogEx(self.szLogTitle, self.szLogAction, 1, tbItemSet[i]["name"])
                    Msg2Player("Bπn nhÀn Æ≠Óc " .. tbItemSet[i]["gdp"][4] .. " " .. tbItemSet[i]["name"] .. ".")
                end
            end
        end
    end
    -- Award Task
    if type(tbAwardList["task"]) == "table" then
        local tbTaskSet = tbAwardList["task"]
        for i = 1, getn(tbTaskSet) do
            SetTask(tbTaskSet[i][1], GetTask(tbTaskSet[i][1]) + tbTaskSet[i][2])
            if type(tbTaskSet[i][3]) == "string" then
                Msg2Player(tbTaskSet[i][3] .. " t®ng th™m " .. tbTaskSet[i][2] .. ".")
            end
            if self.szLogTitle ~= "" then
                gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbTaskSet[i][2], "Task " .. tbTaskSet[i][1])
            end
        end
    end
    -- Award Chan Khi
    if type(tbAwardList["nChankhi"]) == "number" then
        if MeridianGetLevel() > 0 then
            local nRet = AwardGenuineQi(tbAwardList["nChankhi"])
            if self.szLogTitle ~= "" and nRet == 1 then
                gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nChankhi"], "Ch©n kh›")
            end
        end
    end
    -- Award Quan Cong
    if type(tbAwardList["nQuancong"]) == "number" then
        if GetTask(701) ~= 0 then
            if GetTask(701) > 0 then
                SetTask(701, GetTask(701) + tbAwardList["nQuancong"])
            elseif GetTask(701) < 0 then
                SetTask(701, GetTask(701) - tbAwardList["nQuancong"])
            end
            Msg2Player("ßi”m c´ng trπng t®ng th™m " .. tbAwardList["nQuancong"] .. ".")
            if self.szLogTitle ~= "" then
                gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nQuancong"], "Qu©n c´ng")
            end
        end
    end
    -- Award Danh Vong
    if type(tbAwardList["nDanhvong"]) == "number" then
        ModifyReputation(tbAwardList["nDanhvong"], 0)
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nDanhvong"], "Danh v‰ng")
        end
    end
    -- Award Su Mon
    if type(tbAwardList["nSumon"]) == "number" then
        SetTask(336, GetTask(336) + tbAwardList["nSumon"])
        Msg2Player("ßi”m s≠ m´n t®ng th™m " .. tbAwardList["nSumon"] .. ".")
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nSumon"], "S≠ m´n")
        end
    end
    -- Award Gold
    if type(tbAwardList["nGold"]) == "number" then
        Earn(tbAwardList["nGold"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nGold"], "Ng©n l≠Óng")
        end
    end
    -- Award Exp Pet
    if type(tbAwardList["nPetExp"]) == "number" then
        if mod(GetTask(TASK_VNG_PET), 100) >= 1 then
            SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (tbAwardList["nPetExp"] * 100))
            Msg2Player("ßi”m n©ng c p bπn ÆÂng hµnh t®ng th™m " .. tbAwardList["nPetExp"])
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nPetExp"], "Æi”m n©ng c p pet")
        end
    end
    -- Award Linh luc Pet
    if type(tbAwardList["nPetLinhluc"]) == "number" then
        if mod(GetTask(TASK_VNG_PET), 100) >= 2 then
            -- ßi”m n©ng c p, Æi”m luy÷n, vµng, th∏i dﬁch, Æi”m linh l˘c c«n, Æi”m linh l˘c tËi Æa, sË l«n luy÷n linh l˘c 1 ngµy
            tRequireElement = {
                [1] = { 0, 7000, 1000000, 10, 0, 0, 0 },
                [2] = { 300, 7000, 1000000, 20, 0, 200, 5 },
                [3] = { 600, 7000, 1000000, 30, 200, 600, 5 },
                [4] = { 1200, 7000, 1000000, 40, 600, 1500, 5 },
            }
            if IsPlayerDeath() ~= 1 then
                local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT) / 100)
                local nQuestGPCount = mod(GetTask(TASK_VNG_PET_GODPOINT), 100)
                local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
                if nCurGodPoint + tbAwardList["nPetLinhluc"] <= tRequireElement[nCurLevel][6] then
                    nCurGodPoint = nCurGodPoint + tbAwardList["nPetLinhluc"]
                    SetTask(TASK_VNG_PET_GODPOINT, nCurGodPoint * 100 + nQuestGPCount)
                    Msg2Player("ßi”m linh l˘c pet t®ng th™m " .. tbAwardList["nPetLinhluc"])
                    gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nPetLinhluc"], "Æi”m linh l˘c pet")
                else
                    nCurGodPoint = tRequireElement[nCurLevel][6]
                    SetTask(TASK_VNG_PET_GODPOINT, nCurGodPoint * 100 + nQuestGPCount)
                    Msg2Player("Bπn ßÂng Hµnh Æ∑ Æπt Æ≠Óc Æi”m Linh L˘c tËi Æa cÒa c p, kh´ng th” t®ng th™m.")
                end
            end
        end
    end
    -- Award Bach Cau
    if type(tbAwardList["nBachCau1"]) == "number" then
        SetTask(2501, GetTask(2501) + tbAwardList["nBachCau1"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nBachCau1"], "Bπch C©u Hoµn")
        end
    end
    if type(tbAwardList["nBachCau2"]) == "number" then
        SetTask(2507, GetTask(2507) + tbAwardList["nBachCau2"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nBachCau2"], "ßπi Bπch C©u Hoµn")
        end
    end
    if type(tbAwardList["nBachCau3"]) == "number" then
        SetTask(2508, GetTask(2508) + tbAwardList["nBachCau3"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nBachCau3"], "Bπch C©u Ti™n ß¨n")
        end
    end
    -- Award Tam Thanh
    if type(tbAwardList["nTamThanh1"]) == "number" then
        EatSanqin(1, tbAwardList["nTamThanh1"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTamThanh1"], "Tam Thanh Hoµn")
        end
    end
    if type(tbAwardList["nTamThanh2"]) == "number" then
        EatSanqin(2, tbAwardList["nTamThanh2"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTamThanh2"], "ßπi Tam Thanh Hoµn")
        end
    end
    if type(tbAwardList["nTamThanh3"]) == "number" then
        EatSanqin(3, tbAwardList["nTamThanh3"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTamThanh3"], "Tam Thanh Ti™n ß¨n")
        end
    end
    -- Award Luc Than
    if type(tbAwardList["nLucThan1"]) == "number" then
        EatLiushen(1, tbAwardList["nLucThan1"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nLucThan1"], "LÙc Th«n Hoµn")
        end
    end
    if type(tbAwardList["nLucThan2"]) == "number" then
        EatLiushen(2, tbAwardList["nLucThan2"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nLucThan2"], "ßπi LÙc Th«n Hoµn")
        end
    end
    if type(tbAwardList["nLucThan3"]) == "number" then
        EatLiushen(3, tbAwardList["nLucThan3"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nLucThan3"], "LÙc Th«n Ti™n ß¨n")
        end
    end
    -- Award Tu Linh
    if type(tbAwardList["nTuLinh1"]) == "number" then
        SetTask(3105, GetTask(3105) + tbAwardList["nTuLinh1"], TASK_ACCESS_CODE_OFFLINELIVE)
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTuLinh1"], "TÙ Linh Hoµn")
        end
    end
    if type(tbAwardList["nTuLinh2"]) == "number" then
        SetTask(3106, GetTask(3106) + tbAwardList["nTuLinh2"], TASK_ACCESS_CODE_OFFLINELIVE)
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTuLinh2"], "ßπi TÙ Linh Hoµn")
        end
    end
    if type(tbAwardList["nTuLinh3"]) == "number" then
        SetTask(3107, GetTask(3107) + tbAwardList["nTuLinh3"], TASK_ACCESS_CODE_OFFLINELIVE)
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTuLinh3"], "TÙ Linh Ti™n ß¨n")
        end
    end
    -- Award Function
    if type(tbAwardList["fn"]) == "string" then
        dostring(tbAwardList["fn"])
    end
    return 1
end

