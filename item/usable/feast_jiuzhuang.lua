-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 九转逍遥丹脚本
-- 文件名：feast_jiuzhuang.lua
-- Edited by 
-- 2020/12/09 AM 02:30
-- ======================================================
Include("\\script\\item\\usable\\feast_head.lua");

g_JIUZHUAN = {
	[1] = {1, 0, 277, "九转逍遥丹（力根）", "力量提高70点；根骨提高70点"},
	[2] = {1, 0, 278, "九转逍遥丹（力身）", "力量提高70点；身法提高70点"},
	[3] = {1, 0, 279, "九转逍遥丹（力洞）", "力量提高70点；洞察提高70点"},
	[4] = {1, 0, 280, "九转逍遥丹（力内）", "力量提高70点；内功提高70点"},
	[5] = {1, 0, 281, "九转逍遥丹（内根）", "内功提高70点；根骨提高70点"},
	[6] = {1, 0, 282, "九转逍遥丹（内身）", "内功提高70点；身法提高70点"},
	[7] = {1, 0, 283, "九转逍遥丹（内洞）", "内功提高70点；洞察提高70点"},
	[8] = {1, 0, 284, "九转逍遥丹（身根）", "身法提高70点；根骨提高70点"},
	[9] = {1, 0, 285, "九转逍遥丹（身洞）", "身法提高70点；洞察提高70点"},
	[10] = {1, 0, 286, "九转逍遥丹（洞根）", "洞察提高70点；根骨提高70点"},
}

g_TSK_BIT_USEID 		= 3024 		-- BIT TASK
g_BIT 					= 5 			-- BIT
g_TIME 				= 5 			-- 药效5分钟
g_Trigger 				= {65, 2065}
g_Effect 				= {1, "重伤后效果不消失"}


function OnUse(nItemIndex)
	local nType = get_item_type(nItemIndex);
	if nType == 0 then
		Talk(1,"","您使用了错误的药品！");
		return 0;
	end;
	local name 			= g_JIUZHUAN[nType][4]
	local medicine 		= g_JIUZHUAN[nType][3]
	local g_Desc 		= g_JIUZHUAN[nType][5]
	local effect 		= g_Effect[1]
	local effectDesc 	= g_Effect[2]
	local triggerID 		= g_Trigger[1]
	local triggerNum 	= g_Trigger[2]
	local time 		= g_TIME
	local strTitle = "<color=green>"..name.."<color>："
	local selTab = {};
	local szTitle = format("%s使用%s有如下效果：有效时间：<color=green>%d分钟<color>；<color=red>（%s）<color>\n  <color=Green2>%s<color>\n", strTitle, name, time, effectDesc, g_Desc)
	tinsert(selTab, format("使用%s/#open_pack_usable(%d, %d, %d, %d, %d, %d, %d)", name, nItemIndex, medicine, time, effect, g_BIT, triggerID, triggerNum));
	tinsert(selTab,"结束对话/cancel_dialog");
	Say(szTitle, getn(selTab), selTab)
end

function OnTimer()
	local nBitUse = GetBit(GetTask(g_TSK_BIT_USEID), g_BIT); -- 标记是否使用过
	if nBitUse == 1 then
		SetTask(g_TSK_BIT_USEID, SetBit(GetTask(g_TSK_BIT_USEID), g_BIT, 0));
		RemoveTrigger(GetTrigger(g_Trigger[2]))
	end
end

function get_item_type(nItemIndex)
	local genre = GetItemGenre(nItemIndex)
	local detail = GetItemDetail(nItemIndex)
	local particular = GetItemParticular(nItemIndex);
	for i=1,getn(g_JIUZHUAN) do
		if genre == g_JIUZHUAN[i][1] and detail == g_JIUZHUAN[i][2] and particular == g_JIUZHUAN[i][3] then
			return i;
		end;
	end;
	return 0;
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end