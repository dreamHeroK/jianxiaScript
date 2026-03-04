--天阴精力箱
--消耗20点精力打开，打开后不消失，每人每关可以开启一次
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")

function main()
	Say("是否要消耗20点精力来开启天阴精力宝箱？", 2, "确认开启/ensure_openBox", "暂时不开启/do_nothing");
end

tJingLiAward = {
	{1, 600, "天命石", {2, 1, 30410, 1, 4}, 0},
	--{1, 200, "天门碎片", {2, 1, 30410, 2, 4}, 0},
	--{1, 100, "天门碎片", {2, 1, 30410, 4, 4}, 0},
	{31, 1000, "rand_start_equip()", 1},
	{1, 600, "星辉石二级", {2, 1, 30534, 1, 4}, 0},
	{1, 200, "星辉石三级", {2, 1, 30535, 1, 4}, 0},
	{1, 100, "无极宝典", {2, 1, 30538, 1, 4}, 0},
	{1, 100, "无极秘籍", {2, 1, 30539, 1, 4}, 0},
	{1, 500, "星魄结晶", {2, 1, 30554, 1, 4}, 0},
	{1, 250, "天命晶石", {2, 2, 7, 1, 4}, 0},
	{1, 525, "天晶石", {2, 2, 8, 1, 4}, 0},
	{1, 25, "天晶星魄", {2, 1, 1009, 1, 4}, 0, 0, 0, 1},
	{1, 300, "灵晶元气石四级", {2, 1, 30416, 1, 4}, 0},
	{1, 200, "灵晶元气石五级", {2, 1, 30417, 1, 4}, 0},
	{1, 100, "灵晶元气石六级", {2, 1, 30418, 1, 4}, 0, 0, 0, 1},
	{31, 800, "api_daily_limit_award_yinquan(10,0)", 1},
	{31, 200, "api_daily_limit_award_yinquan(20,0)", 1},
	{31, 100, "api_daily_limit_award_yinquan(100,0)", 1},
	{1, 500, "玄玉精华二级", {2, 1, 30522, 1, 4}, 0},
	{1, 500, "龙血精华二级", {2, 1, 30528, 1, 4}, 0},
	{1, 100, "玄玉精华三级", {2, 1, 30523, 1, 4}, 0, 0, 0, 1},
	{1, 100, "龙血精华三级", {2, 1, 30529, 1, 4}, 0, 0, 0, 1},
	{1, 200, "五华天元气丹(生命)", {1, 0, 261, 1, 1}, 0},
	{1, 200, "五华天元气丹(内功)", {1, 0, 262, 1, 1}, 0},
	{1, 200, "五华天元气丹(攻击)", {1, 0, 263, 1, 1}, 0},
	{1, 200, "五华天元气丹(防御)", {1, 0, 264, 1, 1}, 0},
	{1, 200, "五华天元气丹(敏捷)", {1, 0, 265, 1, 1}, 0},
	{1, 600, "混元炼体丹", {1, 0, 6, 1, 4}, 0},
	{1, 600, "生生回气丹", {1, 0, 16, 1, 4}, 0},
	{1, 600, "忘忧回元丸", {1, 0, 11, 1, 4}, 0},
	{1, 400, "九转混元丹", {1, 0, 32, 1, 4}, 0},
}
function ensure_openBox()
	local nTeamIndex = MV_IS_OPENED_BOX_BEGIN + getIndexAtTeam();
	if GetMissionV(nTeamIndex) ~= 0 then
		Say("你已经开启过天阴精力宝箱了，不能重复开启", 0);
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","背包空间不足");
		return 0
	end
	local nRet1, nRet2 = ModifyEnergy(-20, 1);
	if -1 ~= nRet1 then
		local nRandIndex = gf_EventGiveRandAward(tJingLiAward, gf_SumRandBase(tJingLiAward), 1, "地玄宫", "开启地玄宫天阴精力宝箱");
		SetMissionV(nTeamIndex, 1);
		--精力宝箱开启次数统计
		AddRuntimeStat(1,10,0,1);
		--统计道具
		if tJingLiAward[nRandIndex] then
			if tJingLiAward[nRandIndex][3] == "龙血精华三级" then
				AddRuntimeStat(1,16,0,tJingLiAward[nRandIndex][4][4]);
			elseif tJingLiAward[nRandIndex][3] == "玄玉精华三级" then
				AddRuntimeStat(1,17,0,tJingLiAward[nRandIndex][4][4]);
			elseif tJingLiAward[nRandIndex][3] == "无极宝典" then
				AddRuntimeStat(1,18,0,tJingLiAward[nRandIndex][4][4]);
			elseif tJingLiAward[nRandIndex][3] == "无极秘籍" then
				AddRuntimeStat(1,19,0,tJingLiAward[nRandIndex][4][4]);
			end
		end
	else
		Say("精力不足，无法开启天阴精力宝箱.",0);	
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
		{1, 7000, "战神披风", {0, 152, 1, 1, 4}, 0},
		{1, 2500, "玄天战袍", {0, 152, 2, 1, 4}, 0},
		{1, 380, "幻影战衣", {0, 152, 3, 1, 4}, 0},
		{1, 20, "金罡五行铠甲", {0, 152, 4, 1, 4}, 0, 0, 0, 1},
		{1, 20, "木罡五行铠甲", {0, 152, 5, 1, 4}, 0, 0, 0, 1},
		{1, 20, "水罡五行铠甲", {0, 152, 6, 1, 4}, 0, 0, 0, 1},
		{1, 20, "火罡五行铠甲", {0, 152, 7, 1, 4}, 0, 0, 0, 1},
		{1, 20, "土罡五行铠甲", {0, 152, 8, 1, 4}, 0, 0, 0, 1},
		{1, 20, "阴罡五行铠甲", {0, 152, 9, 1, 4}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "地玄宫", "开启地玄宫天阴精力宝箱");
end