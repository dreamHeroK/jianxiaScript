-- ====================== 文件信息 ====================== 
-- 剑侠情缘onlineII 通缉任务杀手对话脚本                  
-- Edited by starry night                                 
-- 2005/09/05 PM 16:21                                    
-- ======================================================
--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

function main()
	local npcName = GetTargetNpcName();
	if npcName==nil or npcName=="" then npcName = "杀手"; end;	
	Say("<color=green>"..npcName.."<color>: 小子瞅啥了，没见过帅哥吗？你再瞅，信不信不宰了你？",
		2,
		"我就是瞅了，你来宰我啊，我好怕怕！/Killer_Fight",
		"对不起，我只是路过！/Killer_Exit");
end;


function Killer_Fight()
	local npcName = GetTargetNpcName();
	local npcID = GetTargetNpc();
	local nKillerID = GetTask(TASK_KILLER_NPCINDEX_ID);
	local nTask_State = GetTask(TASK_KILLER_STATE_ID);
	local nPlayerName = GetPlayerSex();
		
	if npcID == nKillerID and nTask_State == 1 then
		--10%几率不战而胜
		if random(1,100)>90 then
			Say("<color=green>"..npcName.."<color>："..nPlayerName.."大爷饶命啊，我错了~这东西留给您了~~~跑路~~~~！.",0);
			SetTask(TASK_KILLER_STATE_ID,2);--完成任务设置变量值为2
			TaskTip("恭喜你完成了杀手任务!");
			--移除时间触发器
			RemoveTrigger(GetTrigger(500));
			SetNpcScript(npcID,"");--撤销该Npc所挂脚本
			SetNpcLifeTime(npcID,0);
--			if random(1,100) > 94 then
--				AddItem(2,1,195,1,1);
--			end;
		else
			Say("<color=green>"..npcName.."<color>：我就不信邪了！",0);
			SetNpcScript(npcID, "\\script\\task\\killer\\killer_fight.lua");
			ChangeNpcToFight(npcID);
		end;
		
	else
		Say("<color=green>"..npcName.."<color>: 滚一边去，大爷今天心情好不想宰你!",0);
	end;
	
end;


function Killer_Exit()

end;
	