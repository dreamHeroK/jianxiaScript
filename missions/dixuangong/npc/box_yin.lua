Include("\\script\\class\\clause3.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")
--Include("\\script\\misc\\data_state\\state.lua")
Include("\\script\\online_activites\\award.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

msg = "恭喜侠士 $n 从地玄宫获取宝物 $i";

T_YinBoxScript = {
    "\\script\\missions\\dixuangong\\npc\\box_yin1.lua",
    "\\script\\missions\\dixuangong\\npc\\box_yin1.lua",
    nil,
    "\\script\\missions\\dixuangong\\npc\\box_yin1.lua",
    "\\script\\missions\\dixuangong\\npc\\box_yin1.lua",
    "\\script\\missions\\dixuangong\\npc\\box_yin1.lua",
    nil,
}

T_YIN_BOX_IDX = {}
function remove_yin_box()
    for i, v in T_YIN_BOX_IDX do
        if GetNpcName(i) == "银宝箱" then
            SetNpcLifeTime(i, 0);
        end
    end
    T_YIN_BOX_IDX = {}
end

function create_box_yin(m, x, y, nStage)
    if not T_YinBoxScript[nStage] then
        return
    end
    --local m, x, y = GetNpcWorldPos(nNpcIdx);
    local x2, y2 = x + random(-5, 5), y + random(-5, 5);
    local npc = CreateNpc("yinbaoxiang", "银宝箱", m, x2, y2);
    if npc and npc > 0 then
        T_YIN_BOX_IDX[npc] = 1
        --SetNpcLifeTime(npc, 180);
        SetNpcScript(npc, T_YinBoxScript[nStage]);
    else
        print("创建地玄宫阴宝箱失败")
    end
end

tAward = {
    randMulti = 1,
    subclauses = {
        { { "初级武学残页", { 2, 0, 504, 1, 1 }, nil, { 604800 } }, 500 },
        { { "中级武学残页", { 2, 0, 398, 1, 1 }, nil, { 604800 } }, 200 },
        { { "极品丹药", { 2, 1, 30269, 1, 1 }, nil, { 604800 } }, 500 },
        { { "至尊武学秘籍", { 2, 1, 270, 1, 1 }, nil, { 604800 } }, 700 },
        { { "上古至尊秘籍", { 2, 1, 1007, 1, 1 }, nil, { 604800 } }, 700 },
        { { "天罡真诀", { 2, 1, 1008, 1, 1 }, nil, { 604800 } }, 600 },
        { { "稀有材料", { 2, 0, 553, 1, 1 }, nil, { 604800 } }, 500 },
        { { "英雄徽章", { 2, 1, 30499, 2, 1 }, nil, nil }, 600 },
        { { "英雄徽章礼盒", { 2, 1, 30499, 4, 1 }, nil, nil }, 200 },
        { { "英雄徽章大礼包", { 2, 1, 30499, 10, 1 }, nil, nil }, 50 },
        { { "天命石", { 2, 1, 30410, 2, 1 }, nil, nil }, 400 },
        { { "天命石袋", { 2, 1, 30410, 4, 1 }, nil, nil }, 100 },
        { { "天命石宝箱", { 2, 1, 30410, 20, 1 }, msg, nil }, 20 },
        { { "天机令", { 2, 1, 30370, 1, 1 }, msg, nil }, 1 },
        { { "黄金侠客令", { 2, 1, 538, 1, 1 }, nil, { 1296000 } }, 500 },
        { { "白金侠客令", { 2, 1, 30228, 1, 1 }, nil, { 1296000 } }, 100 },
        { { "逍遥披风", { 0, 152, 29, 1, 1 }, nil, nil }, 30 },
        { { "清风披风", { 0, 152, 30, 1, 1 }, nil, nil }, 30 },
        { { "流云披风", { 0, 152, 31, 1, 1 }, nil, nil }, 30 },
        { { "绝世服饰", { 2, 1, 31233, 1, 1 }, nil, nil }, 500 },
        { { "武林绝学", { 2, 1, 30071, 1, 1 }, nil, nil }, 784 },
        { { "珍品武学卷一", { 2, 1, 30998, 1, 1 }, nil, nil }, 300 },
        { { "珍品武学卷二", { 2, 1, 30999, 1, 1 }, nil, nil }, 300 },
        { { "珍品武学卷三", { 2, 1, 31000, 1, 1 }, nil, nil }, 150 },
        { { "珍品武学卷四", { 2, 1, 31001, 1, 1 }, nil, nil }, 50 },
        { { "光辉战袍", { 2, 1, 9977, 1, 1 }, nil, nil }, 100 },
        { { "武林秘典", { 2, 1, 30731, 1, 1 }, nil, nil }, 500 },
        { { "天赐战甲", { 2, 1, 31386, 1, 1 }, nil, nil }, 500 },
        { { "灵符", { 0, 105, 201, 1, 1, -1, -1, -1, -1, -1, -1 }, msg, nil }, 1 },
        { { "风神令", { 0, 105, 209, 1, 1, -1, -1, -1, -1, -1, -1 }, msg, nil }, 1 },
        { { "天命披风六阶", { 2, 1, 31385, 5, 1 }, nil, nil }, 638 },
        { { "天命披风七阶", { 2, 1, 31399, 1, 1 }, nil, nil }, 500 },
        { { "苍狼披风", { 0, 152, 35, 1, 1 }, msg, nil }, 5 },
        { { "霓裳披风", { 0, 152, 36, 1, 1 }, msg, nil }, 5 },
        { { "幻月披风", { 0, 152, 37, 1, 1 }, msg, nil }, 5 },
    },
    giveClause = ClauseRandom.giveClause,
    give = ClauseRandom.giveClause,
}

--needItem = { T_TIANJIAOLING[4], { T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_OPEN_BOX_TIANJIAOLING_NEED } };

tTemp = {};

function on_open_box_yin()
    local npcIdx = GetTargetNpc();
    if GetMissionV(MV_DAYE_2) == 0 then
        Say(format("开启【银宝箱】需消耗【天机令】%d个（可在商城购买）", N_OPEN_BOX_TIANJIAOLING_NEED),
                2,
                "\n 确定开启/#IamDaye(" .. npcIdx .. ")",
                "\n 暂不开启/nothing");
        return
    else
        speLoot(npcIdx);
    end
end

function IamDaye(npcIdx)
    local daye = GetMissionV(MV_DAYE_2);

    if 0 ~= daye then
        Talk(1, "", "已有队伍成员正在开启宝箱");
        return 0;
    end

    if DelItem(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_OPEN_BOX_TIANJIAOLING_NEED) == 1 then
        SetMissionV(MV_DAYE_2, PlayerIndex);
        SetMissionV(MV_LAO_ER_2, PlayerIndex);
        gf_ModifyTask(TASKID_DXG_SCORE, N_OPEN_BOX_TIANJIAOLING_NEED, TASK_ACCESS_CODE_DXG_MISSION);
        speLoot(npcIdx);
        --天阴圣物箱开启次数统计
        AddRuntimeStat(1, 11, 0, 1);
        --地玄宫消耗通天令牌数量统计
        AddRuntimeStat(1, 13, 0, N_OPEN_BOX_TIANJIAOLING_NEED);
        --2Xu活动
        vaf_award_api("tDXGYinBox")
        FireEvent("event_mission_box_award", "dixuangong", "silver", 0)
        FireEvent("event_ib_cost", T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_OPEN_BOX_TIANJIAOLING_NEED)
    else
        Talk(1, "", "物品栏中没有足够的【天机令】，无法开启<color=green>银宝箱<color>。可从<color=yellow>商城<color>购买");
    end
end

function getLootSeting()
    return tAward.subclauses;
end

function getLootItem()
    local tClause = getLootSeting();

    local nMax = 0;
    for i = 1, getn(tClause) do
        nMax = nMax + tClause[i][2];
    end
    local rnd = random(1, nMax);
    for i = 1, getn(tClause) do
        rnd = rnd - tClause[i][2];
        if rnd <= 0 then
            return i, tClause[i][1];
        end
    end
    print("[getLootItem] [error random] [nMax=%d, rnd=%d]", nMax, rnd);
    assert();
end

function speLoot(npcIdx)
    local daye = GetMissionV(MV_DAYE_2);
    if daye == 0 then
        return 0;
    end
    local tSel = {
        "选择放弃宝物/nothing",
    }
    local OldPlayerIndex = PlayerIndex;
    if daye == PlayerIndex then
        local player_name = ""
        for i = 1, GetTeamSize() do
            PlayerIndex = GetTeamMember(i);
            if PlayerIndex ~= OldPlayerIndex then
                player_name = GetName();
                player_name = zgc_pub_name_replace(player_name, "/", "-");
                player_name = zgc_pub_name_replace(player_name, "|", "-");
                player_name = zgc_pub_name_replace(player_name, ":", "-");
                tinsert(tSel, 1, "将奖励赠予" .. player_name .. "/#lootAwardOther(" .. PlayerIndex .. "," .. npcIdx .. ")");
            end
        end
        PlayerIndex = OldPlayerIndex;
        tinsert(tSel, 1, "自己获取奖励/#lootAward(" .. PlayerIndex .. "," .. npcIdx .. ")");
    end

    local nLootItemId = GetMissionV(MV_LOOT_ID_2);
    if nLootItemId == 0 then
        nLootItemId = getLootItem();
        SetMissionV(MV_LOOT_ID_2, nLootItemId);
    end

    local tClause = getLootSeting();
    local tLootItem = tClause[nLootItemId][1];
    local nCount = 1;
    if tLootItem[2] and type(tLootItem[2]) == "table" then
        nCount = tLootItem[2][4];
    end
    local msg = format("<color=yellow>[%s]x%d<color>", tLootItem[1], nCount);
    Say("<color=green系统提示<color>: 获得" .. msg, getn(tSel), tSel);
end

function lootAwardOther(player_index, box_index)
    local player_index_save = PlayerIndex
    --判断该索引是否还是在该队伍中
    local index_chg_chk_flag = 0
    local team_size = GetTeamSize()
    if team_size ~= 0 then
        index_chg_chk_flag = zgc_pub_same_team_chk(player_index)
    else
        index_chg_chk_flag = 1
    end
    if index_chg_chk_flag ~= 1 then
        Talk(1, "", "<color=green>提示<color>: 目标玩家已不在队伍中，无法分配奖励!")
        return
    end
    --分配对象的空间负重检测
    PlayerIndex = player_index
    local s_palyer_name = GetName()
    if GetFreeItemRoom() < 3 then
        Talk(1, "", "<color=green>提示<color>: 目标玩家背包空间不足!")
        PlayerIndex = player_index_save
        Talk(1, "", "<color=green>提示<color>: : <color=green>" .. s_palyer_name .. "<color><color=yellow>背包<color>已满，无法获得奖励!")
        return
    end

    PlayerIndex = player_index_save
    lootAward(player_index, box_index)
end

function lootAward(player_index, box_index)
    local player_index_save = PlayerIndex

    PlayerIndex = player_index;
    if gf_JudgeRoomWeight(3, 100, "") ~= 1 then
        return
    end
    PlayerIndex = player_index_save;

    local nLootItemId = GetMissionV(MV_LOOT_ID_2);
    if nLootItemId == 0 then
        nLootItemId = getLootItem();
    end
    local tLoot = getLootSeting()[nLootItemId][1];
    SetMissionV(MV_LOOT_ID_2, 0);
    SetMissionV(MV_DAYE_2, 0);
    SetMissionV(MV_LAO_ER_2, 0);

    SetNpcLifeTime(box_index, 0);
    PlayerIndex = player_index;
    gf_SetLogCaption("dixuangong:ib_box2");
    Clause3.giveClause(tLoot);
    gf_SetLogCaption("");
    --统计道具
    if tLoot[1] == "天机令" then
        AddRuntimeStat(1, 14, 0, tLoot[2][4]);
    elseif tLoot[1] == "龙血精华三级" then
        AddRuntimeStat(1, 16, 0, tLoot[2][4]);
    elseif tLoot[1] == "玄玉精华三级" then
        AddRuntimeStat(1, 17, 0, tLoot[2][4]);
    elseif tLoot[1] == "无极宝典" then
        AddRuntimeStat(1, 18, 0, tLoot[2][4]);
    elseif tLoot[1] == "无极秘籍" then
        AddRuntimeStat(1, 19, 0, tLoot[2][4]);
    end

    PlayerIndex = player_index_save;
end
