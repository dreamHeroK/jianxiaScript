--70师门秘籍脚本物品脚本
Include("\\script\\lib\\globalfunctions.lua")

tBook = 
{
	[2] = {"金刚般若经", 0, 107, 166}, 
	[4] = {"潜龙寂灭经", 0, 107, 167}, 
	[3] = {"无尘菩提经", 0, 107, 168}, 
	[6] = {"天罗连珠录", 0, 107, 169}, 
	[8] = {"如意金顶秘籍", 0, 107, 170}, 
	[9] = {"碧海绝音谱", 0, 107, 171}, 
	[11] = {"混沌镇岳秘籍", 0, 107, 172}, 
	[12] = {"揆天游龙秘籍", 0, 107, 173}, 
	[14] = {"幻影迷踪秘籍", 0, 107, 174}, 
	[15] = {"君子截风秘籍", 0, 107, 175}, 
	[17] = {"镇军飞龙枪谱", 0, 107, 176}, 
	[18] = {"穿云落虹秘籍", 0, 107, 177}, 
	[20] = {"幽冥封魔录", 0, 107, 178}, 
	[21] = {"灵蛊幻邪录", 0, 107, 179}, 
	[23] = {"九天风雷诀", 0, 107, 198}, 
	[25] = {"回锋斩日秘籍", 0, 107, 199}, 
	[26] = {"负旗行阵秘籍", 0, 107, 200}, 
	[27] = {"凝血封魂秘籍", 0, 107, 201}, 
	[29] = {"红尘醉梦谱", 0, 107, 202}, 
	[30] = {"风花千叶谱", 0, 107, 203}, 
	[31] = {"迷踪侠影录", 0, 107, 230}, 
	[32] = {"天锋定影诀", 0, 107, 234}, 
};

function OnUse(nItem)
	if gf_Judge_Room_Weight(1, 10," ") ~= 1 then
		return 0;
	end
	local nLock = 4
	local nByRoute  = 1
	local nNum  = 1
	local nRoute = GetPlayerRoute();
	local nRouteFlag = gf_IsPlayerRoute();
	if nRouteFlag ~= 1 then
		Talk(1,"","侠士还没加入任何流派，不能开启<color=yellow>高级师门秘籍包裹<color>。");
		return
	end;
	if DelItemByIndex(nItem, 1) == 1 then
		ahf_GetGaojiMiji(nByRoute, nNum, nLock);
	end
end

--高级秘籍
function ahf_GetGaojiMiji(bIsByRoute, nNum, bIsBand)
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
	gf_AddItemEx2({tBook[nIndex][2],tBook[nIndex][3],tBook[nIndex][4], nNum, bIsBand}, tBook[nIndex][1], "ACTIVITY_HEAD", "获得师门秘籍", 0, 1);
end

