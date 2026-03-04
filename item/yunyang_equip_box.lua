--光昭烈武装备箱脚本
--by 
--2020/07/27
Include("\\script\\lib\\globalfunctions.lua")

tTab =
{
	{"云阳装备箱", 2, 95, 3988, 1, {1,100}, "装有云阳装备的箱子，使用后可以获得一件与自身流派与体型相符的指定部位的云阳装备。"},
	{"云阳武器箱", 2, 95, 3989, 2, {1,100}, "装有云阳武器武器的箱子，使用后可以获得一件与自身流派与体型相符的云阳武器。"},
	{"云阳首饰箱", 2, 95, 4014, 3, {1,100}, "装有云阳首饰的箱子，使用后可以获得一件与自身流派相符的云阳首饰。"},
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
		Talk(1,"","侠士还没加入任何流派，不能用<color=yellow>云阳装备箱<color>。");
		return
	end;

	local nID2,nID3,nID4 = 0,0,0;
	--头部衣服裤子
	local tbID3 = {nil, {3,{40312,40313}}, {8,{40314,40315}}, {0,{40316,40317}}, nil, {1,{40318,40319,40320,40321}}, nil, {2,{nil,nil,40322,40323}}, {10,{nil,nil,40324,40325}}, nil, {0,{40326,40327,40328,40329}}, {5,{40330,40331,40332,40333}}, nil, {2,{40334,40335,40336,40337}}, {9,{40338,40339,40340,40341}}, nil, {6,{40342,40343,40344,40345}}, {4,{40346,40347,40348,40349}}, nil, {7,{40350,40351,40352,40353}}, {11,{40354,40355,40356,40357}}, nil, {2,{40358,40359}}, nil, {3,{40360,40361,40362,40363}}, {9,{40364,40365,40366,40367}}, {11,{40368,40369,40370,40371}}, nil, {13,{nil,nil,40372,40373}}, {12,{nil,nil,40374,40375}}, {14,{40376,40377,40378,40379}}, {2,{40380,40381}}};
    --武器
	local tbID2 = {nil, {3,{40280,40281}}, {8,{40282,40283}}, {0,{40284,40285}}, nil, {1,{40286,40287,40288,40289}}, nil, {2,{nil,nil,40290,40291}}, {10,{nil,nil,40292,40293}}, nil, {0,{40294,40295,40296,40297}}, {5,{40298,40299,40300,40301}}, nil, {2,{40302,40303,40304,40305}}, {9,{40306,40307,40308,40309}}, nil, {6,{40310,40311,40312,40313}}, {4,{40314,40315,40316,40317}}, nil, {7,{40318,40319,40320,40321}}, {11,{40322,40323,40324,40325}}, nil, {2,{40326,40327}}, nil, {3,{40328,40329,40330,40331}}, {9,{40332,40333,40334,40335}}, {11,{40336,40337,40338,40339}}, nil, {13,{nil,nil,40340,40341}}, {12,{nil,nil,40342,40343}}, {14,{40344,40345,40346,40347}}, {2,{40348,40349}}};	
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