Include("\\script\\结婚\\marriage_head.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(10,10) == 0 then
		Talk(1,"","您的背包空间或负重不够，无法开启！");
		return 0;
	end;
	local nLeftTime = GetItemParam(nItemIdx,0);
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_para = GetTask(TASK_WEDDING_FIELD)
	if nLeftTime > 2 or nLeftTime < 0 then
		Talk(1,"","错误数据，请联系客服！");
		WriteLog("[请帖包日志]:"..GetName().."请帖开启日志, nLeftTime:"..nLeftTime);
		return 0;
	end;
	add_invitation(10,task_date,task_para);
	SetItemParam(nItemIdx,0,nLeftTime-1);		
	if nLeftTime == 1 then
		DelItemByIndex(nItemIdx,1);
	else
		Msg2Player("您还可以使用"..(nLeftTime-1).."次邀请卡");
	end;
end;