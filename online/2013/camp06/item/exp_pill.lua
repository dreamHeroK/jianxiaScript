-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 经验造化丹脚本
-- 文件名：exp_pill.lua
-- Edited by 
-- 2020/07/20 AM 07:31
-- ======================================================
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItemIndex)
	local selTab = {};
	local szTitle = ""

	local szTitle = format("使用一个经验造化丹可以直接增加1亿经验。确定要使用吗？")
	tinsert(selTab,"使用经验造化丹/change_exp");
	tinsert(selTab,"我再想想/nothing");
	Say(szTitle, getn(selTab), selTab)
end


function change_exp()
	if DelItem(2,95,2017,1) == 1 then
		gf_ModifyExp(100000000)
	else
		WriteLog("Change Error:\t"..GetName().." got 失败！");
		Talk(1,"OnUse","使用经验造化丹失败。")
		return
	end
end;