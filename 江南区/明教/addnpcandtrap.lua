Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\getrectangle_point.lua") --获得矩形点

tbMingJiao = {}
tbMingJiao.nMapId		= 152
tbMingJiao.trapscript_quanzhou	= "\\script\\江南区\\明教\\trap\\明教to泉州府西.lua"

tbMingJiao.tbDialogNpc	= 
{
	--明教相关
	{"方腊","方腊",152,1452,3008,"\\script\\江南区\\明教\\npc\\方腊.lua"},
	{"侯盾","侯盾",152,1508,2956,"\\script\\江南区\\明教\\npc\\侯盾.lua"},
	{"王寅","王寅",152,1560,3025,"\\script\\江南区\\明教\\npc\\王寅.lua"},
	{"司行方","司行方",152,1455,3132,"\\script\\江南区\\明教\\npc\\司行方.lua"},
	{"邓元觉","邓元觉",152,1284,2748,"\\script\\江南区\\明教\\npc\\邓元觉.lua"},
	{"厉天闰","厉天闰",152,1397,3059,"\\script\\江南区\\明教\\npc\\厉天闰.lua"},
	{"方七佛","方七佛",152,1480,3038,"\\script\\江南区\\明教\\npc\\方七佛.lua"},
	{"方百花","方百花",152,1686,3284,"\\script\\江南区\\明教\\npc\\方百花.lua"},
	{"方百花","出关传送人",153,1779,3452,"\\script\\task\\practice\\出关传送人.lua"},
	{"中原储物柜","物品保管人",152,1508,3074,"\\script\\江南区\\明教\\npc\\物品保管人.lua"},
	{"明教圣战首席大弟子","明教首席大弟子",152,1462,3020,"\\script\\江南区\\明教\\npc\\明教圣战首席大弟子.lua"},
	{"明教圣战首席大弟子","司行方",105,1412,3191,"\\script\\江南区\\泉州府西\\npc\\司行方.lua"},
	{"石宝","石宝",152,1349,2870,"\\script\\task\\faction_back_room\\npc_master.lua"},
	{"门派练功木桩","门派练功木桩",105,1416,3188},
	{"门派练功木桩","门派练功木桩",105,1423,3182},
	{"门派练功木桩","门派练功木桩",105,1416,3175},
	{"门派练功木桩","门派练功木桩",105,1412,3180},
}


function tbMingJiao:AddTrapQuanzhou()

	if (self.nMapId >= 0) then
		for i = 1, 15 do
			AddMapTrap(self.nMapId, floor((1710+i)*32), floor((3334-i)*32), self.trapscript_quanzhou);
		end
	end
end