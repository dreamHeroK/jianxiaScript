Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\getrectangle_point.lua") --获得矩形点

tbGaiBang = {}
tbGaiBang.nMapId		= 209
tbGaiBang.trapscript_rugaibang	= "\\script\\中原一区\\丐帮\\trap\\进丐帮.lua"

tbGaiBang.tbDialogNpc	= 
{
	--丐帮相关
	{"丐帮门人","丐帮弟子",209,1701,3111,"\\script\\中原一区\\丐帮\\npc\\丐帮弟子.lua"},
--	{"丐帮净衣首席大弟子","丐帮首席大弟子",209,1535,3199,"\\script\\中原一区\\丐帮\\npc\\丐帮首席大弟子.lua"},
	{"丐帮副掌门","彭虏望",209,1530,3209,"\\script\\task\\faction_back_room\\npc_master.lua"},
	{"门派练功木桩","门派练功木桩",209,1585,3243},
	{"门派练功木桩","门派练功木桩",209,1590,3240},
	{"门派练功木桩","门派练功木桩",209,1593,3244},
	{"门派练功木桩","门派练功木桩",209,1589,3249},
}

function tbGaiBang:AddTrapRuGaiBang()
	if (self.nMapId >= 0) then
		for i = 1571, 1577 do
			AddMapTrap(self.nMapId, floor(i * 32), floor(3217 * 32), self.trapscript_rugaibang);
		end
	end
end