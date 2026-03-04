--filename:trigger.lua
--create date:2021-04-11
--author:
--describe:活动触发器脚本
Include("\\script\\online\\capture_flag\\head.lua")

TSK_PK_FLAG = 105

function EnterFlagMap()
	if GetPlayerRoute() == 0 then
		return 1
	end		
	local nDate = tonumber(date("%w%H"))
	if nDate >= 319 and nDate < 320 then
		local nMapID, nX, nY = GetWorldPos()
		if nMapID == 304 then
			local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(300, "base")
			if IsTongMember() == 0 or GetTongName() ~= szTongName then
				LeaveTeam()
				local nFlag = random(1,2)
				SetPKFlag(1,nFlag)
				ForbidChangePK(1)
				SetTaskTemp(TSK_PK_FLAG,1)
			end
		end
	else
		if GetTaskTemp(TSK_PK_FLAG) == 1 then
			ForbidChangePK(0)
			SetTaskTemp(TSK_PK_FLAG,0)
		end	
	end
end

function LeaveFlagMap()
	if GetTaskTemp(TSK_PK_FLAG) == 1 then
		ForbidChangePK(0)
		SetTaskTemp(TSK_PK_FLAG,0)
	end	
end

