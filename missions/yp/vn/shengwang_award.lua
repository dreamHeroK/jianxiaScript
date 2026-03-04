Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\missions\\yp\\yp_head.lua")
tAward = {
	--声望 奖励字符串
	{"初出茅庐", 2000, "Faction_Reputation_2000"},
	{"崭露头角", 8000, "Faction_Reputation_6000"},
	{"声名鹊起", 20000, "Faction_Reputation_12000"},
	{"勋绩卓著", 40000, "Faction_Reputation_20000"},
	{"万人敬仰", 80000, "Faction_Reputation_40000"},
}

function shengwang_award_main()
	if yp_get_camp()<=0 then
		Talk(1,"","没有加入任何势力。")
		return
	end
	local tSay = {}
	local szTitle = format("每个名望奖励的阶段只能领取一次，切换势力后也无法再次领取。")
	for i, tt in tAward do
		if _check_can_award(i)==1 then
			tinsert(tSay, format("%s/#_do_award(%d)", format("领取 %s", tt[1]), i))
		end
	end
	tinsert(tSay, format("%s/nothing", "结束"))
	Say(szTitle, getn(tSay), tSay)
end

function _check_can_award(nIndex)
	local nTaskVal = GetTask(TASK_FIELD_SHENGWANG_AWARD)
	if SafeGetBit(nTaskVal, nIndex) == 1 then--已领取
		return 0
	end
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0
	end
	local t = tAward[nIndex]
	local nPop = yp_get_camp_pop()
	if nPop < t[2] then
		return 0
	end
	return 1
end

function _do_award(nIndex)
	if _check_can_award(nIndex)~=1 then
		return
	end
	local t = tAward[nIndex]
	local nTaskVal = GetTask(TASK_FIELD_SHENGWANG_AWARD)
	local nTaskValNew = SafeSetBit(nTaskVal, nIndex, 1)
	SetTask(TASK_FIELD_SHENGWANG_AWARD, nTaskValNew)
	CustomAwardGiveGroup(t[3], 1)
end