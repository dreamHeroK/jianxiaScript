-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 - 系统相关函数类
-- 文件名　　：playerfunlib.lua
-- 翻译修改　： 
-- 联系方式　：QQ: 葫芦娃救爷爷
-- 编译时间：2020-01-24 22:48
-- ==================================================
Include("\\script\\lib\\functionlib.lua");
Include("\\script\\lib\\globalfunctions.lua");
PlayerFunLib = {}

function PlayerFunLib:GetActivityTask(nTaskId)
	return GetTask(nTaskId)
end

function PlayerFunLib:GetActivityTaskBit(nTaskId, nBit)
	return GetBit(self:GetActivityTask(nTaskId), nBit)
end

function PlayerFunLib:SetActivityTask(nTaskId, nValue)
	return SetTask(nTaskId, nValue)
end

function PlayerFunLib:GetTaskDailyCount(nTaskId)
	local nTaskValue =  self:GetActivityTask(nTaskId)
	local nCurDate = tonumber(date("%y%m%d"))
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		self:SetActivityTask(nTaskId, nTaskValue)
	end
	return mod(nTaskValue, 256)
end

function PlayerFunLib:GetTaskWeeklyCount(nTaskId)
	local nTaskValue =  self:GetActivityTask(nTaskId)
	local nCurWeeDate = tonumber(date("%Y%W"))
	if floor(nTaskValue/256) ~= nCurWeeDate then
		nTaskValue = nCurWeeDate * 256
		self:SetActivityTask(nTaskId, nTaskValue)
	end
	return mod(nTaskValue, 256)
end

function PlayerFunLib:CheckTaskBit(nTaskId, nBit, nValue, szFailMsg)
	szFailMsg = szFailMsg or ""
	if GetBit(self:GetActivityTask(nTaskId), nBit) == nValue then
		return 1
	else
		lib:ShowMessage(szFailMsg)
		return
	end
	
end

function PlayerFunLib:CheckTask(nTaskId, nValue, szFailMsg, szOption)
	nValue = lib:NumberParamTrans(nValue)
	if lib:OptionFunction(self:GetActivityTask(nTaskId), nValue, szOption) then
		return 1
	else
		szFailMsg = format(szFailMsg, nValue)
		lib:ShowMessage(szFailMsg)
	end
end

function PlayerFunLib:CheckTaskDaily(nTaskId, nValue, szFailMsg, szOption)
	nValue = lib:NumberParamTrans(nValue)
	local nTaskValue =  self:GetActivityTask(nTaskId)
	local nCurDate = tonumber(date("%y%m%d"))
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		self:SetActivityTask(nTaskId, nTaskValue)
	end
	if lib:OptionFunction(mod(nTaskValue, 256), nValue, szOption) then
		return 1
	else
		lib:ShowMessage(szFailMsg)
	end
end

function PlayerFunLib:CheckTaskWeekly(nTaskId, nValue, szFailMsg, szOption)
	nValue = lib:NumberParamTrans(nValue)
	local nTaskValue =  self:GetActivityTask(nTaskId)
	local nCurWeeDate = tonumber(date("%Y%W"))
	if floor(nTaskValue/256) ~= nCurWeeDate then
		nTaskValue = nCurWeeDate * 256
		self:SetActivityTask(nTaskId, nTaskValue)
	end
	if lib:OptionFunction(mod(nTaskValue, 256), nValue, szOption) then
		return 1
	else
		lib:ShowMessage(szFailMsg)
	end
end

function PlayerFunLib:CheckTaskMonth(nTaskId, nValue, szFailMsg, szOption)
	nValue = lib:NumberParamTrans(nValue)
	local nTaskValue =  self:GetActivityTask(nTaskId)
	local nCurMonDate = tonumber(date("%y%m"))
	if floor(nTaskValue/256) ~= nCurMonDate then
		nTaskValue = nCurMonDate * 256
		self:SetActivityTask(nTaskId, nTaskValue)
	end
	if lib:OptionFunction(mod(nTaskValue, 256), nValue, szOption) then
		return 1
	else
		lib:ShowMessage(szFailMsg)
	end
end

function PlayerFunLib:GetTaskDaily(nTaskId)
	local nTaskValue =  self:GetActivityTask(nTaskId)
	local nCurDate = tonumber(date("%y%m%d"))
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		self:SetActivityTask(nTaskId, nTaskValue)
	end
	return mod(nTaskValue, 256)
end

function PlayerFunLib:GetTaskWeekly(nTaskId)
	local nTaskValue =  self:GetActivityTask(nTaskId)
	local nCurWeeDate = tonumber(date("%Y%W"))
	if floor(nTaskValue/256) ~= nCurWeeDate then
		nTaskValue = nCurWeeDate * 256
		self:SetActivityTask(nTaskId, nTaskValue)
	end
	return mod(nTaskValue, 256)
end

function PlayerFunLib:GetTaskMonth(nTaskId)
	local nTaskValue =  self:GetActivityTask(nTaskId)
	local nCurMonDate = tonumber(date("%y%m"))
	if floor(nTaskValue/256) ~= nCurMonDate then
		nTaskValue = nCurMonDate * 256
		self:SetActivityTask(nTaskId, nTaskValue)
	end
	return mod(nTaskValue, 256)
end

function PlayerFunLib:AddTask(nTaskId, nValue)
	nValue = lib:NumberParamTrans(nValue)
	self:SetActivityTask(nTaskId, self:GetActivityTask(nTaskId) + nValue)
end

function PlayerFunLib:AddTaskDaily(nTaskId, nValue)
	nValue = lib:NumberParamTrans(nValue)
	local nTaskValue =  self:GetActivityTask(nTaskId)
	local nCurDate = tonumber(date("%y%m%d"))
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		self:SetActivityTask(nTaskId, nTaskValue)
	end
	self:SetActivityTask(nTaskId, nTaskValue + nValue)	
end

function PlayerFunLib:AddTaskWeekly(nTaskId, nValue)
	nValue = lib:NumberParamTrans(nValue)
	local nTaskValue =  self:GetActivityTask(nTaskId)
	local nCurWeeDate = tonumber(date("%Y%W"))
	if floor(nTaskValue/256) ~= nCurWeeDate then
		nTaskValue = nCurWeeDate * 256
		self:SetActivityTask(nTaskId, nTaskValue)
	end
	self:SetActivityTask(nTaskId, nTaskValue + nValue)	
end

function PlayerFunLib:AddTaskMonth(nTaskId, nValue)
	nValue = lib:NumberParamTrans(nValue)
	local nTaskValue =  self:GetActivityTask(nTaskId)
	local nCurMonDate = tonumber(date("%y%m"))
	if floor(nTaskValue/256) ~= nCurMonDate then
		nTaskValue = nCurMonDate * 256
		self:SetActivityTask(nTaskId, nTaskValue)
	end
	self:SetActivityTask(nTaskId, nTaskValue + nValue)	
end

function PlayerFunLib:SetTaskDaily(nTaskId, nValue)
	nValue = lib:NumberParamTrans(nValue)
	local nCurDate = tonumber(date("%y%m%d"))
	local nTaskValue =  nCurDate * 256
	self:SetActivityTask(nTaskId, nTaskValue + nValue)	
end

function PlayerFunLib:SetTaskWeekly(nTaskId, nValue)
	nValue = lib:NumberParamTrans(nValue)
	local nCurWeeDate = tonumber(date("%Y%W"))
	local nTaskValue =  nCurWeeDate * 256
	self:SetActivityTask(nTaskId, nTaskValue + nValue)	
end

function PlayerFunLib:SetTaskMonth(nTaskId, nValue)
	nValue = lib:NumberParamTrans(nValue)
	local nCurMonDate = tonumber(date("%y%m"))
	local nTaskValue =  nCurMonDate * 256
	self:SetActivityTask(nTaskId, nTaskValue + nValue)	
end

--主角有关的 判断
function PlayerFunLib:CheckInMap(szMapList, szFailMsg)
	local nMapId = GetWorldPos();
	if type(szMapList) == "number" and szMapList == nMapId then
		return 1
	end
	if lib:CheckInList(szMapList, nMapId) then
		return 1
	end
	lib:ShowMessage(szFailMsg)
	return nil;

end

function PlayerFunLib:CheckLevel(nLevel, szFailMsg, szOption)
	
	nLevel = lib:NumberParamTrans(nLevel)
	if lib:OptionFunction(GetLevel(), nLevel,szOption) then
		return 1
	else
		if szFailMsg == "default" then
			szFailMsg = format("角色等级需要达到<color=yellow>%d<color>级", nLevel)
		end
		lib:ShowMessage(szFailMsg)
	end
end

function PlayerFunLib:CheckTotalLevel(nLevel, szFailMsg, szOption)
	nLevel = lib:NumberParamTrans(nLevel)
	if gf_GetPlayerRebornCount() >= 1 or lib:OptionFunction(GetLevel(), nLevel,szOption) then
		return 1
	else
		if szFailMsg == "default" then
			szFailMsg = format("角色等级需要达到<color=yellow>%d<color>级或者已经转生", nLevel)
		end
		lib:ShowMessage(szFailMsg)
	end
end

function PlayerFunLib:CheckIsTransLife(szFailMsg)
	if gf_GetPlayerRebornCount() >= 1 then
		return 1
	else
		lib:ShowMessage(szFailMsg)
	end
end

function PlayerFunLib:CheckTransLifeCount(nCount, szFailMsg, szOption)
	nCount = lib:NumberParamTrans(nCount)
	if lib:OptionFunction(gf_GetPlayerRebornCount(), nCount,szOption) then
		return 1
	else
		szFailMsg = format(szFailMsg, nCount)
		lib:ShowMessage(szFailMsg)
	end
end

function PlayerFunLib:SetExtBit(nExtPoint, nBit, nBitValue)
	if nBit < 1 or nBit > 15 then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "Out of range")
		return 0
	end
	local nValue = GetExtPoint(nExtPoint)
	local nNewValue = SetBit(nValue, nBit, nBitValue)
	PayExtPoint(nExtPoint, GetExtPoint(nExtPoint))
	AddExtPoint(nExtPoint, nNewValue)
	if GetExtPoint(nExtPoint) == nNewValue then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "success", 1, "From "..nValue.." to "..nNewValue)
		return 1
	else
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "From "..nValue.." to "..GetExtPoint(nExtPoint))
		return 0
	end
end

function PlayerFunLib:PayExtPoint(nExtPoint, nValue)
	local nOldValue = GetExtPoint(nExtPoint)
	PayExtPoint(nExtPoint, nValue)
	local nNewValue = GetExtPoint(nExtPoint)
	if nNewValue ~= nOldValue then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "success", 1, "From "..nOldValue.." to "..nNewValue)
		return 1
	else
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "From "..nOldValue.." to "..nOldValue)
		return 0
	end
end

function PlayerFunLib:AddExtPoint(nExtPoint, nValue)
	local nOldValue = GetExtPoint(nExtPoint)
	AddExtPoint(nExtPoint, nValue)
	local nNewValue = GetExtPoint(nExtPoint)
	if nNewValue ~= nOldValue then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "success", 1, "From "..nOldValue.." to "..nNewValue)
		return 1
	else
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "From "..nOldValue.." to "..nOldValue)
		return 0
	end
end

function PlayerFunLib:SetExtPoint(nExtPoint, nValue)
	local nOldValue = GetExtPoint(nExtPoint)
	PayExtPoint(nExtPoint, GetExtPoint(nExtPoint))
	AddExtPoint(nExtPoint, nValue)
	local nNewValue = GetExtPoint(nExtPoint)
	if nNewValue ~= nOldValue then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "success", 1, "From "..nOldValue.." to "..nNewValue)
		return 1
	else
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "From "..nOldValue.." to "..nOldValue)
		return 0
	end
end

function GetBytePos(nValue, nPos)
	local nHeso = 10^(nPos-1)
	return mod(floor(nValue/nHeso),10)
end

function SetBytePos(nValue, nSetValue, nPos)
	local nHeso = 10^(nPos)
	local nNewValue = floor(nValue/nHeso)*nHeso + nSetValue*(nHeso/10) + mod(nValue,(nHeso/10))
	return nNewValue
end

function PlayerFunLib:GetValuePos(nValue, nPos2, nPos1)
	return floor(mod(nValue,10^(nPos2))/(10^(nPos1-1)))
end

function PlayerFunLib:SetValuePos(nValue, nSetValue, nPos2, nPos1)
	local nHead = floor(nValue/(10^nPos2))*(10^nPos2)
	local nTail = mod(nValue,10^(nPos1-1))
	local nBody = nSetValue*(10^(nPos1-1))
	return (nHead + nBody + nTail)
end

function PlayerFunLib:GetTaskPos(nTask, nPos2, nPos1)
	local nTaskvalue = GetTask(nTask)
	nTaskvalue = self:GetValuePos(nTaskvalue, nPos2, nPos1)
	return nTaskvalue
end

function PlayerFunLib:SetTaskPos(nTask, nSetValue, nPos2, nPos1)
	local nTaskvalue = GetTask(nTask)
	nTaskvalue = self:SetValuePos(nTaskvalue, nSetValue, nPos2, nPos1)
	SetTask(nTask, nTaskvalue)
	return 1
end


function PlayerFunLib:GetTranslifeCount()
	return GetByte(GetTask(1538), 1)
end

function PlayerFunLib:GetTranslifeFaction()
	local tbHuongChuyenSinh = {"龙巢","海巢","河巢","洞巢"}
	local nIndex = GetByte(GetTask(1538), 2)
	return nIndex, (tbHuongChuyenSinh[nIndex] or "")
end