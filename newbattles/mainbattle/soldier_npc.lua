Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");

SZ_BF_CHEAT_OP_SCRIPT = "\\script\\newbattles\\mainbattle\\anti_cheat\\player_cheat_op.lua"

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"每个人都应努力保护自己的家园！");
	end;
	local selTab = {
				"进入后营/enter_back_camp",						
				"离开战场/ask_reason",
				"没什么事/nothing",
				}
	local nCamp = BT_GetCamp()
	if nCamp == SONG_ID and GetMissionV(MV_MID_TRAP_SONG) == 1 then
		tinsert(selTab,2,"进入中营/enter_mid_camp");
	elseif nCamp == LIAO_ID and GetMissionV(MV_MID_TRAP_LIAO) == 1 then
		tinsert(selTab,2,"进入中营/enter_mid_camp");
	end;
	local nCamp = BT_GetCamp()
	local nRandPos = 0;
	if nCamp == SONG_ID and GetMissionV(MV_FRONT_TRAP_SONG) == 1 then
		tinsert(selTab,3,"我要上前线/enter_front_camp");
	elseif nCamp == LIAO_ID and GetMissionV(MV_FRONT_TRAP_LIAO) == 1 then
		tinsert(selTab,3,"我要上前线/enter_front_camp");
	end;
	Say("<color=green>城防守卫<color>：我们的将士们不论年龄大小，只要我们团结起来赶走外族入侵者！",getn(selTab),selTab);
end;

function ask_reason()
	leave("悄悄离开...");
	--AskClientForString("leave","悄悄离开...",1,32,"为什么离开?");
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

function enter_back_camp()
	local nCampPlace = BT_GetCamp()
	local nRandPos = 0;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tPos = {tBackBornPlaceSong,tBackBornPlaceLiao};
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		nRandPos = random(1,getn(tPos[nCampPlace]));
		
		local szScript = format("pco_on_enter_battle_field(%d,%d)",tPos[nCampPlace][nRandPos][1],tPos[nCampPlace][nRandPos][2])
		SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
		SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
	else
		Talk(1,"","斥候已出发，请耐心等待消息！");
	end;
end;

function enter_mid_camp()
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
			
			local szScript = format("pco_on_enter_battle_field(%d,%d)",tPos[nCampPlace][nRandPos][1],tPos[nCampPlace][nRandPos][2])
			SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
			SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
		else
			Talk(1,"","前线战斗正激烈，暂时无法进入战场。");
		end;
	else
		Talk(1,"","斥候已出发，请耐心等待消息！");
	end;
end;

function enter_front_camp()
	local nCamp = BT_GetCamp()
	local nRandPos = random(1,getn(tFrontBornPlace));
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		if GetMissionV(MV_FRONT_TRAP_SONG+nCamp-1) == 1 then
			local szScript = format("pco_on_enter_battle_field(%d,%d)",tFrontBornPlace[nRandPos][1],tFrontBornPlace[nRandPos][2])
			SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
			SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
		else
			Talk(1,"","前线战斗正激烈，暂时无法进入战场。");
		end;
	else
		Talk(1,"","斥候已出发，请耐心等待消息！");
	end;
end;

function nothing()

end;
