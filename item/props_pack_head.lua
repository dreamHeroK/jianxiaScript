-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 - 包裹道具释放类
-- 文件名：props_pack_head.lua
-- Edited by 
-- 2020/04/02 PM 18:32
-- ======================================================
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\dailogsay.lua")
	--参数
	--1	nPlayerIndex		避免出错，加入角色缓存
	--2	nItemIndex
	--3	gdp				获取新的道具信息
		--{
			--[1] g,
			--[2] d,
			--[3] p,
			--[4] num,
			--[5] 鉴定级别,
		--}
	--4	name		释放物品名称
	--5	room		需要背包空间(1,空间 2,负重)
	--6	dialog		私有对话(预留) 
	--7	condition	私有条件(预留) 

function UsePackToItem(nPlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
	if type(gdp) ~= "table" then
		return 0;
	end
	local nCount = gdp[4];
	local szTitle = "打开这个袋子，您可以获得"..nCount.."个<color=yellow>"..name.."<color>。要打开么？"
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