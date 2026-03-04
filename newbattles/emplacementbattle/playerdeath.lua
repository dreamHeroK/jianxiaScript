Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");

function OnDeath(Launcher)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local KillerIndex = NpcIdx2PIdx(Launcher);
	local nOldPlayerIndex = PlayerIndex;
	local nDeathCamp = BT_GetCamp();
	SetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1,GetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1)+1);
	local nCampPlace = nDeathCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	BT_AddBattleActivity(BA_EMPL_DEATH);
	SetTempRevPos(ENTRANCE_POINT[nCampPlace][1],ENTRANCE_POINT[nCampPlace][2]*32,ENTRANCE_POINT[nCampPlace][3]*32);	--设置重生点
	BT_SetData(PTNC_DEATH,BT_GetData(PTNC_DEATH)+1);	--死亡次数加1,不管是被什么搞死的
	CastState("imme_clear_skill_interval",7,0);	--消除所有技能的冷却时间
	if Launcher == -1 then
		return 0;	--被caststate搞死的
	end;
	if KillerIndex == 0 then
		--被NPC杀死
	elseif KillerIndex > 0 then
		--被玩家杀死
		local sPlayerName = GetName();
		local nJunXian = abs(BT_GetData(PT_CURRANK));
		if nJunXian == 0 then
			nJunXian = 1;
		end;
		PlayerIndex = KillerIndex;
		local nKillerCamp = BT_GetCamp();
		if nKillerCamp == nDeathCamp then	--被自己人杀死
			return 0;
		end;
		BT_SetData(PTNC_KILL,BT_GetData(PTNC_KILL)+1);
		BT_AddBattleActivity(BA_EMPL_KILL_PLAYER);
		local sKillerName = GetName();
		BT_EmperorAward(0.1);
		Msg2Player("您共击败敌方人数："..BT_GetData(PTNC_KILL));
		local nEvenID = tKillPlayerBonus[nJunXian];
		local nPoint = BT_GetBattleEvenPoint(nEvenID);
		BT_AddBattleEvenPoint(nEvenID);
		BT_AddMissionPoint(nKillerCamp,nPoint);
		BT_SetData(PT_KILL_SONG_PLAYER+nDeathCamp-1,BT_GetData(PT_KILL_SONG_PLAYER+nDeathCamp-1)+1);
		PlayerIndex = nOldPlayerIndex;
		BT_SetData(PT_KILL_BY_SONG+nKillerCamp-1,BT_GetData(PT_KILL_BY_SONG+nKillerCamp-1)+1);
		BT_DecPersonalPoint(ceil(nPoint/3));
		if nKillerCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"宋方"..sKillerName.."击败了辽方"..sPlayerName);
		else
			Msg2MSAll(MISSION_ID,"辽方"..sKillerName.."击败了宋方"..sPlayerName);
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
end;