Include("\\script\\online\\plant\\tree_head.lua");
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\function\\vip_card\\vc_head.lua");

function OnUse()
--	if GetPlayerRoute() == 0 then
--		Talk(1,"","未加入门派的侠士不能使用般若种子");
--		return 0;
--	end;
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		Talk(1,"","您的背包空间不足");
		return
	end	
--	if checktime() == 0 then
--		Talk(1,"","现在灵气不盛，不利于仙树生长，还是等等再说。");
--		return 0;
--	end;
	if checkplace_maincity() == 0 then
		Talk(1,"","此处灵气不盛，恐怕仙树无法生长。");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_PLAN_SMALLTREE_DATE) < nDate then
		SetTask(TASK_PLAN_SMALLTREE_DATE,nDate);
		SetTask(TASK_PLAN_SMALLTREE_COUNT,0);	--每天种小树数清空
	end;
	if GetTask(TASK_PLAN_SMALLTREE_COUNT) >= PLANT_SMALL_TREE_LIMIT then
		Talk(1,"","今天你已经种了<color=yellow>"..PLANT_SMALL_TREE_LIMIT.."<color>颗般若仙树，还是明天再来吧。");
		return 0;
	end;
	local selTab = {
				"赶紧种下，免得耽误时辰/plant",
				"再等等或许更好/nothing",
				}
	Say("此处山水合宜，灵气冲天，正是种植仙树之处，是否要种？",getn(selTab),selTab)
end;


function plant()
	if checkplace_maincity() == 0 then
		Talk(1,"","此处灵气不盛，恐怕仙树无法生长。");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTime() - GetTask(TASK_PLANTTIME_SMALL) < TREELIFETIME and GetTask(TASK_PLANTTIME_SMALL) ~= 0 then
		Talk(1,"","您已成功种植1棵般若仙树");
		return 0;
	end;
	if GetItemCount(2,0,351) <= 0 then
		Talk(1,"","你没有露水，无法种植小般若树种！");
		return 0;
	end;
	DelItem(2,0,351,1);	--种下的时候也需要一个露水，这个和种大树不一样，种大树时种下的时候不需要露水，也是一个bug吧，不过用７个露水就可以种大树已经深入民心，现在也不好改了。
	if DelItem(2,0,504,1) == 1 then
		local MapID,MapX,MapY = GetWorldPos()
		local npcTreeIndex = CreateNpc(SMALLTREETYPE[1][1],GetName().."的"..SMALLTREETYPE[1][2],MapID,MapX,MapY)
		if npcTreeIndex == 0 then
			WriteLog("[种植般若种子]:"..GetName().."种植时，值返回到函数 CreateNpc 是 0. 正确参数输入 CreateNpc 是"..SMALLTREETYPE[1][1]..","..GetName().." tr錸g "..SMALLTREETYPE[1][2]..","..MapID..","..MapX..","..MapY);
		end;
		SetNpcLifeTime(npcTreeIndex,TREELIFETIME)
		SetTask(TASK_TREEINDEX_SMALL,npcTreeIndex);
		SetTask(TASK_TREEGROW_SMALL,1);
		SetTask(TASK_PLANTTIME_SMALL,GetTime());
		SetTask(TASK_PLAN_SMALLTREE_DATE,nDate);
		SetNpcScript(npcTreeIndex,"\\script\\online\\plant\\small_tree_npc.lua");
		SetTask(TASK_PLAN_SMALLTREE_COUNT,GetTask(TASK_PLAN_SMALLTREE_COUNT)+1);

		Say("请不要在果树长成之前离开当前地图，否则果树会死亡。这是您今天第<color=yellow>"..GetTask(TASK_PLAN_SMALLTREE_COUNT).."<color>次种太虚般若果树，您今天还可以种<color=yellow>"..(PLANT_SMALL_TREE_LIMIT-GetTask(TASK_PLAN_SMALLTREE_COUNT)).."<color>棵太虚般若果树。",0);		
		StartTimeGuage("等待浇水",SMALLTREETYPE[1][3],0,1)
	end;
end;

function OnEquip()
	return 0;
end;

function OnUnEquip()
	return 0;
end

