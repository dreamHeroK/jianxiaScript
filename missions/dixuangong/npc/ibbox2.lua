Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\class\\clause3.lua")
Import("\\script\\lib\\globalfunctions.lua")
--Include("\\script\\misc\\data_state\\state.lua")
Include("\\script\\online_activites\\award.lua")

msg = "恭喜侠士 $n 从地玄宫获得极品宝物 $i";

--精英宝箱
tClause1 = {
    {{"战神披风", {0,152,1,1}}, 1000},
    {{"九天战袍", {0,152,2,1}}, 1000},
    {{"黄金游侠令(绑定)", {2,1,538,1}, nil, {15*24*3600}}, 1500},
    {{"侠客披风",{0,152,29,1},nil},30},
    {{"鬼斧披风",{0,152,30,1},nil},30},
    {{"腾云披风",{0,152,31,1},nil},30},
    {{"绝世服饰",{2,1,31233,1}},500},
    {{"白金游侠令(未绑定)", {2,1,30228,1}, nil, {15*24*3600}}, 100},
    {{"武学秘籍",{2,1,30071,5,1}},2300},
    {{"珍品武学卷一",{2,1,30998,1,1}},468},
    {{"珍品武学卷二",{2,1,30999,1,1}},600},
    {{"珍品武学卷三",{2,1,31000,1,1},nil},440},
    
    {{"武学秘典", {2, 1, 30731, 1, 1}, nil, nil}, 500},
    {{"天赐战甲", {2, 1, 31386, 1, 1}, nil, nil}, 500},
    {{"灵符",     {0, 105, 201, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 1},
    {{"风神令", {0, 105, 209, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 1},
    {{"天命披风六阶", {2, 1, 31385, 5, 1}, nil, nil}, 500},
    {{"天命披风七阶", {2, 1, 31399, 1, 1}, nil, nil}, 500},
}

--五旗宝箱
tClause2 = {
    {{"黄金游侠令(绑定)", {2, 1, 538, 1, 1}, nil,  {1296000}}, 1000},
    {{"白金游侠令(未绑定)", {2, 1, 30228, 1, 1}, nil,  {1296000}}, 100},
    {{"游侠披风", {0, 152, 26, 1, 1}, nil, nil}, 200},
    {{"铁血披风", {0, 152, 27, 1, 1}, nil, nil}, 200},
    {{"云游披风", {0, 152, 28, 1, 1}, nil, nil}, 200},
    {{"侠客披风", {0, 152, 29, 1, 1}, nil, nil}, 30},
    {{"鬼斧披风", {0, 152, 30, 1, 1}, nil, nil}, 30},
    {{"腾云披风", {0, 152, 31, 1, 1}, nil, nil}, 30},
    {{"绝世服饰", {2, 1, 31233, 1, 1}, nil, nil}, 1000},
    {{"天机令", {2, 1, 30370, 1, 1}, msg, nil}, 1},
    {{"武学秘籍", {2, 1, 30071, 10, 1}, nil, nil}, 2500},
    {{"珍品武学卷一", {2, 1, 30998, 1, 1}, nil, nil}, 1100},
    {{"珍品武学卷二", {2, 1, 30999, 1, 1}, nil, nil}, 1100},
    {{"珍品武学卷三", {2, 1, 31000, 1, 1}, nil, nil}, 504},
    {{"武学秘典", {2, 1, 30731, 1, 1}, nil, nil}, 500},
    {{"天赐战甲", {2, 1, 31386, 1, 1}, nil, nil}, 500},
    {{"灵符",      {0, 105, 201, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 1},
    {{"风神令", {0, 105, 209, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 1},
    {{"天命披风六阶", {2, 1, 31385, 5, 1}, nil, nil}, 488},
    {{"天命披风七阶", {2, 1, 31399, 1, 1}, nil, nil}, 500},
    {{"幻月披风", {0, 152, 32, 1, 1}, msg, nil}, 1},
    {{"霓裳披风", {0, 152, 33, 1, 1}, msg, nil}, 1},
    {{"苍狼披风", {0, 152, 34, 1, 1}, msg, nil}, 1},
}

--三堂宝箱
tClause3 = {
    {{"初级武学残页", {2, 0, 504, 1, 1}, nil,  {604800}}, 500},
    {{"中级武学残页", {2, 0, 398, 1, 1}, nil,  {604800}}, 200},
    {{"极品丹药", {2, 1, 30269, 1, 1}, nil,  {604800}}, 500},
    {{"至尊武学", {2, 1, 270, 1, 1}, nil,  {604800}}, 500},
    {{"上古至尊武学", {2, 1, 1007, 1, 1}, nil,  {604800}}, 500},
    {{"天罡真诀", {2, 1, 1008, 1, 1}, nil,  {604800}}, 500},
    {{"稀有材料", {2, 0, 553, 1, 1}, nil,  {604800}}, 500},
    --{{"英雄勋章", {2, 1, 30499, 1, 4}, nil, nil}, 800},
    {{"英雄徽章", {2, 1, 30499, 2, 1}, nil, nil}, 600},
    {{"英雄徽章礼包", {2, 1, 30499, 4, 1}, nil, nil}, 200},
    {{"英雄徽章大礼包", {2, 1, 30499, 10, 1}, nil, nil}, 50},
    {{"天命石", {2, 1, 30410, 2, 1}, nil, nil}, 400},
    {{"天命石袋", {2, 1, 30410, 4, 1}, nil, nil}, 100},
    {{"天命石箱", {2, 1, 30410, 20, 1}, nil, nil}, 20},
    {{"天机令", {2, 1, 30370, 1, 1}, msg, nil}, 1},
	-- {{"游侠挂衣", {0, 152, 26, 1, 1}, msg, nil}, 50},
	-- {{"铁血挂衣", {0, 152, 27, 1, 1}, msg, nil}, 50},
	-- {{"云游挂衣", {0, 152, 28, 1, 1}, msg, nil}, 50},
    {{"黄金游侠令(绑定)", {2, 1, 538, 1, 1}, nil,  {1296000}}, 500},
    {{"白金游侠令(未绑定)", {2, 1, 30228, 1, 1}, nil,  {1296000}}, 100},
    {{"侠客披风", {0, 152, 29, 1, 1}, nil, nil}, 10},
    {{"鬼斧披风", {0, 152, 30, 1, 1}, nil, nil}, 10},
    {{"腾云披风", {0, 152, 31, 1, 1}, nil, nil}, 10},
    {{"绝世服饰", {2, 1, 31233, 1, 1}, nil, nil}, 500},
    {{"武学秘籍", {2, 1, 30071, 10, 1}, nil, nil}, 1041},
    {{"珍品武学卷一", {2, 1, 30998, 1, 1}, nil, nil}, 100},
    {{"珍品武学卷二", {2, 1, 30999, 1, 1}, nil, nil}, 200},
    {{"珍品武学卷三", {2, 1, 31000, 1, 1}, nil, nil}, 800},
    {{"武学秘典", {2, 1, 30731, 1, 1}, nil, nil}, 500},
    {{"天赐战甲", {2, 1, 31386, 10, 1}, nil, nil}, 500},
    {{"灵符",      {0, 105, 201, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 1},
    {{"风神令", {0, 105, 209, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 1},
    {{"天命披风六阶", {2, 1, 31385, 10, 1}, nil, nil}, 626},
    {{"天命披风七阶", {2, 1, 31399, 5, 1}, nil, nil}, 500},
    {{"幻月披风", {0, 152, 32, 1, 1}, msg, nil}, 1},
    {{"霓裳披风", {0, 152, 33, 1, 1}, msg, nil}, 1},
    {{"苍狼披风", {0, 152, 34, 1, 1}, msg, nil}, 1},
}

--凝月宝箱
tClause4 = {
    {{"天机令", {2, 1, 30370, 1, 1}, msg, nil}, 5865},
    {{"天机令x2", {2, 1, 30370, 2, 1}, msg, nil}, 600},
    {{"天机令x3", {2, 1, 30370, 3, 1}, msg, nil}, 200},
    -- {{"侠骨披风", {0, 152, 29, 1, 1}, msg, nil}, 1000},
    -- {{"鬼斧披风", {0, 152, 30, 1, 1}, msg, nil}, 1000},
    -- {{"腾云披风", {0, 152, 31, 1, 1}, msg, nil}, 1000},
    {{"天赐战甲x50", {2, 1, 31386, 50, 1}, nil, nil}, 500},
    {{"灵符x10",     {0, 105, 201, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 10},
    {{"风神令x10", {0, 105, 209, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 10},
    {{"天命披风六阶x100", {2, 1, 31385, 100, 1}, nil, nil}, 1500},
    {{"天命披风七阶x10", {2, 1, 31399, 10, 1}, nil, nil}, 1000},
    {{"幻月披风", {0, 152, 32, 1, 1}, nil, nil}, 100},
    {{"霓裳披风", {0, 152, 33, 1, 1}, nil, nil}, 100},
    {{"苍狼披风", {0, 152, 34, 1, 1}, nil, nil}, 100},
    {{"苍狼披风", {0, 152, 35, 1, 1}, msg, nil}, 5},
    {{"霓裳披风", {0, 152, 36, 1, 1}, msg, nil}, 5},
    {{"幻月披风", {0, 152, 37, 1, 1}, msg, nil}, 5},
}

tClause = {
	tClause1,
	tClause2,
	tClause3,
	tClause4,
}

function main()
	local tItem = getLootItem();
	if not tItem then return end

	local Daye = GetMissionV(MV_SP_DAYE)
	local tSel = {"放弃宝物/nothing"}
	if PlayerIndex == Daye then
		tSel = {
			format("自己收取奖励/#lootAwardOther(%d, %d)",PlayerIndex, GetTargetNpc()),
			format("分配给队友/#giveOther(%d)",GetTargetNpc()),
			"放弃宝物/nothing",
		}
	end
	local msg = format("宝箱内含有[%s *%d]",tItem[1], tItem[2][4]);
	Say(msg, getn(tSel), tSel);
end

function getRandItem(tClause)
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

function getLootItem()
	local lv = GetMissionV(MV_SP_BOX_LV);
	local nBoxLv = GetMissionV(MV_SP_BOSS_LV)

	if lv == 0 then
		lv = nBoxLv;
		SetMissionV(MV_SP_BOX_LV, lv);
	end

	-- if lv ~= nBoxLv then
	-- 	return nil
	-- end

	local clause = tClause[lv];
	if not clause then return end;

	local sp = GetMissionV(MV_SP_LOOT_ID);
	if sp == 0 then
		sp = getRandItem(clause)
		SetMissionV(MV_SP_LOOT_ID, sp);
		local tItem = clause[sp][1];
		WriteLog(format("[dixuangong:lootItem2] [Role:%s Acc:%s] [bossLv=%d, lootId=%d, itemName=%sx%d]",
			GetName(), GetAccount(), lv, sp, tItem[1], tItem[2][4]));
		--产出统计
		if tItem[1] == "天机令" then
			AddRuntimeStat(1,14,0,tItem[2][4]);
		elseif tItem[1] == "龙血精华三级" then
			AddRuntimeStat(1,16,0,tItem[2][4]);
		elseif tItem[1] == "玄玉精华三级" then
			AddRuntimeStat(1,17,0,tItem[2][4]);
		elseif tItem[1] == "无极宝典" then
			AddRuntimeStat(1,18,0,tItem[2][4]);
		elseif tItem[1] == "无极秘籍" then
			AddRuntimeStat(1,19,0,tItem[2][4]);
		end
		--2Xu
		--open_dxg_tyjyx_award();
	end
	local tItem = clause[sp][1];
	return tItem;
end

function giveOther(npcId)
	local oldPidx = PlayerIndex;
	local tSel = {}
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if oldPidx ~= PlayerIndex then
			local player_name = GetName();
			player_name = gsub(player_name,"/","-");
			player_name = gsub(player_name,"|","-");
			player_name = gsub(player_name,":","-");
			tinsert(tSel, 1, "将奖励分配给"..player_name.."/#lootAwardOther("..PlayerIndex..","..npcId..")");
		end
	end
	tinsert(tSel, "放弃宝物/nothing");
	PlayerIndex = oldPidx;
	local tLootItem = getLootItem();
	if not tLootItem then
		return
	end
	local nCount = (tLootItem[2] and tLootItem[2][4]) or 1;
	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
	Say("<color=green>宝箱<color>:当前包含"..msg, getn(tSel), tSel);
end

function lootAwardOther(pidx, npcId)
	local oldPidx = PlayerIndex;
	PlayerIndex = pidx;
	local name = GetName();
	if gf_JudgeRoomWeight(1,10) ~= 1 then
		Msg2Player("背包空间不足，无法获取奖励");
		if pidx ~= oldPidx then
			PlayerIndex = oldPidx;
			Msg2Player(format("%s背包空间不足，无法获得奖励", name));
		end
		return
	end
	giveAward(npcId);
	PlayerIndex = oldPidx;
end

function giveAward(npcId)
	local tItem = getLootItem();
	if not tItem then return end

	local nBossLv = GetMissionV(MV_SP_BOSS_LV)
	local nBoxLv = GetMissionV(MV_SP_BOX_LV)
	if nBossLv ~= nBoxLv then
		--Talk(1,"","Award Expired");
		WriteLog(format("[Error][dixuangong:InvalidAward] [Role:%s Acc:%s] [bossLv=%d, boxLv=%d, lootId=%d, itemName=%sx%d]",
			GetName(), GetAccount(), nBossLv, nBoxLv, GetMissionV(MV_SP_LOOT_ID), tItem[1], tItem[2][4]));
		-- SetMissionV(MV_SP_BOX_LV, 0);
		-- SetMissionV(MV_SP_LOOT_ID, 0);
		-- return
	end

	SetMissionV(MV_SP_BOX_LV, 0);
	SetMissionV(MV_SP_LOOT_ID, 0);
	SetMissionV(MV_SP_DAYE, 0);
	SetNpcScript(npcId, "");
	SetNpcLifeTime(npcId, 0);

	gf_SetLogCaption("dixuangong:ibbox2");
	Clause3.giveClause(tItem);
	gf_SetLogCaption("");
end
