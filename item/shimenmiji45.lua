--45师门秘籍脚本物品脚本
--ID:2,111,191
Include("\\script\\lib\\globalfunctions.lua")

tBook = {
	[1] = {
		[2] = {"金刚伏魔心法", 0, 107, 2}, 
		[4] = {"潜龙心法", 0, 107, 4}, 
		[3] = {"无尘心法", 0, 107, 6}, 
		[6] = {"天罗心法", 0, 107, 8}, 
		[8] = {"如意心法", 0, 107, 10}, 
		[9] = {"碧海心法", 0, 107, 12}, 
		[11] = {"混沌心法", 0, 107, 14}, 
		[12] = {"揆天心法", 0, 107, 16}, 
		[14] = {"幻影心法", 0, 107, 18}, 
		[15] = {"君子心法", 0, 107, 20}, 
		[17] = {"镇军心法", 0, 107, 22}, 
		[18] = {"穿云心法", 0, 107, 24}, 
		[20] = {"幽冥心法", 0, 107, 26}, 
		[21] = {"灵蛊心法", 0, 107, 28}, 
		[23] = {"惊风心法", 0, 107, 181}, 
		[25] = {"回锋心法", 0, 107, 183}, 
		[26] = {"负旗心法", 0, 107, 185}, 
		[27] = {"凝血心法", 0, 107, 187}, 
		[29] = {"醉梦心法", 0, 107, 189}, 
		[30] = {"繁花心法", 0, 107, 191}, 
		[31] = {"迷踪心法", 0, 107, 229}, 
		[32] = {"天锋心法", 0, 107, 233}, 
	},
	[2] = {
		[2] = {"金刚伏魔经", 0, 107, 1}, 
		[4] = {"潜龙秘籍", 0, 107, 3}, 
		[3] = {"无尘秘籍", 0, 107, 5}, 
		[6] = {"天罗秘籍", 0, 107, 7}, 
		[8] = {"如意秘籍", 0, 107, 9}, 
		[9] = {"碧海谱", 0, 107, 11}, 
		[11] = {"混沌秘籍", 0, 107, 13}, 
		[12] = {"揆天秘籍", 0, 107, 15}, 
		[14] = {"幻影秘籍", 0, 107, 17}, 
		[15] = {"君子秘籍", 0, 107, 19}, 
		[17] = {"镇军秘籍", 0, 107, 21}, 
		[18] = {"穿云秘籍", 0, 107, 23}, 
		[20] = {"幽冥鬼录", 0, 107, 25}, 
		[21] = {"灵蛊秘籍", 0, 107, 27}, 
		[23] = {"惊风秘籍", 0, 107, 180}, 
		[25] = {"回锋秘籍", 0, 107, 182}, 
		[26] = {"负旗秘籍", 0, 107, 184}, 
		[27] = {"凝血秘籍", 0, 107, 186}, 
		[29] = {"醉梦秘籍", 0, 107, 188}, 
		[30] = {"繁花秘籍", 0, 107, 190}, 
		[31] = {"迷踪秘籍", 0, 107, 228}, 
		[32] = {"天锋秘籍", 0, 107, 232}, 
	},
};

function OnUse(nItem)
	if gf_Judge_Room_Weight(1, 10," ") ~= 1 then
		return 0;
	end
	local nLock = 4
	local nByRoute  = 1
	local nNum  = 1
	local nIdx  = random(2) -- 1:心法;2:秘籍;random(2)随机
	local nRoute = GetPlayerRoute();
	local nRouteFlag = gf_IsPlayerRoute();
	if nRouteFlag ~= 1 then
		Talk(1,"","侠士还没加入任何流派，不能开启<color=yellow>初级师门秘籍包裹<color>。");
		return
	end;
	if DelItemByIndex(nItem, 1) == 1 then
		ahf_GetChujiMiji(nIdx, nByRoute, nNum, nLock);
	end
end

--初级秘籍
function ahf_GetChujiMiji(bIsIdx, bIsByRoute, nNum, bIsBand)
	if not nNum or nNum <= 0 then
		return
	end
	bIsIdx = bIsIdx or 2
	bIsBand = bIsBand or 4
	local nRoute = GetPlayerRoute();
	local nIndex = 0
	if bIsByRoute and bIsByRoute == 1 then
		nIndex = nRoute;
	else
		nIndex = tbRouteTable[random(getn(tbRouteTable))]
	end
	if not tBook[bIsIdx][nIndex] then return 0; end
	gf_AddItemEx2({tBook[bIsIdx][nIndex][2],tBook[bIsIdx][nIndex][3],tBook[bIsIdx][nIndex][4], nNum, bIsBand}, tBook[bIsIdx][nIndex][1], "ACTIVITY_HEAD", "获得师门心法或秘籍", 0, 1);
end

