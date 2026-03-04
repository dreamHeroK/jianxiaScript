Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\lib\\writelog.lua");

function OnDeath(Launcher)
	if GetTime() - GetTask(TASK_PLANTTIME) > TREELIFETIME then
		SetDeathScript("");	--设置死亡脚本为空
		SetTask(TASK_TREEINDEX,0);	--
		SetTask(TASK_TREEGROW,0);	--
		SetTask(TASK_PLANTTIME,0);		
		return 0;
	end;
	local nTreeGrow = GetTask(TASK_TREEGROW);
	KillerIndex = NpcIdx2PIdx(Launcher);
	OldPlayerIndex = PlayerIndex;
	local sName = GetName();
	SetDeathScript("");	--设置死亡脚本为空
	SetNpcLifeTime(GetTask(TASK_TREEINDEX),0);	--树消失掉
	SetNpcScript(GetTask(TASK_TREEINDEX),"");
	SetTask(TASK_TREEINDEX,0);	--
	SetTask(TASK_TREEGROW,0);	--
	SetTask(TASK_PLANTTIME,0);
	WriteLogEx("Trong cay Bat Nha", "Mat cay");
	PlayerIndex = KillerIndex;
	if PlayerIndex > 0 then
		if AddItem(2,0,398,1) == 1 then
			Msg2Player(TREETYPE[nTreeGrow][2].."消失并变回种子，您迅速拿起种子");
		end;
		sName = GetName();
		PlayerIndex = OldPlayerIndex;
		Msg2Player(TREETYPE[nTreeGrow][2].."消失并变回种子，种子也被抢走了。");
	end;
end;