GAMESVRGLB_SYSTEM		= 151	-- GameServer全局变量：系统
GAMESVRGLB_MULTIPLE		= 152	-- GameServer全局变量：倍率

SYS_BATTLE				= 1		-- 战场的战功
SYS_COC			 	 	= 2		-- 商会的奖励
SYS_MASTER_RANDOMTASK	= 3		-- 师门随机任务奖励
SYS_MASTER_REPEATTASK	= 4		-- 师门重复任务奖励
SYS_KILLER_TASK			= 5		-- 杀手任务奖励
SYS_DRAGONBOAT			= 6		-- 龙舟积分奖励

MIN_MULTIPLE			= 1		-- 倍率最小值
MAX_MULTIPLE			= 3		-- 倍率最大值

-- 奖励翻倍的系统
map_sysnames = {
"战场的战功",
"商会的奖励",
"师门随机任务奖励",
"师门重复任务奖励",
"杀手任务奖励",
"龙舟积分奖励"
}

-- 获取奖励的倍率
function get_reward_multiple(system)
	local multiple_sys = GetGlbValue(GAMESVRGLB_SYSTEM) -- 奖励翻倍的系统
	local multiple_val = 1
	if (multiple_sys ~= 0 and multiple_sys == system) then
		multiple_val = GetGlbValue(GAMESVRGLB_MULTIPLE) / 100
		if (multiple_val == 0) then
			multiple_val = 1
		end
	end
	if (multiple_val < MIN_MULTIPLE) then
		multiple_val = MIN_MULTIPLE
	end
	if (multiple_val > MAX_MULTIPLE) then
		multiple_val = MAX_MULTIPLE
	end
	return multiple_val
end

-- 奖励翻倍
function multiple_reward(system, reward)
	local multiple = get_reward_multiple(system)
	if (multiple == 1) then
		return reward
	else
		return reward * multiple
	end
end
