--烈武装备箱脚本
--by 
--2020/07/27
Include("\\script\\lib\\globalfunctions.lua")

tTab =
{
	{"烈武装备箱", 2, 95, 3279, 1, {1,100}, "装有烈武装备的箱子，使用后可以获得一件与自身流派与体型相符的指定部位的烈武装备。"},
	{"烈武武器箱", 2, 95, 3280, 2, {1,100}, "装有烈武武器的箱子，使用后可以获得一件与自身流派与体型相符的烈武武器。"},
	{"烈武首饰箱", 2, 95, 5447, 3, {1,100}, "装有烈武首饰的箱子，使用后可以获得一件与自身流派相符的烈武首饰。"},
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
		Talk(1,"","侠士还没加入任何流派，不能用<color=yellow>烈武装备箱<color>。");
		return
	end;

	local nID2,nID3,nID4 = 0,0,0;
	local tbID2 = {nil, {3,{22270,22271}}, {8,{22272,22273}}, {0,{22274,22275}}, nil, {1,{22276,22277,22278,22279}}, nil, {2,{nil,nil,22280,22281}}, {10,{nil,nil,22282,22283}}, nil, {0,{22284,22285,22286,22287}}, {5,{22288,22289,22290,22291}}, nil, {2,{22292,22293,22294,22295}}, {9,{22296,22297,22298,22299}}, nil, {6,{22300,22301,22302,22303}}, {4,{22304,22305,22306,22307}}, nil, {7,{22308,22309,22310,22311}}, {11,{22312,22313,22314,22315}}, nil, {2,{22316,22317}}, nil, {3,{22318,22319,22320,22321}}, {9,{22322,22323,22324,22325}}, {11,{22326,22327,22328,22329}}, nil, {13,{nil,nil,22330,22331}}, {12,{nil,nil,22332,22333}}, {14,{22334,22335,22336,22337}}, {2,{22338,22339}}};
	local tbRingID3 = {nil, {8092,8093}, {8094,8095}, {8096,8097}, nil, {8098,8099}, nil, {8100,8101}, {8102,8103}, nil, {8104,8105}, {8106,8107}, nil, {8108,8109}, {8110,8111}, nil, {8112,8113}, {8114,8115}, nil, {8116,8117}, {8118,8119}, nil, {8120,8121}, nil, {8122,8123}, {8124,8125}, {8126,8127}, nil, {8128,8129}, {8130,8131}, {8132,8133}, {8134,8135}};
	if style == 1 then
		nID3 = tbID2[nRoute][2][nBody]
		local capname = GetItemName(0,103,nID3)
		local shoename = GetItemName(0,101,nID3)
		local clothname = GetItemName(0,100,nID3)
		local szTitle = dialog.."选择您要获得哪件装备？"
		local tbOpt = {}
			tinsert(tbOpt, {capname, open_pack_item, {nPlayerIndex, nItemIndex, room, 103, nID3}})
			tinsert(tbOpt, {shoename, open_pack_item, {nPlayerIndex, nItemIndex, room, 100, nID3}})
			tinsert(tbOpt, {clothname, open_pack_item, {nPlayerIndex, nItemIndex, room, 101, nID3}})
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