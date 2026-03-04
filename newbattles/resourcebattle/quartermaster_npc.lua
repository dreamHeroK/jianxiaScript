--filename:quartermaster_npc.lua
--create date:2006-06-05
--describe:粮草争夺战场中双方军需官脚本
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");

function main()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nNpcCamp = 0;
	if nNpcName == "战场军需官(宋)" then
		nNpcCamp = SONG_ID;
	else
		nNpcCamp = LIAO_ID;
	end;
	local nCamp = BT_GetCamp();
	if nCamp ~= nNpcCamp then	--如果玩家的阵营与NPC阵营不同
		Talk(1,"","<color=green>"..nNpcName.."<color>：牛！你竟敢闯进来，还没被抓住！");
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Say("<color=green>"..nNpcName.."<color>：军需用品已被转移到前线，下次记得早点过来！",0);
		return 0;
	end;
	local nResourceCount1 = GetItemCount(tBattleItem[1][2],tBattleItem[1][3],tBattleItem[1][4]);
	local nResourceCount2 = GetItemCount(tBattleItem[2][2],tBattleItem[2][3],tBattleItem[2][4]);
	local nResourceCount3 = GetItemCount(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4]);
	local nStoneCount = GetItemCount(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4]);
	local selTab = {
			"上缴全部粮草/#handin(0)",
			"上缴初级粮草（共"..nResourceCount1.."个）/#handin(1)",
			"上缴中级粮草（共"..nResourceCount2.."个）/#handin(2)",
			"上缴高级粮草（共"..nResourceCount3.."个）/#handin(3)",
			"上缴玄铁矿石（共"..nStoneCount.."个）/handin_stone",
			"领取粮草锄头/get_hoe",
			"返回"..tCampNameZ[nCamp].."方后营/back_to_home",
			"结束对话/nothing"
			}
	Say("<color=green>"..nNpcName.."<color>：时间紧急，赶紧上缴吧。",getn(selTab),selTab);
end;

function handin(nType)
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nResourceCount1 = GetItemCount(tBattleItem[1][2],tBattleItem[1][3],tBattleItem[1][4]);
	local nResourceCount2 = GetItemCount(tBattleItem[2][2],tBattleItem[2][3],tBattleItem[2][4]);
	local nResourceCount3 = GetItemCount(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4]);
	if nType == 0 and nResourceCount1 == 0 and nResourceCount2 == 0 and nResourceCount3 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>：没有携带任何粮草，还是出去找找吧！")
		return 0;
	elseif nType == 1 and nResourceCount1 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>：没有携带初级粮草，还是出去找找吧！")
		return 0;
	elseif nType == 2 and nResourceCount2 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>：没有携带中级粮草，还是出去找找吧！")
		return 0;
	elseif nType == 3 and nResourceCount3 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>：没有携带高级粮草，还是出去找找吧！")
		return 0;
	end;
	local nBattlePoint = 0;	--粮草数量
	local nPersonalPoint = 0;
	local str1 = "";
	local str2 = "";
	local str3 = "";
	if nType == 0 or nType == 1 then
		if nResourceCount1 > 0 then
			if DelItem(tBattleItem[1][2],tBattleItem[1][3],tBattleItem[1][4],nResourceCount1) == 1 then
				nBattlePoint = nBattlePoint + tBPEven[BP_RESOURCE_HAND_IN_RES1]*nResourceCount1;
				nPersonalPoint = nPersonalPoint + tBPEven[BP_RESOURCE_HAND_IN_RES1]*nResourceCount1;
				str1 = "初级粮草"..nResourceCount1.."个，";
			end;
		end;
	end;
	if nType == 0 or nType == 2 then
		if nResourceCount2 > 0 then
			if DelItem(tBattleItem[2][2],tBattleItem[2][3],tBattleItem[2][4],nResourceCount2) == 1 then
				nBattlePoint = nBattlePoint + tBPEven[BP_RESOURCE_HAND_IN_RES2]*nResourceCount2;
				nPersonalPoint = nPersonalPoint + tBPEven[BP_RESOURCE_HAND_IN_RES2]*nResourceCount2;
				str2 = "中级粮草"..nResourceCount2.."个，";
			end;
		end;
	end;
	if nType == 0 or nType == 3 then
		if nResourceCount3 > 0 then
			if DelItem(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4],nResourceCount3) == 1 then
				nBattlePoint = nBattlePoint + tBPEven[BP_RESOURCE_HAND_IN_RES3]*nResourceCount3;
				nPersonalPoint = nPersonalPoint + tBPEven[BP_RESOURCE_HAND_IN_RES3]*nResourceCount3;
				str3 = "高级粮草"..nResourceCount3.."个，";
			end;
		end;
	end;
	local nProbability = 0;
	if nBattlePoint <= 19 then
		nProbability = 0;
	elseif nBattlePoint <= 79 then
		nProbability = 1;				
	else
		nProbability = 3;
	end;
	BT_EmperorAward(nProbability);
	local nCamp = BT_GetCamp();
	Add_Resource(nCamp,nBattlePoint);
	BT_SetData(PT_HANDIN_RESOURCE,BT_GetData(PT_HANDIN_RESOURCE)+nBattlePoint);
	BT_AddPersonalPoint(nPersonalPoint);
	Talk(1,"","<color=green>"..nNpcName.."<color>：你上缴了<color=yellow>"..str1..str2..str3.."<color>战场积分增加<color=yellow>"..nBattlePoint.."<color>点，累计战场积分<color=yellow>"..Get_ResCount(nCamp).."<color>点");
	Msg2MSGroup(MISSION_ID,"前线战报:"..GetName().."上缴"..str1..str2..str3.."当前积累战场积分："..Get_ResCount(nCamp),nCamp);
end;

function get_hoe()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	if BigGetItemCount(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4]) > 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>：你已经有"..tBattleItem[4][1].."了，如果您没有随身携带，赶紧从储物箱里取出来，时间不多了！");
	else
		if AddItem(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4],1) == 1 then
			BT_SetData(PTNC_USE_HOE_TIMES,0);
			Msg2Player("您获得了1个"..tBattleItem[4][1]);
		end;
	end;
end;

function back_to_home()
	local nCamp = BT_GetCamp()
	SetPos(ENTRANCE_POINT[nCamp][2],ENTRANCE_POINT[nCamp][3]);
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	SetFightState(0);
end;

function handin_stone()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nStoneCount = GetItemCount(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4]);
	if nStoneCount <= 0 then
		Talk(1,"main","<color=green>"..nNpcName.."<color>：好像您没有带玄铁矿石。");
	else
		local selTab = {
					"上缴玄铁矿石/handin_stone_confirm",
					"打听玄铁矿石秘密/know_cateran_header",
					"返回上一内容/main",
					}
		Say("<color=green>"..nNpcName.."<color>：你真的要上缴所有 (<color=yellow>"..nStoneCount.."<color>个) 玄铁矿石吗？听说山贼也非常喜欢它们。",getn(selTab),selTab);
	end;
end;

function handin_stone_confirm()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local nStoneCount = GetItemCount(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4]);
	local nBattlePoint = tBPEven[BP_RESOURCE_HAND_STONE_QM]*nStoneCount;
	if nStoneCount <= 0 then
		Talk(1,"main","<color=green>"..nNpcName.."<color>：你没有携带任何玄铁矿石");
	else
		if DelItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],nStoneCount) == 1 then
			BT_AddPersonalPoint(nBattlePoint);	--这里暂不使用BT_AddBattleEvenPoint
			Add_Resource(nCamp,nBattlePoint);
		end;
	end;
end;

function know_cateran_header()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	Talk(1,"main","<color=green>"..nNpcName.."<color>：山贼首领也正在收集玄铁矿石，听说他有很多宝藏，你也可以去找他。");
end;