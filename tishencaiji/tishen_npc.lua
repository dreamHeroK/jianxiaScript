-- 采集代理人  npc
-- 2006-8-21 12:12

TISHEN_INDEX_ID = 100
TISHEN_ITEM_VALUE = 101

MAX_PAGE_ITEM_COUNT = 5
GOLD_PER_8_HOUR = 4
MAX_TISHEN_COUNT = 20

function GetPlayerSex()
	if GetSex() == 1 then
		return "少侠"
	else
		return "女侠"
	end
end

function main()
	local szSay = 
	{
		"看看代理人采集了多少!/see_gather_item",
		"向代理人学习收集/learn_exp",
		"请采集代理人查找其他材料/manage_tishen",
		"雇用团队，我有事要问他们/employ_tishen",
		"委托人介绍/tishen_shuoming",
		"没事/end_say",
	}
	
	-- 计算获得的物品
	for i = 1, MAX_TISHEN_COUNT do
		CalcTishenGatherData(i)
	end
	
	-- 清空已到最高等级的替身采集经验
	for i = 1, MAX_TISHEN_COUNT do
		local nSkillID = GetTishenGatherSkillID(i)
		local nSkillLevel = GetLifeSkillLevel(0, nSkillID)
		if nSkillLevel >= 99 then		-- 到最高等级了
			AddTishenGatherExp(i)		-- 加不上，但是要清掉
		end
	end
	
	Say("这位"..GetPlayerSex().."你需要什么？", getn(szSay), szSay)	
end

function employ_tishen()
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem = IsTishenGatherExist(i)
		if szName then
			if nLastTime >= 0 then
				local nHour = floor(nLastTime / 3600)
				local nMin = floor(mod(nLastTime, 3600) / 60)
				local nSec = mod(nLastTime, 60)
				local szMsg =  " -- 采集  : "..szGatherItem.."  其它  : "..nHour.."时"..nMin.."分"..nSec.."秒"
				if strfind(GetName(), "/") == nil then
					szSay[ntIndex] = GetName().."-"..szName.."收件人"..szMsg.."/#employ_tishen_info("..i..")"
				else
					szSay[ntIndex] = szName.."收件人"..szMsg.."/#employ_tishen_info("..i..")"
				end
				ntIndex = ntIndex + 1
			end
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "离开/end_say"
		Say("不知道！"..GetPlayerSex().."哪个团队会采集？", getn(szSay), szSay)
	else
		Say("<color=green>采集代理人<color>:"..GetPlayerSex().."这里没有可雇佣的团队", 0)
	end
end

function employ_tishen_info(nIndex)
	Say("请问"..GetPlayerSex().."需要多长的代理采集时间?",
		4,
		"使用1个神农丹--收取8小时的雇佣采集 (收取费用"..GOLD_PER_8_HOUR.."金)/#yes_use(1,"..nIndex..")",
		"使用2个神农丹--收取16小时的雇佣采集 (收取费用"..(GOLD_PER_8_HOUR * 2).."金)/#yes_use(2,"..nIndex..")",
		"使用3个神农丹--收取24小时的雇佣采集 (收取费用"..(GOLD_PER_8_HOUR * 3).."金)/#yes_use(3,"..nIndex..")",
		"в ta xem/main")
end

function yes_use(nCount, nIndex)
	if GetItemCount(2, 1, 343) < nCount then
		Say(GetPlayerSex().."神农丹不足, 无法接收代理采集！", 0)
		return
	end
	
	if GetCash() < GOLD_PER_8_HOUR * 10000 * nCount then
		Say(GetPlayerSex().."没有足够的钱来雇用采集工人。", 0)
		return
	end

	local szName, nLastTime, szGatherItem = IsTishenGatherExist(nIndex)
	if szName == nil then
		return
	end
	
	local nTime = nCount * 8 * 3600 + nLastTime
	if nTime > 25 * 3600 then
		Say("!!"..GetPlayerSex().."请休息一会。 \n<color=red>(雇用一次不能超过25小时)", 0)
		return
	end
	
	Pay(GOLD_PER_8_HOUR * 10000 * nCount)
	
	if DelItem(2,1,343,nCount) == 1 then
		AddTishenGatherTime(nIndex, nCount * 8 * 3600)
		Msg2Player("代理采集"..szGatherItem.."已为你增加了 ["..(nCount * 8).."] 小时")
	end
end

function manage_tishen()
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem = IsTishenGatherExist(i)
		if szName then
			if nLastTime > 0 then
				local nHour = floor(nLastTime / 3600)
				local nMin = floor(mod(nLastTime, 3600) / 60)
				local nSec = mod(nLastTime, 60)
				local szMsg =  " -- 采集  : "..szGatherItem.."  左侧  : "..nHour.."时"..nMin.."分"..nSec.."秒"
				if strfind(GetName(), "/") == nil then
					szSay[ntIndex] = GetName().."-"..szName.."收件人"..szMsg.."/#manage_tishen_info("..i..")"
				else
					szSay[ntIndex] = szName.."收件人"..szMsg.."/#manage_tishen_info("..i..")"
				end
				ntIndex = ntIndex + 1
			end
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "离开/end_say"
		Say("不知道！"..GetPlayerSex().."哪个团队会采集？", getn(szSay), szSay)
	else
		Say("<color=green>采集代理人<color>:"..GetPlayerSex().."这里没有可雇佣的团队", 0)
	end
end

function manage_tishen_info(nIndex)
	SetTaskTemp(TISHEN_INDEX_ID, nIndex)
	
	local nSkillID = GetTishenGatherSkillID(nIndex)
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("您没有此收集技能，无法改变！", 0)
		return
	end
	
	local tSay = {}

	for i = 1, getn(t) do
		if i > 6 then
			tSay[i] = "下一页/#next_page("..nSkillID..")"
			break
		end
		tSay[i] = t[i][1].."/#sel_item("..format("%q", t[i][1])..","..t[i][2]..","..nSkillID..")"
	end
	tSay[getn(tSay)+1] = "如果你不想采集其它材料, 按部就班就行/end_say"
	Say("!!"..GetPlayerSex().."你想采集那种材料了?", getn(tSay), tSay)
end

function next_page(nSkillID)
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("您没有此收集技能，无法改变！", 0)
		return
	end
	
	local nIndex = 1
	local tSay = {}
	for i = 7, getn(t) do
		tSay[nIndex] = t[i][1].."/#sel_item("..format("%q", t[i][1])..","..t[i][2]..","..nSkillID..")"
		nIndex = nIndex + 1
	end
	
	local nIndexID = GetTaskTemp(TISHEN_INDEX_ID)
	tSay[nIndex] = "上一页/#manage_tishen_info("..nIndexID..")"
	tSay[nIndex+1] = "如果你不想采集其它材料, 按部就班就行/end_say"
	
	Say("!!"..GetPlayerSex().."你想采集那种材料了?", getn(tSay), tSay)
end

function sel_item(szItem, nMapLevel, nSkillID)

	Say("!!"..GetPlayerSex().."你确定要采集<color=yellow>"..szItem.."<color> 吗?",
		2,
		"是的/#change_gather("..nMapLevel..","..nSkillID..",\""..szItem.."\")",
		"错了/end_say")
end

function change_gather(nMapLevel, nSkillID, szItem)
	local nIndex = GetTaskTemp(TISHEN_INDEX_ID)
	local nRet = ChangeTishenGather(nIndex, nMapLevel, nSkillID)
	if nRet > 0 then
		local nActionName = GetGatherSkillName(nSkillID)
		Say("<color=green>采集代理人<color>:"..GetPlayerSex()..", 此"..nActionName.."采集团队采集物转换为<color=yellow>"..szItem.."<color>", 0)
	end
end

function see_gather_item()
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem = IsTishenGatherExist(i)
		if szName then
			local szMsg = ""
			if nLastTime <= 0 then
				szMsg = " -- 采集完毕"
			else
				local nHour = floor(nLastTime / 3600)
				local nMin = floor(mod(nLastTime, 3600) / 60)
				local nSec = mod(nLastTime, 60)
				szMsg =  " -- 采集  : "..szGatherItem.."  左侧  : "..nHour.."时"..nMin.."分"..nSec.."秒"
			end
			
			if strfind(GetName(), "/") == nil then
				szSay[ntIndex] = GetName().."-"..szName.."收件人"..szMsg.."/#seeinfo("..i..")"
			else
				szSay[ntIndex] = szName.."收件人"..szMsg.."/#seeinfo("..i..")"
			end
			ntIndex = ntIndex + 1
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "离开/end_say"
		Say("不知道！"..GetPlayerSex().."什么是你要收集的物品?", getn(szSay), szSay)
	else
		Say("<color=green>采集代理人<color>:"..GetPlayerSex().."这里没有可雇佣的团队", 0)
	end
end

function seeinfo(nIndex)
	local szSay = {}
	
	local t = GetTishenGatherItem(nIndex)
	local nCount = 1
	for index, value in t do
		if nCount > MAX_PAGE_ITEM_COUNT then
			szSay[nCount] = "下一页/#next_item_page("..nIndex..","..nCount..")"
			break
		end
		-- n = nGenre << 24 | nDetail << 16 | nParticular
		local n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
		szSay[nCount] = index.."["..(value.nItemCount).."] 个/#ggi("..n..","..(value.nItemCount)..","..nIndex..",\""..index.."\")"
		nCount = nCount + 1
	end
	
	if nCount > 1 then
		szSay[getn(szSay) + 1] = "获取所有物品/#get_all_gather_item("..nIndex..")"
		szSay[getn(szSay) + 1] = "离开/end_say"
		Say("这些人采集了以下物品。<color=yellow>(在拿取物品之前，请确认背包有足够的空间和重量)<color>", getn(szSay), szSay)
	else
		Say("这些人没有采集到物品, 请"..GetPlayerSex().."稍后再来!", 2, "返回/main", "离开/end_say")
	end
end

function next_item_page(nIndex, nPageIndex)
	local szSay = {}
	
	local t = GetTishenGatherItem(nIndex)
	local nCount = 1
	local nPos = 1
	for index, value in t do
		if nPos >= nPageIndex then
			if nCount > MAX_PAGE_ITEM_COUNT then
				szSay[nCount] = "下一页/next_item_page("..nIndex..","..(MAX_PAGE_ITEM_COUNT + nPageIndex)..")"
				break
			end
			-- n = nGenre << 24 | nDetail << 16 | nParticular
			local n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
			szSay[nCount] = index.."["..(value.nItemCount).."] 个/#ggi("..n..","..(value.nItemCount)..","..nIndex..",\""..index.."\")"
			nCount = nCount + 1
		end
		nPos = nPos + 1
	end
	
	if nCount > 1 then
		szSay[getn(szSay) + 1] = "获取所有物品/#get_all_gather_item("..nIndex..")"
		szSay[getn(szSay) + 1] = "离开/end_say"
		Say("这些人收集了以下物品。<color=yellow>(在拿取物品之前，请确认背包有足够的空间和重量)<color>", getn(szSay), szSay)
	end
end

function get_all_gather_item(nIndex)
	if IsBoxLocking() == 1 then
		Say("<color=green>采集代理人<color>: 你的背包已被锁定，无法获得采集团队采集的物品。",0)
		return
	end

	local n = 0
	local t = GetTishenGatherItem(nIndex)
	for index, value in t do
		n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
		local nRet = UpdateTishenGatherInfo(nIndex, n, value.nItemCount)
		if nRet > 0 then
			local str = format("准备接收 (%d,%d,%d) %d",value.nGenre,value.nDetail,value.nParticular,value.nItemCount)
			str = "[受托人收集]"..GetName()..str
			WriteLog(str)
			if AddItem(value.nGenre, value.nDetail, value.nParticular, value.nItemCount, 1) == 1 then
				WriteLog("[駓 th竎 thu th藀]"..GetName().."Nh薾 v藅 ph萴 th祅h c玭g")
			end
		else
			Msg2Player("你的背包已满或者超重")
			break
		end
	end
end

--get_gather_item
function ggi(nItem, nMax, nIndex, sz)
	if IsBoxLocking() == 1 then
		Say("<color=green>采集代理人<color>: 你的背包已被锁定，无法获得采集团队采集的物品。",0)
		return
	end

	SetTaskTemp(TISHEN_INDEX_ID, nIndex)
	SetTaskTemp(TISHEN_ITEM_VALUE, nItem)
	
	AskClientForNumber("get_gather_item_callback", 1, tonumber(nMax), "选择"..sz);
end

function get_gather_item_callback(nCount)
	local nTishenIndex = GetTaskTemp(TISHEN_INDEX_ID)
	local nItem = GetTaskTemp(TISHEN_ITEM_VALUE)
	if nTishenIndex == 0 or nItem == 0 then
		return
	end
	
	local t = GetTishenGatherItem(nTishenIndex)
	
	local nGatherCount = 0
	local nGenre = 0
	local nDetail = 0
	local nParticular = 0
	
	local n = 0
	for index, value in t do
		n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
		if n == nItem then
			nGatherCount = value.nItemCount
			nGenre = value.nGenre
			nDetail = value.nDetail
			nParticular = value.nParticular
			break
		end
	end
	
	if nCount > nGatherCount then
		nCount = nGatherCount
	end
	
	if nCount <= 0 then
		return
	end
	
	local nRet = UpdateTishenGatherInfo(nTishenIndex, n, nCount)
	if nRet > 0 then
		local str = format("准备接收 (%d,%d,%d) %d",nGenre,nDetail,nParticular,nCount)
		str = "[受托人收集]"..GetName()..str
		WriteLog(str)
		if AddItem(nGenre, nDetail, nParticular, nCount, 1) == 1 then
			WriteLog("[駓 th竎 thu th藀]"..GetName().."Nh薾 v藅 ph萴 th祅h c玭g")
		end
	else
		Msg2Player("你的背包已满或者超重")
	end
end

function learn_exp()
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem, nExp = IsTishenGatherExist(i)
		if szName then
			if strfind(GetName(), "/") == nil then
				szSay[ntIndex] = GetName().."-"..szName.."团队-获得经验: ["..nExp.."]/#see_exp_info("..i..")"
			else
				szSay[ntIndex] = szName.."团队-获得经验: ["..nExp.."]/#see_exp_info("..i..")"
			end
			ntIndex = ntIndex + 1
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "离开/end_say"
		Say("不知道！"..GetPlayerSex().."为哪些人采集经验？", getn(szSay), szSay)
	else
		Say("<color=green>采集代理人<color>:"..GetPlayerSex().."这里没有可雇佣的团队", 0)
	end
end

function see_exp_info(nIndex)
	local szSay = {}
	
	nRet = GetTishenGatherExp(nIndex)
	if nRet == nil then
		Say("<color=green>采集代理人<color>:"..GetPlayerSex().."没有此生活技能，无法从代理工人那获得经验", 0)
		AddTishenGatherExp(nIndex)	-- 没有此生活技能的Add操作为清空此类替身的经验
	elseif nRet > 0 then
		Say("<color=green>采集代理人<color>:"..GetPlayerSex().."可以接收"..nRet.."点采集经验值。 \n<color=red>注意：其他采集经验值将会被删除。<color>", 3, "获得采集经验/#yes_get_exp("..nIndex..")", "查看其他团队采集经验/learn_exp", "离开/end_say")
	else
		Say("这些人暂时没有采集经验, 请"..GetPlayerSex().."稍后再来!", 2, "返回/main", "离开/end_say")
	end
end

function yes_get_exp(nIndex)
	local nAddExp, nSkillName = AddTishenGatherExp(nIndex)
	Msg2Player("你获得了 ["..nAddExp.."] 点"..nSkillName.." 采集经验值 ")
end

function tishen_shuoming()
	Say("这位"..GetPlayerSex().."是否想了解有关代理人的更多信息？",
		4,
		"代理采集需要什么/wupinshuoming",
		"雇佣团队说明/duiwushuoming",
		"领取采集委托经验和物品说明/lingqushuoming",
		"返回/main")
end

function wupinshuoming()
	Say("想要代理采集需要托管和神农丹, 在需要托管的采集地图处使用契约书, 神农丹决定托管的期限。 在各大城市的杂货店处可购买契约书, 神农丹则需要在御街购买。",0)
end

function duiwushuoming()
	Say("使用契约书雇用团队，我们可以让他们采集指定的物品。 你可以去<color=green>采集代理人<color> 处查看雇佣了多少团队, 雇佣团队采集那些物品以及更改团队采集的物品。",0)
end

function lingqushuoming()
	Say("你可以去<color=green>采集代理人<color>查看采集情况, 采集的物品和采集技能经验值, 如果同时有2采集代理人在采集, 你获取了1位采集的技能经验, 那么另外一位采集人的技能经验将会被删除， 采集的物品不受此影响。",0)
end

function end_say()

end

