Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\missions\\liangshan\\mission\\tmission.lua")
Include("\\script\\class\\clause3.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\lib\\lingshi_head.lua")
Include("\\settings\\static_script\\lib\\itemfunctions.lua")

Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")

msg = format("恭喜$n从梁山群雄会中获得了$i", itemName);
--好汉箱子
function giveItem(self)
	ItemCreate:create(self[1])
	local notice = gsub(msg, "\$n", GetName());
	notice = gsub(notice, "\$i", self[1]);
	Msg2Global(notice);
end
tClause1 = {
    {{"天罡令"          ,{2,95,204,1},msg},     80000},
    {{"天罡令"          ,{2,95,204,2},msg},     10000},
    {{"天罡令"          ,{2,95,204,3},msg},     5000},
}
tClause2 = {
	{{"军功章", {2,1,9999,1}}, 300},
	{{"大军功章", {2,1,9998,1}}, 100},
	{{"金钱袋", {2,95,662,1}, }, 4500},
	{{"消劫散" ,{2,0,141,1}}, 200},
--	{{"八宝粽子"  ,{2,1,1125,1}},500},
	{{"小军绩牌"  ,{2,1,9975,1}},500},
	{{"神器"  ,{2,95,55,1}},500},
	{{"师门圣物" ,{2,95,205,1}},800},
	{{"金猪全席", {1,1,39,1}}, 200},
	{{"蒙顶石花茶", {1,1,40,1}}, 200},
	{{"5级灵石原石", {2,95,557,1}}, 500},
	{{"6级灵石原石", {2,95,558,1}}, 1200},
	{{"高级师门秘籍包裹", {2,97,128,1}}, 500},
	{{"五行秘籍", {0,107,155,1}}, 100},
	{{"强化精石（11级）", {2,101,12,1}}, 200},
	{{"强化精石（12级）", {2,101,13,1}}, 100},
}

tClause3 = {
	{{"磐龙璧"           	,{2,1,1000,1}},        15000 },
	{{"军功章"       		,{2,1,9999,1},msg},    6000 },
	{{"大人参果"           	,{2,0,553,1}},        	5000 },
	{{"大军功章"       		,{2,1,9998,1}},      	5000 },
	{{"师门圣物"       		,{2,95,205,1}},    5000 },
	{{"翻羽"               	,{0,105,15,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    500},
	{{"超光"               	,{0,105,19,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    500},
	{{"奔宵"               	,{0,105,16,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    500},
	{{"腾雾"               	,{0,105,20,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    500},
	{{"将军白马"           	,{0,105,34,1,1,-1,-1,-1,-1,-1,-1},msg,{30*24*60*60}},    500},
	{{"无痕水"       		,{2,1,503,1},msg},	3000},
	{{"洗髓丹"       		,{2,0,136,1}},	2000},
	{{"洗髓灵丹"       		,{2,0,137,1},msg},	1000},
}
tClause4 = {
	{{"消劫散"         		,{2,0,141,1}},   		3000},
--	{{"八宝粽子"         	,{2,1,1125,1}},   		5000 },
	{{"师门圣物"       		,{2,95,205,1}},    10000 },

}
tClause5 = {
	{{"军功章", {2,1,9999,1}}, 300},
	{{"大军功章", {2,1,9998,1}}, 100},
	{{"金钱袋", {2,95,662,1}, }, 4490},
	{{"消劫散" ,{2,0,141,1}}, 200},
--	{{"八宝粽子"  ,{2,1,1125,1}},500},
	{{"小军绩牌"  ,{2,1,9975,1}},500},
	{{"师门圣物" ,{2,95,205,1}},800},
	{{"神器"  ,{2,95,55,1}},500},
	{{"金猪全席", {1,1,39,1}}, 200},
	{{"蒙顶石花茶", {1,1,40,1}}, 200},
	{{"5级灵石原石", {2,95,557,1}}, 500},
	{{"6级灵石原石", {2,95,558,1}}, 1200},
	{{"高级师门秘籍包裹", {2,97,128,1}}, 500},
	{{"五行秘籍", {0,107,155,1}}, 100},
	{{"强化精石（11级）", {2,101,12,1}}, 200},
	{{"强化精石（12级）", {2,101,13,1}}, 100},
	{{"天罡令",{2,95,204,1}}, 10},
}

function getLootSeting(bossLv)
	local t = {tClause1,tClause2,tClause3,tClause4,tClause5}
	tClause = t[bossLv];
	if not tClause then
		print(format("[getLootSeting] [error bossLv] [bossLv=%s]", tostring(bossLv)));
		assert()
	end
	return tClause;
end

function getLootItem(bossLv)
	local tClause = getLootSeting(bossLv);

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

function main()
	speLoot();
end

function speLoot()
	local nNpcIdx = GetTargetNpc();
    local bossId = GetMissionV(MV_CUR_BOSS_ID);
	local bossLv = tMission:getBossLv(bossId);
	local daye = GetMissionV(MV_DAYE);
	if daye == -1 or daye == 0 then
		return
	end
	local tSel = {
			"不开启宝箱了/nothing",
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
				tinsert(tSel, 1, "把宝箱里面的物品分配给 "..player_name.."/#lootAwardOther("..PlayerIndex..","..nNpcIdx..")");
			end
		end
		PlayerIndex = OldPlayerIndex;
		tinsert(tSel, 1, "把宝箱里面的物品分配给自己/#lootAward("..PlayerIndex..","..nNpcIdx..")");
	end


	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem(bossLv);
		SetMissionV(MV_LOOT_ID, nLootItemId);
	end

	local tClause = getLootSeting(bossLv);
	if not tClause or not tClause[nLootItemId] or not tClause[nLootItemId][1] then
		WriteLog(format("[ERROR] [liangshan:lootError] [Role:%s Acc:%s][bossLv=%s, nLootItemId=%s]",
			GetName(), GetAccount(), tostring(bossLv), tostring(nLootItemId)));
		nLootItemId = getLootItem(bossLv);
		SetMissionV(MV_LOOT_ID, nLootItemId);
	end
	local tLootItem = tClause[nLootItemId][1];
	local nCount = (tLootItem[2] and tLootItem[2][4]) or 1;
	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
	Say("<color=green>钻石宝箱<color>：宝箱里面有"..msg, getn(tSel), tSel);
end

function lootAwardOther(player_index, box_index)

	if 1 ~= tMission:CheckTargetNpc(box_index) then return end

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
	if GetFreeItemRoom()  < 3 then
		Talk(1,"","<color=green>提示<color>：您的<color=yellow>包裹<color>空间不足！")
		PlayerIndex = player_index_save
		Talk(1,"","<color=green>提示<color>：<color=green>"..s_palyer_name.."<color>的<color=yellow>包裹<color>空间不足，无法进行分配！")
		return
	end

	PlayerIndex = player_index_save

	lootAward(player_index, box_index)

end

function lootAward(player_index, box_index)

	if 1 ~= tMission:CheckTargetNpc(box_index) then return end

	local player_index_save = PlayerIndex

	PlayerIndex = player_index;
	if gf_JudgeRoomWeight(3, 100, "") ~= 1 then return end
	PlayerIndex = player_index_save;

	local bossId = GetMissionV(MV_CUR_BOSS_ID);
	local bossLv = tMission:getBossLv(bossId);

	local daye = GetMissionV(MV_DAYE);
	if daye == -1 then
		daye = GetTeamMember(0);
	end
	if daye ~= PlayerIndex then
		return
	end

	local nLootItemId = GetMissionV(MV_LOOT_ID);
	if nLootItemId == 0 then
		nLootItemId = getLootItem(bossLv);
	end
	local tLoot = getLootSeting(bossLv)[nLootItemId];
	SetMissionV(MV_LOOT_ID, 0);
	SetMissionV(MV_DAYE, 0);
	SetMissionV(MV_LAO_ER, 0);

	SetNpcLifeTime(box_index, 0);
	PlayerIndex = player_index;
	gf_SetLogCaption("liangshan:ib_box");
	local nItemIndex = Clause3.giveClause(tLoot[1]);
--	if tLoot[3] then
--		SetItemExpireTime(nItemIndex,tLoot[3]*DAY_SECOND_NUM)
--	end
	gf_SetLogCaption("");
	PlayerIndex = player_index_save;
	
		--天罡令
	if tLoot[1][1] == TTGLInfo[4] then
		SetTask(VET_MS_TASKID_JUYILING, 0, 0)
		_stat_when_ib_produce(tLoot[1][2][4])--IB道具产出统计
	end
end
