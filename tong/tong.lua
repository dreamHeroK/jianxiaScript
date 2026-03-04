
--------------------如果非客户端---------------------------
Include("\\script\\tong\\tong_header.lua")

function weekly_maintain_login()	
	if tit_IsTempTong() ~= 0 then -- 没有加入任何帮派
		return 0;
	end
	local szTong = GetTongName()
	local nMembers = 1
	local nCheckTong = 1
	TxtData:Init("tong", "tong.txt")
	TxtData:LoadMultiColumn()	
	for i = 1, getn(TxtData.tbTextData) do
		if tostring(szTong) == tostring(TxtData.tbTextData[i][1]) then
			nMembers = TxtData.tbTextData[i][3] 		-- 帮会人数
			break
		end
	end
	TxtData:Init("tong", "tong_value.txt")
	TxtData:LoadMultiColumn()	
	for i = 1, getn(TxtData.tbTextData) do
		if tostring(szTong) == tostring(TxtData.tbTextData[i][1]) then
			nCheckTong = 0
			break
		end
	end
	if nCheckTong == 1 then -- 帮会价值参数预留10个（1：贡献度）
		local szLog = szTong.."	0	0	0	0	0	0	0	0	0	0"
		TxtData:AddLine(szLog)
	end
	local nTongLevel = GetTongLevel()
	local nType = random( getn(TB_WEEKGOAL_TYPE_ID))  	-- 设置周目标
	local nLevel = nTongLevel
	if (nLevel <= 0) then nLevel = 1 end --开始时周目标难度默认为1
	if (nLevel > 2) then
		nLevel = 2
	end
	local nCheckTongWeek = 1
	local nHourValue = random(150, 170)
	nWeekGoalPlayer = TB_WEEKGOAL_CHANGE[nLevel] * nHourValue --确定玩家周目标贡献度
	nWeekGoalTotal = floor(0.4 * nMembers * nWeekGoalPlayer) --确定帮会周目标贡献度
	nWeekGoalPricePlayer = floor(TB_WEEKGOAL_PRICE_BASE[nLevel] * nHourValue) --确定玩家周目标奖励
	nWeekGoalPriceTong = floor(TB_WEEKGOAL_PRICE_BASE[nLevel] * nHourValue * 0.4 * nMembers) --确定帮会周目标奖励
	if nTongLevel >= 1 then
		nWeekGoalPlayer = WEEKGOAL_VALUE_PERSON;
		nWeekGoalTotal = floor(0.4 * nMembers * nWeekGoalPlayer); --确定帮会周目标贡献度
		nWeekGoalPricePlayer = WEEKGOAL_PRICE_PERSON;
		nWeekGoalPriceTong = WEEKGOAL_PRICE_TONG;
		local nYears = tf_Date("Y")
		local nWeek = tf_Date("W")
		local szFileName = "tong_contribution_"..nYears.. "_"..nWeek.. ".txt"
		TxtData:Init("tong", szFileName)
		TxtData:LoadMultiColumn()	
		for i = 1, getn(TxtData.tbTextData) do
			if tostring(szTong) == tostring(TxtData.tbTextData[i][1]) then
				nCheckTongWeek = 0
				break
			end
		end
		if nCheckTongWeek == 1 then
			local szData = szTong .. "	0	0	" ..TB_WEEKGOAL_TYPE_ID[nType].."	" ..TB_WEEKGOAL_TYPE_NAME[nType].."	" .. nLevel.."	" .. nWeekGoalPlayer.."	" .. nWeekGoalTotal.."	" .. nWeekGoalPricePlayer.."	" .. nWeekGoalPriceTong
			TxtData:AddLine(szData)
		end
	end
	return 1
end
