Include("\\script\\class\\clause3.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
--Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")
--Include("\\script\\misc\\data_state\\state.lua")
--Include("\\script\\online_activites\\award.lua")
Include("\\script\\missions\\cangjianshanzhuang\\runtime_data_stat.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\missions\\cangjianshanzhuang\\head.lua")


msg = "恭喜$n从万剑冢中获得了$i";

MV_WHO_IS_DAYE = 24
MV_LOOT_ID = 25
TSK_SCRORE = 0
TSK_SCRORE_ACC_CODE=0
LOG_TITLE="liangshan yin box"
NEED_ROOM=2
OPEN_BOX_NEED = {"天骄令",2, 97, 236,1}

T_YinBoxScript={
	"\\script\\missions\\cangjianshanzhuang\\npc\\box_yin.lua",
	"\\script\\missions\\cangjianshanzhuang\\npc\\box_yin.lua",
	"\\script\\missions\\cangjianshanzhuang\\npc\\box_yin.lua",
	nil,
}

T_YIN_BOX_IDX = {}
function remove_yin_box()
	for i,v in T_YIN_BOX_IDX do
		if GetNpcName(i) == "黄金宝箱" then
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
	local npc = CreateNpc("步非烟的百宝箱", "黄金宝箱", m, x2, y2);
	if npc and npc > 0 then
		T_YIN_BOX_IDX[npc] = 1
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_YinBoxScript[nStage]);
	else
		print("create ls yinbaoxiang fail")
	end
end

tAward = {
	randMulti = 1,
	subclauses = {
			{ {"2级灵石原石", {2,95,554,1}, nil,nil,{1, 100} }, 500},
			{ {"3级灵石原石", {2,95,555,1}, nil,nil,{1, 100} }, 1000},
			{ {"4级灵石原石", {2,95,556,1}, nil,nil,{1, 100} }, 1000},
			{ {"5级灵石原石", {2,95,557,1}, nil,nil,{1, 100} }, 500},
			{ {"6级灵石原石", {2,95,558,1}, nil,nil, {1, 100}}, 500},
			{ {"师门真卷残页", {2,96,176,1}, nil,nil, {1, 100}}, 200},
			{ {"修真要诀", {2,0,554,1}, nil,nil, {1, 100}}, 500},
			{ {"小人参果", {2,0,552,1}, nil,nil, {1, 100}}, 800},
			{ {"金钱袋", {2,95,662,1}, nil,nil, {1, 100}}, 200},
			{ {"陨铁碎片", {2,2,7,1}, nil,nil, {1, 100}}, 400},
			{ {"陨铁", {2,2,8,1}, nil,nil, {1, 100}}, 400},
			{ {"陨铁精石", {2,1,1009,1}, nil,nil, {1, 100}}, 100},
			{ {"神器", {2,95,55,1}, nil,nil, {1, 100}}, 200},
			{ {"大人参果", {2,0,553,1}, nil,nil, {1, 100}}, 500},
			{ {"九转回魂丹", {1,0,32,1}, nil,nil, {1, 100}}, 200},
			{ {"师门圣物", {2,95,205,1}, nil,nil, {1, 100}}, 500},
			{ {"梁山特产", {2,95,207,1}, nil,nil, {1, 100}}, 1000},
			{ {"般若树种", {2,0,398,1,1}, nil,nil, {1, 100}}, 200},
			{ {"星辰碎片", {2,201,1,1}, nil,nil, {1, 100}}, 100},
			{ {"九转逍遥丹（力根）", {1, 0, 277,1}, nil,nil, {1, 100}}, 100},
			{ {"九转逍遥丹（力身）", {1, 0, 278,1}, nil,nil, {1, 100}}, 100},
			{ {"九转逍遥丹（力洞）", {1, 0, 279,1}, nil,nil, {1, 100}}, 100},
			{ {"九转逍遥丹（力内）", {1, 0, 280,1}, nil,nil, {1, 100}}, 100},
			{ {"九转逍遥丹（内根）", {1, 0, 281,1}, nil,nil, {1, 100}}, 100},
			{ {"九转逍遥丹（内身）", {1, 0, 282,1}, nil,nil, {1, 100}}, 100},
			{ {"九转逍遥丹（内洞）", {1, 0, 283,1}, nil,nil, {1, 100}}, 100},
			{ {"九转逍遥丹（身根）", {1, 0, 284,1}, nil,nil, {1, 100}}, 100},
			{ {"九转逍遥丹（身洞）", {1, 0, 285,1}, nil,nil, {1, 100}}, 100},
			{ {"九转逍遥丹（洞根）", {1, 0, 286,1}, nil,nil, {1, 100}}, 100},
			{ {"高级师门秘籍包裹", {2,97,128,1}, nil,nil,{1, 100} }, 200},
 

	},
	giveClause = ClauseRandom.giveClause,
	give = ClauseRandom.giveClause,
}

--needItem = {T_TIANJIAOLING[4], {T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],N_CALL_BOSS_TIANJIAOLING_NEED}};

tTemp = {};

function main()
	local npcIdx = GetTargetNpc();
	if GetMissionV(MV_WHO_IS_DAYE) == 0 then
		Say("你需要完成任务【找回笔筒】（NPC C要帮忙）。",
			2,
			"\n 我来/#IamDaye("..npcIdx..")",
			"\n 不了/什么也不做");
		return
	else
		speLoot(npcIdx);
	end
end

function IamDaye(npcIdx)
	local daye = GetMissionV(MV_WHO_IS_DAYE);

	if 0 ~= daye then
		Talk(1, "", "你已经找到了人了");
		return 0;
	end

	if DelItem(OPEN_BOX_NEED[2],OPEN_BOX_NEED[3],OPEN_BOX_NEED[4],OPEN_BOX_NEED[5]) == 1 then
		SetMissionV(MV_WHO_IS_DAYE, PlayerIndex);
		--SetMissionV(MV_LAO_ER_2, PlayerIndex);
		if TSK_SCRORE and TSK_SCRORE > 0 then
			gf_ModifyTask(TSK_SCRORE, OPEN_BOX_NEED[5], TSK_SCRORE_ACC_CODE);
		end
		speLoot(npcIdx);
		_stat_when_ib_consume(OPEN_BOX_NEED[5])--IB消耗统计
		--2Xu活动
		vaf_award_api("tWjzYinBox")
	--	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {OPEN_BOX_NEED[2],OPEN_BOX_NEED[3],OPEN_BOX_NEED[4],OPEN_BOX_NEED[5]})
	else
		Talk(1, "", "您没有完成【找回笔筒】任务，不能交给<宝箱>。[天骄令]可以在<御街>购买");
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
	local daye = GetMissionV(MV_WHO_IS_DAYE);
	if daye == 0 then
		return 0;
	end
	local tSel = {
			"不给他/nothing",
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
				tinsert(tSel, 1, "我带了奖励给"..player_name.."/#lootAwardOther("..PlayerIndex..","..npcIdx..")");
			end
		end
		PlayerIndex = OldPlayerIndex;
		tinsert(tSel, 1, "我需要领取奖励/#lootAward("..PlayerIndex..","..npcIdx..")");
	end


	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem();
		SetMissionV(MV_LOOT_ID, nLootItemId);
	end

	local tClause = getLootSeting();
	local tLootItem = tClause[nLootItemId][1];
	local nCount = 1;
	if tLootItem[2] and type(tLootItem[2]) == "table" then
		nCount = tLootItem[2][4];
	end
	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
	Say("<color=green>特殊奖励<color>：要拿走"..msg, getn(tSel), tSel);
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
		Talk(1,"","<color=green>提示<color>：请重新检查您要分配的对象是否在您的<color=yellow>队伍<color>中！")
		return
	end
	--分配对象的空间负重检测
	PlayerIndex = player_index
	local s_palyer_name = GetName()
	if GetFreeItemRoom()  < NEED_ROOM then
		Talk(1,"","<color=green>提示<color>：您的<color=yellow>包裹<color>空间不足！")
		PlayerIndex = player_index_save
		Talk(1,"","<color=green>提示<color>：<color=green>"..s_palyer_name.."<color>的<color=yellow>包裹<color>空间不足，无法进行分配！")
		return
	end

	PlayerIndex = player_index_save
	lootAward(player_index, box_index)
end

function lootAward(player_index, box_index)
	local player_index_save = PlayerIndex

	PlayerIndex = player_index;
	if gf_JudgeRoomWeight(NEED_ROOM, 100, "") ~= 1 then return end
	PlayerIndex = player_index_save;

	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem();
	end
	local tLoot = getLootSeting()[nLootItemId][1];
	SetMissionV(MV_LOOT_ID, 0);
	SetMissionV(MV_WHO_IS_DAYE, 0);
	--SetMissionV(MV_LAO_ER_2, 0);

	SetNpcLifeTime(box_index, 0);
	PlayerIndex = player_index;
	gf_SetLogCaption(LOG_TITLE);
	Clause3.giveClause(tLoot);
	gf_SetLogCaption("");
	
	if tLoot[1] == "天骄令" then
		_stat_when_ib_produce(tLoot[2][4])--IB道具产出统计
	end
	
--	--统计道具
--	if tLoot[1] == "天门金令" then
--		AddRuntimeStat(1,14,0,tLoot[2][4]);
--	elseif tLoot[1] == "3级炼炉铁" then
--		AddRuntimeStat(1,16,0,tLoot[2][4]);
--	elseif tLoot[1] == "3级洗心石" then
--		AddRuntimeStat(1,17,0,tLoot[2][4]);
--	elseif tLoot[1] == "秘银钻" then
--		AddRuntimeStat(1,18,0,tLoot[2][4]);
--	elseif tLoot[1] == "秘银锤" then
--		AddRuntimeStat(1,19,0,tLoot[2][4]);
--	end
	EventAddPhoBan(20);
	
	PlayerIndex = player_index_save;
end
