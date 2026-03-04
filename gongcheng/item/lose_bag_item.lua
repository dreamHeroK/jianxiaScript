Include("\\script\\lib\\globalfunctions.lua")
tb_exp = {
	[0] = 0,
	[1] = 2500,
	[2] = 25000,
	[3] = 100000,
	[4] = 250000,
	[5] = 500000,
	[6] = 1000000,
	[70] = 1500000,
	[71] = 1750000,
	[72] = 2000000,
	[73] = 2250000,
	[74] = 2500000,
	[75] = 2750000,
	[76] = 3000000,
	[77] = 3250000,
	[78] = 3500000,
	[79] = 3750000,
	[80] = 4000000,
	[81] = 4250000,
	[82] = 4500000,
	[83] = 4750000,
	[84] = 5000000,
	[85] = 5250000,
	[86] = 5500000,
	[87] = 5750000,
	[88] = 6000000,
	[89] = 6250000,
	[90] = 6500000,
	[91] = 6750000,
	[92] = 7000000,
	[93] = 7250000,
	[94] = 7500000,
	[95] = 7750000,
	[96] = 8000000,
	[97] = 8250000,
	[98] = 8500000,
	[99] = 8750000,
};
function OnUse(nItemIdx)
	local nWeek = GetWeekSequence(1,0);
	if GetTask(1043) < nWeek then
		SetTask(1043,nWeek);
		SetTask(1044,0);
	end
	if GetTask(1043) >= nWeek and GetTask(1044) >= 2 then
		Talk(1,"","每人每周只能用两次攻城战酬谢（负）,这周你用了两次.");
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetTask(1044,GetTask(1044)+1);	
		local nLevel = GetLevel();
--		if nLevel < 70 then
--			nLevel = floor(nLevel / 10);
--		end
		if nLevel ~= 0 then
			local nExp = 10000000
			ModifyExp(nExp);
			Msg2Player("你得到 "..nExp.." 经验值");
			gf_AddItemEx({2,96,176,1,4},"师门真卷残页");
			gf_AddItemEx({2,97,236,15,4},"天骄令");
			gf_AddItemEx({2,97,213,1,4},"五行天仪匣");
			Talk(1,"","这周大侠这是第"..GetTask(1044).." 使用(攻城战酬谢（负）), 每人每周只能用两次.");
		end
	end;
end;

function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--计算周的序数
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--处理时差
	nCurTime = nCurTime - 4*24*3600;	--对齐到1970年1月1日（星期四）后的第一个周一凌晨。
	local nWeekSecond = 7*24*3600;	--一周多少秒
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--计算偏移时间
	local nTotalTime = nCurTime - nOffset;	--计算后的总时间
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--计算周的序数
	return nWeekSeq;
end;