Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\getrectangle_point.lua") --获得矩形点

tbWuDu = {}
tbWuDu.nMapId		= 407
tbWuDu.trapscript_ruwudu	= "\\script\\西南区\\五毒教\\trap\\入五毒教.lua"

tbWuDu.tbDialogNpc	= 
{
	--五毒相关
	{"五毒掌门新","白莹莹",407,1615,3182,"\\script\\西南区\\五毒教\\npc\\白莹莹.lua"},
	{"西南苗人","勾册",407,1572,3159,"\\script\\西南区\\五毒教\\npc\\勾册.lua"},
	{"西南男性","方猿",407,1549,3184,"\\script\\西南区\\五毒教\\npc\\方猿.lua"},
	{"五毒教主","尤榕",407,1643,3233,"\\script\\西南区\\五毒教\\npc\\尤榕.lua"},
	{"五毒教徒","西图",407,1606,3279,"\\script\\西南区\\五毒教\\npc\\西图.lua"},
	{"西南绸缎庄老板","柳新竹",407,1606,3220,"\\script\\西南区\\五毒教\\npc\\柳新竹.lua"},
	{"五毒副教主","吴言",407,1594,3171,"\\script\\西南区\\五毒教\\npc\\吴言.lua"},
	{"五毒护法","熊立",407,1551,3265,"\\script\\西南区\\五毒教\\npc\\熊立.lua"},
	{"五毒教徒","泰光",407,1556,3216,"\\script\\西南区\\五毒教\\npc\\泰光.lua"},
	{"游方医生","医者",407,1604,3219,"\\script\\西南区\\五毒教\\npc\\医者.lua"},
--	{"五毒邪侠首席大弟子","五毒首席大弟子",407,1604,3199,"\\script\\西南区\\五毒教\\npc\\五毒首席大弟子.lua"},
	{"中原储物柜","物品保管人",407,1621,3249,"\\script\\西南区\\五毒教\\npc\\物品保管人.lua"},
	{"门派练功木桩","门派练功木桩",407,1560,3278},
	{"门派练功木桩","门派练功木桩",407,1554,3287},
	{"门派练功木桩","门派练功木桩",407,1562,3296},
	{"门派练功木桩","门派练功木桩",407,1569,3290},
}

function tbWuDu:AddTrapRuWudu()
	if (self.nMapId >= 0) then
		for i = 1585, 1591 do
			AddMapTrap(self.nMapId, floor(i * 32), floor(3287 * 32), self.trapscript_ruwudu);
		end
	end
end