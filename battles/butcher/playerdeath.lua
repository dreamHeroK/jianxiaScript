--玩家死亡脚本
Include("\\script\\battles\\butcher\\head.lua")

function OnDeath(Launcher)
	State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;

	PlayerIndex1 = NpcIdx2PIdx(Launcher);
	OrgPlayer  = PlayerIndex;
	DeathName = GetName();
	deathcamp = GetCurCamp();
	currank = BT_GetData(PL_CURRANK)

	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		if (GetCurCamp() ~= deathcamp) then
			LaunName = GetName();
			--更新杀Npc数目和排行榜
			BT_SetData(PL_KILLPLAYER, BT_GetData(PL_KILLPLAYER) + 1); --记录玩家杀其它玩家的总数
			serieskill = BT_GetData(PL_SERIESKILL) + 1;
			BT_SetData(PL_SERIESKILL, serieskill); --记录玩家当前的连斩数

--			if (mod(serieskill, 3) == 0) then
--				if (deathcamp == 1) then
--						bt_addtotalpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
--						but_addmissionpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
--	
--						Msg2Player("你获得三连斩战功"..BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
--				else
--						bt_addtotalpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
--						but_addmissionpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
--	
--						Msg2Player("你获得三连斩战功"..BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
--				end
--			end
	
			if (BT_GetData(PL_MAXSERIESKILL) < serieskill) then 
				BT_SetData(PL_MAXSERIESKILL, serieskill) -- 统计玩家的最大连斩数
			end
			
			bt_addtotalpoint(1)
			but_addmissionpoint(3)
		
--			if (deathcamp == 1) then
--				bt_addtotalpoint(BT_GetTypeBonus(PL_KILLPLAYER, 2))
--				but_addmissionpoint(BT_GetTypeBonus(PL_KILLPLAYER, 2))
--			else
--				bt_addtotalpoint(BT_GetTypeBonus(PL_KILLPLAYER, 1))
--				but_addmissionpoint(BT_GetTypeBonus(PL_KILLPLAYER, 1))
--			end
		
			local rankname = "";
			if (currank > 0) then
				rankname = tbRANKNAME[currank]
--				if (deathcamp == 1) then
--					local sc = floor(BT_GetTypeBonus(PL_KILLRANK1 + currank - 1, 2) * RA_KILL_PL_RANK[currank])
--					bt_addtotalpoint(sc)
--					but_addmissionpoint(sc)
--				else
--					local sc = floor(BT_GetTypeBonus(PL_KILLRANK1 + currank - 1, 1) * RA_KILL_PL_RANK[currank])
--					bt_addtotalpoint(sc)
--					but_addmissionpoint(sc)
--				end
			end
		
			if (GetCurCamp()  == 1) then
				str  = "宋方"..LaunName.."杀死了辽方"..rankname..DeathName.."，PK人数增为"..BT_GetData(PL_KILLPLAYER);
			else
				str  = "辽方"..LaunName.."杀死了宋方"..rankname..DeathName.."，PK人数增为"..BT_GetData(PL_KILLPLAYER);
			end
		
			Msg2MSAll(MISSIONID, str);
		end
		PlayerIndex = OrgPlayer;
	end;

	BT_SetData(PL_BEKILLED, BT_GetData(PL_BEKILLED) + 1)
	BT_SetData(PL_SERIESKILL, 0)
	
	if (currank > 0) then
		if (mod(BT_GetData(PL_BEKILLED), 3) == 0) then
			Msg2Player("前线战报：您已被降级！");
			BT_SetData(PL_CURRANK, currank - 1);
			RemoveTitle(32, currank)
			if (currank > 1) then
				AddTitle(32, currank - 1);
			end
			SetCurTitle(32, currank - 1);
		end
	end

	sf_onplayerleave()
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end
