Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\lib\\writelog.lua");
Include("\\script\\function\\vip_card\\vc_head.lua");


function OnUse()
	Create_Map_Trigger();
	if GetPlayerRoute() == 0 then
		Talk(1,"","未加入门派的侠士不能使用般若种子");
		return 0;
	end;
	if checktime() == 0 then
		Talk(1,"","现在时辰不对，灵气不盛，不利于仙树生长，还是等等再说（每日10点-凌晨1点）。");
		return 0;
	end;
	if checkplace() == 0 then
		Talk(1,"","此处灵气不盛，恐怕仙树无法生长。");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_PLAN_BIGTREE_DATE) < nDate then
		SetTask(TASK_PLAN_BIGTREE_COUNT,0);	--每天种小树数清空
		SetTask(TASK_PLAN_BIGTREE_DATE,nDate);
	end;
	if GetTask(TASK_PLAN_BIGTREE_COUNT) >= PLANT_BIG_TREE_LIMIT then
		Talk(1,"","今天你已经种了<color=yellow>"..PLANT_BIG_TREE_LIMIT.."<color>颗般若仙树，还是明天再来吧。");
		return 0;
	end;
	local selTab = {
				"赶紧种下，免得耽误时辰/plant",
				"再等等或许更好/nothing"
				}
	Say("此处山水合宜，灵气冲天，正是种植仙树之处，是否要种？",getn(selTab),selTab)
end;

--请不要在果树长成之前离开当前地图，否则果树会死亡。这是您今天第<color=yellow>1<color>次种太虚般若果树，您今天还可以种<color=yellow>7<color>棵太虚般若果树。
function plant()
	if checktime() == 0 then
		Talk(1,"","现在灵气不盛，不利于仙树生长，还是等等再说。");
		return 0;
	end;
	if checkplace() == 0 then
		Talk(1,"","此处灵气不盛，恐怕仙树无法生长。");
		return 0;
	end;
	local nMapId, nX, nY = GetWorldPos();
	if nMapId == 301 then
	nDistEast = gf_DistanceBetweenPoints(nMapId, nX, nY, 301, 1491, 2982);  
	if nDistEast ~= 0 and nDistEast >= 120 then
	   Talk(1,"","此处灵气不盛，请往中间种植仙树");
	   return 0;
	end;
	end
	local nDate = tonumber(date("%y%m%d"));
	if GetTime() - GetTask(TASK_PLANTTIME) < TREELIFETIME and GetTask(TASK_PLANTTIME) ~= 0 then
		Talk(1,"","您已成功种植1棵般若仙树");
		return 0;
	end;
	if DelItem(2,0,398,1) == 1 then
		local MapID,MapX,MapY = GetWorldPos()
		local npcTreeIndex = CreateNpc(TREETYPE[1][1],GetName().."种下的"..TREETYPE[1][2],MapID,MapX,MapY)
		if npcTreeIndex == 0 then
			WriteLog("[种植般若种子]:"..GetName().."种植时，值返回到函数 CreateNpc 是 0. 正确参数输入 CreateNpc 是"..TREETYPE[1][1]..","..GetName().."种下的"..TREETYPE[1][2]..","..MapID..","..MapX..","..MapY);
		end;

		SetNpcLifeTime(npcTreeIndex,TREELIFETIME)
		SetTask(TASK_TREEINDEX,npcTreeIndex);
		SetTask(TASK_TREEGROW,1);
		SetTask(TASK_PLANTTIME,GetTime());
		SetNpcScript(npcTreeIndex,"\\script\\online\\plant\\tree_npc.lua");
		SetDeathScript("\\script\\online\\plant\\playerdeath.lua");
		SetTask(TASK_PLAN_BIGTREE_DATE,nDate);
		SetTask(TASK_PLAN_BIGTREE_COUNT,GetTask(TASK_PLAN_BIGTREE_COUNT)+1);
		Say("请不要在果树长成之前离开当前地图，否则果树会死亡。这是您今天第<color=yellow>"..GetTask(TASK_PLAN_BIGTREE_COUNT).."<color>次种太虚般若果树，您今天还可以种<color=yellow>"..(PLANT_BIG_TREE_LIMIT-GetTask(TASK_PLAN_BIGTREE_COUNT)).."<color>棵太虚般若果树。",0);
		StartTimeGuage("等待浇水",TREETYPE[1][3],0,1)
		local nMapID = GetWorldPos();
		if nMapID == 301 then
			WriteLogEx("成都府西", "正确的种植太虚般若果树位置");
		elseif nMapID == 504 then
			WriteLogEx("成都府西", "错误的种植太虚般若果树位置");
		end
--		Msg2SubWorld("大侠"..GetName().."正在"..TREEPLACE[nMapID].."（"..floor(MapX/8).."/"..floor(MapY/16).."）种植般若仙树，各位大神前去围观。");
--		AddLocalCountNews("大侠"..GetName().."正在"..TREEPLACE[nMapID].."（"..floor(MapX/8).."/"..floor(MapY/16).."）种植般若仙树，各位大神前去围观。", 1);
	end;
end;

function OnEquip()
	return 0;
end;

function OnUnEquip()
	return 0;
end

