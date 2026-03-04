Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\eyt_battle\\mission.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")

EYT_NPC = "<color=green>恩怨台:<color>";

function main()
	if ISEytSystemOpen(2) ~= 1 then
		return 0;
	end
	local tSay = {};
	tSay.msg = EYT_NPC .. format("欢迎参加【恩怨台】活动，这是一场激烈的战斗，让您体验不同于平时的战斗乐趣。在参与活动之前，恩怨台将会分成两个队伍，每队 %d 人。您可以选择加入哪一方阵营来进行战斗，以获取更多的积分。参与活动需要满足以下条件：\n\n1.等级达到 %d 级以上\n2.拥有至少一个空闲的队伍位置\n\n请选择您的操作：", 8, 150);
	tSay.sel = {
		{"立即参加", "eyt_npc_condition"},
		{"加入队伍", "eyt_npc_join"},
		{"加入队伍（需要 3 人）", "eyt_npc_join_team"},
		{"\n取消操作", "nothing"},
	};
	temp_Talk(tSay);
end

function eyt_npc_condition()
	local tSay = {}
	tSay.msg = EYT_NPC..format("\n活动时间：%s", "每天12:00-14:00，18:00-20:00")
	tSay.msg = tSay.msg.."\n最低参与等级：玩家等级达到5级以上"
	tSay.msg = tSay.msg.."\n战队限制：每队最多可以有3名玩家，多余的玩家需要组成其他队伍参与"
	tSay.sel = {
		{"\n返回主菜单", "main"},
		{"结束对话", "nothing"},
	}
	temp_Talk(tSay)
end

function eyt_npc_join()
	if eyt_npc_check() ~= 1 then
		return 0;
	end
	local nUsableMap = eyt_GetSuitMap(1);
	DebugOutput("nUsableMap =", nUsableMap);
	if nUsableMap ~= 0 then
		local nRed = mf_GetPlayerCount(EYT_MISSION_ID, EYT_CAMP_RED, nUsableMap);
		local nBlue = mf_GetPlayerCount(EYT_MISSION_ID, EYT_CAMP_BLUE, nUsableMap);
		if nRed <= nBlue then
			EYT_MISSION:Enter(nUsableMap, EYT_CAMP_RED);
		else
			EYT_MISSION:Enter(nUsableMap, EYT_CAMP_BLUE);
		end
	else
if GetMapLoadCount(EYT_MAP_ID) >= EYT_MISSION_MAX then
	Say("恩怨太已满员，请稍后再试！", 0);
	return 0;
end
		local mapID, mapIdx = EYT_MISSION:Create()
		DebugOutput("EYT_MISSION:Create()", mapID, mapIdx);
		EYT_MISSION:Enter(mapID, EYT_CAMP_RED);
	end
end

function eyt_npc_join_team()
	if eyt_npc_check(1) ~= 1 then
		return 0;
	end
	local nUsableMap = eyt_GetSuitMap(GetTeamSize());
	DebugOutput("nUsableMap =", nUsableMap);
	if nUsableMap ~= 0 then
		local nRed = mf_GetPlayerCount(EYT_MISSION_ID, EYT_CAMP_RED, nUsableMap);
		local nBlue = mf_GetPlayerCount(EYT_MISSION_ID, EYT_CAMP_BLUE, nUsableMap);
		if nRed <= nBlue then
			EYT_MISSION:TeamEnter(nUsableMap, EYT_CAMP_RED);
		else
			EYT_MISSION:TeamEnter(nUsableMap, EYT_CAMP_BLUE);
		end
	else
if GetMapLoadCount(EYT_MAP_ID) >= EYT_MISSION_MAX then
	Say("恩怨太已满员，请稍后再试！", 0);
	return 0;
end
		local mapID, mapIdx = EYT_MISSION:Create()
		DebugOutput("EYT_MISSION:Create()", mapID, mapIdx);
		EYT_MISSION:TeamEnter(mapID, EYT_CAMP_RED);
	end
end

function eyt_npc_check(bTeam)
	--时间限制
	local nTime = tonumber(date("%H%M"));
if (not ((1200 <= nTime and nTime < 1400) or (1800 <= nTime and nTime < 2000))) then
	Say(EYT_NPC..format("恩怨太只在%s至%s和%s至%s时间段开放，目前不接受参与。", "12:00", "14:00", "18:00", "20:00"), 0);
	return 0;
end
	--已经有队伍了
	local nTeamSize = GetTeamSize();
	if not bTeam or bTeam ~= 1 then
if nTeamSize ~= 0 then
	Say(EYT_NPC..format("%s已经加入了队伍，无法参与恩怨太", gf_GetPlayerSexName()), 0);
	return 0;
end
if gf_CheckLevel(5, 96) ~= 1 then
	Say(EYT_NPC..format("%s等级需要达到%d级才能参与恩怨太", gf_GetPlayerSexName(), 96), 0)
	return 0;
end
if eyt_GetJoinTimes() >= EYT_JOIN_TIME_LIMIT then
	Say(EYT_NPC..format("%s今天已经参与了%d次，无法再次参与恩怨太", gf_GetPlayerSexName(), EYT_JOIN_TIME_LIMIT), 0)
	return 0;
end
		local nJoinTime = eyt_GetJoinTime();
		local needTime = EYT_PUNISH_TIME + nJoinTime - GetTime();
		local nMin = floor(needTime/60);
if needTime > 0 and (nMin <= EYT_PUNISH_TIME/60 and nMin >= 0) then
	Say(EYT_NPC..format("%s刚刚离开恩怨台，%d分钟%s后才能再次参加", gf_GetPlayerSexName(), nMin, mod(needTime,60)), 0);
	return 0;
else
	if GetName() ~= GetCaptainName() then
		Say(EYT_NPC.."只有队长才能报名参加！", 0)
		return 0;
	end
end
if nTeamSize > 3 then
	Say(EYT_NPC..format("%s当前队伍人数超过%d人，无法报名参加恩怨台", gf_GetPlayerSexName(), 3), 0);
	return 0;
end
if gf_CheckTeam(
	function ()
		if gf_CheckLevel(5, 96) ~= 1 then
			return 0;
		end
		return 1;
	end, EYT_NPC..format("以下队员等级不满足%d转%d级要求，无法参加恩怨台:\n", 5, 96)) ~= 1 then
		return 0;
end
if gf_CheckTeam(
	function ()
		if eyt_GetJoinTimes() >= EYT_JOIN_TIME_LIMIT then
			return 0;
		end
		return 1;
	end, EYT_NPC..format("以下队员今天已经参加了%d次，无法再次参加恩怨台:\n", EYT_JOIN_TIME_LIMIT)) ~= 1 then
		return 0;
end
if gf_CheckTeam(
	function ()
		local nJoinTime = eyt_GetJoinTime();
		local needTime = EYT_PUNISH_TIME + nJoinTime - GetTime();
		local nMin = math.floor(needTime/60);
		if needTime > 0 and (nMin <= EYT_PUNISH_TIME/60 and nMin >= 0) then
			return 0;
		end
		return 1;
	end, EYT_NPC..format("以下队员最近退出时间不足%d分钟，无法参加恩怨台:\n", EYT_PUNISH_TIME/60)) ~= 1 then
		return 0;
end
	end
	return 1;
end

function main_eyt_award()
	local nSucc = eyt_GetSucc()
	local nFail = eyt_GetFail()
	local tSay = {}
	tSay.msg = EYT_NPC..format("%s参加恩怨台共计%d轮，获胜%d轮，失败%d轮，是否领取奖励？<color=red>（请确认背包是否有足够空间）<color>", gf_GetPlayerSexName(), nSucc+nFail, nSucc, nFail)
	tSay.sel = {}
	if nSucc + nFail <= 0 then
		table.insert(tSay.sel, {"暂无可领取奖励", "nothing"})
	else
		if nSucc > 0 then
			table.insert(tSay.sel, {"领取胜利奖励", "eyt_npc_get_succ_award"})
		end
		if nFail > 0 then
			table.insert(tSay.sel, {"领取失败奖励", "eyt_npc_get_fail_award"})
		end
	end
	table.insert(tSay.sel, {"取消", "nothing"})
	temp_Talk(tSay)
end

function eyt_npc_get_succ_award()
	local nSucc = eyt_GetSucc()
	if nSucc <= 0 then
		Say("暂无可领取奖励", 0)
		return 0
	end
	local tSay = {}
	tSay.msg = EYT_NPC..format("%s参加恩怨台共获胜%d轮，是否领取胜利奖励？<color=red>（每轮仅可领取一次奖励）<color>", gf_GetPlayerSexName(), nSucc)
	tSay.sel = {
		{"领取奖励", "eyt_npc_get_succ_award_do"},
		{"取消", "main_eyt_award"},
		{"返回", "nothing"},
	}
	temp_Talk(tSay)
end

function eyt_npc_get_succ_award_do(bUseIb)
	local nSucc = eyt_GetSucc()
if nSucc <= 0 then
	Say("暂无可领取奖励", 0)
	return 0
end
if gf_Judge_Room_Weight(3, 10," ") ~= 1 then
	return 0
end
if bUseIb and GetItemCount(2, 97, 236) < 1 then
	Say(format("在背包或仓库中%s的数量不足%d", "Thi?p K? L?nh", 1), 0)
	return 0
end
if not bUseIb then --直接领奖
	local nExp = 10000000 * (1 + EYT_AWARD_COEFFICIENT + GetVipCardParam())
	gf_ModifyExp(nExp)
	gf_AddItemEx2({2,1,30499,1}, "H?p quà anh hùng", "恩怨台", "Ph?n th??ng th??ng truy?n th?a T?", 0, 1)
	CustomAwardGiveOne(CustomAwardSelectOne("EY_jinbaoxiang_2_free"))
else --天骄令领奖
	if DelItem(2, 97, 236, 1) ~= 1 then
		return 0
	end
	local nExp = 20000000 * (1 + EYT_AWARD_COEFFICIENT + GetVipCardParam())
	gf_ModifyExp(nExp)
	gf_AddItemEx2({2,1,30499,2}, "H?p quà anh hùng", "恩怨台", "Ph?n th??ng th??ng truy?n th?a T? (Thi?p K? L?nh)", 0, 1)
	CustomAwardGiveOne(CustomAwardSelectOne("EY_jinbaoxiang_2_IB"))
	--:onEvent(SYSEVENT_GLOBAL_COST_IB, {2,97,236,1})
end
	_vc_JoinEytBattle_Win(); --参加恩怨台取胜并领取奖励
	eyt_ReduceSucc();
	eyt_npc_get_succ_award();
end

function eyt_npc_get_fail_award()
	local nFail = eyt_GetFail()
	if nFail <= 0 then
		Say("当前没有可领取的奖励", 0)
		return 0
	end
	local tSay = {}
	tSay.msg = EYT_NPC..format("%s参加了恩怨台并累计失败%d次，你想立即领取奖励吗？（<color=red>每次只能领取一个场次<color>）", gf_GetPlayerSexName(), nFail)
	tSay.sel = {
		{"立即领取奖励", "eyt_npc_get_fail_award_do"},
		{"使用天骄令领取奖励", "#eyt_npc_get_fail_award_do(1)"},
		{"返回", "main_eyt_award"},
		{"不要奖励了", "nothing"},	
	}
	temp_Talk(tSay)
end

function eyt_npc_get_fail_award_do(bUseIb)
	local nFail = eyt_GetFail()
if nFail <= 0 then
	Say("当前没有可领取的奖励", 0)
	return 0
end
if gf_Judge_Room_Weight(3, 10," ") ~= 1 then
	return 0
end
if bUseIb and GetItemCount(2, 97, 236) < 1 then
	Say(string.format("在背包或仓库中没有足够的%s数量（需求：%d）", "天骄令", 1), 0)
	return 0
end
	if not bUseIb then --直接领奖
		local nExp = 5000000 * (1 + EYT_AWARD_COEFFICIENT + GetVipCardParam());
		gf_ModifyExp(nExp);
		--gf_AddItemEx2({2,1,30499,0}, "英雄勋章", "恩怨台比武", "恩怨台败场奖励", 0, 1);
		CustomAwardGiveOne(CustomAwardSelectOne("EY_baoxiang_2"));
	else --天骄令领奖
		if DelItem(2, 97, 236, 1) ~= 1 then
			return 0;
		end
local nExp = 10000000 * (1 + EYT_AWARD_COEFFICIENT + GetVipCardParam())
gf_ModifyExp(nExp)
gf_AddItemEx2({2,1,30499,1}, "恩怨台", "Ph?n th??ng b?o trì ?n ??nh (Thiên Kiêu L?nh)", 0, 1)
CustomAwardGiveOne(CustomAwardSelectOne("EY_baoxiang_2_IB"))
--Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {2,97,236,1})
	end
	eyt_ReduceFail();
	eyt_npc_get_fail_award();
end
