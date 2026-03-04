Include("\\script\\item\\standin_doll.lua");
Import("\\script\\global\\mate_head.lua");

-- 配偶上线事件
function OnMateOnline()
	if (IsDollActive() == 1) then
		FinishDoll()
	end
	SetTask(TASK_INCLOVE_TIME, 0)
end

-- 配偶下线事件
function OnMateOffline()
	SetTask(TASK_INCLOVE_TIME, 0)
end

-- 离婚事件
function OnDivorce()
	-- DEBUG
	print("OnDivorce")
	if (IsDollActive() == 1) then
		FinishDoll()
	end
	SetTask(TASK_INCLOVE_TIME, 0)
end

function UpdateLove(interval)	--一分钟调用一次
	-- 如果配偶在线或者在使用替身娃娃，则定时增加同心值
	if (GetMateOnlineStatus() == 1 or
		IsDollActive() == 1) then
		local time = GetTask(TASK_INCLOVE_TIME)
		local same_heart_value_max = GetTask(2023)
		time = time + interval
		if (time >= INTERVAL_INCLOVE) then
			local love = GetTask(TASK_LOVEGRADE) + VALUE_INCCLOVE
			if (love > MAX_LOVEGRADE) then
				SetTask(TASK_INCLOVE_TIME, 0)
				return
			end
			-- DEBUG
			print(format("玩家 [%s]的同心值增加: %d", GetName(), love))
			SetTask(TASK_LOVEGRADE, love)
			SetTask(TASK_INCLOVE_TIME, 0)
		else
			SetTask(TASK_INCLOVE_TIME, time)
		end
	end
end
