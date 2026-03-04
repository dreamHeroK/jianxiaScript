--create date:07-04-13
--author:yanjun
--describe:城门机关死亡脚本
Include("\\script\\gongcheng\\gongcheng_function.lua");

function OnDeath(nNpcIdx)
	local nJiGuanID = GCZ_GetChengMenJiGuanIndex(nNpcIdx);
	--SetNpcLifeTime(nNpcIdx,0);
	if nJiGuanID == 0 then
		WriteLog("[攻城战败]: chengmenjiguan_death.lua trong script GCZ_GetChengMenJiGuanIndex 返回错误数值的函数");
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GCZ_GetEnemyCamp();
	GCZ_PlaySound(nPlayerCamp,tWavFileName[3][1]);
	GCZ_PlaySound(nEnemyCamp,tWavFileName[3][2]);
	SetMissionV(MV_DESTROY_EAST_DOOR+nJiGuanID-1,1);
	SetMissionV(MV_EAST_JIGUAN_INDEX+nJiGuanID-1,0);
	if nJiGuanID == 1 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_B2,GONG_ID,TRUE);
		Msg2MSAll(MISSION_ID,"东部城门危急, 城外集合点已开");
	elseif nJiGuanID == 2 then
		Msg2MSAll(MISSION_ID,"中区城门危急");
	elseif nJiGuanID == 3 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_B1,GONG_ID,TRUE);
		Msg2MSAll(MISSION_ID,"西门危急, 西城门外集合点已开");
	end;
	Msg2MSAll(MISSION_ID,GetName().." 摧毁了 "..tChengMenJiGuanPos[nJiGuanID][3])
	if GCZ_CheckAllDoor() == 1 then
		Msg2MSAll(MISSION_ID,"城门已完全岌岌可危, 成功大炮还有距离 ");
		GCZ_ComeToGongmeng();
	end;
end;
