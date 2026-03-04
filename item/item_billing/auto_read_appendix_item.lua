
Import("\\script\\lib\\define.lua")

MAX_HOUR = 30000
ADD_HOUR = 1

function OnUse()
	local nLeftTime = GetTask(TASKID_AUTO_READ_APPENDIX)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)
	local nMin = floor(mod(nLeftTime, 60))

	if nHour >= MAX_HOUR then
		Talk(1, "", format("Thêi gian C¬ Quan Nh©n tÝch lòy ®· ®¹t  %d giê, kh«ng thÓ dïng thªm.", MAX_HOUR));
		return
	end

	Say("Sö dông 1 Kh«i Lçi C¬ Quan Nh©n cã thÓ nhËn ®­îc 1 giê tu luyÖn ch©n vâ, hiÖn ®¹i hiÖp cßn "..nHour.." giê "..nMin.." phót tu luyÖn, x¸c ®Þnh sö dông chø?",
			2,
			"§óng vËy./yes_use",
			"Hñy bá./no_use"
	)
end

function yes_use()
	local nHave = GetItemCount(2,95,5830)
	local nLeftTime = GetTask(TASKID_AUTO_READ_APPENDIX)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)

	local nMax = min(ceil((MAX_HOUR - nHour) / ADD_HOUR), nHave)

	AskClientForNumber("use_cb", 1, nMax, "Sö dông bao nhiªu?")
end

function use_cb(nCount)
	local nTaskValue = GetTask(TASKID_AUTO_READ_APPENDIX)
	if DelItem(2, 95, 5830, nCount) == 1 then
		SetTask(TASKID_AUTO_READ_APPENDIX, nTaskValue + ADD_HOUR * 3600 * 18 * nCount)
		local nTime = floor(GetTask(TASKID_AUTO_READ_APPENDIX) / 18 / 60)
		local nHour = floor(nTime / 60)
		local nMin = floor(mod(nTime, 60))
		WriteLog(format("[Sö dông C¬ Quan Nh©n][Acc:%s Role:%s][Sö dông %d c¸i][Thêi gian tr­íc: %d][Thêi gian hiÖn t¹i: %d]",
				GetAccount(), GetName(), nCount, nTaskValue, GetTask(TASKID_AUTO_READ_APPENDIX)))
		Msg2Player("§¹i hiÖp sö dông C¬ Quan Nh©n, thêi gian tu luyÖn ch©n vâ lµ "..nHour.." giê "..nMin.." phót")
	end
end

function no_use()

end