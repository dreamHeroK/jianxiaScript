--filename:resource_npc.lua
--create date:2006-06-16
--describe:粮草脚本
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function main()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex == 0 then
		return 0;
	end;
	local bExist = GetUnitCurStates(nNpcIndex,0);	--使用等级属性作是否存在的标记
	if bExist == 0 then
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Msg2Player("无法采集这种粮草。");
		return 0;
	end;
	if IsHaveState(1) > 0 then	--是否骑马
		Msg2Player("骑马状态，采集粮草变得异常困难。");
		return 0;
	end;
	local _,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIndex);
	if BT_GetDistance(nNpcPosX,nNpcPosY) >= 15 then
		Msg2Player("该区域没有粮草");
		return 0;
	end;
	if GetItemCount(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4]) <= 0 then
		Msg2Player("你没有携带粮草锄头");
		return 0;
	end;
--	local nMainType,nSubType1,nSubType2 = GetPlayerEquipInfo(2);
--	if nMainType ~= 0 or nSubType1 ~= 0 or nSubType2 ~= 0 then
--		Msg2Player("手里握着武器，采集粮草变得异常困难。");
--		return 0;
--	end;
	if DoFireworks(DIGGING_ACTION_ID,1) == 1 then
		Msg2Player("采集粮草……");
		CastState("state_fetter",1,5*18)
		ProgressSlot(5*18);	--5秒
		SetNpcLifeTime(nNpcIndex,0);
		AddUnitStates(nNpcIndex,0,-bExist);	--置0
		SetNpcScript(nNpcIndex,"");
	else
		Msg2Player("打坐状态下不能采集粮草")
	end;
end;


function OnProgressCallback()
	local nCamp = BT_GetCamp();
	if random(1,100) <= 50 then
		Msg2MSGroup(MISSION_ID,"这场战争肆意地影响了环境，玩家"..GetName().."被原住民追赶，等待将士们来营救。",nCamp);
		local npcIndex = CreateNpc("环保土民","环保土民",GetWorldPos());
		SetNpcDeathScript(npcIndex,"\\script\\newbattles\\resourcebattle\\angryvillager_death.lua");	
	else
		AddItem(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4],3);
		Msg2Player("您获得了3包"..tBattleItem[3][1]);	
	end;
	BT_AddBattleActivity(BA_RESO_GOT_RES);
	Use_Hoe();
end;