Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\getrectangle_point.lua") --获得矩形点

tbEMei = {}
tbEMei.nMapId		= 303
tbEMei.trapscript_ruemei	= "\\script\\中原二区\\峨嵋\\trap\\进峨嵋.lua"
tbEMei.trapscript_yurongfeng	= "\\script\\中原二区\\峨嵋\\trap\\峨嵋to玉融峰.lua"

tbEMei.tbDialogNpc	= 
{
	--峨嵋相关
--	{"峨嵋佛家首席大弟子","峨嵋首席大弟子",303,1637,3167,"\\script\\中原二区\\峨嵋\\npc\\峨嵋首席大弟子.lua"},
	{"峨嵋副掌门","慧芸师太",303,1715,3059,"\\script\\task\\faction_back_room\\npc_master.lua"},
	
	{"门派练功木桩","门派练功木桩",303,1599,3238},
	{"门派练功木桩","门派练功木桩",303,1603,3242},
	{"门派练功木桩","门派练功木桩",303,1604,3235},
	{"门派练功木桩","门派练功木桩",303,1607,3237},
}

function tbEMei:AddTrapRuEMei()
	if (self.nMapId >= 0) then
		for i = 1625, 1630 do
			AddMapTrap(self.nMapId, floor(i * 32), floor(3180 * 32), self.trapscript_ruemei);
		end
	end
end

function tbEMei:AddTrapToYuRongFeng()
	if (self.nMapId >= 0) then
		for i = 3104, 3109 do
			AddMapTrap(self.nMapId, floor(1482 * 32), floor(i * 32), self.trapscript_yurongfeng);
		end
	end
end