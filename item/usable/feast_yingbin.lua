-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 药品珍品粽子脚本
-- 文件名：feast_zpzz.lua
-- Edited by 
-- 2020/12/09 AM 02:30
-- ======================================================
Include("\\script\\item\\usable\\feast_head.lua");

g_ITEM 			= {1, 1, 32, "迎宾宴"}
g_TSK_BIT_USEID 	= 3024 		-- BIT TASK
g_BIT 				= 6 			-- BIT
g_TIME 			= 10 		-- 药效10分钟
g_Trigger 			= {66, 2066}
g_Desc 				= "内外功点数防御增加60点，生命上限提高10%，生命上限增加1000点，承受伤害减半概率提高10%"
g_Effect 			= {1, "重伤后效果不消失"}


function OnUse(nItemIndex)
	local name 		= g_ITEM[4]
	local effect 		= g_Effect[1]
	local effectDesc 	= g_Effect[2]
	local triggerID 		= g_Trigger[1]
	local triggerNum 	= g_Trigger[2]
	local medicine 		= g_ITEM[3]
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

-- 退出对话，不做任何操作
function cancel_dialog()
end