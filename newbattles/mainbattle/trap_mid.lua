Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
function main()
	local nCamp = BT_GetCamp()
	local nCampPlace = nCamp;
	local nRandPos = 0;
	local tPos = {tMidBornPlaceSong,tMidBornPlaceLiao};
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		if GetMissionV(MV_MID_TRAP_SONG+nCamp-1) == 1 then
			nRandPos = random(1,getn(tPos[nCampPlace]));
			SetPos(tPos[nCampPlace][nRandPos][1],tPos[nCampPlace][nRandPos][2]);
			BT_RestoreAll();
			SetFightState(1);
			BT_SetTempData(PTT_DIE_LOOP,0);
		else
			SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3])
			Talk(1,"","当前前线正在激战，暂时无法参军。");
		end;
	else
		SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3])
		Talk(1,"","斥候已经派出，请耐心等待消息！");
	end;
end;