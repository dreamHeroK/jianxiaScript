Include("\\script\\missions\\liangshan\\mission\\tmission.lua")
Include("\\script\\master_prentice\\master_prentice_head.lua")
Import("\\script\\lib\\itemfunctions.lua")

function giveLSBossAward(bossId, nLootId)
	SetPlayerScript("\\script\\missions\\liangshan\\npc\\box_ib_mail.lua");
	SendScript2VM("\\script\\missions\\liangshan\\npc\\box_ib_mail.lua", format("lootAward(PlayerIndex, %d, %d, 1)", bossId, nLootId))
end

function giveLSIBAward(bossId, nLootId)
	if not bossId or bossId == 0 then
		bossId = tMission:chooseBoss(2,1);
	end
	SetPlayerScript("\\script\\missions\\liangshan\\npc\\box_ib2_mail.lua");
	SendScript2VM("\\script\\missions\\liangshan\\npc\\box_ib2_mail.lua", format("lootAward(PlayerIndex, %d, %d, 1)",bossId, nLootId))
end

function giveLSJuyiling(nCount)
	gf_AddItemEx({tTianJiaoLingInfo[2], tTianJiaoLingInfo[3], tTianJiaoLingInfo[4], nCount},tTianJiaoLingInfo[1]);
end

function give_master_prentice_award(nIdx)
    local nRoute = GetPlayerRoute();
    local nBody = GetBody();

    if MP_AWARD_STUDY_COMPLETE_MASTER == nIdx or MP_AWARD_STUDY_COMPLETE_PRENTICE == nIdx then
        local nRet, nItemIdx = gf_AddItemEx({2, 0, 888, 1, 4}, "特殊奖励");
        if 0 < nItemIdx then
            SetItemExpireTime(nItemIdx, 30*24*60*60);
        end

        if 1 == _JX2WZ then
            gf_AddItemEx({2, 1, 1254, 50, 4}, "高级经验药水");
        end

        return
    end

    if MP_AWARD_MASTER_ROUTE_3 == nIdx then
        gf_AddItemEx({2, 95, 1169, 1, 4}, "高级内功心法");
        return
    end

    if MP_AWARD_MASTER_ROUTE_10 == nIdx then
        gf_AddItemEx({2, 95, 1168, 1, 4}, "高级外功心法");
        return
    end
end


function giveTTDAward(sItemIds)
	AddItem(gf_UnPack(sItemIds));
end
