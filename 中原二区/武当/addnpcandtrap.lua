Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\getrectangle_point.lua") --获得矩形点

tbWuDang = {}
tbWuDang.nMapId		= 312
tbWuDang.trapscript_ruwudang	= "\\script\\中原二区\\武当\\trap\\进武当.lua"

tbWuDang.tbDialogNpc	= 
{
	--武当相关
--	{"武当道家首席大弟子","武当首席大弟子",312,1824,3338,"\\script\\中原二区\\武当\\npc\\武当首席大弟子.lua"},
	{"武当门人","薛云铮",312,1873,3273,"\\script\\task\\faction_back_room\\npc_master.lua"},
	{"门派练功木桩","门派练功木桩",312,1931,3422},
	{"门派练功木桩","门派练功木桩",312,1935,3419},
	{"门派练功木桩","门派练功木桩",312,1939,3422},
	{"门派练功木桩","门派练功木桩",312,1934,3427},
}

function tbWuDang:AddTrapRuWuDang()
	if (self.nMapId >= 0) then
		for i = 1891, 1896 do
			AddMapTrap(self.nMapId, floor(i * 32), floor(3422 * 32), self.trapscript_ruwudang);
		end
	end
end