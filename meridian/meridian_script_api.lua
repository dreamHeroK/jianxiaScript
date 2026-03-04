--真气获得途径操作接口

Import("\\script\\system_switch_config.lua")

AWARD_QENUINEQI_TYPE_EXP = 1
AWARD_QENUINEQI_DAILY_TASK = 2
AWARD_QENUINEQI_ACTIVITY = 3
AWARD_QENUINEQI_IB = 4

t_type_zhenqi_limit_para = {
	[AWARD_QENUINEQI_TYPE_EXP] = {1, 65535, 1, 0, "每日获得真气上限"},
	[AWARD_QENUINEQI_DAILY_TASK] = {2, 65535, 1, 1, "日常任务"},
	[AWARD_QENUINEQI_ACTIVITY] = {3, 65535, 2, 0, "活动"},
	[AWARD_QENUINEQI_IB] = {4, 65535, 2, 1, "充值特权"},
}

--------------------------------------------------------------------------------
--通过活动获得真气，有每日上限
--返回0 获得失败
--返回1 获得成功
function ActivityAwardGenuineQiDaily(nValue)
	return AwardGenuineQiByType(nValue, AWARD_QENUINEQI_ACTIVITY)
end

--获取今日通过活动还能获得的真气值
function ActivityGetDailyGenuineQiLeftCapacity()
	return GetTodayAwardGenuineQiLeftCapacityByType(AWARD_QENUINEQI_ACTIVITY)
end

--获取今日通过活动获取的真气值
function ActivityGetDailyAwardGenuineQi()
	return GetTodayAwardGenuineQiByType(AWARD_QENUINEQI_ACTIVITY)
end

--------------------------------------------------------------------------------
--通过IB获得真气，有每日上限
--返回0 获得失败
--返回1 获得成功
function IBAwardGenuineQiDaily(nValue)
	return AwardGenuineQiByType(nValue, AWARD_QENUINEQI_IB)
end

--获取今日通过活动还能获得的真气值
function IBGetDailyGenuineQiLeftCapacity()
	return GetTodayAwardGenuineQiLeftCapacityByType(AWARD_QENUINEQI_IB)
end

--获取今日通过活动获取的真气值
function IBGetDailyAwardGenuineQi()
	return GetTodayAwardGenuineQiByType(AWARD_QENUINEQI_IB)
end
--------------------------------------------------------------------------------

--经脉系统脚本接口
function AwardGenuineQiByType(nValue, nType)
	if 1 ~= IsMeridianSystemOpen() then
		return 0
	end
	if MeridianGetLevel() < 1 then
		return 0
	end
	if nValue <= 0 then
		return 0
	end
	if nType < 1 or nType > getn(t_type_zhenqi_limit_para) then
		return 0
	end
	local nTodayLeftCapacity = GetTodayAwardGenuineQiLeftCapacityByType(nType)
	if nTodayLeftCapacity > 0 then
		local nAward = nValue
		if nAward > nTodayLeftCapacity then
			nAward = nTodayLeftCapacity
		end
		local bSuccess = 0
		if 1 == _AddTodayAwardGenuineQiByType(nType, nAward) then
			bSuccess = (AwardGenuineQi(nAward) or 0)
		end
		return bSuccess;
	else

Msg2Player(format("今天已超过%s的限制，%s", t_type_zhenqi_limit_para[nType][5], t_type_zhenqi_limit_para[nType][5]))
	end

	return 0;
end

function GetTodayAwardGenuineQiLeftCapacityByType(nType)
	local nRet = -1;
	if nType and nType >= 1 and nType <= getn(t_type_zhenqi_limit_para) then
		local nTotayAward = GetTodayAwardGenuineQiByType(nType)
		if nTotayAward >= 0 then
			nRet = t_type_zhenqi_limit_para[nType][2] - nTotayAward
		end
	end
	local nTotalCapacity = MeridianGetLeftGenuineQiCapcity()
	if nRet > nTotalCapacity then
		nRet = nTotalCapacity;
	end
	return nRet
end

function GetTodayAwardGenuineQiByType(nType)
	local nRet = -1;
	if nType and nType >= 1 and nType <= getn(t_type_zhenqi_limit_para) then
		local nValue = GetDailyTask(t_type_zhenqi_limit_para[nType][3])
		local nBytes = {GetByte(nValue, 1),	GetByte(nValue, 2),	GetByte(nValue, 3),	GetByte(nValue, 4),	}
		if t_type_zhenqi_limit_para[nType][4] == 0 then
			nRet = nBytes[2] * 256 + nBytes[1]
		elseif t_type_zhenqi_limit_para[nType][4] == 1 then
			nRet = nBytes[4] * 256 + nBytes[3]
		end
	end
	return nRet
end

function _AddTodayAwardGenuineQiByType(nType, nValue)
	--最大只支持65535
	if nValue < 0 or nValue > 65535 then
		return 0
	end
	local nRet = 0;
	if nType and nValue and nType >= 1 and nType <= getn(t_type_zhenqi_limit_para) then
		local nStartByte = 0
		local nTaskValue = GetDailyTask(t_type_zhenqi_limit_para[nType][3])
		local nBytes = {GetByte(nTaskValue, 1),	GetByte(nTaskValue, 2),	GetByte(nTaskValue, 3),	GetByte(nTaskValue, 4),	}
		if t_type_zhenqi_limit_para[nType][4] == 0 then
			nStartByte = 1
		elseif t_type_zhenqi_limit_para[nType][4] == 1 then
			nStartByte = 3
		end
		if nStartByte > 0 then
			local nCurVal = nBytes[nStartByte + 1] * 256 + nBytes[nStartByte]
			local nNewVal = nCurVal + nValue
			if nNewVal >= 0 and nNewVal <= 65535 then
				local nNewTaskValueTemp = SetByte(nTaskValue, nStartByte, GetByte(nNewVal, 1))
				local nNewTaskValue = SetByte(nNewTaskValueTemp, nStartByte + 1, GetByte(nNewVal, 2))
				SetDailyTask(t_type_zhenqi_limit_para[nType][3], nNewTaskValue)
				nRet = 1
			end
		end
	end
	return nRet
end
