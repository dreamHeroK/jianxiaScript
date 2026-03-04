-- Include("\\script\\task\\plant_tuoguan\\head.lua");
-- 召唤雇佣采集队的东东

USE_SHENNONG_NUMBER = 100

GOLD_PER_8_HOUR = 4

function GetPlayerSex()
	if GetSex() == 1 then
		return "大侠"
	else
		return "女侠"
	end
end

function OnUse()

	local nNpcCount = GetNpcCountNear()
	if nNpcCount > 100 then
		Say("这里采集的人太多了，"..GetPlayerSex().."还是去其他地方采集吧。", 0)
		return
	end

	Say(""..GetPlayerSex().."可以使用契约书和神农丹代理采集。",
		2,
		"使用神农丹代理采集/use_shennong",
		"结束对话/end_say");
end

function use_shennong()
	Say(GetPlayerSex().."需要使用多少神农丹给代理人采集？",
		4,
		"使用1个神农丹获得8小时的代理采集（需要"..GOLD_PER_8_HOUR.."金）/#yes_use(1)",
		"使用2个神农丹获得16小时的代理采集（需要"..(GOLD_PER_8_HOUR * 2).."金）/#yes_use(2)",
		"使用3个神农丹获得24小时的代理采集（需要"..(GOLD_PER_8_HOUR * 3).."金）/#yes_use(3)",
		"不使用代理采集/end_say")
end

function yes_use(nCount)
	if GetItemCount(2, 1, 343) < nCount then
		Say(GetPlayerSex().."背包的神农丹不足。", 0)
		return
	end
	
	if GetCash() < GOLD_PER_8_HOUR * 10000 * nCount then
		Say(GetPlayerSex().."好像没携带那么多金。", 0)
		return
	end
	
	SetTaskTemp(USE_SHENNONG_NUMBER, nCount)
	
	local tSkillList = GetUseableGatherSkillList()
	if tSkillList == nil then
		Say("不能在这里委托代理人采集。", 0)
		return
	end
	
	local tSay = {}
	if getn(tSkillList) == 0 then
		Say("您不能在此区域使用采集技能。", 0)
		return
	end
	
	if getn(tSkillList) > 1 then
		for index, value in tSkillList do
			tSay[index] = value[2].."/#sel_skill("..value[1]..")"
		end
		Say("这里物产丰富，"..GetPlayerSex().."需要委托代理人采集什么？", getn(tSay), tSay)
	elseif getn(tSkillList) == 1 then
		sel_skill(tSkillList[1][1])
	end
end

function sel_skill(nSkillID)
	local nFreeCount, nSameTypeFreeCount = GetFreeTishenGather(nSkillID)
	if nFreeCount == 0 then
		Say("不是不想拿雇主的钱，实在是人手不足啊！\n<color=red>（你已经委托了6个代理人）<color>", 0)
		return
	elseif nSameTypeFreeCount == 0 then
		Say("不是不想拿雇主的钱，实在是人手不足啊！\n<color=red>（你已经委托了这里的代理人）<color>", 0)
		return
	end
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("您的这个采集技能太低，不能在这里收集！", 0)
		return
	end
	
	local tSay = {}

	for i = 1, getn(t) do
		if i > 6 then
			tSay[i] = "下一页/#next_page("..nSkillID..")"
			break
		end
		-- 特例处理啊,来不及了!
		local nSss = strfind(t[i][1], "武当符石")
		local s123 = ""
		if nSss ~= nil then
			s123 = strsub(t[i][1], 1, nSss - 1).."门派符石"
		else
			nSss = strfind(t[i][1], "汴京符石")
			if nSss ~= nil then
				s123 = strsub(t[i][1], 1, nSss - 1).."城市符石"
			else
				s123 = t[i][1]
			end
		end
				
		tSay[i] = s123.."/#sel_item("..format("%q", s123)..","..t[i][2]..","..nSkillID..")"
	end
	
	if getn(tSay) == 0 then
		Say("一切都不是！", 0)
		return
	end
	
	tSay[getn(tSay)+1] = "我不想采集/end_say"
	
	Say(GetPlayerSex().."想委托采集哪种物品？", getn(tSay), tSay)
end

function next_page(nSkillID)
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("您的采集技能有点低，无法在此区域采集！", 0)
		return
	end
	
	local nIndex = 1
	local tSay = {}
	for i = 7, getn(t) do
		-- 特例处理啊,来不及了!
		local nSss = strfind(t[i][1], "武当符石")
		local s123 = ""
		if nSss ~= nil then
			s123 = strsub(t[i][1], 1, nSss - 1).."门派符石"
		else
			nSss = strfind(t[i][1], "汴京符石")
			if nSss ~= nil then
				s123 = strsub(t[i][1], 1, nSss - 1).."城市符石"
			else
				s123 = t[i][1]
			end
		end

		tSay[nIndex] = s123.."/#sel_item("..format("%q", s123)..","..t[i][2]..","..nSkillID..")"
		nIndex = nIndex + 1
	end
	
	if getn(tSay) == 0 then
		Say("一切都不是！", 0)
		return
	end
	
	tSay[nIndex] = "上一页/#sel_skill("..nSkillID..")"
	tSay[nIndex+1] = "我不想采集/end_say"
	
	Say(GetPlayerSex().."想委托采集哪种物品？", getn(tSay), tSay)
end

function sel_item(szItem, nMapLevel, nSkillID)
	
	Say(GetPlayerSex().."确定要委托采集<color=yellow>"..szItem.."<color>吗？",
		2,
		"确定/#start_gather("..nMapLevel..","..nSkillID..")",
		"取消/end_say")
end

function start_gather(nMapLevel, nSkillID)
	local nCount = GetTaskTemp(USE_SHENNONG_NUMBER)
	
	if GetItemCount(2, 1, 343) < nCount then
		Say(GetPlayerSex().."背包的神农丹不足。", 0)
		return
	end
	
	if GetCash() < GOLD_PER_8_HOUR * 10000 * nCount then
		Say(GetPlayerSex().."好像没携带那么多金。", 0)
		return
	end
	
	Pay(GOLD_PER_8_HOUR * 10000 * nCount)
	
	if DelItem(2,1,509,1) == 1 and DelItem(2,1,343,nCount) == 1 then
		--Msg2Player(nGerne, nDetail, nParticular)
		local nMaxTime = 8 * 3600
		StartTishenGather(nMapLevel, nSkillID, nMaxTime * nCount)
		
		local szSkillName = GetGatherSkillName(nSkillID)
		local szNpcName = GetName().."-"..szSkillName.."代理人"
		local szNpcMode = szSkillName
		if szNpcMode == "集灵" then
			szNpcMode = "抽丝"
		end
		-- createnpc
		local nMapID, nX, nY = GetWorldPos()
		local nIndex = CreateNpc(szNpcMode, szNpcName, nMapID, nX, nY, 7, 1, 1)
		SetNpcDir(nIndex, random(63))
		SetNpcLifeTime(nIndex, nMaxTime * nCount)
	else
		Say(GetPlayerSex().."没有契约书，不能代理采集。", 0)
	end
end

function end_say()
end
