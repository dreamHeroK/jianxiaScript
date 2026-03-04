Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");

function OnUse()
	local nMapID,nMapX,nMapY = GetWorldPos();
	if nMapID ~= MAPID then
		Msg2Player("山贼兵旗只能在战场特殊地图使用");
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT or GetFightState() == 0 then
		Msg2Player("暂时不能使用山贼兵旗");
		return 0;
	end;
	if check_place() == 1 then
		if DelItem(tBattleItem[7][2],tBattleItem[7][3],tBattleItem[7][4],1) == 1 then
			local nCamp = BT_GetCamp();
			local nEnemyCamp = 3 - nCamp;
			local nNpcIndex = CreateNpc("山贼喽罗","山贼喽罗 ("..tCampNameZ[nCamp]..")",GetWorldPos())
			SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\resourcebattle\\cateran_louluo_death.lua");
			SetNpcLifeTime(nNpcIndex,15);
			Dec_Resource(nEnemyCamp,15);	--扣对方的粮草
			Add_Resource(nCamp,15);	--增加本方粮草
			if nCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"前线战报: 宋方"..GetName().."使用山贼兵旗召唤一个山贼喽罗偷走辽方15包粮草");
			else
				Msg2MSAll(MISSION_ID,"前线战报: 辽方"..GetName().."使用山贼兵旗召唤一个山贼喽罗偷走宋方15包粮草");
			end;
		end;
	else
		Msg2Player("当区域不能使用山贼兵旗");
	end;
end;

function check_place()
	return 1;
end;                      