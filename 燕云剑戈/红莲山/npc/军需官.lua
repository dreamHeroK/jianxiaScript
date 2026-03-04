--云中军需管
Include("\\script\\missions\\yp\\biaotou_npc.lua");
Include("\\script\\missions\\yp\\biaoche_npc.lua");
g_NpcName = "<color=green>军需官<color>： "


function main()
	Say(""..g_NpcName.."大侠一路辛苦了!前方路途还很远，大供可以在我这里稍事休整再出发o我可为大侠修理镖车，将镖车耐久度回复至最大3大侠亦可在我这里尝试添加一些辎重。可能镖车会升级为高级镖车。但亦有可能会损不镖车造成镖车等级下降。我这小叼小驿站里辎重也不多。最多只能让大侠尝试5次。大侠可要三思后行哦! ",
		5,		
		"我要更换镖车/bt_Talk_7",
		"我要修理镖车/bt_REPAIR",
		"我要投保/bt_Talk_3",		
		"购买换镖令/bt_Talk_6",					
		"结束对话/nothing"
		);

end



