--梁山精力箱
--消耗20点精力打开，打开后不消失，每人每关可以开启一次
--Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")
Include("\\script\\missions\\liangshan\\head.lua");

JINGLI_BOX_INDEX=0
function main()
	--SendScript2VM("\\script\\missions\\liangshan\\mission\\mission.lua", format("jingli_box_main()"))
	Say("你确定消耗20点精力开启精力宝箱吗？", 2, "确定开启/ensure_openBox", "我只是看看而已/do_nothing");
end

--function jingli_box_main()	
--	Say("你确定消耗20点精力开启精力宝箱吗？", 2, "确定开启/ensure_openBox", "我只是看看而已/do_nothing");
--end

--掉落梁山精力箱
function drop_jingli_box(nBossNpcIdx)
--	do return end
	if JINGLI_BOX_INDEX ~= 0 then--一次掉一个箱子
		return
	end
	set_jingli_box_open_flag(0)--先清除标志位
	local nLifeTime = nil
	local m, x, y = GetNpcWorldPos(nBossNpcIdx);
	if m and x and y then
		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
   		local npc = CreateNpc("箱子钱", "精力宝箱", m, x2, y2);
    		if npc and npc > 0 then
    			JINGLI_BOX_INDEX=npc
    			if nLifeTime then
        			SetNpcLifeTime(npc, nLifeTime);
        		end
        		SetNpcScript(npc, "\\script\\missions\\liangshan\\npc\\box_jingli.lua");
    		else
    			print(format("create npc jinglibox fail"))
    		end
	end
end

function remove_jingli_box()
	if JINGLI_BOX_INDEX ~= 0 then--一次掉一个箱子
		SetNpcLifeTime(JINGLI_BOX_INDEX, 0);
	end
	JINGLI_BOX_INDEX=0
end

function set_jingli_box_open_flag(nVal)
	if 0 == nVal then
		JINGLI_BOX_INDEX=0
	end
	SetMissionV(MV_LS_OPEN_JINGLI_BOX_FLAG, nVal);
end

tJingLiAward = {
	{31, 500, "rand_start_equip()", 1},
	{1, 250, "陨铁精石", {2, 1, 1009, 1, 4}, 0, 0, 0, 1},
	{31, 800, "api_daily_limit_award_yinquan(10,0)", 1},
	{31, 200, "api_daily_limit_award_yinquan(20,0)", 1},
	{31, 100, "api_daily_limit_award_yinquan(100,0)", 1},
	{1, 200, "五华聚元散（力量）", {1, 0, 261, 1}, 0},
	{1, 200, "五华聚元散（内功）", {1, 0, 262, 1}, 0},
	{1, 200, "五华聚元散（根骨）", {1, 0, 263, 1}, 0},
	{1, 200, "五华聚元散（身法）", {1, 0, 264, 1}, 0},
	{1, 200, "五华聚元散（洞察）", {1, 0, 265, 1}, 0},
	{1, 600, "黑玉断续膏", {1, 0, 6, 1, 1}, 0},
	{1, 600, "生生造化散", {1, 0, 16, 1, 1}, 0},
	{1, 600, "万物归元丹", {1, 0, 11, 1, 1}, 0},
	{1, 400, "九转回魂丹", {1, 0, 32, 1, 1}, 0},
	{1, 200, "盛世铜宝箱", {2,94,10,1, 1}, 0},
	{1, 50, "盛世银宝箱", {2,94,11,1, 1}, 0},
}

function ensure_openBox()
	local nOpenFlag = GetMissionV(MV_LS_OPEN_JINGLI_BOX_FLAG)
	local nTeamMemberBitIdx = getIndexAtTeam() + 1
	local bOpened = SafeGetBit(nOpenFlag, nTeamMemberBitIdx)
	if bOpened ~= 0 then
		Say("你已经打开了一个精力宝箱。", 0);
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","您的背包空间不足1个。");
		return 0
	end
	local nRet1, nRet2 = ModifyEnergy(-20, 1);
	if -1 ~= nRet1 then
		set_jingli_box_open_flag(SafeSetBit(nOpenFlag, nTeamMemberBitIdx, 1))
		local nRandIndex = gf_EventGiveRandAward(tJingLiAward, gf_SumRandBase(tJingLiAward), 1, "梁山群雄会", "打开梁山群雄会精力宝箱");
		--精力宝箱开启次数统计
		AddRuntimeStat(1,10,0,1);
	else
		Say("您的精力不足，不能打开精力宝箱。",0);	
	end
end

function do_nothing()
--do nothing
end

function getIndexAtTeam()
	for i = 1, GetTeamSize() do
		if PlayerIndex == GetTeamMember(i) then
			return i - 1;
		end
	end	
end

function rand_start_equip()
	local tAward = {
		{1, 5000, "耀阳之火云披风", {0, 152, 3, 1, 1,-1,-1,-1,-1,-1,-1,-1}, 0},
		{1, 5000, "耀阳之统御令", {0, 153, 3, 1, 1,-1,-1,-1,-1,-1,-1,-1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "梁山群雄会", "打开梁山群雄会精力宝箱");
end