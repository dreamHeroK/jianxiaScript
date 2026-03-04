--光昭烈武装备箱脚本
--by 
--2020/07/27
Include("\\script\\lib\\globalfunctions.lua")

tTab =
{
	{"苍梧龙隐装备箱（八卦）", 2, 95, 4015, 1, {1,100}, "装有苍梧龙隐装备（八卦）的箱子，使用后可以获得一件与自身流派与体型相符的指定部位的苍梧龙隐装备。"},
	{"苍梧龙隐武器箱（八卦）", 2, 95, 4016, 2, {1,100}, "装有苍梧龙隐武器（八卦）的箱子，使用后可以获得一件与自身流派与体型相符的苍梧龙隐武器。"},
--	{"苍梧龙隐首饰箱", 2, 95, 4014, 3, {1,100}, "装有苍梧龙隐首饰的箱子，使用后可以获得一件与自身流派相符的苍梧龙隐首饰。"},
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
	local tbID2 = {nil, {3,{40210,40211}}, {8,{40212,40213}}, {0,{40214,40215}}, nil, {1,{40216,40217,40218,40219}}, nil, {2,{nil,nil,40220,40221}}, {10,{nil,nil,40222,40223}}, nil, {0,{40224,40225,40226,40227}}, {5,{40228,40229,40230,40231}}, nil, {2,{40232,40233,40234,40235}}, {9,{40236,40237,40238,40239}}, nil, {6,{40240,40241,40242,40243}}, {4,{40244,40245,40246,40247}}, nil, {7,{40248,40249,40250,40251}}, {11,{40252,40253,40254,40255}}, nil, {2,{40256,40257}}, nil, {3,{40258,40259,40260,40261}}, {9,{40262,40263,40264,40265}}, {11,{40266,40267,40268,40269}}, nil, {13,{nil,nil,40270,40271}}, {12,{nil,nil,40272,40273}}, {14,{40274,40275,40276,40277}}, {2,{40278,40279}}};
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
	 -- AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,0,15,nLingqi)
		AddItem(0,nID2,nID3,1,4,0,0,0,0,0,0,0,15,150);
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