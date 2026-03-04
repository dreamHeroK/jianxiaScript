--帮派大乱斗功能npc
Include("\\script\\missions\\tong_melee\\tm_head.lua")
Include("\\script\\lib\\talktmp.lua")

g_TimeLimit = 0;
g_TimeLimitOther = 0;
g_tTongRank = {};

--参加帮派大乱斗
function tm_join_tong_melee()
	if tm_IsTongMeleeOpen() ~= 1 then
		return 0;
	end
	local tSay = {
		"帮派会战介绍/tm_what_is_tong_melee",
		"参加帮派会战的条件/tm_join_condition",
		"帮派会战规则/tm_rule_tong_melee",
		"领取参战奖励/tm_award_tong_melee",
		"\n返回/tm_dialog_return",
		"结束对话/nothing"
	}
	local nRet = IsPlayerQueuing(1);
	if not nRet  then return 0; end
	if nRet == 1 then
		tinsert(tSay, 1, "取消帮派会战/tm_cancle_tong_melee_now");
	else
		tinsert(tSay, 1, "加入帮派会战/tm_join_tong_melee_now");
	end
	Say(TM_TONG_AD_NPC.."神兽有强大的灵力协助加入到帮派会战，也增加了帮派的力量。", getn(tSay), tSay);
end

--领取帮派大乱斗奖励
function tm_award_tong_melee()
	if tm_IsTongMeleeOpen() ~= 1 then
		return 0;
	end
	local tSay = {
		"领取参战奖励/tm_get_every_match_award",
		"领取帮会排名奖励/tm_get_tong_award",
		"查看帮派会战排名/tm_look_for_rank",
		"\n随便看看/nothing",
	}
	Say(TM_TONG_AD_NPC.."参加帮派会战会获得奖励，帮主可以获得排名奖励。", getn(tSay), tSay);
end

--返回
function tm_dialog_return()
	SetPlayerScript("\\script\\世界地图\\跨服演武场\\npc\\tong_ambassagor.lua");
	SendScript2VM("\\script\\世界地图\\跨服演武场\\npc\\tong_ambassagor.lua", "main()");
end

function get_join_que_id()
	local nTime = tonumber(date("%H%M"));
	if nTime < 1300 then
		return 1
	else
		return 2
	end
end
function get_delete_que_id()
	local nTime = tonumber(date("%H%M"));
	if nTime < 2215 then
		return 1
	else
		return 2
	end
end

--参加帮会大乱斗
function tm_join_tong_melee_now()
	if tm_checkJoinCondition() ~= 0 then
		AddPlayerToQueuing(get_join_que_id(), 1);
	end
end

--取消帮会大乱斗
function tm_cancle_tong_melee_now()
	local nRet = IsPlayerQueuing(1);
	if nRet and nRet == 1 then
		DelPlayerFromQueuing(get_delete_que_id());
	end
end

--什么是帮会大乱斗
function tm_what_is_tong_melee()
	local tSay = {};
	tSay.msg = TM_TONG_AD_NPC.."帮派会战是一个8v8的帮派混战模式，每周日12点45分、21点15分成都帮派大使由帮主带队报名参加。每周一至周四可以领取排名奖励。";
	tSay.sel = {
		{"\n返回", "tm_join_tong_melee"},
		{"结束对话", "nothing"},
	};
	temp_Talk(tSay);
end

--参加条件是什么
function tm_join_condition()
	local tSay = {};
	tSay.msg = TM_TONG_AD_NPC.."只要角色达到80级并加入<color=red>帮会<color>的玩家就可以加入。但只有<color=red>帮主<color>可以成为参加帮派会战的队长！";
	tSay.sel = {
		{"\n返回", "tm_join_tong_melee"},
		{"结束对话", "nothing"},
	};
	temp_Talk(tSay);
end


function tm_rule_tong_melee()
	local tSay = {};
	tSay.msg = TM_TONG_AD_NPC.."帮派会战开始后，队长可以分发神兽，并指派一名成员来守卫。击败其他帮会的成员将获得被召唤的神兽的灵力点，击败被召唤的野兽的守护者，并且获得更多的被召唤的野兽的灵力点。如果您死了，您的灵力点将被扣除，当被召唤的野兽的灵力点达到一定值时，被召唤的野兽将会升级，从而给本帮带来很多好处。同时，如果被召唤的野兽的灵力点中扣除太多的灵力将使被召唤的神兽降级。最后，根据帮会的灵性分数进行高低行列，并为确定胜负提供条件。";
	tSay.msg = tSay.msg..format("(最多有3个帮会可以加入)",3);
	tSay.sel = {
		{"\n返回", "tm_join_tong_melee"},
		{"结束对话", "nothing"},
	};
	temp_Talk(tSay);
end

function tm_get_every_match_award()
	local nExp = GetTask(TM_TASKID_EXP);
	local nLingshi = gf_GetMyTaskByte(TM_TASKID_LINGSHI, 1, 2);
	if nExp == 0 and nLingshi == 0 then
		Talk(1,"",TM_TONG_AD_NPC.."您已经领取了帮派会战的奖励或者您尚未参加帮派会战！");
		return 0;
	end
	if nExp > 0 then
		gf_Modify("Exp", nExp);
		SetTask(TM_TASKID_EXP, 0, TASK_ACCESS_CODE_TONG_MELEE);
	end
	if nLingshi > 0 then
		gf_AddItemEx({2,95,559,1,4},"7级灵石原石");
		gf_SetMyTaskByte(TM_TASKID_LINGSHI, 1, 2, 0, TASK_ACCESS_CODE_TONG_MELEE);
	end
end

function tm_look_for_rank()
	local nTime = GetTime();
	DebugOutput(nTime - g_TimeLimit)
	--5min更新一次
	if nTime - g_TimeLimit < 5*60 then
		tm_look_for_rank_local();
	else
		local s = SDB(TM_RANK_INMATCHREALM, 0, 0, 2);
		s:apply2(tm_look_for_rank_cb);
		g_TimeLimit = nTime;
	end
end

function tm_look_for_rank_local()
	--查询排名
	local nRank = -1;
	local nSorce = 0;
	local RealmTongName = GetRouterGroupName().."*"..GetTongName();
	for _, v in g_tTongRank do
		if v and type(v) == "table" and getn(v) == 3 and tostring(v[1]) == tostring(RealmTongName) then
			nRank = v[3];
			nSorce = v[2];
			break;
		end
	end
	--显示排名
	local msg;
	if nRank <= 0 then
		msg = TM_TONG_AD_NPC.."目前无法获得本季帮派会战的排名数据";
	elseif nRank > TM_TONG_RANK_MAX then
		msg = TM_TONG_AD_NPC..format("本赛季帮会排名：%d", TM_TONG_RANK_MAX);
	else
		msg = TM_TONG_AD_NPC..format("上周帮会获得<color=green>%d<color>积分，排名：<color=green>%d<color>!", nSorce, nRank);
	end	
	local nIndex = 1;
	local tSay = {}
	for i = 1, getn(g_tTongRank) do
		local v = g_tTongRank[i];
		if v and type(v) == "table" and getn(v) == 3 then	
			if v[3] > TM_TONG_RANK_MAX then
				break;
			end	
			tSay[nIndex] = format("排名: %d, 帮会[%s], 累计积分[%d]", v[3], v[1], v[2]);
			nIndex = nIndex + 1;
		end
	end
	local suSay = {};
	suSay.msg = msg;
	suSay.sel = {};
	for i =1, getn(tSay) do
		tinsert(suSay.sel, {tSay[i], "nothing"});
	end
	tinsert(suSay.sel, {"结束对话", "nothing"});
	temp_Talk(suSay);
	return 1;
end

function tm_look_for_rank_cb(nCount, sdb)
	DebugOutput("tm_look_for_rank_cb", nCount, sdb)
	if nCount <= 0 then
		Talk(1,"",TM_TONG_AD_NPC.."错误的帮派会战排名。");
		return 0;
	end
	--计算排名
	local tempData;
	local nLastSocre = -1;
	local nRealRank = 0;
	local nIndex = 1;
	for i = 1, nCount do
		tempData = sdb[i-1];
		if tempData and getn(tempData) == 2 then
			if tempData[2] < nLastSocre or nLastSocre == -1 then
				nRealRank = nRealRank + 1;
			end
			DebugOutput(tostring(tempData[1]), tonumber(tempData[2]), nRealRank);
			g_tTongRank[nIndex] = {tostring(tempData[1]), tonumber(tempData[2]), nRealRank};
			nIndex = nIndex + 1;
			nLastSocre = tempData[2];
		end
	end
	tm_look_for_rank_local()
end

function tm_get_tong_award()
	local nTime = GetTime()
	DebugOutput(nTime - g_TimeLimitOther)
	if nTime - g_TimeLimitOther < 90 then
		Talk(1,"","服务器正忙，请稍后再试！")
		return
	end
	local nDuty = GetTongDuty();
	if nDuty <= 0 or nDuty >= 4 then
		Talk(1,"",TM_TONG_AD_NPC.."只有帮会帮主才能领取帮会奖励！")
		return 0;
	end
	local today = Date();
	local wDay = today:week();
	if wDay == 0 or wDay == 5 or wDay == 6 then
		Talk(1,"",TM_TONG_AD_NPC.."帮会奖励只能在周一至周四领取！")
		return 0;
	end
	local s = SDB(TM_RANK_INSOURCEREALM, 0, 0);
	s:apply2(_tm_get_tong_award)
	g_TimeLimitOther = nTime;
end

function _tm_get_tong_award(nCount, sdb)
	local RealmTongName = GetRouterGroupName().."*"..GetTongName();
	for i = 1, nCount do
		local tData = sdb[i-1];
		DebugOutput("TM_RANK_INSOURCEREALM", tData[1], tData[2], tData[3], tData[4], tData[5]);
		if tData and tostring(RealmTongName) == tostring(tData[1]) and 1 == tonumber(tData[2]) then
			Say(TM_TONG_AD_NPC..format("上周帮派会战，您的%s根据积分获得排名%d，您的帮会奖励由 <color=red>%s<color>领取!", 
				tData[4], tData[3], tData[5]), 0);
			return 0;
		end
	end
	local s = SDB(TM_RANK_INMATCHREALM, 0, 0, 2);
	s:apply2(_tm_get_tong_award_cd)
end

function _tm_get_tong_award_cd(nCount, sdb)
	if nCount <= 0 then
		Talk(1,"",TM_TONG_AD_NPC.."错误的帮派会战排名数据。");
		return 0;
	end
	--计算排名
	local tempData;
	local tTongRank = {}
	local nLastSocre = -1;
	local nRealRank = 0;
	for i = 1, nCount do
		tempData = sdb[i-1];
		if tempData and getn(tempData) == 2 then
			if tempData[2] < nLastSocre or nLastSocre == -1 then
				nRealRank = nRealRank + 1;
			end
			tinsert(tTongRank, {tostring(tempData[1]), tonumber(tempData[2]), nRealRank})
			nLastSocre = tempData[2];
		end
	end
	--查询排名
	local nRank = -1;
	local nSorce = 0;
	local RealmTongName = GetRouterGroupName().."*"..GetTongName();
	for _, v in tTongRank do
		if v and type(v) == "table" and getn(v) == 3 and tostring(v[1]) == tostring(RealmTongName) then
			nRank = v[3];
			nSorce = v[2];
			break;
		end
	end
	if nRank <= 0 then
		Talk(1,"",TM_TONG_AD_NPC.."目前无法获得本赛季帮派会战排名数据。");
		return 0;
	end
	if nRank > TM_TONG_RANK_MAX then
		Talk(1,"",TM_TONG_AD_NPC..format("本赛季帮会排名：%d", TM_TONG_RANK_MAX));
		return 0;
	end
	local msg = format("上周帮会获得<color=green>%d<color>积分，排名：<color=green>%d<color>!", nSorce, nRank);
	Say(TM_TONG_AD_NPC..msg, 2, format("领取奖励/#_tm_get_tong_award_now(%d, %d)", nSorce, nRank), "稍后再来/nothing");
	return 1;
end

function _tm_get_tong_award_now(nSorce, nRank)
	local s = SDB(TM_RANK_INSOURCEREALM, 0, 0);
	s:reflash();
	s:apply2(callout(_tm_get_tong_award_now_cb, nSorce, nRank));
end

function _tm_get_tong_award_now_cb(nSorce, nRank, nCount, sdb)
	DebugOutput("_tm_get_tong_award_now_cb", nSorce, nRank, nCount, sdb)
	local RealmTongName = GetRouterGroupName().."*"..GetTongName();
	local tData = sdb[RealmTongName];
	DebugOutput(RealmTongName, tData, tData[1], tData[2], tData[3], tData[4], tData[5])
	if tData[1] and tData[1] ~= 0 then
		Talk(1,"",TM_TONG_AD_NPC..format("帮会成员%s已经领过奖励了。", tData[4]));
		return 0;
	end
	local s = SDB(TM_RANK_INSOURCEREALM, 0, 0);
	s[RealmTongName] = {"ddds", 1, nRank, nSorce, GetName()};
	--给奖励----------------
	if TM_TONG_AWARD[nRank][2] == 2 then
		gf_AddItemEx2({295,5428,1,4}, "圣战战旗", "帮派会战", "帮会奖励", 0, 1);
		gf_AddItemEx2({2,1,3868,1,4}, "霸气帮会令", "帮派会战", "帮会奖励", 0, 1);
		AddRuntimeStat(12, 3, 0, 1);
	elseif TM_TONG_AWARD[nRank][2] == 1 then
		gf_AddItemEx2({2,95,5427,1,4}, "圣灵战旗", "帮派会战", "帮会奖励", 0, 1);
	end
	return 1;
end