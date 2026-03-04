--师门装备包脚本
--by 
--2020/04/06

tTab =
{
	{"师门一套头饰包", 2, 95, 1150, 1, 1},
	{"师门一套上衣包", 2, 95, 1151, 1, 2},
	{"师门一套下装包", 2, 95, 1152, 1, 3},
	{"师门一套武器包", 2, 95, 1153, 1, 4},
	{"师门二套头饰包", 2, 95, 1154, 2, 1},
	{"师门二套上衣包", 2, 95, 1155, 2, 2},
	{"师门二套下装包", 2, 95, 1156, 2, 3},
	{"师门二套武器包", 2, 95, 1157, 2, 4},
	{"师门第3套裤子包", 2, 94, 5, 3, 3},
	{"师门第3套帽子包", 2, 94, 6, 3, 1},
	{"师门第3套首饰包", 2, 94, 7, 3, 5},
	{"师门第3套衣服包", 2, 94, 8, 3, 2},
	{"师门第3套武器包", 2, 95, 1158, 3, 4},
	{"师门四套头饰包", 2, 95, 1159, 4, 1},
	{"师门四套上衣包", 2, 95, 1160, 4, 2},
	{"师门四套下装包", 2, 95, 1161, 4, 3},
	{"师门四套武器包", 2, 95, 1162, 4, 4},
	{"师门四套首饰包", 2, 95, 1163, 4, 5},
	{"师门四套装备包", 2, 95, 856, 4, 6},
}

--给第2、3套师门装备，戒指ID有问题，不适用于第4、5套
--nRoute：路线
--nBody：体形
--nGeneration：指明为第几套
--nType：指明为装备类型（1：头饰包；2：上衣包；3：下装包；4：武器包；5：首饰包）
--新用函数主要原因在于这里给的第3套师门设置为邦定装备，即AddItem第4个参数填为4。

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[2] == nGenre and value[3] == nDetail and value[4] == nParticular then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();

	local nGeneration = tTab[nTabIndex][5]
	local nType = tTab[nTabIndex][6]

	local nID2,nID3,nID4 = 0,0,0;
	local tbWeaponID2 = {nil, 3, 8, 0, nil, 1, nil, 2, 10, nil, 0, 5, nil, 2, 9, nil, 6, 4, nil, 7, 11, nil, 2, nil, 3, 9 , 11, nil, 13, 12, 14, 2};
	if nType == 1 then
		nID2 = 103
	elseif nType == 2 then
		nID2 = 100
	elseif nType == 3 then
		nID2 = 101
	elseif nType == 4 then
		nID2 = tbWeaponID2[nRoute];
	elseif nType == 5 then
		nID2 = 102
	end;

	if nRoute == 8 or nRoute == 9 then		--峨嵋特殊处理
		nID3 = nRoute*100+(nGeneration-1)*10+nBody-2;
	elseif nRoute == 23 or nRoute == 25 or nRoute == 26 or nRoute == 27 then		--新门派特殊处理
		nID3 = nRoute*1000+100+(nGeneration-1)*10+nBody;
	elseif nRoute == 29 or nRoute == 30 then		--新翠烟特殊处理
		nID3 = nRoute*1000+100+(nGeneration-1)*10+nBody-2;
	else
		nID3 = nRoute*100+(nGeneration-1)*10+nBody;
	end;
	
	if (nRoute == 2 or nRoute == 3 or nRoute == 4 or nRoute == 8 or nRoute == 9) and nGeneration == 3 then		--另一个戒指	
		nID4 = nID3 + 2;
	else
		nID4 = nID3 + 4;
	end

	local sRingName1 = GetItemName(0,102,nID3)
	local sRingName2 = GetItemName(0,102,nID4)

	if nType == 5 then
		local selTab = {};
		local szTitle = format("请选择要领取的首饰：")
		tinsert(selTab,sRingName1.."/#fe_AddFactionEquipment("..nItemIndex..", "..nID2..", "..nID3..")");
		tinsert(selTab,sRingName2.."/#fe_AddFactionEquipment("..nItemIndex..", "..nID2..", "..nID4..")");

		tinsert(selTab,"取消/cancel_dialog");
		Say(szTitle, getn(selTab), selTab);
	elseif nType == 6 then
		local nID2List = {100,101,103}
		nID2 = nID2List[random(1,3)];
		fe_AddFactionEquipment(nItemIndex, nID2, nID3)
	else
		fe_AddFactionEquipment(nItemIndex, nID2, nID3)
	end
end

function fe_AddFactionEquipment(nItemIndex,nID2, nID3)
	if zgc_pub_goods_add_chk(3,600) ~= 1 then
		return
	end
	if DelItemByIndex(nItemIndex,1) == 1 then
		local name = GetItemName(0,nID2,nID3)
		AddItem(0,nID2,nID3,1,1,-1,-1,-1,-1,-1,-1);
		Msg2Player("您获得了["..name.."]×1");
	end
end;

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

function cancel_dialog()
end
