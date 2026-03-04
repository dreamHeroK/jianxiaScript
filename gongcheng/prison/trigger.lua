-- 计时器

Include("\\script\\gongcheng\\prison\\prison_head.lua")

function OnTimer()
	local nTrigger = GetRunningTrigger()
	if nTrigger ~= 0 then
		local nStep = GetTriggerParam(nTrigger, 2)
		SetTriggerParam(nTrigger, 2, nStep + 1)
		if nStep + 1 < CITYWAR_MAX_STEP then
			Msg2Player("时间过去["..(nStep + 1).."/"..CITYWAR_MAX_STEP.."]")
		else
			if mod(nStep, 10) == 0 then
				Msg2Player("你可以离开牢狱!")
			end
		end
	end
end

function Leave_Map()
	print("Citywar Prison Leave_Map")
	RemoveTrigger(GetTrigger(CITYWAR_LEAVE_PRISON))
	StallEnable(1)		-- 能摆摊
	ForbidRead(0)		--能修书
	UseScrollEnable(1)	--允许使用回城
end

function Enter_Map()
	print("Citywar Prison Enter_Map")
	RemoveTrigger(GetTrigger(CITYWAR_ENTER_PRISON))
	StallEnable(0)	-- 不能摆摊
	ForbidRead(1)	--不能修书
	UseScrollEnable(0)	--禁止使用回城
end