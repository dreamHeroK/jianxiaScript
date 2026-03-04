Include("\\script\\isolate\\functions\\gtask\\handler.lua")
--ËùÓÐµÄÈÎÎñÉ±¹ÖµôÂä¶¼ÔÚÕâÀïÅäÖÃÁË£¬²»ÓÃÔÙµ¥¶ÀÅäÖÃ´¥·¢Æ÷Ö®Àà
Include("\\script\\task\\global_task\\runtime_data_stat.lua")

---------------------
--config
tNpcDeathCfg = {
	--nTaskId, nTaskName, {NpcInfo}, fn, {fnPara}
	{415, "LÊy l¹i vËt phÈm", {"Giang Hå Tiªu TiÓu §Çu Môc", 6300}, fn_award_items, {5,100,{ 
																		{"V¨n søc-§Çu mÊt linh khÝ",{2,1,31085,1,4},1,100}, 
																		{"V¨n søc-¸o mÊt linh khÝ",{2,1,31086,1,4},1,100}, 
																		{"V¨n søc-QuÇn mÊt linh khÝ",{2,1,31087,1,4},1,100}, 
																		{"V¨n søc-Giíi mÊt linh khÝ",{2,1,31088,1,4},1,100}, 
																		{"V¨n søc-Béi mÊt linh khÝ",{2,1,31089,1,4},1,100}, 
																	}
																} 
	},
	{418, "§o¹t Kim Tinh", {"Kim Linh ", 321}, fn_award_items, {1,100,{  {"Kim Tinh",{2,1,31091,1,4},1,100},   }}		},
	{430, "Phong V©n Kinh BiÕn", {"Tinh hoa Thiªn D­¬ng Giao", 6400}, fn_award_items, {1,100,{  {"MËt th­ Thiªn ¢m gi¸o",{2,1,31098,1,4},10,100},   }}		},
	{436, "§o¹t l¹i Bóa", {"Tªn trém bÝ Èn", 208}, fn_award_items, {1,100,{  {"Bóa cña M¹c NhÞ",{2,1,31102,1,4},1,100},   }}		},
	{446, "DiÖt ¸c quû", {"Vua ¸c Quû", 306}, fn_award_items, {1,100,{  {"Kh¨n Tay Cña Vua ¸c Quû",{2,1,31106,1,4},1,100},   }}		},
	{450, "Thö th¸ch cña Thõa T­íng", {"§¹i §ao Quan Th¾ng", 6007}, fn_award_items, {1,100,{  {"Th­ §Çu Hµng",{2,1,31108,1,4},1,50},   }}		},

--		Õ½¿ñÉý¼¶µÚ¶þÆÚÐÂÔö
	{469, "Khiªu chiÕn §­êng M«n L·o L·o (2)", {"Tiªu NhiÔm NguyÖt Thiªn ¢m Gi¸o", 7118}, fn_award_items, {1,100,{{"B¶n VÏ C¬ Quan", {2,1,31143,1,4}, 1, 100},}}},
	{475, "Khiªu chiÕn C¸i Bang Bang Chñ (2)", {"Nhai Th­îng S¬n TÆc", 6300}, fn_award_items, {1,100,{{"Tµi S¶n BÞ C­íp", {2,1,31145,1,4}, 50, 50},}}},
	
}







--never modify below
----------------------------------------------------------------------------
function gtask_npc_death_main(npcIdx, sName)
	local tCfg = tNpcDeathMap[sName]
	if tCfg then
		local nMyMapId = GetWorldPos()--¼ì²éÒ»ÏÂ±»É±¹ÖÎïËùÔÚµÄµØÍ¼ÊÇ·ñÂú×ãÒªÇó
		if nMyMapId >= 65536 then--¸±±¾£¬È¡Ä£°åID
			local nMapIndex = SubWorldID2Idx(nMyMapId)
			nMyMapId = GetMapTemplate(nMapIndex)
		end
		for i=1,getn(tCfg) do
			local t = tCfg[i]
			local nMapId = t[3][2]
			if nMapId == -1 or nMapId == nMyMapId then
				gt_add_runtime_stat("kill_boss", t[1], 0, 1)
				_fn_task_dispatch(t)
			end
		end
	end
end

--npc death event
-------------------------------------------------------------------------
function fn_make_npc_death_map()
	if not tNpcDeathCfg then
		error("cannnot call fn_make_npc_death_map without tNpcDeathCfg")
		return
	end
	tNpcDeathMap = {}
	for i=1,getn(tNpcDeathCfg) do
		local t = tNpcDeathCfg[i]
		local szNpcName = t[3][1]
		local tCfg = tNpcDeathMap[szNpcName] or {}
		tinsert(tCfg, t)
		tNpcDeathMap[szNpcName] = tCfg
	end
end

tNpcDeathMap = nil
fn_make_npc_death_map()