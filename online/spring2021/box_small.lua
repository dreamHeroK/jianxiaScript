Include("\\script\\online\\spring2021\\head.lua")

function main()
	local nCurNpcIndex = GetTargetNpc()
	if (nCurNpcIndex == 0) then
		return
	end
	local nWait = 30 - (GetTime() - GetUnitCurStates(nCurNpcIndex, 6))
	if nWait > 0 then
		Talk(1,"","等待"..nWait.."秒才能拾取小年兽!")
		return 0
	end

	if GetBit(GetTask(TASK_YEARS_BIT), OpenBoxFlag) == 1 then
		Talk(1,"",format("您正在拾取小年兽，不要贪得无厌哦"));
		return
	end	

	local nDailyCount = PlayerFunLib:GetTaskDaily(TASKID_OPEN_BOX)

	if nDailyCount >= 20 then
		Talk(1,"","你今天已经拾取了20个小年兽，明儿再来吧！");
		return
	end
	if (DelItem(2,95,52, 1) == 1) then
		SetTask(TASK_YEARS_BIT, SetBit(GetTask(TASK_YEARS_BIT), OpenBoxFlag, 1));
		CastState("state_fetter", 100, 18*5, 1, 9999);
		ProgressSlot(5 * 18)
		SetNpcLifeTime(nCurNpcIndex, 0)
		SetNpcScript(nCurNpcIndex, "")
		SetDeathScript("\\script\\online\\spring2021\\player_death.lua")
		PlayerFunLib:AddTaskDaily(TASKID_OPEN_BOX, 1)
	else
		Talk(1,"","您好像没有携带藏宝箱钥匙。");
		return
	end
end

-- 开启结束以后的回调函数
function OnProgressCallback()
	sp_BoxAward()
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;
