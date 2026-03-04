-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 五毒教NPC勾册Script
-- By StarryNight
-- 2006/02/09 PM 14:12
-- ======================================================
Include("\\script\\task\\faction_back_room\\npc_master.lua");
g_szThisFile = "\\script\\西南区\\五毒教\\npc\\勾册.lua";	--默认值
g_szInforHeader = "<color=green>勾册<color>：";	--默认值
g_nBackRoomEntryType = 1;	--入口类型，分两种。1表示从师傅处进入，2表示从道具处进入

function main()
	backroom_main();
end;
