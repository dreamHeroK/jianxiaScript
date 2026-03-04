--师门真卷包
Include("\\script\\lib\\globalfunctions.lua")

tBook = {
	[2] = {0, 107, 204, "金刚般若真卷", 2},
	[4] = {0, 107, 205, "潜龙寂灭真卷", 1},
	[3] = {0, 107, 206, "无尘菩提真卷", 1},
	[6] = {0, 107, 207, "天罗连珠真卷", 2},
	[8] = {0, 107, 208, "如意金顶真卷", 1},
	[9] = {0, 107, 209, "碧海绝音真卷", 1},
	[11] = {0, 107, 210, "混沌镇岳真卷", 2},
	[12] = {0, 107, 211, "揆天游龙真卷", 2},
	[14] = {0, 107, 212, "幻影迷踪真卷", 1},
	[15] = {0, 107, 213, "君子截风真卷", 2},
	[17] = {0, 107, 214, "镇军飞龙枪真卷", 2},
	[18] = {0, 107, 215, "穿云落虹真卷", 2},
	[20] = {0, 107, 216, "幽冥封魔真卷", 2},
	[21] = {0, 107, 217, "灵蛊幻邪真卷", 1},
	[23] = {0, 107, 218, "九天风雷真卷", 1},
	[25] = {0, 107, 219, "回锋斩日真卷", 2},
	[26] = {0, 107, 220, "负旗行阵真卷", 2},
	[27] = {0, 107, 221, "凝血封魂真卷", 1},
	[29] = {0, 107, 222, "红尘醉梦真卷", 2},
	[30] = {0, 107, 223, "风花千叶真卷", 2},
	[31] = {0, 107, 231, "迷踪真卷", 2},
	[32] = {0, 107, 235, "天锋真卷", 2},
}

function OnUse(nItem)
	if gf_Judge_Room_Weight(1, 10," ") ~= 1 then
		return 0;
	end
	local nRoute = GetPlayerRoute();
	local nRouteFlag = gf_IsPlayerRoute();
	if nRouteFlag ~= 1 then
		Talk(1,"","侠士还没加入任何流派，不能开启<color=yellow>师门高级真卷包裹<color>。");
		return
	end;
	if DelItemByIndex(nItem, 1) == 1 then
		ahf_GetGaojiZhenjuan(1, 1, 4);
	end
end


--高级真卷
function ahf_GetGaojiZhenjuan(bIsByRoute, nNum, bIsBand)
	if not nNum or nNum <= 0 then
		return
	end
	bIsBand = bIsBand or 4
	local nRoute = GetPlayerRoute();
	local nIndex = 0
	if bIsByRoute and bIsByRoute == 1 then
		nIndex = nRoute;
	else
		nIndex = tbRouteTable[random(getn(tbRouteTable))]
	end
	if not tBook[nIndex] then return 0; end
	-- gf_AddItemEx2({tBook[nIndex][1],tBook[nIndex][2],tBook[nIndex][3], nNum, bIsBand}, tBook[nIndex][4], "ACTIVITY_HEAD", "获得师门真卷", 0, 1);
	
	
	local _, nItemID = AddItem(tBook[nIndex][1], tBook[nIndex][2], tBook[nIndex][3], 1)
	
	if tBook[nIndex][5] == 1 then
		SetBookInfo(nItemID, nil, 5, 1, 20, 20, 20)
	else
		SetBookInfo(nItemID, nil, 5, 20, 1, 20, 20)
	end
end
