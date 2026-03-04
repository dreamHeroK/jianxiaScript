

--2020/07/27
Include("\\script\\lib\\globalfunctions.lua")

tTab =
{
	{"东皇凤鸣装备箱", 2, 102, 190, 1, {1,100}, "装有东皇凤鸣装备的箱子，使用后可以获得一件与自身流派与体型相符的指定部位的东皇凤鸣装备。"},
	{"东皇凤鸣武器箱", 2, 102, 191, 2, {1,100}, "装有东皇凤鸣武器的箱子，使用后可以获得一件与自身流派与体型相符的东皇凤鸣武器。"},
	{"东皇凤鸣首饰箱", 2, 95, 4011, 3, {1,100}, "装有东皇凤鸣首饰的箱子，使用后可以获得一件与自身流派相符的东皇凤鸣首饰。"},
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
		Talk(1,"","侠士还没加入任何流派，不能用<color=yellow>东皇凤鸣装备箱<color>。");
		return
	end;

	local nID2,nID3,nID4 = 0,0,0;
	local tbID2 = {nil, {3,{22824,22825}}, {8,{22826,22827}}, {0,{22828,22829}}, nil, {1,{22830,22831,22832,22833}}, nil, {2,{nil,nil,22834,22835}}, {10,{nil,nil,22836,22837}}, nil, {0,{22838,22839,22840,22841}}, {5,{22842,22843,22844,22845}}, nil, {2,{22846,22847,22848,22849}}, {9,{22850,22851,22852,22853}}, nil, {6,{22854,22855,22856,22857}}, {4,{22858,22859,22860,22861}}, nil, {7,{22862,22863,22864,22865}}, {11,{22866,22867,22868,22869}}, nil, {2,{22870,22871}}, nil, {3,{22872,22873,22874,22875}}, {9,{22876,22877,22878,22879}}, {11,{22880,22881,22882,22883}}, nil, {13,{nil,nil,22884,22885}}, {12,{nil,nil,22886,22887}}, {14,{22888,22889,22890,22891}}, {2,{22892,22893}}};
	local tbRingID3 = {nil, {22943,22944}, {22945,22946}, {22947,22948}, nil, {22949,22950}, nil, {22951,22952}, {22953,22954}, nil, {22955,22956}, {22957,22958}, nil, {22959,22960}, {22961,22962}, nil, {22963,22964}, {22965,22966}, nil, {22967,22968}, {22969,22970}, nil, {22971,22972}, nil, {22973,22974}, {22975,22976}, {22977,22978}, nil, {22979,22980}, {22981,22982}, {22983,22984}, {22985,22986}};
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