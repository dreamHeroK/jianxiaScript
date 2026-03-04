
-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 张伯汉的包袱
-- Edited by 
-- ==================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(765) == 1 then
		task_Talk_01();
		return
	end
end;

function task_Talk_01()
	if GetItemCount(2,0,144) < 1 then
		gf_AddItemEx({2,0,144,1}, "张伯汉的包袱", 1)
	end
	Create_NPC_Trigger()
	local nIndexNpc = GetTargetNpc();
	SetNpcLifeTime(nIndexNpc,0)	--消失
end;


function Create_NPC_Trigger()
	CreateTrigger(1, 2011, 2011*2);
	ContinueTimer(GetTrigger(2011*2));
end

function OnTimer()
	RemoveTrigger(GetRunningTrigger());
	local nNpcIdx = CreateNpc("张伯汉的包裹", "张伯汉的包裹 ", 107,1573,2939);
	SetNpcDeathScript(nNpcIdx,"\\script\\江南区\\武夷山\\npc\\张伯汉的包裹.lua");
end;
