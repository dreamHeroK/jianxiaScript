-- 成都之印

tCityName =
{
	[300] = "成都",
	[100] = "泉州",
	[350] = "襄阳",
}

function replace(str,pattern,s)
	local startS,endS = strfind(str,pattern)
	while(startS) do
		str = strsub(str,1,startS-1)..s..strsub(str,endS+1,strlen(str))
		startS,endS = strfind(str,pattern)
	end
	return str
end

function OnUse(idx)
	local nItemIdx = tonumber(idx)
	if GetTeamSize() == 0 then
		Say("在使用成都之前请与需要操作的人组队!", 0)
		return
	end
	local nshi = GetItemParam(nItemIdx, 1)
	local nti = GetItemParam(nItemIdx, 2)
	
	Say("您想在哪个城市担任职位?\n可以担任 <color=yellow>"..(1 - nshi).."<color> 师爷和 <color=yellow>"..(4 - nti).." <color> 提辖\n<color=green>师爷<color>: 师爷可以改变税收和税收.\n<color=green>提辖<color>: 可以抓捕有PK值的玩家!", 3, "任命师爷/#renming_shi_ye("..nItemIdx..")", "任命提辖/#renming_ti_xia("..nItemIdx..")", "不做/no_say")
end

function renming_shi_ye(nItemIdx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	local nNowMapID = GetWorldPos()
	if nNowMapID ~= nItemMapID then
		Say("太守之印只能在 "..tCityName[nItemMapID].."使用 ", 0)
		return
	end
	local nMapID, nDuty = GetCityWarDutyFlag()
	if nMapID ~= nItemMapID or nDuty ~= 0 then
		Say("你不是成都的 "..tCityName[nItemMapID].." 主人，不能使用成都之印!", 0)
		return
	end
	local nCount = GetItemParam(nItemIdx, 1)
	if nCount == 1 then
		Say("一个城市只能任命一名师爷。", 0)
		return
	end
	local szMyName = GetName()
	local szCityTongName = GetCityWarInfo(nItemMapID, "base")
	local nOldPlayer = PlayerIndex
	local nIndex = 1
	tTab = {}
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			local szName = GetName()
			if szName ~= szMyName and GetTongName() == szCityTongName then
				szName = replace(szName, "/" ,"-")
				szName = replace(szName, "|" ,"-")
				szName = replace(szName, ":" ,"-")
				tTab[nIndex] = szName.."/#yes_renming_shi_ye("..nItemIdx..","..i..")"
				nIndex = nIndex + 1
			end
		end
	end
	tTab[nIndex] = "不做/no_say"
	PlayerIndex = nOldPlayer
	Say("你打算任命谁为师爷?\n注意:  具有特殊字符的玩家的名字将被转换为 <color=yellow>\"-\"<color>", getn(tTab), tTab)
end

function yes_renming_shi_ye(nItemIdx, nTeamIdx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	local nExpireTime = GetItemExpireTime(nItemIdx)
	local nNowMapID = GetWorldPos()
	if nNowMapID ~= nItemMapID then
		Say("太守之印只能在 "..tCityName[nItemMapID].."使用 ", 0)
		return
	end
	local nMapID, nDuty = GetCityWarDutyFlag()
	if nMapID ~= nItemMapID or nDuty ~= 0 then
		Say("你不是成都的 "..tCityName[nItemMapID].." 主人，不能使用成都之印!", 0)
		return
	end
	local nCount = GetItemParam(nItemIdx, 1)
	if nCount == 1 then
		Say("一个城市只能任命一名师爷。", 0)
		return
	end
	
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(nTeamIdx)
	if PlayerIndex > 0 then
		local szName = GetName()
		local nTargetMapID = GetCityWarDutyFlag()
		local nJoinTime = GetTime() - GetJoinTongTime()
		local szTongName = GetTongName()
		if nTargetMapID > 0 or nJoinTime <= 604800 then		-- 已有职位或入帮不足7天者不能给于
			szName = replace(szName, "/" ,"-")
			szName = replace(szName, "|" ,"-")
			szName = replace(szName, ":" ,"-")
			PlayerIndex = nOldPlayer
			Talk(1,"","无法接受 <color=yellow>"..szName.."<color> 成为师爷，请确认."..szName.."是否入帮不足7天。")
			return
		end
		local nRet, nShiyeItemIndex = AddItem(2,1,1204,1,1)
		if nRet == 1 then
			SetItemParam(nShiyeItemIndex, 0, nItemMapID)		-- 哪个城市的
			SetItemExpireTime(nShiyeItemIndex, nExpireTime)		-- 物品到期时间
			SaveNow()											-- 寰楀埌鐗╁搧鐨勪汉淇濆瓨涓?涓?
			WriteLog("攻城管理:"..GetTongName().."-"..szName.." 被任命为师爷")
			PlayerIndex = nOldPlayer
			szName = replace(szName, "/" ,"-")
			szName = replace(szName, "|" ,"-")
			szName = replace(szName, ":" ,"-")
			SetItemParam(nItemIdx, 1, 1)
			Talk(1,"","接受 "..szName.." 任命为师爷")
			SendTongMessage(GetName().."任命"..szName.." 师爷")
			-- 如果已经任命完所有名额了，就删掉自己
			local nshi = GetItemParam(nItemIdx, 1)
			local nti = GetItemParam(nItemIdx, 2)
			if nshi == 1 and nti == 4 then
				BigDelItem(2, 1, 1207, 1)
			end
			SaveNow()											-- 给物品的人也保存一下
		else
			Talk(1,"","背包空间不足或已上限")
		end
	end
end

function renming_ti_xia(nItemIdx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	local nNowMapID = GetWorldPos()
	if nNowMapID ~= nItemMapID then
		Say("成都印只能在 "..tCityName[nItemMapID].."使用 ", 0)
		return
	end
	local nMapID, nDuty = GetCityWarDutyFlag()
	if nMapID ~= nItemMapID or nDuty ~= 0 then
		Say("你不是成都的 "..tCityName[nItemMapID].." 主人，不能使用成都之印!", 0)
		return
	end
	local nCount = GetItemParam(nItemIdx, 2)
	if nCount == 4 then
		Say("一个城市只能任命四位提辖", 0)
		return
	end
	local szMyName = GetName()
	local szCityTongName = GetCityWarInfo(nItemMapID, "base")
	local nOldPlayer = PlayerIndex
	local nIndex = 1
	tTab = {}
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			local szName = GetName()
			if szName ~= szMyName and GetTongName() == szCityTongName then
				szName = replace(szName, "/" ,"-")
				szName = replace(szName, "|" ,"-")
				szName = replace(szName, ":" ,"-")
				tTab[nIndex] = szName.."/#yes_renming_ti_xia("..nItemIdx..","..i..")"
				nIndex = nIndex + 1
			end
		end
	end
	tTab[nIndex] = "不做/no_say"
	PlayerIndex = nOldPlayer
	Say("你打算任命谁?\n注意: 具有特殊字符的玩家的名字将被转换为 <color=yellow>\"-\"<color>", getn(tTab), tTab)	
end

function yes_renming_ti_xia(nItemIdx, nTeamIdx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	local nExpireTime = GetItemExpireTime(nItemIdx)
	local nNowMapID = GetWorldPos()
	if nNowMapID ~= nItemMapID then
		Say("成都印只能在 "..tCityName[nItemMapID].."使用 ", 0)
		return
	end
	local nMapID, nDuty = GetCityWarDutyFlag()
	if nMapID ~= nItemMapID or nDuty ~= 0 then
		Say("你不是成都的 "..tCityName[nItemMapID].." 主人，不能使用成都印!", 0)
		return
	end
	local nCount = GetItemParam(nItemIdx, 2)
	if nCount == 4 then
		Say("一个城市能任命四位提辖", 0)
		return
	end
	
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(nTeamIdx)
	if PlayerIndex > 0 then
		local szName = GetName()
		local nTargetMapID = GetCityWarDutyFlag()
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nTargetMapID > 0 or nJoinTime <= 604800 then		-- 已有职位或入帮不足7天者不能给于
			szName = replace(szName, "/" ,"-")
			szName = replace(szName, "|" ,"-")
			szName = replace(szName, ":" ,"-")
			PlayerIndex = nOldPlayer
			Talk(1,"","无法任命 <color=yellow>"..szName.."<color> 成为提辖,请确认。"..szName.."是否入帮不足7天。")
			return
		end
		local nRet, nTixiaItemIndex = AddItem(2,1,1205,1,1)
		if nRet == 1 then
			SetItemParam(nTixiaItemIndex, 0, nItemMapID)		-- 哪个城市的
			SetItemExpireTime(nTixiaItemIndex, nExpireTime)		-- 物品到期时间
			SaveNow()											-- 得到物品的人保存一下
			WriteLog("攻城管理:"..GetTongName().."-"..szName.." 被任命为提辖")
			PlayerIndex = nOldPlayer
			szName = replace(szName, "/" ,"-")
			szName = replace(szName, "|" ,"-")
			szName = replace(szName, ":" ,"-")
			nCount = nCount + 1
			SetItemParam(nItemIdx, 2, nCount)
			Talk(1,"","你被任命 "..szName.." 为提辖")
			SendTongMessage(GetName().."任命"..szName.." 提辖。")
			-- 如果已经任命完所有名额了，就删掉自己
			local nshi = GetItemParam(nItemIdx, 1)
			local nti = GetItemParam(nItemIdx, 2)
			if nshi == 1 and nti == 4 then
				BigDelItem(2, 1, 1207, 1)
			end
			SaveNow()											-- 给物品的人也保存一下
		else
			Talk(1,"","背包空间不足或已上限")
		end
	end
end

function no_say()
end