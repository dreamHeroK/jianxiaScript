Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\missions\\yp\\yp_head.lua")

thisFile = "\\script\\missions\\yp\\zxc\\mission.lua";

tbZXC = { 
	name = "葬雪城",
--	timerID = 79,
	missionID = 84,
	realMapID = 5079,
	dynamicMap = 0,
}
tbZXC = gf_CopyInherit(missionHead, tbZXC)
firePhases = {
	timerID = 118,
	frequency = 18*2,
	maxsecond = 14*24*3600, --7天？
};
firePhases = gf_CopyInherit(phaseBase,firePhases)

function yp_rebornBiaoche(m,nNewPosX,nNewPosY)
	if GetTask(TASK_FIELD_PVP_CAR_START) ~= 1 then
		zxc_enter(m,nNewPosX,nNewPosY);	
		return 0;
	end	
	local nOldNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nOldNpcID = GetTask(TASK_FIELD_PVP_CAR_ID);
	local nCurNpcID = GetNpcID(nOldNpcIdx);
	if nOldNpcIdx == 0 or nOldNpcID ~= nCurNpcID then
		Msg2Player("您的镖车由于被毁或者超过托镖时限未成功送达目的地，运镖失败！");
		Talk(1,"","您的镖车由于被毁或者超过托镖时限未成功送达目的地，运镖失败！");
		SetTask(TASK_FIELD_PVP_CAR_RAND,0)
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_IDX,0);
		SetTask(TASK_FIELD_PVP_CAR_ID,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
		zxc_enter(m,nNewPosX,nNewPosY);	
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nOldNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	local nBCType = GetTask(TASK_FIELD_PVP_CAR_RAND)
	if nBCType == 0 then
		zxc_enter(m,nNewPosX,nNewPosY);	
		return 0;
	end
	if nDistance > 30 then
		zxc_enter(m,nNewPosX,nNewPosY);	
		return 0;
	end
	local nNpcIdx = CreateNpc(tBiaoChe[nBCType][1],format("%s的%s",GetName(),tBiaoChe[nBCType][2]),m,nNewPosX,nNewPosY);
	if nNpcIdx ~= 0 then
		SetNpcRemoveScript(nOldNpcIdx,"");
		SetNpcLifeTime(nOldNpcIdx,0)
		local nNpcID = GetNpcID(nNpcIdx);
		local nCurLife = GetTask(TASK_FIELD_PVP_CAR_LIFE);
		local nLifeTime = 30*60-(GetTime()-GetTask(TASK_FIELD_PVP_CAR_LIFETIME));
		if nLifeTime > 30*60 then
			nLifeTime = 30*60;
		elseif nLifeTime <= 0 then
			nLifeTime = 1;
		end
		ModifyNpcData(nNpcIdx,0,nCurLife,0); --设置当前生命值
		SetNpcLifeTime(nNpcIdx,nLifeTime);   --设置当前存在时间
		local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
		if tAllCamp[nCamp] then
			SetCampToNpc(nNpcIdx,tAllCamp[nCamp]);
		end
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
		SetNpcRemoveScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
		SetTask(TASK_FIELD_PVP_CAR_IDX,nNpcIdx);
		SetTask(TASK_FIELD_PVP_CAR_ID,nNpcID);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,GetTime());	
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		SetNpcTempData(nNpcIdx, 1, nBCType)
	end
	zxc_enter(m,nNewPosX,nNewPosY);	
end

function zxc_enter(m,nNewPosX,nNewPosY)
	SendScript2VM("\\script\\missions\\yp\\zxc\\entrynpc.lua", "enter()")
	NewWorld(m,nNewPosX,nNewPosY);
end