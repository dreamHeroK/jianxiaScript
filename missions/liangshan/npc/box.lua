Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\missions\\liangshan\\mission\\tmission.lua")
Include("\\script\\class\\clause3.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

SF_FILE = "\\script\\missions\\liangshan\\npc\\box.lua"
--梁山宝箱奖励

tClause4 = {
	{{"军功章", {2,1,9999,1}}, 300},
	{{"大军功章", {2,1,9998,1}}, 300},
	{{"金钱袋", {2,95,662,1}, }, 4080},
	{{"消劫散" ,{2,0,141,1}}, 100},
	{{"八宝粽子"  ,{2,1,1125,1}},100},
	{{"师门圣物" ,{2,95,205,1}},500},
	{{"金猪全席", {1,1,39,1}}, 100},
	{{"蒙顶石花茶", {1,1,40,1}}, 100},
	{{"4级灵石原石", {2,95,5567,1}}, 900},
	{{"5级灵石原石", {2,95,557,1}}, 1000},
	{{"6级灵石原石", {2,95,558,1}}, 1200},
	{{"高级师门秘籍包裹", {2,97,128,1}}, 100},
	{{"五行秘籍", {0,107,155,1}}, 100},
	{{"小军绩牌"  ,{2,1,9975,1}},500},
	{{"神器"  ,{2,95,55,1}},500},
	{{"星辰碎片", {2,201,1,1}},100},
	{{"强化精石（11级）", {2,101,12,1}}, 10},
	{{"强化精石（12级）", {2,101,13,1}}, 10},
}

tClause5 = {
	{{"军功章", {2,1,9999,1}}, 300},
	{{"大军功章", {2,1,9998,1}}, 300},
	{{"金钱袋", {2,95,662,1}, }, 3880},
	{{"消劫散" ,{2,0,141,1}}, 100},
	{{"八宝粽子"  ,{2,1,1125,1}},100},
	{{"师门圣物" ,{2,95,205,1}},500},
	{{"金猪全席", {1,1,39,1}}, 100},
	{{"蒙顶石花茶", {1,1,40,1}}, 100},
	{{"4级灵石原石", {2,95,5567,1}}, 1000},
	{{"5级灵石原石", {2,95,557,1}}, 1000},
	{{"6级灵石原石", {2,95,558,1}}, 1200},
	{{"高级师门秘籍包裹", {2,97,128,1}}, 100},
	{{"五行秘籍", {0,107,155,1}}, 100},
	{{"小军绩牌"  ,{2,1,9975,1}},500},
	{{"神器"  ,{2,95,55,1}},500},
	{{"星辰碎片", {2,201,1,1}},200},
	{{"强化精石（11级）", {2,101,12,1}}, 10},
	{{"强化精石（12级）", {2,101,13,1}}, 10},
}

function getLootSeting(bossLv, bIB)
	if bossLv == 5 then
		tClause = tClause5;
	elseif bossLv == 4 then
		tClause	= tClause4;
	end
	local t = {nil, nil, nil, tClause4,tClause5}
	tClause = t[bossLv];

	if not tClause then
		print(format("[getLootSeting] [error bossLv] [bossLv=%s]", tostring(bossLv)));
		assert()
	end
	return tClause;
end

function getLootItem(bossLv, bIB)
	local tClause = getLootSeting(bossLv, bIB);

	local nMax = 0;
	for i = 1, getn(tClause) do
		nMax = nMax + tClause[i][2];
	end
	local rnd = random(1, nMax);
	for i = 1, getn(tClause) do
		rnd = rnd - tClause[i][2];
		if rnd <= 0 then
			return i,tClause[i][1],tClause[i][3];
		end
	end
	print("[getLootItem] [error random] [nMax=%d, rnd=%d]", nMax, rnd);
	assert();
end

function main()
	local nNpcIdx = GetTargetNpc();
    local nStage = GetMissionV(MV_STAGE_LEVEL);
    local bossId = GetUnitCurStates(nNpcIdx, 5)
    if bossId == 0 then
    	bossId = GetMissionV(MV_CUR_BOSS_ID);
    end
	local bossLv = tMission:getBossLv(bossId);

	normalLoot(nNpcIdx, bossLv);
end

function normalLoot(nNpcIdx, bossLv)
	local dwId = GetUnitCurStates(nNpcIdx, 3)
	if dwId == 0 then
		local nRet = ApplyItemDice(1, 100, 30, SF_FILE, "GD_Time_Over", GetTeamSize())
		dwId = nRet;
		local _, tLootItem,nExpireDay = getLootItem(bossLv);
		WriteLog(format("[liangshan:box] [CreateItem:%s]", tLootItem[1]));
		local nItemIndex = AddDiceItemInfo(dwId, gf_UnPack(tLootItem[2]))
		if nExpireDay then
			SetItemExpireTime(nItemIndex,nExpireDay*DAY_SECOND_NUM)
		end
		AddUnitStates(nNpcIdx, 3, dwId);
		local nPlayerOld = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if IsPlayerDeath() == 0 then
				RollItem(dwId)
				--Observer:onEvent(OE_LIANGSHAN_BOX);
			end
		end
		PlayerIndex = nPlayerOld
		return
	end

	local nState = GetItemDiceState(dwId)
	if nState == 0 then
		Msg2Player(LSMsgToPlayer[2])
	elseif nState == 1 then
		local n, szItem = DiceLootItem(dwId)
		if n == 0 then
			local szMsg = GetName()..LSMsgToPlayer[4]..szItem
			MU_Msg2Team(szMsg)
		elseif n == 1 then
			Msg2Player(LSMsgToPlayer[3])
		end
	elseif nState == 2 then
		Msg2Player(LSMsgToPlayer[5])
	end
end

function GD_Time_Over(dwId)
	local t, nSize, szItem = GetItemDiceRollInfo(dwId)
	local bAllGiveUp = 1
	for index, value in t do
		local str = value[1]..format(LSMsgToPlayer[8],value[2])
		if value[3] == 0 then
			str = value[1]..LSMsgToPlayer[9]
		elseif value[3] == 1 then
			str = str.."("..LSMsgToPlayer[10]..")"
			if value[4] == 1 then
				str = str.." -- "..LSMsgToPlayer[11]..szItem
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.."("..LSMsgToPlayer[12]..")"
			if value[4] == 1 then
				str = str.." -- "..LSMsgToPlayer[11]..szItem
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player(LSMsgToPlayer[6])
	elseif nSize ~= getn(t) then
		Msg2Player(LSMsgToPlayer[7])
	end
end
