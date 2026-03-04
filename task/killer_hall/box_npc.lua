--date:2007-3-8
--author:yanjun
--describe:the script file of the box npc
Include("\\script\\task\\killer_hall\\killer_hall_head.lua");
function main()
	local nNpcIdx = GetTargetNpc();
	if nNpcIdx <= 0 then
		return 0;
	end;
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	if gf_GetDistance(nMapX,nMapY) > 10 then
		Msg2Player("离得太远了，走近点！");
		return 0;
	end;
--	if KH_Check_Skill_Level() == 0 then
--		Msg2Player("您的技能等级太低了，无法打开箱子");
--		return 0;
--	end;
	local sNpcName = GetNpcName(nNpcIdx);
	local nCurTime = GetTime();
	local nParam1 = GetUnitCurStates(nNpcIdx,1);	--记录时间
	local nParam2 = GetUnitCurStates(nNpcIdx,2);	--是否正在被使用
	local nTimeDiff = nCurTime - nParam1;
	if nParam2 ~= 1 or nTimeDiff > 60 then
		KH_SetUnit_CurStates(nNpcIdx,1,nCurTime)
		KH_SetUnit_CurStates(nNpcIdx,2,1)
		SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,nNpcIdx)
		DoWait(3,4,10)				--进入调用
	else
		Talk(1,"","已经有人使用了<color=red>"..sNpcName.."<color>(剩余时间：<color=yellow>"..(60-nTimeDiff).."秒<color>)。")
		return
	end
end;