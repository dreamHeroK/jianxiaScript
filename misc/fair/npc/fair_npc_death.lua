Import("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
--\script\misc\fair\fair_item.lua
t_FairBossAward = {
    ["一支胜利花"] = {
        gTaskId = 581,
        item = { 2, 1, 31257 },
    },
    ["药人草a1"] = {
        gTaskId = 582,
        item = { 2, 1, 31258 },
    },
}

function OnDeath(npcIndex)
    local szName = GetNpcName(npcIndex)
    local tAward = t_FairBossAward[szName]
    if PlayerIndex <= 0 then
        return
    end
    if GetTeamSize() > 0 then
        local oldPlayerIndex = PlayerIndex
        for i = 1, GetTeamSize() do
            PlayerIndex = GetTeamMember(i)
            if tGtTask:check_cur_task(tAward.gTaskId) == 1 then
                if GetFreeItemRoom() < 1 then
                    Talk(1, "", "空间不足")
                else
                    AddItem(tAward.item[1], tAward.item[2], tAward.item[3], 1, 4)
                end
            end
        end
        PlayerIndex = oldPlayerIndex
    else
        if tGtTask:check_cur_task(tAward.gTaskId) == 1 then
            if GetFreeItemRoom() < 1 then
                Talk(1, "", "空间不足")
            else
                AddItem(tAward.item[1], tAward.item[2], tAward.item[3], 1, 4)
            end
        end
    end
end