Include("\\script\\newbattles\\functions.lua");

function main()
	local selTab = {
				"打开储物箱/open_box",
				"我要维修装备/repair",
				"领取战场药品/want_medicine",
--				"兑换战场药品/buy_medicine",
				"没什么事/nothing",
				}
	local szSaySth = "";
	local nCurMapID = GetWorldPos();
	if nCurMapID == VILLAGE_MAP_ID then
	elseif nCurMapID == RESOURCE_MAP_ID then
		tremove(selTab,3);	--草谷场战没有领取药品和积分换药功能
		tremove(selTab,3);
	elseif nCurMapID == EMPLACEMENT_MAP_ID then
		
	elseif nCurMapID == MAIN_MAP_ID then	--主战场对话选项判断

	end;
	szSaySth = "有什么需要帮忙的吗？";
	Say("<color=green>战场军需官<color>："..szSaySth,getn(selTab),selTab);
end;

function want_medicine()
	-- if BT_GetData(PTNC_GOT_MEDICINE) == 1 then
		-- Talk(1,"","<color=green>战场军需官<color>：军中药品数量不多，每场战场每人只能领取一次药品。");
		-- return 0;
	-- end;
	local nCount = 0;
	local nCurMapID = GetWorldPos();
	if nCurMapID == MAIN_MAP_ID then
		local nPlayerCamp = BT_GetCamp();
		local nResourceCamp = GetGlbValue(GLB_RESOURCE);
		if nPlayerCamp == nResourceCamp then
			nCount = 50;	--胜方可获50个
		elseif nResourceCamp == 0 then
			nCount = 40;	--平局可获40个
		else
			nCount = 25;	--败方可获25个
		end;
	else
		nCount = 30;
	end;
	if gf_Judge_Room_Weight(3,300) == 1 then	
		BT_SetData(PTNC_GOT_MEDICINE,1);
		AddItem(tBattleItem[9][2],tBattleItem[9][3],tBattleItem[9][4],nCount);
		Msg2Player("您获得了"..nCount.."个"..tBattleItem[9][1]);	
		AddItem(tBattleItem[10][2],tBattleItem[10][3],tBattleItem[10][4],nCount);
		Msg2Player("您获得了"..nCount.."个"..tBattleItem[10][1]);	
		AddItem(tBattleItem[11][2],tBattleItem[11][3],tBattleItem[11][4],nCount);
		Msg2Player("您获得了"..nCount.."个"..tBattleItem[11][1]);	
	else
		Talk(1,"","<color=green>战场军需官<color>：您的背包空间或者负重不足，请先检查！");
	end;
end;

function buy_medicine()
	local selTab = {
				"我想换取战场药品/want_battle_medicine",
				"我想换取普通药品/want_pk_medicine",
				"没什么事/nothing",
				}
	Say("<color=green>战场军需官<color>：您想换取哪种药品？",getn(selTab),selTab);
end;
--===========================================================================================
function want_battle_medicine()
	list_battle_medicine(1,getn(tBattleMed));
end;

function list_battle_medicine(nPageNum,nCount)
	local tMedList = get_battle_medicine_list();
	local selTab = {};
	local nItemPerPage = 4;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nCount);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("上一页 \n /#list_battle_medicine(%d,%d)",nPageNum-1,nCount));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tMedList[i]);
	end;
	if nPageNum ~= ceil(nCount/nItemPerPage) then
		tinsert(selTab,format("\n下一页/#list_battle_medicine(%d,%d)",nPageNum+1,nCount));	
	end;
	tinsert(selTab,"\n我想看看其他药物/buy_medicine");
	tinsert(selTab,"没什么事/nothing");
	Say("<color=green>战场军需官<color>：您想换取哪种药品？",getn(selTab),selTab);
end;

function get_battle_medicine_list()
	local tSelTab = {};
	for i=1,getn(tBattleMed) do
		tinsert(tSelTab,format(tBattleMed[i][1].."/#select_battle_medicine(%d)",i));
	end;
	return tSelTab;
end;

function select_battle_medicine(nMedIdx)
	local selTab = {
					format("我想换取1个/#get_battle_medicine(%d,%d)",nMedIdx,1),
					format("我想换取2个/#get_battle_medicine(%d,%d)",nMedIdx,2),
					format("我想换取5个/#get_battle_medicine(%d,%d)",nMedIdx,5),
					format("我想换取10个/#get_battle_medicine(%d,%d)",nMedIdx,10),
					format("我想换取20个/#get_battle_medicine(%d,%d)",nMedIdx,20),
					"\n我想看看其他的药品/want_battle_medicine",
					"没什么事/nothing",
					}
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local szItemName = tBattleMed[nMedIdx][1];
	local nNeedPoint = tBattleMed[nMedIdx][5];
	local nMaxCount = floor(nCurPoint/nNeedPoint);
	local szEffect = tBattleMed[nMedIdx][6];
	local nCurRank = abs(BT_GetData(PT_CURRANK));
	local nNeedRank = tBattleMed[nMedIdx][7];
	if nCurRank < nNeedRank then
		Talk(1,"want_battle_medicine","<color=green>战场军需官<color>：您的军衔不足，需要达到<color=yellow>"..tRankName[nNeedRank].."<color>才可以换取这些药品。");
		return 0;
	end;
	Say("<color=green>战场军需官<color>：每个<color=yellow>"..szItemName.."<color>需要<color=yellow>"..nNeedPoint.."<color>积分，您目前拥有的累积积分<color=yellow>"..nCurPoint.."<color>，最多可以兑换<color=yellow>"..nMaxCount.."<color>个"..szItemName.."。药品效果：<color=yellow>"..szEffect.."<color>.",getn(selTab),selTab);
end;

function get_battle_medicine(nMedIdx,nCount)
	local nNeedPoint = tBattleMed[nMedIdx][5];
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local szItemName = tBattleMed[nMedIdx][1];
	if gf_JudgeRoomWeight(2,nCount*2) == 0 then
		Talk(1,"","<color=green>战场军需官<color>：您的背包空间或者负重不足，请先检查！");
		return 0;
	end;
	local nNeedTotalPoint = nNeedPoint*nCount;
	if nCurPoint < nNeedTotalPoint then
		Talk(1,"","<color=green>战场军需官<color>：您的战场积分不足！");
		return 0;
	end;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedTotalPoint);
	AddItem(tBattleMed[nMedIdx][2],tBattleMed[nMedIdx][3],tBattleMed[nMedIdx][4],nCount);
	Msg2Player("您消耗了"..nNeedTotalPoint.."战场积分")
	Msg2Player("您获得了"..nCount.."个"..szItemName);
end;
--===========================================================================================
function want_pk_medicine()
	list_pk_medicine(1,getn(tPKMed));
end;

function list_pk_medicine(nPageNum,nCount)
	local tMedList = get_pk_medicine_list();
	local selTab = {};
	local nItemPerPage = 4;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nCount);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("上一页\n /#list_pk_medicine(%d,%d)",nPageNum-1,nCount));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tMedList[i]);
	end;
	if nPageNum ~= ceil(nCount/nItemPerPage) then
		tinsert(selTab,format("\n下一页/#list_pk_medicine(%d,%d)",nPageNum+1,nCount));	
	end;
	tinsert(selTab,"\n我先看看其他药品/buy_medicine");
	tinsert(selTab,"没什么事/nothing");
	Say("<color=green>战场军需官<color>：您想换取哪种药品？",getn(selTab),selTab);
end;

function get_pk_medicine_list()
	local tSelTab = {};
	for i=1,getn(tPKMed) do
		tinsert(tSelTab,format(tPKMed[i][1].."/#select_pk_medicine(%d)",i));
	end;
	return tSelTab;
end;

function select_pk_medicine(nMedIdx)
	local selTab = {
					format("我想换取1个/#get_pk_medicine(%d,%d)",nMedIdx,1),
					format("我想换取2个/#get_pk_medicine(%d,%d)",nMedIdx,2),
					format("我想换取5个/#get_pk_medicine(%d,%d)",nMedIdx,5),
					format("我想换取10个/#get_pk_medicine(%d,%d)",nMedIdx,10),
					format("我想换取20个/#get_pk_medicine(%d,%d)",nMedIdx,20),
					"\n我想看看其他的药品/want_pk_medicine",
					"没什么事/nothing",
					}
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local szItemName = tPKMed[nMedIdx][1];
	local nNeedPoint = tPKMed[nMedIdx][5];
	local nMaxCount = floor(nCurPoint/nNeedPoint);
	local szEffect = tPKMed[nMedIdx][6];
	local nCurRank = abs(BT_GetData(PT_CURRANK));
	local nNeedRank = tPKMed[nMedIdx][7];
	if nCurRank < nNeedRank then
		Talk(1,"want_pk_medicine","<color=green>战场军需官<color>：您的军衔不足，需要达到<color=yellow>"..tRankName[nNeedRank].."<color>才可以换取这些药品。");
		return 0;
	end;
	Say("<color=green>战场军需官<color>：每个<color=yellow>"..szItemName.."<color>需要<color=yellow>"..nNeedPoint.."<color>积分，您目前拥有的累积积分<color=yellow>"..nCurPoint.."<color>，最多可以兑换<color=yellow>"..nMaxCount.."<color>个"..szItemName.."。药品效果：<color=yellow>"..szEffect.."<color>.",getn(selTab),selTab);
end;

function get_pk_medicine(nMedIdx,nCount)
	local nNeedPoint = tPKMed[nMedIdx][5];
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local szItemName = tPKMed[nMedIdx][1];
	if gf_JudgeRoomWeight(2,nCount*2) == 0 then
		Talk(1,"","<color=green>战场军需官<color>：您的背包空间或者负重不足，请先检查！");
		return 0;
	end;
	local nNeedTotalPoint = nNeedPoint*nCount;
	if nCurPoint < nNeedTotalPoint then
		Talk(1,"","<color=green>战场军需官<color>：您的战场积分不足！");
		return 0;
	end;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedTotalPoint);
	AddItem(tPKMed[nMedIdx][2],tPKMed[nMedIdx][3],tPKMed[nMedIdx][4],nCount);
	Msg2Player("您消耗了"..nNeedTotalPoint.."战场积分")
	Msg2Player("您获得了"..nCount.."个"..szItemName);
end;
--===========================================================================================
function open_box()
	if GetTask(805) == 0 then
		Talk(1,"","您尚未开启储物箱。");
		return 0;
	end;
	OpenBox();
end;

function repair()
	local selTab = {
			"无损维修(当前耐久度大于0)/repair1",
			"升级维修/repair2",
			"无损维修(当前耐久度等于0)/repair3",
			"返回/main"
			};
	Say("<color=green>战场军需官<color>：维修时一定要选好装备。",getn(selTab),selTab)
end;

function repair1()
	AdvanceRepair(1);
end;

function repair2()
	AdvanceRepair(2);
end;

function repair3()
	AdvanceRepair(3);
end;

function nothing()

end;