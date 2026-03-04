Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"在这里周围出现了许多粮草，将士们迅速聚集起来，刻不容缓！");
	end;
	local selTab = {
				"进入战场/enter_battle",
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

function enter_battle()
	local nCampPlace = BT_GetCamp()
	local tPos = {
			[SONG_ID] = {1606,3505},
			[LIAO_ID] = {1724,3264},
			}
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","斥候已出发，请耐心等待消息！");
	else
		SetPos(tPos[nCampPlace][1],tPos[nCampPlace][2])
		BT_RestoreAll();
		BT_SetTempData(PTT_DIE_LOOP,0);
		SetFightState(1);
		CastState("state_dispear",0,INVINCIBILITY_TIME*18);
	end;
end;

function nothing()

end;
