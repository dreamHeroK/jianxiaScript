-- 2007-5-9 9:38
-- 狱卒

Include("\\script\\gongcheng\\prison\\prison_head.lua")

tCityWarOutPos =
{
	[1] = {200, 1385, 2829},
	[2] = {300, 1769, 3555},
	[3] = {100, 1413, 2958},
	[4] = {400, 1520, 2981},
	[5] = {150, 1682, 3125},
	[6] = {350, 1460, 2948},
}

function main()
	Say("<color=green>狱卒<color>：要走要留，你自己决定吧。",2,"送我出去/go_outside", "稍后再出去/no_say")
end

function go_outside()
	local tMap = 
	{
		[730] = 1801,
		[731] = 1802,
		[732] = 1803,
		[733] = 1804,
		[734] = 1805,
	}
	local nMapID = GetWorldPos()
	if tMap[nMapID] == nil then
		return
	end
	CreateTrigger(2, tMap[nMapID], CITYWAR_LEAVE_PRISON)
	
	local nTrigger = GetTrigger(CITYWAR_STEP_TRIGGER)
	local nStep = GetTriggerParam(nTrigger, 2)
	if nTrigger == 0 then					-- 来探监的
		local selTab = 
		{
			"汴京/#go_out_safe(1)",
			"成都/#go_out_safe(2)",
			"泉州/#go_out_safe(3)",
			"大理/#go_out_safe(4)",
			"扬州/#go_out_safe(5)",
			"襄阳/#go_out_safe(6)",
			"取消/no_say"
		}
		Say("<color=green>狱卒<color>：本人可以送你到以下城市", getn(selTab), selTab)
	elseif  nStep > CITYWAR_MAX_STEP then	-- 被抓进来的已经够时间的
		chose_go_out()
	else
		Talk(1,"","<color=green>狱卒<color>：您还没有用完探视时间，只需坐在那里！")
		--chose_want_bail()
	end
end

function chose_go_out()
	local nValue = GetPKValue()
	local nPay = nValue * 80
	if nValue > 0 then
		Say("<color=green>狱卒<color>：你的PK值为"..nValue.."如果支付我"..nPay.."金，我可以帮你把你的PK值消除为0，同意吗？",
			2,
			"好，我要清洗PK/chose_go_out_xi",
			"没钱，还是算了/no_say")
			--"不需要，我自己来/chose_go_out_buxi")
	else
		chose_go_out_buxi()
	end
end

function chose_go_out_xi()
	local selTab = 
	{
		"汴京/#go_out_safe_xi(1)",
		"成都/#go_out_safe_xi(2)",
		"泉州/#go_out_safe_xi(3)",
		"大理/#go_out_safe_xi(4)",
		"扬州/#go_out_safe_xi(5)",
		"襄阳/#go_out_safe_xi(6)",
		"取消/no_say"
	}
	Say("<color=green>狱卒<color>：选择监狱把PK清洗了，我可以把你送到以下地方：", getn(selTab), selTab)
end

function chose_go_out_buxi()
	local selTab = 
	{
		"汴京/#go_out_safe(1)",
		"成都/#go_out_safe(2)",
		"泉州/#go_out_safe(3)",
		"大理/#go_out_safe(4)",
		"扬州/#go_out_safe(5)",
		"襄阳/#go_out_safe(6)",
		"取消/no_say"
	}
	Say("<color=green>狱卒<color>：我可以把你送到以下地方：", getn(selTab), selTab)
end

function chose_want_bail()
	local nValue = GetPKValue()
	if nValue > 0 then
		Say("<color=green>狱卒<color>：你现在PK值有"..nValue.."，当你出狱时，你的PK值随机减去"..(nValue*80).."点，你确定要出狱吗？",
			2,
			"离开监狱并清除PK/want_bail_xi",
			"我不需要/no_say")
--			"离开监狱，不需要清除PK/want_bail_buxi")
	else
		want_bail_buxi()
	end
end

function want_bail_xi()
	local _, nArrestPay = CustomDataRead("tongcitywar_arrest_tong")
	print(_, nArrestPay)
	if nArrestPay == nil then
		nArrestPay = 0
	end
	local nValue = GetPKValue() * 80
	local nPay = nArrestPay + nValue
	
	local selTab = 
	{
		"确定，我要去汴京/#go_outside_yes(1,"..nPay..",1)",
		"确定，我要去成都/#go_outside_yes(2,"..nPay..",1)",
		"确定，我要去泉州 /#go_outside_yes(3,"..nPay..",1)",
		"确定，我要去大理/#go_outside_yes(4,"..nPay..",1)",
		"确定，我要去扬州/#go_outside_yes(5,"..nPay..",1)",
		"确定，我要去襄阳/#go_outside_yes(6,"..nPay..",1)",
		"取消/no_say",
	}
	Say("<color=green>狱卒<color>：还没来得及休息一下，现在去支付<color=yellow>"..nArrestPay.."金<color>来清洗(随机) "..nValue.."点PK，确定吗？",getn(selTab),selTab)
end

function want_bail_buxi()	
	local _, nPay = CustomDataRead("tongcitywar_arrest_tong")
	if nPay == nil then
		nPay = 0
	end
	
	local selTab = 
	{
		"确定，我要去汴京/#go_outside_yes(1,"..nPay..",0)",
		"确定，我要去成都/#go_outside_yes(2,"..nPay..",0)",
		"确定，我要去泉州 /#go_outside_yes(3,"..nPay..",0)",
		"确定，我要去大理/#go_outside_yes(4,"..nPay..",0)",
		"确定，我要去扬州/#go_outside_yes(5,"..nPay..",0)",
		"确定，我要去襄阳/#go_outside_yes(6,"..nPay..",0)",
		"取消/no_say",
	}
	
	if nPay == 0 then
		Say("<color=green>狱卒<color>：并非休息时间，现在你必须支付保释金。但是，如果您没有70级，则无需保释金。",getn(selTab),selTab)
	else
		Say("<color=green>狱卒<color>：并非休息时间，你如果想出去，必须支付保释金<color=yellow>"..nPay.."金<color>，你确定要保释吗？",getn(selTab),selTab)
	end
end;

function go_outside_yes(index, nPay, subPK)
	if nPay == 0 then
		--地图对NewWorld作了限制，要填第四参数。权限设置参看\GameSvr\maps\god_power.ini配置文件
		CleanInteractive()
		NewWorld(tCityWarOutPos[index][1], tCityWarOutPos[index][2], tCityWarOutPos[index][3], 100)
		CustomDataRemove("tongcitywar_arrest_tong")
		RemoveTrigger(GetTrigger(CITYWAR_STEP_TRIGGER))
		SetPlayerRevivalPos(tCityWarOutPos[index][1], tCityWarOutPos[index][1])
	else
		if Pay(nPay * 10000) == 1 then
			if subPK == 1 then
				AddPKValue(-GetPKValue())
			end
			--地图对NewWorld作了限制，要填第四参数。权限设置参看\GameSvr\maps\god_power.ini配置文件
			CleanInteractive()
			NewWorld(tCityWarOutPos[index][1], tCityWarOutPos[index][2], tCityWarOutPos[index][3], 100)
			CustomDataRemove("tongcitywar_arrest_tong")
			RemoveTrigger(GetTrigger(CITYWAR_STEP_TRIGGER))
			SetPlayerRevivalPos(tCityWarOutPos[index][1], tCityWarOutPos[index][1])
			-- 把税收加到抓自己名捕的那个城市里
--			local szTong = CustomDataRead("tongcitywar_arrest_tong")
--			if szTong ~= nil and szTong ~= "" then
--				local nMoney = GetTongAttr("TONG_MONEY", szTong)
--				nMoney = nMoney + floor(nPay * 0.8)
--				if nMoney > 20000 then
--					nMoney = 20000
--				end
--				SetTongAttr("TONG_MONEY", szTong, nMoney)
--			end
		else
			Talk(1,"","<color=green>狱卒<color>：没钱还想保释？给我老老实实待着。")
		end
	end
end

function go_out_safe_xi(index)
	local nValue = GetPKValue()
	local nPay = nValue * 80
	if Pay(nPay * 10000) == 1 then
		RemoveTrigger(GetTrigger(CITYWAR_STEP_TRIGGER))
		CleanInteractive()
		AddPKValue(-nValue)
		NewWorld(tCityWarOutPos[index][1], tCityWarOutPos[index][2], tCityWarOutPos[index][3], 100)
		local szTong = CustomDataRead("tongcitywar_arrest_tong")
		if szTong ~= nil and szTong ~= "" then
			local nMoney = GetTongAttr("TONG_MONEY", szTong)
			nMoney = nMoney + floor(nPay * 0.8)
			if nMoney > 20000 then
				nMoney = 20000
			end
			SetTongAttr("TONG_MONEY", szTong, nMoney)
		end
	else
		Talk(1,"","<color=green>狱卒<color>：没钱还想保释？给我老老实实待着。")
	end
end

function go_out_safe(index)
	--地图对NewWorld作了限制，要填第四参数。权限设置参看\GameSvr\maps\god_power.ini配置文件
	RemoveTrigger(GetTrigger(CITYWAR_STEP_TRIGGER))
	CleanInteractive()
	NewWorld(tCityWarOutPos[index][1], tCityWarOutPos[index][2], tCityWarOutPos[index][3], 100)
end

function no_say()
end