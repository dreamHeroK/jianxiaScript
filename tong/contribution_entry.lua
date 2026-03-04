--活动价值量->
--取80%加到个人贡献度->(周累积贡献度累加(周累积贡献度上限)->个人总贡献度累加，(如果是周目标活动)个人周目标贡献度累加->帮会周目标贡献度累加)，
--取20%加到帮会总贡献度
--活动价值量入口函数：ContriValueAdd(nValue, nEntry)，返回０表示失败(无帮会)，１表示成功

Include("\\script\\tong\\tong_header.lua");

--缓存到一定价值量才发到Relay
TONG_VALUE_SYNC = 1000000 --储备贡献度及周目标累积贡献度价值量缓存上限

--转化系数
coefPersonal = 0.8
coefTongStore = 0.2

--活动价值量入口逻辑
function ContriValueEntryLogic(nValue, nEntry) --nValue 价值量，nEntry入口
	--_dbgMsg("价值入口（10倍）"..nValue)
	local nRet = 1
	if tit_IsTempTong() ~= 0 then -- 没有加入任何帮派
		return 0;
	end
	local szTong = GetTongName()
	local nTong = 0 					
	local nGoalTotal = 0 			-- 帮会总贡献度
	local nWeekGoalTotal = 0 		-- 当前玩家周总贡献度
	local nWeekTotal = 0 			-- 当前玩家周目标贡献度
	local nWeekGoal = 0 			-- 当前帮会周目标标识
	local nYears = tf_Date("Y")
	local nWeek = tf_Date("W")
	local szFileName = "tong_contribution_"..nYears.. "_"..nWeek.. ".txt"
	TxtData:Init("tong", szFileName)
	TxtData:LoadMultiColumn()	
	for i = 1, getn(TxtData.tbTextData) do
		if tostring(szTong) == tostring(TxtData.tbTextData[i][1]) then
			nTong = i 			
			nWeekGoalTotal = tonumber(TxtData.tbTextData[i][2]) 	-- 当前周累计贡献度
			nWeekTotal = tonumber(TxtData.tbTextData[i][3]) 		-- 当前周目标贡献度
			nWeekGoal = tonumber(TxtData.tbTextData[i][4]) 		-- 当前帮会周目标标识
			break
		end
	end
	---------------------------------转化到个人-------------------------------------------
	local nPersonal = coefPersonal*nValue	
	--个人
	local nValuePlayer = GetTask(TASKID_WEEK_CONTRIVALUE) + nPersonal
	--_dbgMsg("总缓存"..nValuePlayer)
	local nContribution = floor(nValuePlayer/COEF_CONTRIB_TO_VALUE)
	if (nContribution > 0) then
		--如果是周目标活动
		if (nEntry == nWeekGoal) then
			--个人周目标贡献度累加
			SetTask(TASKID_WEEK_CONTRIVALUE, nContribution)
			--帮会周目标累积贡献度累加
			local nCurValue = nWeekTotal + nContribution
			TxtData.tbTextData[nTong][3] = nCurValue
			TxtData:SaveMultiColumn()
		end
		--周累积贡献度
		--_dbgMsg("目前周累积贡献度"..nWeekTotal.."/"..MAX_WEEK_CONTRIBUTION)
		if nWeekTotal < MAX_WEEK_CONTRIBUTION then
			--获取的贡献度将超出上限
			--_dbgMsg("增加贡献度"..nContribution)
			if nWeekTotal + nContribution > MAX_WEEK_CONTRIBUTION then
				nContribution = MAX_WEEK_CONTRIBUTION - nWeekTotal
				--_dbgMsg("贡献度已达周上限，本次只增加贡献度"..nContribution)
				TxtData.tbTextData[nTong][2] = nContribution
				TxtData:SaveMultiColumn()
				--剩余价值量
				nValuePlayer = 0
			else
				TxtData.tbTextData[nTong][2] = nContribution
				TxtData:SaveMultiColumn()
				nValuePlayer = mod(nValuePlayer, COEF_CONTRIB_TO_VALUE)
			end
			--帮会储存总贡献度
			TxtData:Init("tong", "tong_value.txt")
			TxtData:LoadMultiColumn()	
			for i = 1, getn(TxtData.tbTextData) do
				if tostring(szTong) == tostring(TxtData.tbTextData[i][1]) then
					nTong = i 			
					nGoalTotal = tonumber(TxtData.tbTextData[i][2]) 		-- 帮会总贡献度
					break
				end
			end
			local nTongStore = coefTongStore*nValue
			--帮会储备
			local nValueTong = nGoalTotal + nTongStore			
			--_dbgMsg("目前帮会储备缓存"..nValueTong)
			local nStore = floor(nValueTong/COEF_CONTRIB_TO_VALUE)
			--_dbgMsg("增加帮会储备"..nStore)
			TxtData.tbTextData[nTong][2] = nStore
			TxtData:SaveMultiColumn()
		else
			--_dbgMsg("贡献度已达上限！")
			--已达周上限
			nRet = -1
		end
	end
	if (nRet == 1)then
		--剩余缓存：nValuePlayer
		SetTask(TASKID_CONTRIVALUE, nValuePlayer)
	end
	return nRet
end
