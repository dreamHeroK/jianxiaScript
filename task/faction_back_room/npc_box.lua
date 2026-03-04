--create date:2007-12-21 16:49
--author:yanjun
--describe:关卡奖励宝箱
Include("\\script\\task\\faction_back_room\\back_room_function.lua");

function main()
	if GetTask(TSK_WC_FAIL_TIMES) >= MAX_FAILURE_TIMES then
		Talk(1,"","本周你已经闯关了<color=yellow>"..MAX_FAILURE_TIMES.."<color>次，已无法打开宝箱。");
		return 0;
	end;
	local nNpcIdx = GetTargetNpc();
	if nNpcIdx <= 0 then
		return 0;
	end;
	if gf_JudgeRoomWeight(1,20,"") == 0 then
		return 0;
	end;
	local nDiff = GetUnitCurStates(nNpcIdx,1);	--宝箱对应的关卡	
	local nStage = GetUnitCurStates(nNpcIdx,2);	--宝箱对应的关卡
	local nParam3 = GetUnitCurStates(nNpcIdx,3);
	if nParam3 ~= 1 then	--如果未被拾取
		gf_SetUnitCurState(nNpcIdx,3,1);	--设置已被拾取
		local nCurDiff = BR_GetCurDiff();	--宝箱对应的关卡的下一关。因为创建宝箱后，当前关卡将会被置为下一关
		local nCurStage = BR_GetCurStage();	--宝箱对应的关卡的下一关
		BR_SaveRecord(nCurDiff,nCurStage);	--拾取宝箱后保存进度为下一关
		SetNpcLifeTime(nNpcIdx,0);
		BR_GetBoxAward(nDiff,nStage);
	end;
end;