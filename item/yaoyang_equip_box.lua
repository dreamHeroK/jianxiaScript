--耀阳装备箱脚本
--by 
--2020/07/27
Include("\\script\\lib\\globalfunctions.lua")

tTab =
{
	{"耀阳装备箱", 2, 95, 5443, 1, {1,100}, "装有耀阳装备的箱子，使用后可以获得一件与自身流派与体型相符的指定部位的耀阳装备。"},
	{"耀阳武器箱", 2, 95, 5444, 2, {1,100}, "装有耀阳武器的箱子，使用后可以获得一件与自身流派与体型相符的耀阳武器。"},
	{"耀阳首饰箱", 2, 95, 5445, 3, {1,100}, "装有耀阳首饰的箱子，使用后可以随机获得一件耀阳首饰。"},
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
		Talk(1,"","侠士还没加入任何流派，不能用<color=yellow>耀阳装备箱<color>。");
		return
	end;
	local nID2,nID3,nID4 = 0,0,0;
	local tbWeaponID2 = {nil, {3,8992}, {8,8994}, {0,8993}, nil, {1,8995}, nil, {2,8996}, {10,8997}, nil, {0,8998}, {5,8999}, nil, {2,9000}, {9,9001}, nil, {6,9002}, {4,9003}, nil, {7,9004}, {11,9005}, nil, {2,9006}, nil, {3,9007}, {9,9008}, {11,9009}, nil, {13,9010}, {12,9011}, {14,9065}, {2,9064}};
	local tbID3 = {nil, {3128,3129}, {3132,3133}, {3130,3131}, nil, {3134,3135,3136,3137}, nil, {nil,nil,3138,3139}, {nil,nil,3140,3141}, nil, {3142,3143,3144,3145}, {3146,3147,3148,3149}, nil, {3150,3151,3152,3153}, {3154,3155,3156,3157}, nil, {3158,3159,3160,3161}, {3162,3163,3164,3165}, nil, {3166,3167,3168,3169}, {3170,3171,3172,3173}, nil, {3174,3175}, nil, {3176,3177,3178,3179}, {3180,3181,3182,3183}, {3184,3185,3186,3187}, nil, {nil,nil,3188,3189}, {nil,nil,3190,3191}, {4107,4108,4109,4110}, {4111,4112}};
	local tbRingID3 = {3176, 3178, 3180, 3182, 3184};
	if style == 1 then
		nID3 = tbID3[nRoute][nBody]
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
		nID2 = tbWeaponID2[nRoute][1]
		nID3 = tbWeaponID2[nRoute][2]
		local szTitle = dialog.."确定要打开么？"
		local tbOpt = {}
			tinsert(tbOpt, {"确定", open_pack_item, {nPlayerIndex, nItemIndex, room, nID2, nID3}})
			tinsert(tbOpt, {"取消", cancel_dialog})
		CreateNewSayEx(szTitle, tbOpt)
	elseif style == 3 then
		local szTitle = dialog.."确定要打开么？"
		nID3 = tbRingID3[random(1, getn(tbRingID3))];
		local tbOpt = {}
			tinsert(tbOpt, {"确定", open_pack_item, {nPlayerIndex, nItemIndex, room, 102, nID3}})
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