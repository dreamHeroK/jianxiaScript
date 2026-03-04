-- 名捕职务

Include("\\script\\online\\zgc_public_fun.lua")

tCityName =
{
	[300] = "成都",
	[100] = "泉州",
	[350] = "襄阳",
}

tMapTitleID =
{
	[300] = {51, 4},
	[100] = {51, 8},
	[350] = {51, 12},
}

function OnUse(idx)
	local nItemIdx = tonumber(idx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	if tMapTitleID[nItemMapID] == nil then
		Talk(1,"","<color=red>使用 script [攻城战] 任命提辖错误! 请通知帮主!!<color>")
		return
	end
	local nMapID = GetWorldPos()
	if nItemMapID ~= nMapID then
		Say("只在 "..tCityName[nItemMapID].." 才使用这个物品 ", 0)
		return
	end
	local nJoinTime = GetTime() - GetJoinTongTime()
	local szTongName = GetCityWarInfo(nItemMapID, "base")
	if szTongName == nil or szTongName == "" then
		Say("这座城目前帮会占领", 0)
		return
	end
	if nJoinTime <= 604800 then
		Say("大侠不能任命为提辖, 请确认您已加入  "..szTongName.." 七天以上", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 25) == 0 then		-- 这个判断要先做
		return
	end
	local nRet = SetCityWarPlayerDuty(nItemMapID, 2)
	if nRet == -1 then
		Say("这座城目前帮会占领", 0)
	elseif nRet == 1 then
		local nCount = GetCityWarInfo(nItemMapID, "fighter")
		if nCount >= 4 then
			Say("你不能任命为提辖, "..szTongName.."已经有四个提辖了", 0)
		else
			Say("你不能任命为提辖, 请确认您尚未担任其他职务", 0)
		end
	elseif nRet == 0 then
		if DelItem(2,1,1205,1) == 1 then
			-- 把多余的聘书删除掉
			local n = BigGetItemCount(2,1,1204)
			if n > 0 then
				BigDelItem(2,1,1204,n)
			end
			
			n = BigGetItemCount(2,1,1205)
			if n > 0 then
				BigDelItem(2,1,1205,n)
			end

			AddItem(2,1,1211,25,1)					-- 成都搜捕令
			AddTitle(tMapTitleID[nItemMapID][1], tMapTitleID[nItemMapID][2])
			SetCurTitle(tMapTitleID[nItemMapID][1], tMapTitleID[nItemMapID][2])
			Say("你被任命为 "..tCityName[nItemMapID].." 提辖 \n<color=red>注意:  名称名称必须激活才具有名称功能.<color>", 0)
			SendTongMessage(GetName().."你已成为师爷.")
			WriteLog("攻城战-管理:"..szTongName.."-"..GetName().." 成为 "..tCityName[nItemMapID].."提辖")
			SaveNow()
		end
	end
end

function no_say()
end