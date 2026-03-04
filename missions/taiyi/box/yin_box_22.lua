--银宝箱1
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\class\\clause3.lua")

Include("\\script\\missions\\taiyi\\head.lua")
Include("\\script\\missions\\taiyi\\tyfunctions.lua")

Include("\\script\\online_activites\\head\\activity_normal_head.lua")

--S? Ki謓
Include("\\settings\\static_script\\cheat\\event\\event_init.lua");


MV_WHO_IS_DAYE = tTY.mv_35;
MV_LOOT_ID = tTY.mv_36;
LOG_TITLE = "梵天林-太一塔";
NEED_ROOM = 2;
OPEN_BOX_NEED = {"天骄令", 2, 97, 236, 2};
msg = "玩家$n开宝箱获得$i";

thisFilePath = "\\script\\missions\\taiyi\\box\\yin_box_1.lua"

tAward = {
	randMulti = 1,
	subclauses = {
		{ {"辉星碎片", {2,95,769,100}}, 7000},
		{ {"灵石宝箱", {2,95,5435,1}}, 6000},
		{ {"神器", {2,95,55,10}}, 6000},
		{ {"陨铁晶石", {2,1,1009,30}}, 5000},
		{ {"破晓", {2,90,104,1}}, 500},
		{ {"拂晓", {2,90,103,1}}, 500},
		{ {"九州系列首饰箱", {2,95,60035,1}},3000},
		{ {"瀚宇装备包(八卦)", {2,95,60034,1}},1000},
		{ {"瀚宇装备包", {2,95,60032,1}},1000},
		{ {"天使镇魂玉", {2,103,153,1}},500},
		{ {"徽章箱子", {2,103,150,1}},500},
		{ {"披风箱子", {2,103,151,1}},500},
		{ {"五行天仪箱子", {2,103,152,1}},500},
	},
	giveClause = ClauseRandom.giveClause,
	give = ClauseRandom.giveClause,
}

function main()
	local npcIdx = GetTargetNpc();
	if GetMissionV(MV_WHO_IS_DAYE) == 0 then
		Say("打开[宝箱]需消耗2[天骄令].",
			2,
			"\n打开宝箱/#IamDaye("..npcIdx..")",
			"取消/nothing");
		return
	else
		speLoot(npcIdx);
	end
end

function IamDaye(npcIdx)
	local daye = GetMissionV(MV_WHO_IS_DAYE);

	if 0 ~= daye then
		Talk(1, "", "有人打开这个箱子了");
		return 0;
	end

	if DelItem(OPEN_BOX_NEED[2],OPEN_BOX_NEED[3],OPEN_BOX_NEED[4],OPEN_BOX_NEED[5]) == 1 then
		SetMissionV(MV_WHO_IS_DAYE, PlayerIndex);
		speLoot(npcIdx);
		AddRuntimeStat(18, 5, GetMissionV(2)-1, (OPEN_BOX_NEED[5] or 1));
		
		local tClause = getLootSeting();
		local nLootItemId = GetMissionV(MV_LOOT_ID);
		if nLootItemId > 0 and nLootItemId <= getn(tClause) then
			local tItem = tClause[nLootItemId][1];
			if tItem and type(tItem) == "table" then
				if tItem[1] == "皓月碎片" then
					AddRuntimeStat(2, 95, 740, 200);
				elseif tItem[1] == "耀阳碎片" then
					AddRuntimeStat(2, 95, 741, 100);
				elseif tItem[1] == "洪荒碎片" then
					AddRuntimeStat(2, 95, 1506, 50);
				elseif tItem[1] == "洪荒碎片" then
					AddRuntimeStat(2, 95, 1506, 50);
				end
			end
		end
		
		--cdkey
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", format("_ck_SetCostIB(%d)", OPEN_BOX_NEED[5]));	
		vaf_award_api("tTYTYinBox")
	else
		Talk(1, "", "你身上没有[天骄令], 无法打开<color=green>宝箱<color>.");
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
			"取消/nothing",
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
				tinsert(tSel, 1, "奖励分配给"..player_name.."/#lootAwardOther("..PlayerIndex..","..npcIdx..")");
			end
		end
		PlayerIndex = OldPlayerIndex;
		tinsert(tSel, 1, "领取奖励/#lootAward("..PlayerIndex..","..npcIdx..")");
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
	Say("<color=green>宝箱<color>:里有"..msg, getn(tSel), tSel);
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
		Talk(1,"","<color=green>注意<color>:请检查您所分享的人是否相同<color=yellow>组队<color> 在一起!")
		return
	end
	--分配对象的空间负重检测
	PlayerIndex = player_index
	local s_palyer_name = GetName()
	if GetFreeItemRoom()  < NEED_ROOM then
		Talk(1,"","<color=green>通知<color>: <color=yellow>背包<color>空间不足!")
		PlayerIndex = player_index_save
		Talk(1,"","<color=green>通知<color>: <color=green>"..s_palyer_name.."<color><color=yellow>背包<color>空间不足, 无法进行分配!")
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
	SetNpcLifeTime(box_index, 0);
	PlayerIndex = player_index;
	gf_SetLogCaption(LOG_TITLE);
	Clause3.giveClause(tLoot);
	gf_SetLogCaption("");
	
	EventAddPhoBan(20);
	
	PlayerIndex = player_index_save;
end
