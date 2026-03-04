Include("\\script\\online\\plant\\tree_head.lua");

--******************************************************
--	CAY BAT NHA TO
--******************************************************

function main()
	local npcIdx,npcModel,npcName = GetTriggeringUnit();
	if npcIdx == 0 then
	--	WriteLog("[般若树种]："..GetName().."浇灌, GetTriggeringUnit 1，返回值为0");
		return 0;
	end;
	local nNameLen = strlen(GetName());
	local bJudgeByName = 0;
	if GetName() == strsub(npcName,1,nNameLen) then
		bJudgeByName = 1;
	end;
	local bIsTree = 0;
	for i=1,getn(TREETYPE) do
		if npcModel == TREETYPE[i][1] then
			bIsTree = 1;
			break;
		end;
	end;
	if bIsTree == 0 then
		SetNpcScript(npcIdx,"");
	--	WriteLog("[般若树种]：NPC:"..npcName.."原始文件错误");
		return 0;
	end;
	Create_Map_Trigger();
	local npcTreeIndex = GetTargetNpc();
	if npcTreeIndex == 0 then
	--	 WriteLog("[般若树种]："..GetName().."浇灌, GetTargetNpc 返回值为0");
		 return 0;
	end;
	if bJudgeByName == 0 then
		if GetTime() - GetTask(TASK_PLANTTIME) > TREELIFETIME or GetTask(TASK_PLANTTIME) == 0 or npcTreeIndex ~= GetTask(TASK_TREEINDEX) then
			Msg2Player("这不是你种的树");
			return 0;
		end;
	end;
	local nTreeGrow = GetTask(TASK_TREEGROW);
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME);
	if nTreeGrow < 6 then
		if nTimePassed < TREETYPE[nTreeGrow][3] then
			Talk(1,"",TREETYPE[nTreeGrow][2].."生长十分健康，暂不需要浇灌。不过不要跑太远，如果<color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME)).."<color>后不浇灌的话，果树会缺水而死。距离下次浇灌时间还有<color=yellow>"..Get_Time_String(TREETYPE[nTreeGrow][3]-nTimePassed).."<color>。");
			return 0;
		end;
	end;
	local sSaySth = "";
	local selTab = {};
	if nTreeGrow == 6 then
		if nTimePassed < TREETYPE[nTreeGrow][3] then
			Talk(1,"",TREETYPE[nTreeGrow][2].."刚刚长成，不宜太快摘取，过<color=yellow>"..Get_Time_String(TREETYPE[nTreeGrow][3]-nTimePassed).."<color>后再摘取吧。");
			return 0;
		end;
		tinsert(selTab,"赶紧摘取，免得强人所夺/getfruit");
		tinsert(selTab,"再等等再摘/nothing");
		sSaySth = "太虚般若果树已经成熟，长出一个又大又鲜的仙果，是否摘取？如果<color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME)).."<color>后不摘取的话，果树会自然死亡。";
	else
		tinsert(selTab,"浇灌(需要"..TREETYPE[nTreeGrow+1][4].."份露水)/givewater");
		tinsert(selTab,"再等等或许更好/nothing");
		sSaySth = TREETYPE[nTreeGrow][2].."正需露水滋润，要不要浇灌呢？如果<color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME)).."<color>后不浇灌的话，果树会缺水而死。";
	end;
	
	Say(sSaySth,getn(selTab),selTab);
end;

function givewater()
	local nTreeGrow = GetTask(TASK_TREEGROW);
	local npcTreeIndex = GetTask(TASK_TREEINDEX);
	if npcTreeIndex == 0 then
	--	WriteLog("[般若树种]："..GetName().."浇水时间, TASK_TREEINDEX 任务变量为0");
		return 0;
	end;	
	if DelItem(2,0,351,TREETYPE[nTreeGrow+1][4]) ~= 1 then
		Talk(1,"","你没有露水，无法完成浇灌！");
		return 0;
	end;
	local MapID,MapX,MapY = GetNpcWorldPos(npcTreeIndex)
	SetNpcLifeTime(npcTreeIndex,0);
	SetNpcScript(npcTreeIndex,"");
	npcTreeIndex = CreateNpc(TREETYPE[nTreeGrow+1][1],GetName().."种下的"..TREETYPE[nTreeGrow+1][2],MapID,MapX,MapY);
	if npcTreeIndex == 0 then
--		WriteLog("[般若树种]："..GetName().."浇水时，值返回到函数 CreateNpc 是0. 正确参数输入 CreateNpc:"..TREETYPE[nTreeGrow+1][1]..","..GetName().."种下的"..TREETYPE[nTreeGrow+1][2]..","..MapID..","..MapX..","..MapY);
	end;
	SetNpcLifeTime(npcTreeIndex,TREELIFETIME);
	SetNpcScript(npcTreeIndex,"\\script\\online\\plant\\tree_npc.lua")
	SetTask(TASK_TREEINDEX,npcTreeIndex);
	SetTask(TASK_TREEGROW,nTreeGrow+1);
	SetTask(TASK_PLANTTIME,GetTime());
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME);
	local nTreeGrow = GetTask(TASK_TREEGROW);
	if nTreeGrow ==6 then
		StartTimeGuage("等待摘取",TREETYPE[nTreeGrow][3]-nTimePassed,0,1)			
	else
		StartTimeGuage("等待浇水",TREETYPE[nTreeGrow][3]-nTimePassed,0,1)	
	end
end;

function getfruit()
	if GetTask(TASK_TREEGROW) == 6 then
		local npcTreeIndex = GetTargetNpc();
		if npcTreeIndex == 0 then
		--	 WriteLog("[般若树种]："..GetName().."摘取 GetTargetNpc 返回 0");
			 return 0;
		end;
		
		local nDate =  tonumber(date("%y%m%d%H"))
		SetNpcScript(npcTreeIndex,"");
		SetNpcLifeTime(npcTreeIndex,0);
		SetTask(TASK_TREEINDEX,0);
		SetTask(TASK_TREEGROW,0);
		SetTask(TASK_PLANTTIME,0);
		SetDeathScript("");
	--	WriteLogEx("般若树种", "摘取完成");
		gl_aw_giveAward_2()
		SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 23));
	end;
end;

function nothing()

end;