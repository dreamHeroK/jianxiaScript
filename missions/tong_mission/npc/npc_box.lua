--create date:2007-07-25 15:57
--author:yanjun
--describe:关卡奖励宝箱
Include("\\script\\missions\\tong_mission\\main_function.lua");

function main()
	local nNpcIdx = GetTargetNpc();
	if nNpcIdx <= 0 then
		return 0;
	end;
	if GetTaskTemp(TSK_TEMP_HELPER) == 1 then
		Talk(1,"","外援不能拾起宝箱。");
		return 0;
	end;
	local nCurJob = IsTongMember();
	if nCurJob <= 0 or nCurJob > 3 then
		Talk(1,"","宝藏箱必须由长老和帮主打开。");
		return 0;
	end;
	local nParam2 = GetUnitCurStates(nNpcIdx,2);	
	local nStage = GetUnitCurStates(nNpcIdx,1);	
	local nNeedRoom = 2;
	if nStage == MAX_STAGE then
		nNeedRoom = 7;	--第6关需要7个空间
	end;
	if gf_JudgeRoomWeight(nNeedRoom,50,"") == 0 then
		return 0;
	end;
	if nParam2 ~= 1 then	--如果未被拾取
		TM_SetUnitCurStates(nNpcIdx,2,1);	--设置已被拾取
		SetNpcLifeTime(nNpcIdx,0);
		AddItem(2,0,740+nStage-1,2);
		if nStage == MAX_STAGE then	--如果是第6关，则再给1至5关的箱子各1个
			for i=1,5 do
				AddItem(2,0,740+i-1,1);
			end;
			Msg2MSAll(MISSION_ID,GetName().."打开第"..nStage.."关宝箱，获得了7个紫光阁宝箱");
		else
			Msg2MSAll(MISSION_ID,GetName().."打开第"..nStage.."关宝箱，获得了2个紫光阁宝箱");
		end;
		SetMissionV(MV_GET_BOX,0);
		SendTongMessage(GetName().."捡起了第"..nStage.."关宝箱");
		WriteLog("[紫光阁]:"..GetName().."捡起了第"..nStage.."关宝箱");
	end;
end;