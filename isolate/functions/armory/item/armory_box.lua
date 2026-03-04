--脚本名称：
--脚本功能：
--功能策划：刘亮
--功能开发：朱力
--开发时间：2010-03-26
--代码修改记录
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\isolate\\functions\\armory\\item\\armory_head.lua")

g_szLogCaption = "纹饰";

function OnUse(idx)
    local nItemIndex = tonumber(idx);
    local nG, nD, nP = GetItemInfoByIndex(nItemIndex);
    local tItem = g_tItem[nP];

    if not tItem then
        return 0;
    end

    if tItem[2] ~= nG or tItem[3] ~= nD or tItem[4] ~= nP then
        return 0;
    end

    Confirm(nP, nItemIndex);

    return 1;
end

function Confirm(nSel, nItemIndex)
    local tItem = g_tItem[nSel];

    if not tItem then
        return 0;
    end

    local szTitle = format("<color=green>[%s]<color>: 使用<color=green>%s<color><color=red>可以<color> 随机获得%s%s<color=yellow>纹饰1个<color>。\n\n", tItem[1], tItem[1], g_tStringTable.tLevel[tItem[6]], g_tStringTable.tArmory[tItem[5]]);
    local tMenu = {
        format("%s/#Award(%d,%d)", "确认", nSel, nItemIndex),
        "稍后再决定	/nothing",
    };
    Say(szTitle, getn(tMenu), tMenu);

    return 1;
end


function Award(nSel, nItemIndex)
	local tItem = g_tItem[nSel];

	if not tItem then
		return 0;
	end

	if 1 ~= gf_JudgeRoomWeight(1, 1, tItem[1]) then
		return 0;
	end
	
	local bBind = GetItemStatus(nItemIndex, 1)

	if 1 ~= DelItemByIndex(nItemIndex, 1) then
		return 0;
	end

	MakeArmory(tItem[5], tItem[6], bBind);

	return 1;
end

function MakeArmory(nPart, nLevel, bBind)
	local nRet, tArmory = GetArmory(nPart, nLevel);

	if 0 == nRet or not tArmory then
		return 0;
	end

	local nRet, tMagicAttribute = GetMagicAttribute(nPart, nLevel);

	if 0 == nRet or not tMagicAttribute then
		return 0;
	end
	
	local nBind = 1
	if 1 == bBind then	nBind = 4	end

	gf_SetLogCaption(g_szLogCaption);
	local _, nIdx = gf_AddItemEx({tArmory[2], tArmory[3], tArmory[4], 1, nBind, tMagicAttribute[1][2], tMagicAttribute[1][1], tMagicAttribute[2][2], tMagicAttribute[2][1], tMagicAttribute[3][2], tMagicAttribute[3][1], -1}, tArmory[1]);
  --  SetArmoryQuality(nIdx, 3);
	return 1;
end

function RandomSelected(tData, nRndIdx)
	if not tData or 0 == getn(tData) then
		return 0;
	end

	local nMax = 0;
	for idx, tInfo in tData do
		if type(tInfo) == "table" then
			nMax = nMax + tInfo[nRndIdx];
		end
	end

	local nRand = random(1, nMax);
	for idx, tInfo in tData do
		if type(tInfo) == "table" then
			nRand = nRand - tInfo[nRndIdx];
			if nRand <= 0 then
				return idx;
			end
		end
	end

	assert();
end

function GetArmory(nPart, nLevel)
	local tArmoryZone = g_tArmory[nPart];

	if not tArmoryZone then
		return 0;
	end

	tArmoryZone = tArmoryZone[nLevel];

	if not tArmoryZone then
		return 0;
	end

	local nSel = RandomSelected(tArmoryZone, 1);

	if not tArmoryZone[nSel] then
		return 0;
	end

	return 1, tArmoryZone[nSel][2];
end

function GetMagicAttribute(nPart, nLevel)
	local nPartIndex	= g_tMagicAttribute.tPartIndex[nPart];
	local nLevelIndex	= nLevel + 1;

	if not nPartIndex then
		return 0;
	end

	local tMagicAttribute = {};

	for _, tMagicAttrZone in g_tMagicAttribute.tMagicInfo do
		local nSel = RandomSelected(tMagicAttrZone, nPartIndex);

		if not tMagicAttrZone[nSel] then
			return 0;
		end

		tMagicAttribute[getn(tMagicAttribute) + 1] = tMagicAttrZone[nSel][5][nLevelIndex];
	end

	return 1, tMagicAttribute;
end
