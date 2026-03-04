Include("\\script\\online\\plant\\tree_head.lua");

function main()
	local npcIdx,npcModel,npcName = GetTriggeringUnit();
	if npcIdx == 0 then
		WriteLog("[般若树种]："..GetName().."浇灌, GetTriggeringUnit 1，返回值为0");
		return 0;
	end;
	local nNameLen = strlen(GetName());
	local bJudgeByName = 0;
	if GetName() == strsub(npcName,1,nNameLen) then
		bJudgeByName = 1;
	end;
	local bIsTree = 0;
	for i=1,getn(SMALLTREETYPE) do	--这个是用来检查目标NPC是不是树，不过感觉好像没什么意义
		if npcModel == SMALLTREETYPE[i][1] then
			bIsTree = 1;
			break;
		end;
	end;
	if bIsTree == 0 then
		SetNpcScript(npcIdx,"");
		WriteLog("[般若树种]：NPC:"..npcName.."原始文件错误");
		return 0;
	end;
	local npcTreeIndex = GetTargetNpc();
	if npcTreeIndex == 0 then
		 WriteLog("[般若树种]："..GetName().."浇灌, GetTargetNpc 返回值为0");
		 return 0;
	end;
	if bJudgeByName == 0 then
		if GetTime() - GetTask(TASK_PLANTTIME_SMALL) > TREELIFETIME or GetTask(TASK_PLANTTIME_SMALL) == 0 or npcTreeIndex ~= GetTask(TASK_TREEINDEX_SMALL) then
			Msg2Player("这不是你种的树");
			return 0;
		end;
	end;
	local nTreeGrow = GetTask(TASK_TREEGROW_SMALL);
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME_SMALL);
	if nTreeGrow < 3 then
		if nTimePassed < SMALLTREETYPE[nTreeGrow][3] then
			Talk(1,"",SMALLTREETYPE[nTreeGrow][2].."生长十分健康，暂不需要浇灌。不过不要跑太远，如果<color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME_SMALL)).."<color>后不浇灌的话，果树会缺水而死。距离下次浇灌时间还有<color=yellow>"..Get_Time_String(SMALLTREETYPE[nTreeGrow][3]-nTimePassed).."<color>。");
			return 0;
		end;
	end;
	local sSaySth = "";
	local selTab = {};
	if nTreeGrow == 3 then
		if nTimePassed < SMALLTREETYPE[nTreeGrow][3] then
			Talk(1,"",SMALLTREETYPE[nTreeGrow][2].."刚刚长成，不宜太快摘取，过<color=yellow>"..Get_Time_String(SMALLTREETYPE[nTreeGrow][3]-nTimePassed).."<color>后再摘取吧。");
			return 0;
		end;
		tinsert(selTab,"赶紧摘取，免得强人所夺/getfruit");
		tinsert(selTab,"再等等再摘/nothing");
		sSaySth = "太虚般若果树已经成熟，长出一个又大又鲜的仙果，是否摘取？如果<color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME_SMALL)).."<color>后不摘取的话，果树会自然死亡。";
	else
		tinsert(selTab,"浇灌(需要"..SMALLTREETYPE[nTreeGrow+1][4].."份露水)/givewater");
		tinsert(selTab,"再等等或许更好/nothing");
		sSaySth = SMALLTREETYPE[nTreeGrow][2].."正需露水滋润，要不要浇灌呢？如果<color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME_SMALL)).."<color>后不浇灌的话，果树会缺水而死。";
	end;
	
	Say(sSaySth,getn(selTab),selTab);
end;

function givewater()
	local nTreeGrow = GetTask(TASK_TREEGROW_SMALL);
	local npcTreeIndex = GetTask(TASK_TREEINDEX_SMALL);
	if npcTreeIndex == 0 then
		WriteLog("[般若树种]："..GetName().."浇水时间, TASK_TREEINDEX 任务变量为0");
		return 0;
	end;	
	if DelItem(2,0,351,SMALLTREETYPE[nTreeGrow+1][4]) ~= 1 then
		Talk(1,"","你没有露水，无法完成浇灌！");
		return 0;
	end;
	local MapID,MapX,MapY = GetNpcWorldPos(npcTreeIndex)
	SetNpcLifeTime(npcTreeIndex,0);
	SetNpcScript(npcTreeIndex,"");
	npcTreeIndex = CreateNpc(SMALLTREETYPE[nTreeGrow+1][1],GetName().."种下的"..SMALLTREETYPE[nTreeGrow+1][2],MapID,MapX,MapY);
	if npcTreeIndex == 0 then
		WriteLog("[般若树种]："..GetName().."浇水时，值返回到函数 CreateNpc 是0. 正确参数输入 CreateNpc:"..SMALLTREETYPE[nTreeGrow+1][1]..","..GetName().."种下的"..SMALLTREETYPE[nTreeGrow+1][2]..","..MapID..","..MapX..","..MapY);
	end;
	SetNpcLifeTime(npcTreeIndex,TREELIFETIME);
	SetNpcScript(npcTreeIndex,"\\script\\online\\plant\\small_tree_npc.lua")
	SetTask(TASK_TREEINDEX_SMALL,npcTreeIndex);
	SetTask(TASK_TREEGROW_SMALL,nTreeGrow+1);
	SetTask(TASK_PLANTTIME_SMALL,GetTime());
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME_SMALL);
	local nTreeGrow = GetTask(TASK_TREEGROW_SMALL);
	if nTreeGrow ==3 then
		StartTimeGuage("等待摘取",SMALLTREETYPE[nTreeGrow][3]-nTimePassed,0,1)			
	else
		StartTimeGuage("等待浇水",SMALLTREETYPE[nTreeGrow][3]-nTimePassed,0,1)	
	end
end;

function getfruit()
	if GetTask(TASK_TREEGROW_SMALL) == 3 then
		local npcTreeIndex = GetTargetNpc();
		if npcTreeIndex == 0 then
			 WriteLog("[般若树种]："..GetName().."摘取 GetTargetNpc 返回 0");
			 return 0;
		end;
		SetNpcScript(npcTreeIndex,"");
		SetNpcLifeTime(npcTreeIndex,0);
		SetTask(TASK_TREEINDEX_SMALL,0);
		SetTask(TASK_TREEGROW_SMALL,0);
		SetTask(TASK_PLANTTIME_SMALL,0);
		gl_aw_giveAward_1()
		SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 22));
	end;
end;

function nothing()

end;