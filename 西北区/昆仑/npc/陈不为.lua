-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\system_switch_config.lua")
Include("\\script\\task\\faction_back_room\\npc_master.lua");
g_szThisFile = "\\script\\西北区\\昆仑\\npc\\陈不为.lua";	--默认值
g_szInforHeader = "<color=green>陈不为<color>：";	--默认值
g_nBackRoomEntryType = 1;	--入口类型，分两种。1表示从师傅处进入，2表示从道具处进入

function main()
	if IsSMMSHstemOpen() ~= 1 then
		Talk(1,"","当前尚未开启");
		return 
	end	
	backroom_main();
end