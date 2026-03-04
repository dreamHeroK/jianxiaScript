--光昭烈武装备箱脚本
--by 
--2020/07/27
Include("\\script\\lib\\globalfunctions.lua")

tTab =
{
	{"长留云阳装备箱", 2, 95, 3990, 1, {1,100}, "装有长留云阳装备的箱子，使用后可以获得一件与自身流派与体型相符的指定部位的长留云阳装备。"},
	{"长留云阳武器箱", 2, 95, 3991, 2, {1,100}, "装有长留云阳武器武器的箱子，使用后可以获得一件与自身流派与体型相符的长留云阳武器。"},
	{"长留云阳首饰箱", 2, 95, 3997, 3, {1,100}, "装有长留云阳首饰的箱子，使用后可以获得一件与自身流派相符的长留云阳首饰。"},
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
		Talk(1,"","侠士还没加入任何流派，不能用<color=yellow>长留云阳装备箱<color>。");
		return
	end;

	local nID2,nID3,nID4 = 0,0,0;
	--头部衣服裤子
	local tbID3 = {nil, {3,{40452,40453}}, {8,{40454,40455}}, {0,{40456,40457}}, nil, {1,{40458,40459,40460,40461}}, nil, {2,{nil,nil,40462,40463}}, {10,{nil,nil,40464,40465}}, nil, {0,{40466,40467,40468,40469}}, {5,{40470,40471,40472,40473}}, nil, {2,{40474,40475,40476,40477}}, {9,{40478,40479,40480,40481}}, nil, {6,{40482,40483,40484,40485}}, {4,{40486,40487,40488,40489}}, nil, {7,{40490,40491,40492,40493}}, {11,{40494,40495,40496,40497}}, nil, {2,{40498,40499}}, nil, {3,{40500,40501,40502,40503}}, {9,{40504,40505,40506,40507}}, {11,{40508,40509,40510,40511}}, nil, {13,{nil,nil,40512,40513}}, {12,{nil,nil,40514,40515}}, {14,{40516,40517,40518,40519}}, {2,{40520,40521}}};
    --武器
	local tbID2 = {nil, {3,{40420,40421}}, {8,{40422,40423}}, {0,{40424,40425}}, nil, {1,{40426,40427,40428,40429}}, nil, {2,{nil,nil,40430,40431}}, {10,{nil,nil,40432,40433}}, nil, {0,{40434,40435,40436,40437}}, {5,{40438,40439,40440,40441}}, nil, {2,{40442,40443,40444,40445}}, {9,{40446,40447,40448,40449}}, nil, {6,{40450,40451,40452,40453}}, {4,{40454,40455,40456,40457}}, nil, {7,{40458,40459,40460,40461}}, {11,{40462,40463,40464,40465}}, nil, {2,{40466,40467}}, nil, {3,{40468,40469,40470,40471}}, {9,{40472,40473,40474,40475}}, {11,{40476,40477,40478,40479}}, nil, {13,{nil,nil,40480,40481}}, {12,{nil,nil,40482,40483}}, {14,{40484,40485,40486,40487}}, {2,{40488,40489}}};	
    local tbRingID3 = {nil, {40045,40046}, {40047,40048}, {40049,40050}, nil, {40051,40052}, nil, {40053,40054}, {40055,40056}, nil, {40057,40058}, {40059,40060}, nil, {40061,40062}, {40063,40064}, nil, {40065,40066}, {40067,40068}, nil, {40069,40070}, {40071,40072}, nil, {40073,40074}, nil, {40075,40076}, {40077,40078}, {40079,40080}, nil, {40081,40082}, {40083,40084}, {40085,40086}, {40087,40088}};
	if style == 1 then
		nID3 = tbID3[nRoute][2][nBody]
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