Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function main()
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Say("你确定有东西给我？",0);
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local nChangeLeft = GetMissionV(MV_CHANGEDRUMLEFT_SONG+nCamp-1);
	local selTab = {
			"换取山贼兵旗(需要1个玄铁矿石)/get_flag",
			"换取山贼战鼓(需要2个玄铁矿石和"..nChangeLeft..")/get_drum",
			"随便看看/nothing",
			}
	Say("有话就说，否则就离开这里！",getn(selTab),selTab);
end;

function get_flag()
	local nCamp = BT_GetCamp();
	local nStoneCount = GetMissionV(MV_STONE_COUNT_SONG+nCamp-1);
	if DelItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],1) == 1 then
		AddItem(tBattleItem[7][2],tBattleItem[7][3],tBattleItem[7][4],1);
		Msg2Player("您获得[山贼兵旗]×1);
		SetMissionV(MV_STONE_COUNT_SONG+nCamp-1,nStoneCount+1);
		BT_AddPersonalPoint(1*tBPEven[BP_RESOURCE_HAND_STONE_CH]);
		Add_Resource(nCamp,1*tBPEven[BP_RESOURCE_HAND_STONE_CH]);
	else
		Talk(1,"","滚！竟敢欺骗我，你根本没有带<color=yellow>玄铁矿石<color>给我。");
	end;
end;

function get_drum()
	local nCamp = BT_GetCamp();
	local nChangeLeft = GetMissionV(MV_CHANGEDRUMLEFT_SONG+nCamp-1);
	local nStoneCount = GetMissionV(MV_STONE_COUNT_SONG+nCamp-1);
	if nChangeLeft <= 0 then
		Talk(1,"","Th玭g c秏! Х h誸 chi課 c?i cho ngi r錳.");
		return 0;
	end;
	if DelItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],2) == 1 then
		AddItem(tBattleItem[8][2],tBattleItem[8][3],tBattleItem[8][4],1);
		Msg2Player("您获得[山贼战鼓]×1);
		SetMissionV(MV_CHANGEDRUMLEFT_SONG+nCamp-1,nChangeLeft-1);
		SetMissionV(MV_STONE_COUNT_SONG+nCamp-1,nStoneCount+2);
		BT_AddPersonalPoint(2*tBPEven[BP_RESOURCE_HAND_STONE_CH]);
		Add_Resource(nCamp,2*tBPEven[BP_RESOURCE_HAND_STONE_CH]);
	else
		Talk(1,"","滚！竟敢欺骗我，你根本没有带<color=yellow>玄铁矿石<color>给我。");
	end;
end;