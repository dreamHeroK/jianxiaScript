Include("\\script\\lib\\globalfunctions.lua")
tb_exp = {
	[0] = 0,
	[1] = 5000,
	[2] = 50000,
	[3] = 200000,
	[4] = 500000,
	[5] = 1000000,
	[6] = 2000000,
	[70] = 3000000,
	[71] = 3500000,
	[72] = 4000000,
	[73] = 4500000,
	[74] = 5000000,
	[75] = 5500000,
	[76] = 6000000,
	[77] = 6500000,
	[78] = 7000000,
	[79] = 7500000,
	[80] = 8000000,
	[81] = 8500000,
	[82] = 9000000,
	[83] = 9500000,
	[84] = 10000000,
	[85] = 10500000,
	[86] = 11000000,
	[87] = 11500000,
	[88] = 12000000,
	[89] = 12500000,
	[90] = 13000000,
	[91] = 13500000,
	[92] = 14000000,
	[93] = 14500000,
	[94] = 15000000,
	[95] = 15500000,
	[96] = 16000000,
	[97] = 16500000,
	[98] = 17000000,
	[99] = 17500000,
};

function OnUse(nItemIdx)
	local nWeek = GetWeekSequence(1,0);
	if GetTask(1043) < nWeek then
		SetTask(1043,nWeek);
		SetTask(1044,0);
	end
	if GetTask(1043) >= nWeek and GetTask(1044) >= 2 then
		Talk(1,"","每人每周只能用两次攻城礼包,这周你用了两次。");
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetTask(1044,GetTask(1044)+1);
		local nLevel = GetLevel();
--		if nLevel < 70 then
--			nLevel = floor(nLevel / 10);
--		end
		if nLevel ~= 0 then
			local nExp = 20000000
			ModifyExp(nExp);
			Msg2Player("你得到 "..nExp.." 经验值");
			gf_AddItemEx({2,96,176,2,4},"师门真卷残页");
			gf_AddItemEx({2,97,236,30,4},"天骄令");
			gf_AddItemEx({2,97,213,2,4},"五行天仪匣");
			Talk(1,"","这周大侠这是第"..GetTask(1044).." 使用攻城礼包, 每人每周只能用两次.");
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