-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 礼包一换多公共释放脚本
-- 文件名：newyear09_ib_item.lua
-- Edited by 
-- 2020/06/02 AM 11:52
-- ======================================================
Include("\\script\\lib\\awardtemplet.lua");

tTab =
{
	{2, 95, 213, "金蛋宝箱", 10, "金蛋", 2, 95, 189, "箱子"},
	{2, 95, 215, "一袋小金锤", 1, "小金锤", 2, 95, 187, "袋子"},
	{2, 95, 216, "一盒小金锤", 10, "小金锤", 2, 95, 187, "盒子"},
	{2, 95, 217, "一箱小金锤", 100, "小金锤", 2, 95, 187, "箱子"},
	{2, 95, 218, "一盒放大镜", 3, "放大镜", 2, 95, 187, "盒子"},
	{2, 95, 232, "小包新年许愿砂", 50, "新年许愿砂", 2, 95, 231, "包裹"},
	{2, 95, 233, "大包新年许愿砂", 250, "新年许愿砂", 2, 95, 231, "包裹"},
	{2, 95, 670, "天阴银符印包裹", 10, "天阴银符印", 2, 95, 619, "包裹"},
	{2, 95, 671, "天阴金符印包裹", 10, "天阴银符印", 2, 95, 620, "包裹"},
	{2, 95, 882, "小包换镖令", 10, "天阴银符印", 2, 95, 918, "包裹"},
	{2, 95, 883, "大包换镖令", 100, "天阴银符印", 2, 95, 918, "包裹"},
	{2, 95, 1516, "小包斗魄令", 50, "斗魄令", 2, 95, 1511, "包裹"},
	{2, 95, 1517, "大包斗魄令", 250, "斗魄令", 2, 95, 1511, "包裹"},
	{2, 95, 2086, "小包天骄令", 100, "天骄令", 2, 97, 236, "包裹"},
	{2, 95, 2087, "大包天骄令", 500, "天骄令", 2, 97, 236, "包裹"},
	{2, 114, 57, "小包龙魂玉", 10, "龙魂玉", 2, 114, 56, "包裹"},
	{2, 114, 58, "大包龙魂玉", 100, "龙魂玉", 2, 114, 56, "包裹"},
}

function OnUse(nItemIndex)
	local sItemName, G, D, P = get_item_info(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[1] == G and value[2] == D and value[3] == P then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end

	gdp = {tTab[nTabIndex][7],tTab[nTabIndex][8],tTab[nTabIndex][9],tTab[nTabIndex][5],1}
	name = tTab[nTabIndex][6]
	tip = tTab[nTabIndex][10]
	room = {1,100}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, tip, room, dialog, condition)
end


function UsePackToItem(nPlayerIndex, nItemIndex, gdp, name, tip,room, dialog, condition)
	if type(gdp) ~= "table" then
		return 0;
	end
	local nCount = gdp[4];
	local szTitle = "打开这个"..tip.."，您可以获得"..nCount.."个<color=yellow>"..name.."<color>。要打开么？"
	if dialog ~= nil and dialog ~= "" then
		szTitle = dialog[1]
	end
	local tbOpt = {}
		tinsert(tbOpt, {"是的", open_pack_item, {nPlayerIndex, nItemIndex, gdp, name, room, dialog, condition}})
		tinsert(tbOpt, {"暂时不打开一一取消", cancel_dialog})
	CreateNewSayEx(szTitle, tbOpt)
end

function open_pack_item(nPlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
	PlayerIndex = nPlayerIndex;
	if condition ~= 0 then
		return 0;
	end
	local sItemName, g, d, p = get_item_info(nItemIndex)
	local nFreeRoom		= GetFreeItemRoom()
	local nFreeWeight		= GetMaxItemWeight() - GetCurItemWeight()
	local nCurNeedRoom	= room[1]
	local nCurNeedWeight	= room[2]
	if type(gdp) ~= "table" then
		return 0;
	end
	local nCount = gdp[4];
	local strNeedWeight = {"您的背包负重不足{"..nCurNeedWeight.."}，不能获得{"..name.."}！",}
	local strNeedRoom = {"您的背包空间不足{"..nCurNeedRoom.."}，不能获得{"..name.."}！",}
	local strGetTitle = {"您获得了"..nCount.."个{"..name.."}！",}
	local strGetMsg = "您获得了["..name.."]×"..nCount
	local strGetError = {"未知错误，不能获得{"..name.."}！",}

	if dialog ~= nil and dialog ~= "" then
		strNeedWeight = {dialog[2]}
		strNeedRoom = {dialog[3]}
		strGetTitle = {dialog[4]}
		strGetMsg = dialog[5]
		strGetError = {dialog[6]}
	end
	-- 负重
	if nFreeWeight < nCurNeedWeight then
		local szTalk = strNeedWeight
		TalkEx("", szTalk);
		return 0
	end
	-- 空间
	if nFreeRoom < nCurNeedRoom then
		local szTalk = strNeedRoom
		TalkEx("", szTalk);
		return 0
	end

	if (DelItem(g, d, p, 1) == 1) then
		if gdp[5] ~= nil then
			add_flag = AddItem(gdp[1], gdp[2], gdp[3], nCount, gdp[5])
		else
			add_flag = AddItem(gdp[1], gdp[2], gdp[3], nCount)
		end
		if add_flag == 0 then	-- 如果有错误没有给出来，补偿一个包
			AddItem(g, d, p, 1)
			WriteLog("["..strLog.."]\ItemPropsPack Error:\t"..GetName().."释放"..sItemName.."错误，已返回一个"..sItemName.."！");
		else
			local szTalk = strGetTitle
			TalkEx("", szTalk);
			Msg2Player(strGetMsg);
			WriteLog("["..strLog.."]\ItemPropsPack:\t"..GetName().."释放"..sItemName.."获得了"..nCount.."个"..name);
		end
	else
		local szTalk = strGetError
		TalkEx("", szTalk);
		WriteLog("["..strLog.."]\ItemPropsPack Error:\t"..GetName().."释放"..sItemName.."参数错误！");
	end

end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

-- 退出对话，不做任何操作
function cancel_dialog()
end;