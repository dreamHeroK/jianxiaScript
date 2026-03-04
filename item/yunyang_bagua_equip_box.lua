--光昭烈武装备箱脚本
--by 
--2020/07/27
Include("\\script\\lib\\globalfunctions.lua")

tTab =
{
	{"云阳装备箱（八卦）", 2, 95, 3992, 1, {1,100}, "装有云阳装备（八卦）的箱子，使用后可以获得一件与自身流派与体型相符的指定部位的云阳装备。"},
	{"云阳武器箱（八卦）", 2, 95, 3993, 2, {1,100}, "装有云阳武器（八卦）的箱子，使用后可以获得一件与自身流派与体型相符的云阳武器。"},
}

--长留云阳装备箱（八卦）	2	95	3995
--长留云阳武器箱（八卦）	2	95	3996
--changliuyunyang_bagua_equip_box.lua
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
	--头衣裤
	local tbID3 = {nil, {3,{40382,40383}}, {8,{40384,40385}}, {0,{40386,40387}}, nil, {1,{40388,40389,40390,40391}}, nil, {2,{nil,nil,40392,40393}}, {10,{nil,nil,40394,40395}}, nil, {0,{40396,40397,40398,40399}}, {5,{40400,40401,40402,40403}}, nil, {2,{40404,40405,40406,40407}}, {9,{40408,40409,40410,40411}}, nil, {6,{40412,40413,40414,40415}}, {4,{40416,40417,40418,40419}}, nil, {7,{40420,40421,40422,40423}}, {11,{40424,40425,40426,40427}}, nil, {2,{40428,40429}}, nil, {3,{40430,40431,40432,40433}}, {9,{40434,40435,40436,40437}}, {11,{40438,40439,40440,40441}}, nil, {13,{nil,nil,40442,40443}}, {12,{nil,nil,40444,40445}}, {14,{40446,40447,40448,40449}}, {2,{40450,40451}}};
    --武器
	local tbID2 = {nil, {3,{40350,40351}}, {8,{40352,40353}}, {0,{40354,40355}}, nil, {1,{40356,40357,40358,40359}}, nil, {2,{nil,nil,40360,40361}}, {10,{nil,nil,40362,40363}}, nil, {0,{40364,40365,40366,40367}}, {5,{40368,40369,40370,40371}}, nil, {2,{40372,40373,40374,40375}}, {9,{40376,40377,40378,40379}}, nil, {6,{40380,40381,40382,40383}}, {4,{40384,40385,40386,40387}}, nil, {7,{40388,40389,40390,40391}}, {11,{40392,40393,40394,40395}}, nil, {2,{40396,40397}}, nil, {3,{40398,40399,40400,40401}}, {9,{40402,40403,40404,40405}}, {11,{40406,40407,40408,40409}}, nil, {13,{nil,nil,40410,40411}}, {12,{nil,nil,40412,40413}}, {14,{40414,40415,40416,40417}}, {2,{40418,40419}}};
    
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