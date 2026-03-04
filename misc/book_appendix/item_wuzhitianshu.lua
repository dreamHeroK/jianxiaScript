-- 贯通券 2,114,118
-- 升华秘籍
Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\book_appendix\\head.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

function OnUse(nItemIdx)
	onUse(nItemIdx);
end

function onUse(nItemIdx, bSure)
	local bookIdx = GetPlayerEquipIndex(itempart_book);
	if bookIdx == 0 then
        Talk(1, "", "角色未装备书籍部位")
		return
	end
	if IsReading() == 1 then
        return Talk(1, "", "正在进行修炼中，请先结束修炼再进行操作！");
	end
	local g,d,p = GetItemInfoByIndex(bookIdx);
	local exchange = g_tItemExchange[PackItemId(g,d,p)];
	if not exchange then
        return Talk(1, "", "当前装备的书籍不支持升级！");
	end
	if GetEquipLevel(bookIdx) < 99 then
        return Talk(1, "", "当前装备的书籍等级不足99级，不支持升级！");
	end
	--print(GetSubData(1, bookIdx, enumCCDT_Item_Book_Appendix, -1))
	if GetSubData(1, bookIdx, enumCCDT_Item_Book_Appendix, -1) then
        return Talk(1, "", format("[%s] 已经是升华状态，不支持再次升级", GetItemName(bookIdx)));
	end
	if not bSure then
		local tSel = {
            format("确定升级/#onUse(%d, 1)", nItemIdx),
            "取消/nothing",
        }
        Say("提示：是否确认升级当前装备的书籍？升级后将消耗1个无字天书。", 
            getn(tSel), tSel);
        return
    end
    
    if DelItemByIndex(nItemIdx, 1) ~= 1 then return end

	local bRet = AddSubData(1, bookIdx, enumCCDT_Item_Book_Appendix, g_Route2AppID[GetPlayerRoute()]);
	SyncItem2Client(bookIdx);
	if bRet >= 0 then
        Talk(1,"","升级成功！");
		AddRuntimeStat(39, 5, 0, 1)
	else
		AddItem(2,114,118,1)
        Talk(1,"","升级失败，请检查背包空间")
	end
	--Observer:onEvent(OE_BOOKAPP_UPGRADE, {book=bookIdx});
	--print("AddSubData result ", bRet, bookIdx, enumCCDT_Item_Book_Appendix, g_Route2AppID[GetPlayerRoute()])
	WriteLog(format("[BookApp] [ShenHua] [Acc=%s, Role=%s] [Book=%s]", GetAccount(), GetName(), GetItemName(bookIdx)));
	--AddStatValue("bookapp_upgrade", 1);
end
