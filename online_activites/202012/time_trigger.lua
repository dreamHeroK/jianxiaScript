--称号：共聚江湖
--by 
--2020/09/29

Include("\\script\\lib\\time.lua");


TSK_YEARS_BEGIN_DATE = 2391;      --共聚江湖称号领取开始时间 
TSK_YEARS_END_DATE = 2394;        --共聚江湖称号领取结束时间
TSK_YEARS_EXP_DATE = 1359;        --当天是否领满了经验
TSK_YEARS_EXP_NUM = 1360;         --当天给了多少次经验

g_nYearsDays = 7;              --经验持续时间：天
g_nYearsExpNums = 120;          --每天起效经验次数：次

function OnTimer()
	local nDate = tonumber(date("%Y%m%d"));
	local nBeginDate = GetTask(TSK_YEARS_BEGIN_DATE);
	local nEndDate = GetTask(TSK_YEARS_END_DATE);
	local nExpDate = GetTask(TSK_YEARS_EXP_DATE);
	local nExpNum = GetTask(TSK_YEARS_EXP_NUM);
	if nDate < nBeginDate then 
		return 0;
	end
	if nDate > nEndDate then   --结束了
		RemoveTrigger(GetTrigger(2023));
		return 0;	
	else
		if nExpDate < nDate then   --清0处理
			SetTask(TSK_YEARS_EXP_DATE,nDate);
			SetTask(TSK_YEARS_EXP_NUM,0);
		end
		if GetTask(TSK_YEARS_EXP_NUM) >= g_nYearsExpNums then  --当天起效60次了
			return 0;
		end		
		give_title_exp();
	end
end

function give_title_exp()
	local nDate = tonumber(date("%Y%m%d"));
	local nExpDate = GetTask(TSK_YEARS_EXP_DATE);
	local nExpNum = GetTask(TSK_YEARS_EXP_NUM);	
	local nLv = GetLevel();
	local nGeren, nDetail = GetCurTitle();
	if nExpNum >= g_nYearsExpNums then   --当天起效120次了
		return 0;
	end	
	if nGeren == 3 and nDetail == 8 then
		local	nExp = floor(nLv*nLv*15)
		SetTask(TSK_YEARS_EXP_NUM,GetTask(TSK_YEARS_EXP_NUM)+1);
		ModifyExp(nExp);	
		Msg2Player("您亮出[共聚江湖]获得"..nExp.."经验");
	end
end
