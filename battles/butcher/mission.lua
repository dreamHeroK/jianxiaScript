Include("\\script\\battles\\butcher\\head.lua")

function InitMission()
	for i = 1, 100 do 
	SetMissionV(i , 0);
	end;
	SetMissionS(1, "")
	SetMissionS(2, "")
end

function RunMission()
	SetMissionV(MS_STATE,2);
	
	bt_assignrank(1) --给宋方的玩家分配官衔
	bt_assignrank(2) --给辽方的玩家分配官衔

	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
		break
		end
 		if (pidx > 0) then
 			PlayerIndex = pidx;
		end
	--此时为GM发布命令，正式打响战斗
	TaskTip("敌军已经开始行动，将士们赶赴前线，奋勇杀敌呀！") 
end

end;

function EndMission()
	SetMissionV(MS_STATE,3)
	StopMissionTimer(MISSIONID, 39);
	StopMissionTimer(MISSIONID ,40);
	
	GameOver()
	level = BT_GetGameData(GAME_LEVEL);
	DeleteChannel("宋方"..szGAME_GAMELEVEL[level].."杀戮模式")
	DeleteChannel("辽方"..szGAME_GAMELEVEL[level].."杀戮模式")


	SetGlbValue(GLB_BATTLESTATE, 0) --设置该全局变量为1，标志当前服务器正处于宋辽战役阶段，此时襄阳或朱仙镇的出口点自动设在宋辽战役的报名点，否则则设在原宋辽战场地图
	SetGlbValue(GLB_SONGAPPLY, 0)
	SetGlbValue(GLB_LIAOAPPLY, 0)
	SetGlbValue(GLB_SONGFOREIGN, 0)
	SetGlbValue(GLB_LIAOFOREIGN, 0)
	sl_clearbattledata()	--本次战斗结束后，清除战场信息
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
end;

function JoinMission(RoleIndex, Camp)
	PlayerIndex = RoleIndex;
	if (Camp ~= 1 and Camp ~= 2) then
		return
	end
	sf_join(Camp)
	ResetBonus()		--计算战功系数，重置战功
end;

function OnLeave(RoleIndex)
	level = BT_GetGameData(GAME_LEVEL);
	PlayerIndex = RoleIndex;
	ForbidChangePK(0);

	if (GetCurCamp() == 1) then
		LeaveChannel(PlayerIndex, "宋方"..szGAME_GAMELEVEL[level].."杀戮模式")
	else
		LeaveChannel(PlayerIndex, "辽方"..szGAME_GAMELEVEL[level].."杀戮模式")
	end
	SetPKFlag(0, 0)

	--在战场开战以后离开战场则视为“逃离”，限制本场次不可再进入任何一方
	--具体实现为1小时之内不能再次进入战场
--	if GetMissionV(MS_STATE) == 2 then
--		local nLeaveTime = tonumber(date("%y%m%d%H%M"));
--		BT_SetData(PL_LEAVETIME, nLeaveTime);
--	end

	sf_onplayerleave()
	if( GetMissionV( MS_STATE ) ~= 3 ) then
		BT_UpdateMemberCount();
		ResetBonus()		--计算战功系数，重置战功
	end
	
	if( GetMissionV( MS_STATE ) == 2 and wl_search_memcount() == 1 ) then
		CloseMission( MISSIONID )
	end
end;

