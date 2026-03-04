Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function main()
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Say("我真的好可怜！",0);
		return 0;
	end;
	local selTab = {
				"可怜的东西，给他10包初级粮草/#give_resource(1,10)",
				"可怜的东西，给他10包中级粮草/#give_resource(2,10)",
				"可怜的东西，给他10包高级粮草/#give_resource(3,10)",
				"结束对话/nothing",
				}
	Say("几天前，不知道来自哪里的一些山贼，抓走了我们的首领，他们捣毁并洗劫了所有房屋，我们不得不逃到这里。",getn(selTab),selTab);
end;

function give_resource(nType,nCount)
	local nRand = random(1,100);
	local nTime = GetTime();
	if DelItem(tBattleItem[nType][2],tBattleItem[nType][3],tBattleItem[nType][4],nCount) == 1 then	
		if nType == 1 then
			if nRand <= 30 then
				BT_AddBattleEvenPoint(BP_RESOURCE_HAND_IN_RES1_REFUGEE);
			elseif nRand <= 50 then
				clear_all_state();
				BT_SetData(PT_1MIN2TYPE,nTime);--玩家在一分钟内所挖的所有粮草都是中级粮草
				Msg2Player("您获得在1分钟内采集中级粮草的能力，请好好把握！");
			elseif nRand <= 60 then
				clear_all_state();
				BT_SetData(PT_1MINDOUBLE,nTime);--玩家在一分钟内所挖的所有粮草数量x2
				Msg2Player("您获得在1分钟内采集两倍粮草的数量，请好好把握！");
			else	
				AddItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],1);
				Msg2Player("您获得了1个玄铁矿石");
			end;
		elseif nType == 2 then
			if nRand <= 20 then
				BT_AddBattleEvenPoint(BP_RESOURCE_HAND_IN_RES2_REFUGEE);
			elseif nRand <= 50 then
				clear_all_state();
				BT_SetData(PT_1MINDOUBLE,nTime);--玩家在一分钟内所挖的所有粮草数量x2
				Msg2Player("您获得在1分钟内采集两倍粮草的数量，请好好把握！");
			elseif nRand <= 60 then
				clear_all_state();
				BT_SetData(PT_1MIN3TYPE,nTime);--玩家在一分钟内所挖的所有粮草都是高级粮草
				Msg2Player("您获得在1分钟内采集高级粮草的能力，请好好把握！");
			else
				AddItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],2);
				Msg2Player("您获得了2个玄铁矿石");
			end;
		elseif nType == 3 then
			if nRand <= 15 then
				BT_AddBattleEvenPoint(BP_RESOURCE_HAND_IN_RES3_REFUGEE);
			elseif nRand <= 50 then
				clear_all_state();
				BT_SetData(PT_3MINDOUBLE,nTime);--玩家在三分钟内所挖的所有粮草数量x2
				Msg2Player("您获得在3分钟内采集两倍粮草的数量，请好好把握！");
			elseif nRand <= 60 then
				clear_all_state();
				BT_SetData(PT_1MIN3TYPEDOUBLE,nTime);--玩家在一分钟内所挖的所有粮草都是高级粮草且所挖粮草数量x2
				Msg2Player("您获得在1分钟内采集两倍高级粮草的数量，请好好把握！");
			else
				AddItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],6);
				Msg2Player("您获得了6个玄铁矿石");
			end;	
		end;
	else
		Talk(1,"main","哎！您带来的粮草数量还不够！");
	end;
end;

function clear_all_state()
	for i=PT_1MIN2TYPE,PT_3MINDOUBLE do
		BT_SetData(i,0);
	end;
end;