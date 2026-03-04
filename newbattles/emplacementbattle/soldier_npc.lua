Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");

function main()
	local nNpcIndex = GetTargetNpc();
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIndex);
	if BT_GetDistance(nMapX,nMapY) >= 14 then
		return 0;
	end;
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"据说这座炮塔已经多年没有维修，站在那里会受到一定的伤害，将军要小心！");
	end;
	local selTab = {
				"进入战场/enter_front_camp",
				"返回后营/enter_back_camp",
				"离开战场/ask_reason",
				"没什么事/nothing",
				}
	Say("<color=green>前线士兵<color>：我们的将士们不论年龄大小，只要我们团结起来赶走外族入侵者！",getn(selTab),selTab);
end;

function ask_reason()
	AskClientForString("leave","悄悄离开...",1,32,"为什么离开？");
end;	

function leave(sLeaveMsg)
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	local nMissionID = 0;
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(tBTMSInfo[nBattleType][2]);
	nMissionID = tBTMSInfo[nBattleType][1];
	DelMSPlayer(nMissionID,0);
	Msg2MSAll(nMissionID,"发表信息："..sLeaveMsg);
	SubWorld = OldSubWorld;
end;

function enter_front_camp()
	local nCampPlace = BT_GetCamp()
	local tPos = {
			[SONG_ID] = {tFrontPointSong,tBackPointSong},
			[LIAO_ID] = {tFrontPointLiao,tBackPointLiao},
			}
	SubWorld = SubWorldID2Idx(MAPID);
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tRandPos = tPos[nCampPlace][1];
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","斥候已出发，请耐心等待消息！");
	else
		local nPosIndex = random(1,getn(tRandPos)); 
		SetPos(tRandPos[nPosIndex][1],tRandPos[nPosIndex][2]);
		BT_RestoreAll();
		BT_SetTempData(PTT_DIE_LOOP,0);
		SetFightState(1);
		CastState("state_dispear",0,INVINCIBILITY_TIME*18);
	end;
end;

function enter_back_camp()
	local nCampPlace = BT_GetCamp()
	local tPos = {
			[SONG_ID] = {tFrontPointSong,tBackPointSong},
			[LIAO_ID] = {tFrontPointLiao,tBackPointLiao},
			}
	SubWorld = SubWorldID2Idx(MAPID);
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tRandPos = tPos[nCampPlace][2];
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","斥候已出发，请耐心等待消息！");
	else
		local nPosIndex = random(1,getn(tRandPos)); 
		SetPos(tRandPos[nPosIndex][1],tRandPos[nPosIndex][2]);
		BT_RestoreAll();
		BT_SetTempData(PTT_DIE_LOOP,0);
		SetFightState(1);
		CastState("state_dispear",0,INVINCIBILITY_TIME*18);
	end;
end;

function nothing()

end;
