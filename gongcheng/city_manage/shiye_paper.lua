-- 军师职务

tCityName =
{
	[300] = "成都",
	[100] = "泉州",
	[350] = "襄阳",
}

tMapTitleID =
{
	[300] = {51, 3},
	[100] = {51, 7},
	[350] = {51, 11},
}

function OnUse(idx)
	local nItemIdx = tonumber(idx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	if tMapTitleID[nItemMapID] == nil then
		Talk(1,"","<color=red>使用 script [攻城战] 任命师爷错误! 请通知帮主!!<color>")
		return
	end
	local nMapID = GetWorldPos()
	if nItemMapID ~= nMapID then
		Say("只在 "..tCityName[nItemMapID].." 才使用这个物品 ", 0)
		return
	end
	local szTongName = GetCityWarInfo(nItemMapID, "base")
	if szTongName == nil or szTongName == "" then
		Say("这座城目前帮会占领", 0)
		return
	end
	local nJoinTime = GetTime() - GetJoinTongTime()
	if nJoinTime <= 604800 then
		Say("你不能任命为师爷, 请确认您已加入  "..szTongName.." 七天以上", 0)
		return
	end

	local nRet = SetCityWarPlayerDuty(nItemMapID, 1)
	if nRet == -1 then
		Say("这座城目前帮会占领", 0)
	elseif nRet == 1 then
		local nCount = GetCityWarInfo(nItemMapID, "manager")
		if nCount >= 1 then
			Say("你不能任命为师爷, 请确认您已加入 "..szTongName.."已经有一位师爷了.", 0)
		else
			Say("大侠不能任命为师爷, 确认未担任其他职务", 0)
		end
	elseif nRet == 0 then
		if DelItem(2,1,1204,1) == 1 then
			-- 把多余的聘书删除掉
			local n = BigGetItemCount(2,1,1204)
			if n > 0 then
				BigDelItem(2,1,1204,n)
			end
			
			n = BigGetItemCount(2,1,1205)
			if n > 0 then
				BigDelItem(2,1,1205,n)
			end
			
			AddTitle(tMapTitleID[nItemMapID][1], tMapTitleID[nItemMapID][2])
			SetCurTitle(tMapTitleID[nItemMapID][1], tMapTitleID[nItemMapID][2])
			Say("你被任命为 "..tCityName[nItemMapID].."师爷", 0)
			SetTask(2546, 1);--设置军师领取奖励的标记
			SendTongMessage(GetName().."利用军师推荐成为师爷.")
			WriteLog("攻城战-管理:"..szTongName.."-"..GetName().." 成为 "..tCityName[nItemMapID].."师爷")
			SaveNow()
		end
	end
end

function no_say()
end