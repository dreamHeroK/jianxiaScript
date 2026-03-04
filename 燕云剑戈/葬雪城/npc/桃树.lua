
Include("\\script\\task\\global_task\\gtask_head.lua");

--Include("\\script\\pop\\2012\\peach_seed_item.lua");
function main(NpcIndex)
	if tGtTask:check_cur_task(928) == 1 then
		local npcID = GetTargetNpc();
		if GetItemCount(2,96,130) < 5 then
			SetNpcLifeTime(npcID,0);
	        nNpcIndex = CreateNpc("桃花树","桃树",GetWorldPos());--原地重生一颗
	        SetNpcScript(nNpcIndex,"\\script\\北区\\葬雪城\\npc\\桃树.lua");     
			AddItem(2,96,130,1)
		end
		
	end
	if tGtTask:check_cur_task(947) == 1 then
		local npcID = GetTargetNpc();
		if GetItemCount(2,96,130) < 5 then
			SetNpcLifeTime(npcID,0);
	        nNpcIndex = CreateNpc("桃花树","桃树",GetWorldPos());--原地重生一颗
	        SetNpcScript(nNpcIndex,"\\script\\北区\\葬雪城\\npc\\桃树.lua");
			AddItem(2,96,130,1)
		end
	end

--	6010	Tv	3514	5	3			种植5颗桃树
	
end;