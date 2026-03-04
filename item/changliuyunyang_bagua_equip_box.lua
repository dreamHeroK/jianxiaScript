--光昭烈武装备箱脚本
--by 
--2020/07/27
Include("\\script\\lib\\globalfunctions.lua")

tTab =
{
	{"长留云阳装备箱（八卦）", 2, 95, 3995, 1, {1,100}, "装有长留云阳装备（八卦）的箱子，使用后可以获得一件与自身流派与体型相符的指定部位的长留云阳装备。"},
	{"长留云阳武器箱（八卦）", 2, 95, 3996, 2, {1,100}, "装有长留云阳武器（八卦）的箱子，使用后可以获得一件与自身流派与体型相符的长留云阳武器。"},
}

--长留长留云阳装备箱（八卦）	2	95	3995
--长留长留云阳武器箱（八卦）	2	95	3996
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
		Talk(1,"","侠士还没加入任何流派，不能用<color=yellow>长留云阳装备箱<color>。");
		return
	end;

	local nID2,nID3,nID4 = 0,0,0;
	--头衣裤
	local tbID3 = {nil, {3,{40522,40523}}, {8,{40524,40525}}, {0,{40526,40527}}, nil, {1,{40528,40529,40530,40531}}, nil, {2,{nil,nil,40532,40533}}, {10,{nil,nil,40534,40535}}, nil, {0,{40536,40537,40538,40539}}, {5,{40540,40541,40542,40543}}, nil, {2,{40544,40545,40546,40547}}, {9,{40548,40549,40550,40551}}, nil, {6,{40552,40553,40554,40555}}, {4,{40556,40557,40558,40559}}, nil, {7,{40560,40561,40562,40563}}, {11,{40564,40565,40566,40567}}, nil, {2,{40568,40569}}, nil, {3,{40570,40571,40572,40573}}, {9,{40574,40575,40576,40577}}, {11,{40578,40579,40580,40581}}, nil, {13,{nil,nil,40582,40583}}, {12,{nil,nil,40584,40585}}, {14,{40586,40587,40588,40589}}, {2,{40590,40591}}};
    --武器
	local tbID2 = {nil, {3,{40490,40491}}, {8,{40492,40493}}, {0,{40494,40495}}, nil, {1,{40496,40497,40498,40499}}, nil, {2,{nil,nil,40500,40501}}, {10,{nil,nil,40502,40503}}, nil, {0,{40504,40505,40506,40507}}, {5,{40508,40509,40510,40511}}, nil, {2,{40512,40513,40514,40515}}, {9,{40516,40517,40518,40519}}, nil, {6,{40520,40521,40522,40523}}, {4,{40524,40525,40526,40527}}, nil, {7,{40528,40529,40530,40531}}, {11,{40532,40533,40534,40535}}, nil, {2,{40536,40537}}, nil, {3,{40538,40539,40540,40541}}, {9,{40542,40543,40544,40545}}, {11,{40546,40547,40548,40549}}, nil, {13,{nil,nil,40550,40551}}, {12,{nil,nil,40552,40553}}, {14,{40554,40555,40556,40557}}, {2,{40558,40559}}};
    
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