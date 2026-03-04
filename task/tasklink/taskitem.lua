--日常任务头文件
Include("\\script\\task\\richangrenwu\\head.lua");
tTaskItemName = 
{
	{"北绿林令",2,0,399},
	{"逐影枪",2,0,400},
	{"绝情石",2,0,401},
	{"外院总管腰牌",2,0,402},
	{"内院总管腰牌",2,0,403},
	{"越女剑",2,0,404},
	{"庄主金印",2,0,405},
	{"长老指环",2,0,406},
}

function main()
	local npcIndex,npcModel,npcName = GetTriggeringUnit();
	if npcIndex == 0 then
		return 0;
	end;
     --是否完成团队日常任务
	local nDate = tonumber(date("%y%m%d"));
    	if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
        	SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        	SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
    	end
     local nTeamTask = GetGlbValue(DAILY_TASK_0912_TEAM_TASK);
	local nTaskValue = GetTask(345);
--	if nTaskValue == 0 and  nTeamTask == 0 and GetTask(DAILY_TASK_0912_TEAM_TASK_ID) == 0 then
--		return 0;
--	end;
	if nTaskValue > 0 then		
		if tTaskItemName[nTaskValue][1] ~= npcName  then
			Talk(1,"","这东西不对!");
			return 0;
		end;
	elseif nTeamTask > 0 and GetTask(DAILY_TASK_0912_TEAM_TASK_ID) > 0 then
		if DALIY_TASK_0912_TEAM_TASK_LIST[nTeamTask][3] ~= npcName then
			Talk(1,"","这东西不对!");
			return 0;			
		end
		nTaskValue = nTeamTask
	elseif GetTask(1537) == 11 or GetTask(1537) == 17 or GetTask(1537) == 29 then
		if npcName == "北绿林令" then
			nTaskValue = 1
		elseif npcName == "逐影枪" then
			nTaskValue = 2
		elseif npcName == "绝情石" then
			nTaskValue = 3
		else
			return 0;
		end
	else
		return 0;
	end		
		
	local selTab = {
			"马上捡起来/#pickup("..npcIndex..","..nTaskValue..")",
			"我再想想吧/nothing",
			}
	Say("这就是师傅要我们带回来的东西？?",getn(selTab),selTab);
end;

function pickup(npcIndex,ItemNum)	
	local npcName = GetNpcName(npcIndex) or ""	
	if npcName == nil or  npcName == "" then
		Talk(1,"","该物品已被其他人捡起来了！");
		return 0;
	end
	SetNpcLifeTime(npcIndex,0);
	SetNpcScript(npcIndex,"");
	local nRetCode = AddItem(tTaskItemName[ItemNum][2],tTaskItemName[ItemNum][3],tTaskItemName[ItemNum][4],1);
	if nRetCode == 1 then
		Msg2Player("您获得了"..tTaskItemName[ItemNum][1])
	end;
	if DAILY_TASK_0912_SWITCH == 1 then
            is_he_finish_the_team_task(npcName);
     end
	WriteLog("[重复任务]:"..GetName().."获得"..tTaskItemName[ItemNum][1]..". AddItem 返回值为："..nRetCode);
end;

function nothing()

end;