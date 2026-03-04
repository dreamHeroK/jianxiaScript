-- 真武手记
-- Ba & Bia
-- 2,114,120; 2,114,121
Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\book_appendix\\head.lua")

function OnUse(nItemIdx)
	local bookIdx = GetPlayerEquipIndex(itempart_book);
	if bookIdx == 0 then
		Talk(1, "", "你没有装备书籍")
		return
	end

	if nil == GetSubData(1, nItemIdx, enumCCDT_Item_Book_Appendix, -1) then
		Ba(nItemIdx, bookIdx, exchange); -- Ba
	else
		Bia(bookIdx, nItemIdx); -- Bia
	end
end

function Ba(toItem, fromItem, bSure)
	local g,d,p = GetItemInfoByIndex(fromItem);
	local exchange = g_tItemExchange[PackItemId(g,d,p)];
	if not exchange then
		return Talk(1, "", "秘籍合成条件不符合，不能进行秘籍合成!");
	end
	if IsReading() == 1 then
		return Talk(1, "", "正在进行阅读修炼，不能进行秘籍合成!");
	end
	if GetSubData(1, toItem, enumCCDT_Item_Book_Appendix, -1) then
		return Talk(1, "", format("[%s] 已包含附加物品，不能进行合成", GetItemName(toItem)));
	end
	if GetSubData(1, fromItem, enumCCDT_Item_Book_Appendix, -1) == nil then
		return Talk(1, "", format("[%s] 不包含附加物品，不能进行合成", GetItemName(fromItem)));
	end
	if not bSure then
		local tSel = {
			format("同意/#Ba(%d, %d, 1)", toItem, fromItem),
			"取消/nothing",
		}
		Say("请确认是否同意进行真武属性提取? 完成合成将消耗1个纪要。合成后将获得1个新的纪要。", 
			getn(tSel), tSel);
		return
	end
	if DelItemByIndex(toItem, 1) ~= 1 then return end
	local ret, newItem = gf_AddItemEx2(exchange[2][2],exchange[2][1]);
	if ret ~= 1 then
		return Talk(1, "", "[秘籍合成] [合成失败]! 请检查材料是否足够!");
	end
	WriteLog(format("[BookApp] [Ba] [Acc=%s, Role=%s] [Item=%s] [AttrLv=%s]", 
		GetAccount(), GetName(),GetItemName(fromItem), GetSubDataLog(1, fromItem, enumCCDT_Item_Book_Appendix, -1)))
	CloneSubData(1, fromItem, 1, newItem, enumCCDT_Item_Book_Appendix, -1);
	while (1 == DelSubData(1, fromItem, enumCCDT_Item_Book_Appendix, -1)) do end
	AddSubData(1, fromItem, enumCCDT_Item_Book_Appendix, g_Route2AppID[GetPlayerRoute()]);
	SyncItem2Client(fromItem);
	SyncItem2Client(newItem);
	--AddStatValue("bookapp_ba", 1);
end

function Bia(toItem, fromItem, bSure)
	if GetEquipLevel(toItem) < 99 then
		return Talk(1, "", "秘籍等级不足99，不能进行合成!!");
	end
	local g,d,p = GetItemInfoByIndex(toItem);
	local exchange = g_tItemExchange[PackItemId(g,d,p)];
	if not exchange then
		return Talk(1, "", "秘籍合成条件不符合，不能进行合成!");
	end
	local g,d,p = GetItemInfoByIndex(fromItem);
	if exchange[2][2][3] ~= p then
		return Talk(1, "", "颜色相同才能合成，不能进行合成!");
	end
	if GetSubData(1, fromItem, enumCCDT_Item_Book_Appendix, -1) == nil then
		return Talk(1, "", format("[%s] 不包含附加物品，不能进行合成", GetItemName(fromItem)));
	end
	if GetSubData(1, toItem, enumCCDT_Item_Book_Appendix, -1) == nil then
		return Talk(1, "", format("[%s] 缺少附加物品，不能进行合成", GetItemName(toItem)));
	end
	if not bSure then
		local tSel = {
			format("同意/#Bia(%d, %d, 1)", toItem, fromItem),
			"取消合成/nothing",
		}
		Say("请确认是否同意进行纪要属性粘贴? 完成合成将消耗当前纪要。", 
			getn(tSel), tSel);
		return
	end
	WriteLog(format("[BookApp] [Ba] [Acc=%s, Role=%s] [fromItem=%s] [AttrLv=%s]", 
		GetAccount(), GetName(),GetItemName(fromItem), GetSubDataLog(1, fromItem, enumCCDT_Item_Book_Appendix, -1)))
	WriteLog(format("[BookApp] [Ba] [Acc=%s, Role=%s] [toItem=%s] [AttrLv=%s]", 
		GetAccount(), GetName(),GetItemName(toItem), GetSubDataLog(1, toItem, enumCCDT_Item_Book_Appendix, -1)))
	while (1 == DelSubData(1, toItem, enumCCDT_Item_Book_Appendix, -1)) do end
	CloneSubData(1, fromItem, 1, toItem, enumCCDT_Item_Book_Appendix, -1);
	while (1 == DelSubData(1, fromItem, enumCCDT_Item_Book_Appendix, -1)) do end
	SyncItem2Client(toItem);
	if 1 ~= DelItemByIndex(fromItem, 1) then
		WriteLog(format("[BookApp] [Del Fail] [Acc=%s, Role=%s] [from=%s, to=%s]", 
			GetAccount(), GetName(), GetItemName(fromItem), GetItemName(toItem)));
		return
	end
	AddStatValue("bookapp_bia", 1);
end
