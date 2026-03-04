Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\getrectangle_point.lua") --获得矩形点

tbShaoLin = {}
tbShaoLin.nMapId		= 204
tbShaoLin.trapscript_rushaolin	= "\\script\\中原一区\\少林\\trap\\进丐帮.lua"

tbShaoLin.tbDialogNpc	= 
{
	--少林相关
--	{"少林武宗首席大弟子","少林首席大弟子",204,1590,3198,"\\script\\中原一区\\少林\\npc\\少林首席大弟子.lua"},
	{"少林首座","玄空",204,1645,3270,"\\script\\task\\faction_back_room\\npc_master.lua"},
	{"门派练功木桩","门派练功木桩",204,1510,3244},
	{"门派练功木桩","门派练功木桩",204,1513,3248},
	{"门派练功木桩","门派练功木桩",204,1517,3245},
	{"门派练功木桩","门派练功木桩",204,1514,3241},
}

function tbShaoLin:AddTrapRuShaoLin()
	if (self.nMapId >= 0) then
		for i = 1571, 1577 do
			AddMapTrap(self.nMapId, floor(i * 32), floor(3217 * 32), self.trapscript_rushaolin);
		end
	end
end