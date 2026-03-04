Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\class\\clause3.lua")
Include("\\script\\lib\\globalfunctions.lua")
--Include("\\script\\misc\\data_state\\state.lua")
Include("\\script\\online_activites\\award.lua")

msg = "恭喜$闯过地玄宫关卡获得$i";

--精英宝箱
tClause1 = {
	{{"皓月碎片", {2,95,740,200}}, 2000},
	{{"八宝粽子",{2,1,1125,1}},500},
	{{"金钱袋",{2,95,662,1}},1000},
	--{{"师门秘函",{2,1,1020,1}},755},
	{{"九转回魂丹",{1,0,32,1}},500},
	{{"神器",{2,95,55,5}},1000},
	{{"五色彩染",{2,201,13,1}},3200},
	{{"五华聚元散",{1,0,261,1}},1000},
	{{"七华聚元散",{1,0,267,1}},1000},
	{{"辉煌军功章", {2,1,9977,1}},100},
	{{"徽章箱子", {2,103,150,1}},100},
	{{"披风箱子", {2,103,151,1}},100},
	{{"五行天仪箱子", {2,103,152,1}},100},
	{{"天使镇魂玉", {2,103,153,1}},2000},

}

--五旗宝箱
tClause2 = {
	{{"皓月碎片", {2,95,740,200}}, 2000},
	{{"八宝粽子",{2,1,1125,1}},500},
	{{"金钱袋",{2,95,662,1}},1000},
	--{{"师门秘函",{2,1,1020,1}},755},
	{{"九转回魂丹",{1,0,32,1}},500},
	{{"神器",{2,95,55,5}},1000},
	{{"五色彩染",{2,201,13,1}},3200},
	{{"五华聚元散",{1,0,261,1}},1000},
	{{"七华聚元散",{1,0,267,1}},1000},
	--{{"辉煌军功章", {2,1,9977,1}},100},
	{{"徽章箱子", {2,103,150,1}},100},
	{{"披风箱子", {2,103,151,1}},100},
	{{"五行天仪箱子", {2,103,152,1}},100},
	{{"天使镇魂玉", {2,103,153,1}},2000},
}

--三堂宝箱
tClause3 = {
	{{"皓月碎片", {2,95,740,200}}, 2000},
	{{"八宝粽子",{2,1,1125,1}},500},
	{{"金钱袋",{2,95,662,1}},1000},
	--{{"师门秘函",{2,1,1020,1}},755},
	{{"九转回魂丹",{1,0,32,1}},500},
	{{"神器",{2,95,55,5}},1000},
	{{"五色彩染",{2,201,13,1}},3200},
	{{"五华聚元散",{1,0,261,1}},1000},
	{{"七华聚元散",{1,0,267,1}},1000},
	--{{"辉煌军功章", {2,1,9977,1}},100},
	{{"徽章箱子", {2,103,150,1}},100},
	{{"披风箱子", {2,103,151,1}},100},
	{{"五行天仪箱子", {2,103,152,1}},100},
	{{"天使镇魂玉", {2,103,153,1}},2000},
}

--凝月宝箱
tClause4 = {
	{{"皓月碎片", {2,95,740,200}}, 2000},
	{{"八宝粽子",{2,1,1125,1}},500},
	{{"金钱袋",{2,95,662,1}},1000},
	--{{"师门秘函",{2,1,1020,1}},755},
	{{"九转回魂丹",{1,0,32,1}},500},
	{{"神器",{2,95,55,5}},1000},
	{{"五色彩染",{2,201,13,1}},3200},
	{{"五华聚元散",{1,0,261,1}},1000},
	{{"七华聚元散",{1,0,267,1}},1000},
	{{"辉煌军功章", {2,1,9977,1}},100},
	{{"徽章箱子", {2,103,150,1}},100},
	{{"披风箱子", {2,103,151,1}},100},
	{{"五行天仪箱子", {2,103,152,1}},100},
	{{"天使镇魂玉", {2,103,153,1}},2000},
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
	local tSel = {"我再考虑考虑/nothing"}
	if PlayerIndex == Daye then
		tSel = {
			format("我要拾取奖励/#lootAwardOther(%d, %d)",PlayerIndex, GetTargetNpc()),
			format("我要把奖励分配给/#giveOther(%d)",GetTargetNpc()),
			"我再考虑考虑/nothing",
		}
	end
	local msg = format("你在宝箱里发现了<color=yellow>%d个%s<color>请点击分配！", tItem[2][4] ,tItem[1]);
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
	local lv = GetMissionV(MV_SP_BOSS_LV);
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
		if tItem[1] == "游侠令" then
			AddRuntimeStat(1,14,0,tItem[2][4]);
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
			tinsert(tSel, 1, player_name.."/#lootAwardOther("..PlayerIndex..","..npcId..")");
		end
	end
	tinsert(tSel, "我再考虑考虑/nothing");
	PlayerIndex = oldPidx;
	local tLootItem = getLootItem();
	local nCount = (tLootItem[2] and tLootItem[2][4]) or 1;
	local msg = format("<color=yellow>%d个[%s]<color>", nCount, tLootItem[1]);
	Say("<color=green>提示<color>：您可以把"..msg.."分配给您<color=yellow>队伍<color>中的成员！请选择您要分配的人。", getn(tSel), tSel);
end

function lootAwardOther(pidx, npcId)
	local oldPidx = PlayerIndex;
	PlayerIndex = pidx;
	local name = GetName();
	if gf_JudgeRoomWeight(1,10) ~= 1 then
		Talk(1,"","<color=green>提示<color>：您的<color=yellow>背包<color>空间不足！")
		if pidx ~= oldPidx then
			PlayerIndex = oldPidx;
			Talk(1,"","<color=green>提示<color>：<color=green>"..name.."<color>的<color=yellow>背包<color>空间不足，无法进行分配！")
		end
		return
	end
	giveAward(npcId);
	PlayerIndex = oldPidx;
end

function giveAward(npcId)
	local tItem = getLootItem();
	if not tItem then return end

	SetMissionV(MV_SP_LOOT_ID, 0);
	SetMissionV(MV_SP_DAYE, 0);
	SetNpcScript(npcId, "");
	SetNpcLifeTime(npcId, 0);

	gf_SetLogCaption("dixuangong:ibbox2");
	Clause3.giveClause(tItem);
	gf_SetLogCaption("");
end
