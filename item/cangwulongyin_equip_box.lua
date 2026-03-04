--光昭烈武装备箱脚本
--by 
--2020/07/27
Include("\\script\\lib\\globalfunctions.lua")

tTab =
{
	{"苍梧龙隐装备箱", 2, 102, 255, 1, {1,100}, "装有苍梧龙隐装备的箱子，使用后可以获得一件与自身流派与体型相符的指定部位的苍梧龙隐装备。"},
	{"苍梧龙隐武器箱", 2, 102, 256, 2, {1,100}, "装有苍梧龙隐武器武器的箱子，使用后可以获得一件与自身流派与体型相符的苍梧龙隐武器。"},
	{"苍梧龙隐首饰箱", 2, 95, 4017, 3, {1,100}, "装有苍梧龙隐首饰的箱子，使用后可以获得一件与自身流派相符的苍梧龙隐首饰。"},
}

function OnUse(nItemIndex)
	local sItemName, G, D, P = get_item_info(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[2] == G and value[3] == D and value[4] == P then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	style = tTab[nTabIndex][5]
	room = tTab[nTabIndex][6] or ""
	dialog = tTab[nTabIndex][7] or ""
	UsePackToItem(PlayerIndex, nItemIndex, style, room, dialog)
end

function UsePackToItem(nPlayerIndex, nItemIndex, style, room, dialog)
	local selTab = {};
	local szTitle = ""
	local tbRouteTable = {2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 25, 26 , 27, 29, 30, 31, 32};
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nRouteFlag = 0
	if nRoute > 0 then
		for _, ckRoute in tbRouteTable do
			if ckRoute == nRoute then
				nRouteFlag		= 1;	-- Route标识
			end
		end
	end
	if nRouteFlag ~= 1 then
		Talk(1,"","侠士还没加入任何流派，不能用<color=yellow>苍梧龙隐装备箱<color>。");
		return
	end;

	local nID2,nID3,nID4 = 0,0,0;
	local tbID2 = {nil, {3,{40140,40141}}, {8,{40142,40143}}, {0,{40144,40145}}, nil, {1,{40146,40147,40148,40149}}, nil, {2,{nil,nil,40150,40151}}, {10,{nil,nil,40152,40153}}, nil, {0,{40154,40155,40156,40157}}, {5,{40158,40159,40160,40161}}, nil, {2,{40162,40163,40164,40165}}, {9,{40166,40167,40168,40169}}, nil, {6,{40170,40171,40172,40173}}, {4,{40174,40175,40176,40177}}, nil, {7,{40178,40179,40180,40181}}, {11,{40182,40183,40184,40185}}, nil, {2,{40186,40187}}, nil, {3,{40188,40189,40190,40191}}, {9,{40192,40193,40194,40195}}, {11,{40196,40197,40198,40199}}, nil, {13,{nil,nil,40200,40201}}, {12,{nil,nil,40202,40203}}, {14,{40204,40205,40206,40207}}, {2,{40208,40209}}};
	local tbRingID3 = {nil, {40045,40046}, {40047,40048}, {40049,40050}, nil, {40051,40052}, nil, {40053,40054}, {40055,40056}, nil, {40057,40058}, {40059,40060}, nil, {40061,40062}, {40063,40064}, nil, {40065,40066}, {40067,40068}, nil, {40069,40070}, {40071,40072}, nil, {40073,40074}, nil, {40075,40076}, {40077,40078}, {40079,40080}, nil, {40081,40082}, {40083,40084}, {40085,40086}, {40087,40088}};
	if style == 1 then
		nID3 = tbID2[nRoute][2][nBody]
		local capname = GetItemName(0,103,nID3)
		local shoename = GetItemName(0,101,nID3)
		local clothname = GetItemName(0,100,nID3)
		local szTitle = dialog.."选择您要获得哪件装备？"
		local tbOpt = {}
			tinsert(tbOpt, {capname, open_pack_item, {nPlayerIndex, nItemIndex, room, 103, nID3}})
			tinsert(tbOpt, {shoename, open_pack_item, {nPlayerIndex, nItemIndex, room, 101, nID3}})
			tinsert(tbOpt, {clothname, open_pack_item, {nPlayerIndex, nItemIndex, room, 100, nID3}})
			tinsert(tbOpt, {"暂时不打开", cancel_dialog})
		CreateNewSayEx(szTitle, tbOpt)
	elseif style == 2 then
		nID2 = tbID2[nRoute][1]
		nID3 = tbID2[nRoute][2][nBody]
		local szTitle = dialog.."确定要打开么？"
		local tbOpt = {}
			tinsert(tbOpt, {"确定", open_pack_item, {nPlayerIndex, nItemIndex, room, nID2, nID3}})
			tinsert(tbOpt, {"取消", cancel_dialog})
		CreateNewSayEx(szTitle, tbOpt)
	elseif style == 3 then
		local szTitle = dialog.."选择您要获得哪件首饰？"
		nID3 = tbRingID3[nRoute][1]
		nID4 = tbRingID3[nRoute][2]
		local ringname1 = GetItemName(0,102,nID3)
		local ringname2 = GetItemName(0,102,nID4)
		local tbOpt = {}
			tinsert(tbOpt, {ringname1, open_pack_item, {nPlayerIndex, nItemIndex, room, 102, nID3}})
			tinsert(tbOpt, {ringname2, open_pack_item, {nPlayerIndex, nItemIndex, room, 102, nID4}})
			tinsert(tbOpt, {"暂时不打开", cancel_dialog})
		CreateNewSayEx(szTitle, tbOpt)
	end
end

function open_pack_item(nPlayerIndex, nItemIndex, room, nID2, nID3)
	PlayerIndex = nPlayerIndex
	if zgc_pub_goods_add_chk(room[1],room[2]) ~= 1 then
		return
	end
	if DelItemByIndex(nItemIndex,1) == 1 then
		local name = GetItemName(0,nID2,nID3)
		AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1);
		Msg2Player("您获得了["..name.."]×1");
	end
end;

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

function zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","您的背包空间不足<color=yellow>"..goods_num.."<color>，获取失败！")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
		Talk (1,"","您的背包负重不足<color=yellow>"..goods_weight.."<color>，获取失败！")
		return 0
	else 
		return 1
	end
end

-- 退出对话，不做任何操作
function cancel_dialog()
end