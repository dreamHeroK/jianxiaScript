-- IP Bonus created by TuanNA5

Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua"); -- TaskID

IP_SWITCH = 1
IP_TIME_LIMIT = 7246800--2592000
IP_ONLINE_TIME = 2536
IP_TIME_START = 2537
IP_DAILY_ONLINE_TIME = 1202		-- 每日在线时间统计
IP_DAILY_TIME_LIMIT = 86400
TSK_DAILY_BIT_TIMES = 1512		-- 相关任务标识BIT（20-24：领取每日在线时间奖励标记）

TASK_GET_FUZHU_DATE = 2270
TASK_GET_FUZHU_TYPE = 2271
TASK_GET_DAY_AWARD = 2538
TASK_FULL_8_HOUR = 2540

tBuff = {
		{"内外攻提高4%", 125, {{"state_p_attack_percent_add", 4},{"state_m_attack_percent_add", 4}}},
		{"所有属性增加8", 125, {{"state_add_allability", 8}}},
		{"力量增加8", 125, {{"state_add_strength", 8}}},
		{"内功增加8", 125, {{"state_add_energy", 8}}},
		{"根骨增加8", 125, {{"state_add_vitality", 8}}},
		{"身法增加8", 125, {{"state_add_dexterity", 8}}},
		{"洞察增加8", 125, {{"state_add_observe", 8}}},
		{"闪避值增加50", 125, {{"state_dodge_rate_point_add", 50}}},
}

tOnlineAward = {
	-- 初级
	[1] = 	{
				[0] = {250000,0,0,0,0  ,0},
				[3] = {300000,6,6,0,0  ,4},
				[4] = {390000,6,6,0,66,4},
			},
	
	-- 中级	
	[2] = 	{
				[1] = {0,0,0,0,0,0},
				[2] = {0,0,0,0,0,0},
				[3] = {0,0,0,0,0,0},
			},
			
	-- 高级
	[3] = 	{
			[0] = {790000,0  ,0   ,0  ,0     ,0},
			[3] = {790000,10,10,10,0     ,6},
			[4] = {888000,10,10,10,199 ,6},
		},
}

tDayAward = {
	[1] = {
				[1] = {"符印",{2,1,302,200,1}},
				[2] = {"残剑",{2,1,299,200,1}},
				[3] = {"灵伞",{2,1,185,200,1}},
			},
			
	[2] = {
				[1] = {"军用矿石",{2,0,307,240,1}},
				[2] = {"军用矿石",{2,0,307,240,1}},
				[3] = {"军用矿石",{2,0,307,240,1}},
			},
			
	[3] = {
				[1] = {"藏剑英雄帖",{2,0,31,1,4}},
				[2] = {"藏剑英雄帖",{2,0,31,1,4}},
				[3] = {"藏剑英雄帖",{2,0,31,1,4}},
			},
}
VET_70_GAOJIMIJI_NEW =
{
		[2] =  {"金刚般若真卷", {0, 107, 204, 1}}, 
		[3] =  {"无尘菩提真卷", {0, 107, 206, 1}}, 
		[4] =  {"潜龙寂灭真卷", {0, 107, 205, 1}}, 
		[14] =  {"幻影迷踪真卷", {0, 107, 212, 1}}, 
		[15] =  {"君子截风真卷", {0, 107, 213, 1}}, 
		[8] =  {"如意金顶真卷", {0, 107, 208, 1}}, 
		[9] =  {"碧海绝音真卷", {0, 107, 209, 1}}, 
		[11] =  {"混沌镇岳真卷", {0, 107, 210, 1}}, 
		[12] =  {"揆天游龙真卷", {0, 107, 211, 1}}, 
		[6] =  {"天罗连珠真卷", {0, 107, 207, 1}}, 
		[17] =  {"镇军飞龙枪真卷", {0, 107, 214, 1}}, 
		[18] =  {"穿云落虹真卷", {0, 107, 215, 1}}, 
		[20] = {"幽冥封魔真卷", {0, 107, 216, 1}}, 
		[21] = {"灵蛊幻邪真卷", {0, 107, 217, 1}}, 
		[23] = {"九天风雷真卷", {0, 107, 218, 1}}, 
		[29] = {"红尘醉梦真卷", {0, 107, 222, 1}}, 
		[30] = {"风花千叶真卷", {0, 107, 223, 1}}, 
}

tbTimeAwardList = {
--	[1] = {"在线1个小时换取树种*2    珍品粽子*1", 3600, 20, {nExp = 2000000,item = {{gdp={2,0,398,2,4}, name = "般若树种"},{gdp={1,0,287,1,4}, name = "珍品粽子"},},}},
	[1] = {"在线1个小时换取10万经验", 3600, 20, {nExp = 100000,} },
	[2] = {"在线3个小时换取50万经验", 10800, 21, {nExp = 500000, } },
	[3] = {"在线6个小时换取100万经验", 21600, 22, {nExp = 1000000, item = {{gdp={2,1,270,1,4}, name = "白驹丸"},} } },
--	[4] = {"在线7个小时换取20点活跃度和1000万经验", 25200, 23, {nExp = 10000000, dailytask = {{1401, 20, "活跃度"},} } },
}

function IsIPBonus()
	return IP_SWITCH;
end

function GetOnlineTime()
	if GetTask(IP_ONLINE_TIME) > IP_TIME_LIMIT then
		SetTask(IP_ONLINE_TIME, IP_TIME_LIMIT)		
	end
	return GetTask(IP_ONLINE_TIME);
end

function GetDailyOnlineTime()
	if GetTask(IP_DAILY_ONLINE_TIME) > IP_DAILY_TIME_LIMIT then
		SetTask(IP_DAILY_ONLINE_TIME, IP_DAILY_TIME_LIMIT)		
	end
	return GetTask(IP_DAILY_ONLINE_TIME);
end

function SetOnlineTime(nSec,nType)
	if nType == 1 then
		if GetOnlineTime() + nSec < IP_TIME_LIMIT then
			SetTask(IP_ONLINE_TIME, GetOnlineTime() + nSec)
		else
			SetTask(IP_ONLINE_TIME, IP_TIME_LIMIT)
--			if GetTask(TASK_GET_DAY_AWARD) ~= tonumber(date("%Y%m%d"))	then
--				SetTask(TASK_FULL_8_HOUR,1)
--			end
		end	
	elseif nType == 2 then
		if GetTask(IP_ONLINE_TIME) - nSec >= 0 then
			SetTask(IP_ONLINE_TIME, GetOnlineTime() - nSec)
		end
	end
	return GetTask(IP_ONLINE_TIME);
end

function SetDailyOnlineTime(nSec,nType)
	if nType == 1 then
		if GetDailyOnlineTime() + nSec < IP_DAILY_TIME_LIMIT then
			SetTask(IP_DAILY_ONLINE_TIME, GetDailyOnlineTime() + nSec)
		else
			SetTask(IP_DAILY_ONLINE_TIME, IP_DAILY_TIME_LIMIT)
		end	
	elseif nType == 2 then
		if GetTask(IP_DAILY_ONLINE_TIME) - nSec >= 0 then
			SetTask(IP_DAILY_ONLINE_TIME, GetDailyOnlineTime() - nSec)
		end
	end
	return GetTask(IP_DAILY_ONLINE_TIME);
end

function ShowTime()
	local nTime = GetOnlineTime()
	local nHour = 0
	local nMin = 0
	local nSec = 0
	if nTime > 0 then
		nHour = floor(nTime/3600)
		nMin = floor((nTime - nHour*3600)/60)
		nSec = nTime - nHour*3600 - nMin*60
	end
	return nHour, nMin, nSec
end

function ShowDailyTime()
	local nTime = GetDailyOnlineTime()
	local nHour = 0
	local nMin = 0
	local nSec = 0
	if nTime > 0 then
		nHour = floor(nTime/3600)
		nMin = floor((nTime - nHour*3600)/60)
		nSec = nTime - nHour*3600 - nMin*60
	end
	return nHour, nMin, nSec
end

function IpBonusStart()
	if IsIPBonus() == 1 then
		SetTask(IP_TIME_START, GetTime())
	end
end

function IpBonusClose()
	if IsIPBonus() == 1 then
		if GetTask(IP_TIME_START) > 0 then
			local nCurTime =  GetTime()
			local nOnlineTime = nCurTime - GetTask(IP_TIME_START)
			SetOnlineTime(nOnlineTime,1)
			SetDailyOnlineTime(nOnlineTime,1)
		end
		SetTask(IP_TIME_START, 0)
	end
end

function IpBonusReset()
	if GetTask(TASK_GET_FUZHU_DATE) == tonumber(date("%y%m%d")) then
		if GetTask(TASK_GET_FUZHU_TYPE) ~= 0 then			
			local nRandAttr = GetTask(TASK_GET_FUZHU_TYPE)
			local nAttrId = 2600022;
			local nHour = tonumber(date("%H"));
			local nMin = tonumber(date("%M"));
			local nSec = tonumber(date("%S"));
			local nLeftTime = ((23 - nHour) * 60 * 60 + (59 - nMin) * 60 + (60 - nSec)) * 18;			
			for i = 1, getn(tBuff[nRandAttr][3]) do
				CastState(tBuff[nRandAttr][3][i][1], tBuff[nRandAttr][3][i][2], nLeftTime, 1, nAttrId ,1);
				nAttrId = nAttrId + 1;
			end		
		end
	end
end

function TalkEx(fun,szMsg)
	local num = getn(szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",szMsg[i])..","
	end
	szmsg = szmsg..format("%q",szMsg[num])
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"

	dostring(szmsg)	
end	