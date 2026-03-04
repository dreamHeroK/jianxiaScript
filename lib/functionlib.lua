Include("\\script\\lib\\string.lua")

lib = {}

function lib:Split(str,splitor)
	if(splitor==nil) then
		splitor=","
	end
	local strArray={}
	local strStart=1
	local splitorLen = strlen(splitor)
	local index=strfind(str,splitor,strStart)
	if(index==nil) then
		strArray[1]=str
		return strArray
	end
	local i=1
	while index do
		strArray[i]=strsub(str,strStart,index-1)
		i=i+1
		strStart=index+splitorLen
		index = strfind(str,splitor,strStart)
	end
	strArray[i]=strsub(str,strStart,strlen(str))
	return strArray
end

function lib:OptionFunction(nValue1, nValue2, szOption)
	return dostring("return "..nValue1..szOption..nValue2)
end

function lib:ParseAward(szAwardMsg)
	
	if type(szAwardMsg) == "table" then
		return szAwardMsg
	end
	szAwardMsg = gsub(szAwardMsg, "<enter>", "\n")
	szAwardMsg = gsub(szAwardMsg, "<tab>", "\t")
	
	return dostring(szAwardMsg)
end

function lib:CheckInList(szList, Target)
	local tbList = split(szList, ",")
	
	for i=1, getn(tbList) do
		if strfind(tbList[i], "-") then
			local tbSubList = split(tbList[i], "-")
			tbSubList[1] = tonumber(tbSubList[1])
			tbSubList[2] = tonumber(tbSubList[2])
			if tbSubList[1] <= Target and Target <= tbSubList[2] then
				return 1
			end
			
		else
			if type(Target) == "number" then
				tbList[i] = tonumber(tbList[i])
			end
			if tbList[i] == Target then
				return 1
			end	
		end
	end
	
	return nil
end

function lib:GetListTable(szList)
	local tbList = split(szList, ",")
	local tbResult = {}
	for i=1, getn(tbList) do
		if strfind(tbList[i], "-") then
			local tbSubList = split(tbList[i], "-")
			tbSubList[1] = tonumber(tbSubList[1])
			tbSubList[2] = tonumber(tbSubList[2])
			for j=tbSubList[1], tbSubList[2] do
				tinsert(tbResult, j)
			end
		else
			
			tbList[i] = tonumber(tbList[i]) or tbList[i]
			tinsert(tbResult, tbList[i])
		end
	end
	
	return tbResult
end

function lib:NumberParamTrans(pParam)
	
	if type(pParam) == "number" then
		return pParam
	elseif type(pParam) == "string" then
		return dostring("return "..pParam)
	end
end

function lib:StringParamTrans(pParam)
	local si,sn = 1,1
	local szParam = nil
	si, sn, szParam = strfind(pParam, "<lua (.-)/>")
	while( szParam ) do
		szValue = dostring("return ".. szParam)
		pParam = format("%s%s%s",strsub(pParam, 1, si-1),tostring(szValue),strsub(pParam, sn+1))
		si, sn, szParam = strfind(pParam, "<lua (.-)/>", si)
	end
	return pParam
	
end

function lib:ShowMessage(szMsg)
	if szMsg == nil or szMsg == "nomsg" or szMsg == ""then
		return
	end
	szMsg = self:StringParamTrans(szMsg)
	if strfind(szMsg, "<msg>") then
		local szFailMsg = gsub(szMsg, "<msg>", "")
		Msg2Player(szFailMsg)
	else
		Talk(1, "", szMsg)
	end
end


function lib:ShuffleTable(tb, nStart, nEnd)
	
	for i=nStart, nEnd - nStart do
		
		local j = random(i, nEnd)
		
		tb[i], tb[j] = tb[j], tb[i]
		
	end
	return tb
end

function lib:CheckDay(nStartDate, nEndDate, szMessage)
	
	local nCruDate = tonumber(date("%Y%m%d"));
	if (nStartDate <= nCruDate and nCruDate < nEndDate) then
		return 1;
	end
	
	lib:ShowMessage(szMessage);
end

function lib:CheckTime(tbAllowTime, szMessage)
	
	local nCruTime = tonumber(date("%H%M%S"));
	
	for i = 1,getn(tbAllowTime) do 
		if (tbAllowTime[i][1] <= nCruTime and nCruTime < tbAllowTime[i][2]) then
			return 1;
		end
	end

	lib:ShowMessage(szMessage);
end


function lib:CheckTimeAndWeekDay(nStartTime, nEndTime, szWeekDayList, szMessage)
	local nCurTime = tonumber(date("%H%M"));
	local nCurWeekDay = tonumber(date("%w"));
	
	if (nStartTime <= nCurTime and nCurTime <= nEndTime and self:CheckInList(szWeekDayList, nCurWeekDay)) then
		return 1
	end
	
	if (szMessage ~= nil and szMessage ~= "") then
		lib:ShowMessage(szMessage);
	end
end

function lib:Pack(...)
	return arg
end

function lib:DoFunByPlayer(nPlayerIndex, fun, ...)	
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex
	local re = self:Pack(call(fun, arg));
	PlayerIndex = nOldPlayer;
	return unpack(re)
end

function lib:DoFunInWorld(nSubWorld, fun, ...)
	local nOldSubWorld = SubWorld;
	SubWorld = nSubWorld
	local re = self:Pack(call(fun, arg));
	SubWorld = nOldSubWorld;
	return unpack(re)
end

function lib:Include(szFile)
	Include(szFile)
	return 1
end
