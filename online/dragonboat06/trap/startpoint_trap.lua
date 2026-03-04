Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	local MapID,MapX,MapY = GetWorldPos();
	local RoomState = GetMissionV(MV_ROOMSTATE);
	local nGenre,nDetail,nParticular = GetPlayerEquipInfo(10);
	if RoomState == MS_STATE_STARTED or RoomState == MS_STATE_WAITCOMPLETE then	
		if nGenre == 0 and nDetail == 0 and nParticular == 0 then
			Msg2Player("首先需要登船开始比赛。");
			NewWorld(MapID,2038,3268);
			InteractiveEnable(0);
			return 0;
		end;
		if GetTask(POSITION) == TRAPCOUNT then
			Msg2Player("你已经完成了比赛，在终点等待比赛结束。");
			NewWorld(MapID,2038,3268);
			InteractiveEnable(0);
			return 0;
		end;
		if GetTask(POSITION) ~= 0 then
			NewWorld(MapID,2019,3291);
			InteractiveEnable(0);
			Msg2Player("当你在比赛时，试着走正确的路!");
			return 0;
		end;
		if GetMapTaskTemp(MapID,1) == 0 then
			Create_Box(BOXCOUNT);
			SetMapTaskTemp(MapID,1,1);
		end;
		if nParticular >= 26 and nParticular <= 31 then	--如果不是普通龙舟
			LearnSkill(nParticular+828);
			SetLRSkill(nParticular+828,0);	--设为鼠标右键技能
		end;
		SetFightState(1);	--设置为战斗状态
		ForbidChangePK(0)
		SetPKFlag(2,0);	--设置为屠杀状态
		ForbidChangePK(1);	--禁止改变PK状态
	elseif RoomState == MS_STATE_WAITSIGNUP or RoomState == MS_STATE_WAITSTART then
		if nGenre == 0 and nDetail == 0 and nParticular == 0 then
			Msg2Player("在比赛开始前，上船准备好。");
		end;
		NewWorld(MapID,2038,3268);
		InteractiveEnable(0);
		Msg2Player("比赛还没开始，保持安静!");
	end;
end;