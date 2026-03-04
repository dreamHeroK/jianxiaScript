--线索默认对话
--created by lizhi
--2005-9-7 10:49

Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local nMapId, nX, nY = GetWorldPos();
	
	if tGtTask:check_cur_task(917) == 1 then			
		   if GetTask(3510) == 0 then
               Talk(3,"task_set_917","<color=green>线索<color>:....来者何人","盗墓的....","鬼将军快出来...弄死他!");
--		   else
--		       Talk(2,"","<color=green>书童<color>:谢谢你,我已经好多了,你先回去吧,我跟师弟走的慢....","嗯,下次找你们玩!");
		   end
		   return				
    else
	       Talk(1,"","看起来很不起眼的一个包裹!!");
    end;
end;

function task_set_917()
--	AddItem(2,0,718,1);
--	AddItem(2,0,719,1);
--	local nNpcIdx = CreateNpc("鬼将军任务", "鬼将军", GetWorldPos());
--	SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
	SetTask(3510,1);   --任务变量
--	SetTask(3419,0);   --任务变量
end;