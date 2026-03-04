-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 通缉任务传信烟火文件                 
-- Edited by starry night                                 
-- 2005/11/28 PM 17:40                                    
                                                          
-- ======================================================

--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

function OnUse() 

	local nMapID = GetWorldPos();
	
	if GetPKEnmityState() > 0 then
		Talk(1,"end_dialog","在PK状态下，无法使用传信烟火。")
		return
	end	

	if GetFightState() == 1 and nMapID < 700 then
		Say("您确定要召唤一个刺客吗？",
				2,
				"是的/yes",
				"稍后再说/no")
	else
		Talk(1,"","这个东西只能在城外使用！");
	
	end;
end;

function yes()
	if GetPKEnmityState() > 0 then
		Talk(1,"end_dialog","在PK状态下，无法使用传信烟火。")
		return
	end	
	if GetFightState() ~= 1 then
		Talk(1,"","这个东西只能在城外使用！");
		return
	end

	local nLastUseTime = GetTask(TASK_USEYANHUO_TIME);
	local nNowTime = GetTime();
	local nTime = nNowTime - nLastUseTime;
	local nRemainTime = nTime;
	local strTime = "";
		
		nTime = 900 - nTime;
		
		if nTime < 0 then
			nTime = 0;
		end;
		
		strTime = TurnTime(nTime);
		
		if nRemainTime < 900 then
			Say("使用间隔<color=yellow>15<color>分钟（剩下 "..strTime.."）。",0);
			return
		end;
	
	local nDelOk = DelItem(2,1,203,1,1);
	
		if nDelOk ~=1 then 
			return
		end;
		
		DoFireworks(808,1);--烟花效果
	
	local nTopKillerName,nTopKillerMode = GetTopKillerData();
	local nMapID,nWx,nWy = GetWorldPos(); 
	local nTopKillerIndex = CreateNpc(nTopKillerMode,nTopKillerName,nMapID,nWx,nWy,-1,1,1,100);
	
		SetTask(TASK_USEYANHUO_TIME,nNowTime);
		--设置在该地图生成杀手生存时间为一小时	
		SetNpcLifeTime(nTopKillerIndex,3600);  
		--设置顶级杀手脚本
		SetNpcScript(nTopKillerIndex,"\\script\\task\\killer\\killer_talk_top.lua");
		TaskTip("在60分钟内击败这个刺客！"); 
	
end;

function no()

end;