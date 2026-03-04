Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	local npcIndex = GetTriggeringUnit();
	SetNpcLifeTime(npcIndex,0);
	local nRandomNum = random(1,100);
	if nRandomNum <= 10 then
		doeffect(1,"state_move_speed_percent_add",20,5)	--自身加速20%5秒
		Msg2Player("你使自身加速20%持续5秒");
	elseif nRandomNum <= 20 then
		doeffect(2,"state_move_speed_percent_add",20,5)	--其他选手加速20%5秒
		Msg2MSAll(MISSION_ID,GetName().."使其他选手加速20%持续5秒");
	elseif nRandomNum <= 30 then
		doeffect(1,"state_dispear",0,10)	--自身无敌10秒
		Msg2Player("你使自身无敌10秒");
	elseif nRandomNum <= 40 then
		doeffect(2,"state_dispear",0,5)	--其他选手无敌5秒
		Msg2MSAll(MISSION_ID,GetName().."使其他选手无敌5秒");
	elseif nRandomNum <= 44 then
		doeffect(1,"state_slow",20,5)	--自身减速20%5秒
		Msg2Player("你使自身减速20%持续5秒");
	elseif nRandomNum <= 48 then
		doeffect(2,"state_slow",20,5)	--其他人减速20%5秒
		Msg2MSAll(MISSION_ID,GetName().."使其他人减速20%持续5秒");
	elseif nRandomNum <= 52 then
		doeffect(1,"state_confusion",0,3)	--自身混乱3秒
		Msg2Player("你使自身混乱3秒");
	elseif nRandomNum <= 56 then
		doeffect(2,"state_confusion",0,3)	--其他选手混乱3秒
		Msg2MSAll(MISSION_ID,GetName().."使其他选手混乱3秒");
	elseif nRandomNum <= 60 then
		doeffect(1,"state_sleep",0,3)	--自身睡眠3秒
		Msg2Player("你使自身睡眠3秒.");
	elseif nRandomNum <= 64 then
		doeffect(2,"state_sleep",0,3)	--其他选手睡眠3秒
		Msg2MSAll(MISSION_ID,GetName().."使其他选手睡眠3秒.");
	elseif nRandomNum <= 67 then
		doeffect(1,"state_vertigo",0,3)	--自身眩晕3秒
		Msg2Player("你使自身眩晕3秒");
	elseif nRandomNum <= 70 then
		doeffect(2,"state_vertigo",0,3)	--其他人眩晕3秒
		Msg2MSAll(MISSION_ID,GetName().."使其他人眩晕3秒");
	elseif nRandomNum <= 73 then
		doeffect(1,"state_fetter",0,3)	--自身定身3秒
		Msg2Player("你使自身定身3秒");
	elseif nRandomNum <= 76 then
		doeffect(2,"state_fetter",0,3)	--其他人定身3秒
		Msg2MSAll(MISSION_ID,GetName().."使其他人定身3秒");
	elseif nRandomNum <= 84 then
		ModifyReputation(2,0)	--2点声望
		Msg2Player("你获得了2点声望");
	elseif nRandomNum <= 92 then
		ModifyReputation(2,0)	--2点声望
		Msg2Player("你获得了2点声望");
	elseif nRandomNum <= 100 then
		ModifyReputation(2,0)	--2点声望
		Msg2Player("你获得了2点声望");
	else
		Write_Log("Ho箃 ng t誸 an Ng??sai s鉻","Khi m??rng, l鏸 h祄 s??ng蓇 nhi猲! T猲 nh﹏ v藅:"..GetName())
	end;
end;

--nType为１时，作用于自己；为２时作用于其他人，为３时作用于所有人
function doeffect(nType,sStr,nParam,nTime)
	local OldPlayerIndex = PlayerIndex;
	if nType == 1 then
		CastState(sStr,nParam,nTime*18);
	elseif nType == 2 then
		for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
			PlayerIndex = Get_Player_By_Rank(i);
			if PlayerIndex > 0 and PlayerIndex ~= OldPlayerIndex and GetTask(POSITION) ~= TRAPCOUNT then
				CastState(sStr,nParam,nTime*18);
			end;
		end;
	elseif nType == 3 then
		for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
			PlayerIndex = Get_Player_By_Rank(i);
			if PlayerIndex > 0 and GetTask(POSITION) ~= TRAPCOUNT then
				CastState(sStr,nParam,nTime*18);
			end;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;