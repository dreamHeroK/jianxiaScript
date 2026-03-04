Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
if tGtTask:check_cur_task(924) == 1 then
	  Say("<color=green>辽国高手<color>：",
		1,
		"乖乖交出贡品！/gongpin")

end

end;

function gongpin()
	local npcIndexYg = ChangeNpcToFight(GetTargetNpc())
	SetNpcLifeTime(npcIndexYg,3*60); 
	SetNpcScript(npcIndexYg, "\\script\\中原一区\\汴京府东\\npc\\尸体消失.lua");
	
end