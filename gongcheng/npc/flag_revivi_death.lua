--create date:07-04-13
--author:yanjun
--describe:可重生旗子死亡脚本
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnDeath(nNpcIdx)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_ENDING then	--结束阶段不处理
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GCZ_GetEnemyCamp();
	GCZ_PlaySound(nPlayerCamp,tWavFileName[2][1]);
	GCZ_PlaySound(nEnemyCamp,tWavFileName[2][2]);
	SetNpcLifeTime(nNpcIdx,0);
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	local nFlagIdx = GCZ_GetReviviFlagIndex(nNpcIdx)
	if nFlagIdx == 0 then
		WriteLog("[攻城攻城失败]: flag_revivi_death.lua trong script GCZ_GetReviviFlagIndex 返回到错误值的函数");
		return 0;
	end;
	SetMissionV(MV_REVIVI_FLAG1_OWNER+nFlagIdx-1,nPlayerCamp);
	local nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
	if nPlayerCamp == GONG_ID then
		SetMissionV(MV_FLAG_OWN_COUNT,nFlagCount+1);
		if GCZ_CheckWinCondition() == 1 then
			return 1;	--如果攻方赢了就直接返回
		end;
		nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
		GCZ_Msg2Camp("我们寡不敌众 "..tReviviFlagPos[nFlagIdx][3]..", 注意敌人反击! 目前我们成功的进展是 "..nFlagCount.."成",nPlayerCamp);
		GCZ_Msg2Camp("敌人占领了 "..tReviviFlagPos[nFlagIdx][3]..", 如果不立即采取行动,损失就会越来越大. 目前敌方的成功进展是 "..nFlagCount.."成",nEnemyCamp)
	else
		SetMissionV(MV_FLAG_OWN_COUNT,nFlagCount-1);
		nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
		GCZ_Msg2Camp("我们寡不敌众 "..tReviviFlagPos[nFlagIdx][3]..", 注意敌人反击! 目前敌方的成功进展是 "..nFlagCount.."成",nPlayerCamp);
		GCZ_Msg2Camp("敌人占领了 "..tReviviFlagPos[nFlagIdx][3]..", 如果不立即采取行动,损失就会越来越大. 目前敌方的成功进展是 "..nFlagCount.."成",nEnemyCamp)
	end;
	local nMusicState = GCZ_SetMusicState();
	GCZ_PlayBackGroundMusic(nMusicState);
	local nFlagNpcIdx = CreateNpc(tReviviFlagPos[nFlagIdx][3+nPlayerCamp],tReviviFlagPos[nFlagIdx][3].."("..tCampNameZ[nPlayerCamp]..")",nMapID,tReviviFlagPos[nFlagIdx][1],tReviviFlagPos[nFlagIdx][2]);
	SetNpcDeathScript(nFlagNpcIdx,"\\script\\gongcheng\\npc\\flag_revivi_death.lua");
	gf_SetUnitCurState(nFlagNpcIdx,0,nFlagIdx);	--用NPC的等级数据来记NPC的位置索引
	SetCampToNpc(nFlagNpcIdx,tCampNameP[nPlayerCamp]);
end;