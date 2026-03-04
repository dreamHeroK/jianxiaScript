Include("\\script\\class\\clause3.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")
--Include("\\script\\misc\\data_state\\state.lua")
Include("\\script\\online_activites\\award.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

msg = "恭喜$n打开地玄宫宝箱获得$i";

T_YinBoxScript={
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
	for i,v in T_YIN_BOX_IDX do
		if GetNpcName(i) == "白银宝箱" then
			SetNpcLifeTime(i, 0);
		end
	end
	T_YIN_BOX_IDX = {}
end

function create_box_yin(m,x,y, nStage)
	if not T_YinBoxScript[nStage] then
		return
	end
	--local m, x, y = GetNpcWorldPos(nNpcIdx);
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("箱子钱", "白银宝箱", m, x2, y2);
	if npc and npc > 0 then
		T_YIN_BOX_IDX[npc] = 1
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_YinBoxScript[nStage]);
	else
		print("create dixuangong yinbaoxiang fail")
	end
end

tAward = {
	randMulti = 1,
	subclauses = {
        {{"经验丹"            , {2,1,30313,1},msg},600},
        {{"赤铁精"            , {2,1,2652,1},msg},600},
        {{"月华之精"            , {2,1,3219,1},msg},600},
        {{"八卦牌"            , {2,95,550,1},msg},600},
        {{"紫金八卦牌"            , {2,95,551,1},msg},600},	
	},
	giveClause = ClauseRandom.giveClause,
	give = ClauseRandom.giveClause,
}

needItem = {T_TIANJIAOLING[4], {T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],N_CALL_BOSS_TIANJIAOLING_NEED}};

tTemp = {};

function on_open_box_yin()
	local npcIdx = GetTargetNpc();
	if GetMissionV(MV_DAYE_2) == 0 then
		Say("打开[白银宝箱]需要1个[天骄令](御街有卖)。",
			2,
			"\n 确认打开/#IamDaye("..npcIdx..")",
			"\n 不用了/nothing");
		return
	else
		speLoot(npcIdx);
	end
end

function IamDaye(npcIdx)
	local daye = GetMissionV(MV_DAYE_2);

	if 0 ~= daye then
		Talk(1, "", "已经有人打开了这个箱子");
		return 0;
	end

	if DelItem(T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],N_CALL_BOSS_TIANJIAOLING_NEED) == 1 then
		SetMissionV(MV_DAYE_2, PlayerIndex);
		SetMissionV(MV_LAO_ER_2, PlayerIndex);
		gf_ModifyTask(TASKID_DXG_SCORE, N_CALL_BOSS_TIANJIAOLING_NEED, TASK_ACCESS_CODE_DXG_MISSION);
		speLoot(npcIdx);
		--天阴圣物箱开启次数统计
		AddRuntimeStat(1,11,0,1);
		--地玄宫消耗通天令牌数量统计
		AddRuntimeStat(1,13,0,N_CALL_BOSS_TIANJIAOLING_NEED);
		--2Xu活动
		vaf_award_api("tDXGYinBox")
		FireEvent("event_mission_box_award", "dixuangong", "silver", 0)
		--Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],N_CALL_BOSS_TIANJIAOLING_NEED})
		FireEvent("event_ib_cost", T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_CALL_BOSS_TIANJIAOLING_NEED)
	else
		Talk(1, "", "你身上没有[天骄令]，不能打开<color=green>白银宝箱<color>。[天骄令]可以到御街<color=yellow>购买<color>");
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
			"对话结束/nothing",
		}
	local OldPlayerIndex = PlayerIndex;
	if daye == PlayerIndex then
		local player_name = ""
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= OldPlayerIndex then
				player_name = GetName();
				player_name = zgc_pub_name_replace(player_name,"/","-");
				player_name = zgc_pub_name_replace(player_name,"|","-");
				player_name = zgc_pub_name_replace(player_name,":","-");
				tinsert(tSel, 1, "我要把奖励分配给 "..player_name.."/#lootAwardOther("..PlayerIndex..","..npcIdx..")");
			end
		end
		PlayerIndex = OldPlayerIndex;
		tinsert(tSel, 1, "我要领取奖励/#lootAward("..PlayerIndex..","..npcIdx..")");
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
	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
	Say("<color=green>宝箱<color>:里面有"..msg, getn(tSel), tSel);
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
		Talk(1,"","<color=green>注意<color>：请重新查看您要分配的人<color=yellow>是否在<color>该队伍中！")
		return
	end
	--分配对象的空间负重检测
	PlayerIndex = player_index
	local s_palyer_name = GetName()
	if GetFreeItemRoom()  < 3 then
		Talk(1,"","<color=green>提示<color>：<color=yellow>背包<color>空间不足！")
		PlayerIndex = player_index_save
		Talk(1,"","<color=green>提示<color>：<color=green>"..s_palyer_name.."<color><color=yellow>背包<color>已满，不能分配！")
		return
	end

	PlayerIndex = player_index_save
	lootAward(player_index, box_index)
end

function lootAward(player_index, box_index)
	local player_index_save = PlayerIndex

	PlayerIndex = player_index;
	if gf_JudgeRoomWeight(3, 100, "") ~= 1 then return end
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
	if tLoot[1] == "天门金令" then
		AddRuntimeStat(1,14,0,tLoot[2][4]);
	elseif tLoot[1] == "3级炼炉铁" then
		AddRuntimeStat(1,16,0,tLoot[2][4]);
	elseif tLoot[1] == "3级洗心石" then
		AddRuntimeStat(1,17,0,tLoot[2][4]);
	elseif tLoot[1] == "秘银钻" then
		AddRuntimeStat(1,18,0,tLoot[2][4]);
	elseif tLoot[1] == "秘银锤" then
		AddRuntimeStat(1,19,0,tLoot[2][4]);
	end
	
	PlayerIndex = player_index_save;
end
