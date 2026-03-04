--create date:07-04-13
--author:yanjun
--describe:不可重生旗子死亡脚本
Include("\\script\\gongcheng\\gongcheng_function.lua");

function OnDeath(nNpcIdx)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_ENDING then	--结束阶段不处理
		return 0;
	end;
	SetMissionV(MV_FLAG_OWN_COUNT,GetMissionV(MV_FLAG_OWN_COUNT)+1);
	if GCZ_CheckWinCondition() == 1 then
		return 1;
	end;
	local nMusicState = GCZ_SetMusicState();
	GCZ_PlayBackGroundMusic(nMusicState);
	local nFlagID = GCZ_GetNormalFlagIndex(nNpcIdx);
	if nFlagID == 0 then
		WriteLog("[攻城失败]: flag_normal_death.lua trong script GCZ_GetNormalFlagIndexhàm 退货金额失败");
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GCZ_GetEnemyCamp();
	GCZ_PlaySound(nPlayerCamp,tWavFileName[1][1]);
	GCZ_PlaySound(nEnemyCamp,tWavFileName[1][2]);
	SetMissionV(MV_DESTROY_FLAG1+nFlagID-1,1);
	SetMissionV(MV_NORMAL_FLAG1_OWNER+nFlagID-1,GONG_ID);
	local nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
	GCZ_Msg2Camp("我们寡不敌众 "..tNormalFlagPos[nFlagID][3]..", 注意防御敌人!目前我们成功的进展是 "..nFlagCount.."赢",nPlayerCamp);
	GCZ_Msg2Camp("敌人占领了 "..tNormalFlagPos[nFlagID][3]..", 如果不立即采取行动,损失就会越来越大。目前攻防进度. 目前,敌人的进攻进度是 "..nFlagCount.."赢",nEnemyCamp)
	if nFlagID == 1 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_C2,GONG_ID,TRUE);	--ặỡìể1±ằ´íằÙºúÊơạƠãẵ¿ẫểÃÄạàỉC2
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_22,SHOU_ID,FALSE);	--ấỉãẵ²ằ¿ẫểÃÄạàỉ22
		GCZ_Msg2Camp("东城的时代被摧毁了, 东城门的集合点已经开放了",GONG_ID);
		GCZ_Msg2Camp("东城时代危在旦夕, 东城集中点已经开放",SHOU_ID);
	elseif nFlagID == 2 then
		Msg2MSAll(MISSION_ID,"中区的时代被摧毁了, ");
	elseif nFlagID == 3 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_C1,GONG_ID,TRUE);	--ặỡìể3±ằ´íằÙºúÊơạƠãẵ¿ẫểÃÄạàỉC1
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_21,SHOU_ID,FALSE);	--ấỉãẵ²ằ¿ẫểÃÄạàỉ21		
		GCZ_Msg2Camp("西城的时代被摧毁了, 西城门的集合点已经开放",GONG_ID);
		GCZ_Msg2Camp("西城时代危在旦夕, 西城集中点已经关闭",SHOU_ID);
	end;
	--SetNpcLifeTime(nNpcIdx,0);
end;