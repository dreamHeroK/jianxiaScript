
tPvpAllTime = {
	{
		{1100,1115},{1700,1715},{2100,2115},
	},
	{
		{1700,1730},{2100,2130},
	},
	{
		{1400,1430},{2000,2030},
	},
	{
		{2115,2140},
	},
	{
		{1600,1630},{2200,2230},
	},
	{
		{1130,1150},{1730,1750},
	},
	{
		{0000,2359},
	},
}

function gf_UnPack(tbTable,nStartIdx,nEndIdx)
	local nSize = getn(tbTable);
	nStartIdx = nStartIdx or 1;
	nEndIdx = nEndIdx or nSize;
	if tbTable[nStartIdx] and nStartIdx <= nEndIdx then
		return tbTable[nStartIdx],gf_UnPack(tbTable,nStartIdx+1,nEndIdx);
	end;
end;

function OnGetPVPTime()
	local strRet = "";
	local strStart,strEnd = "","";
	local strOne,strTwo = "","";
	local nIDX = 0;
	local nRunTime = 0; --正在活动时间内
	local tCb = {};
	for j = 1,getn(tPvpAllTime) do
		local tTemp = tPvpAllTime[j];
		if tTemp then
			local nNowTime = tonumber(date("%H%M"));
			nIDX = 0;
			for i = 1,getn(tTemp) do
				if nNowTime < tTemp[1][1] then
					nIDX = 1;
					nRunTime = 0;
					break;
				elseif nNowTime >= tTemp[i][1] and nNowTime <= tTemp[i][2] then
					nIDX = i;
					nRunTime = 1;
					break;
				elseif i ~= getn(tTemp) and nNowTime < tTemp[i+1][1] then
					nIDX = i+1;
					nRunTime = 0;
					break;
				elseif i == getn(tTemp) then
					nIDX = 1;
					nRunTime = 0;
					break;
				end	
			end
			if nIDX ~= 0 then
				strStart = format("%02d:%02d",floor(tTemp[nIDX][1]/100),mod(tTemp[nIDX][1],100));
				strEnd = format("%02d:%02d",floor(tTemp[nIDX][2]/100),mod(tTemp[nIDX][2],100));
				strRet = format("%s-%s",strStart,strEnd);
--				if nRunTime == 1 then
--					strRet = "<color=yellow>"..strRet
--				end
				tinsert(tCb,strRet);
			end
		end
	end
	return gf_UnPack(tCb);	
end

--print(OnGetPVPTime())
