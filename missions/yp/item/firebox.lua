--圣物
Include("\\script\\missions\\yp\\award.lua")

function main()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local m = GetWorldPos();
	if tMainMapID[nCamp] == nil or tMainMapID[nCamp][1] ~= m then
		Talk(1,"","此圣物只有本势力的玩家才能拾取！");
		return 0;
	end 
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	SetTask(TASK_FIELD_PVP_FIREBOX_NUM,GetTask(TASK_FIELD_PVP_FIREBOX_NUM)+1);
	local nNum = GetTask(TASK_FIELD_PVP_FIREBOX_NUM);
	if nNum >= 250 then
		WriteLog(format("[标记] [Type: 野外PVP圣物] [Role:%s (acc:%s)] [event: 拾取 %d 次.]", GetName(),GetAccount(),nNum));
	end
	if nNum > 810 then
		Talk(1,"","少侠已经获得太多的武林盟圣物了，太多了可对你不利!");
		return 0;
	end
	local nNpcIdx = GetTargetNpc();
	SetNpcLifeTime(nNpcIdx,0);
	SetNpcScript(nNpcIdx,"");
	yp_aw_giveAward_1();
end