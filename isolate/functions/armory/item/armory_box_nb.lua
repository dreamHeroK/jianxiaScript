--脚本名称：
--脚本功能：
--功能策划：刘亮
--功能开发：朱力
--开发时间：2011-03-15
--代码修改记录
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\isolate\\functions\\armory\\item\\armory_head.lua")

g_szLogCaption = "纹饰刻板";
g_tPlayerData  = {};

function OnUse(idx)
    local nItemIndex = tonumber(idx);
    local nG, nD, nP = GetItemInfoByIndex(nItemIndex);
    local tItem = g_tItem_NB[nP];

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
    local tItem = g_tItem_NB[nSel];

    if not tItem then
        return 0;
    end

    nItemIndex = nItemIndex or 0
    g_tPlayerData[GetName()] = {};

    local szTitle = format("<color=green>[%s]<color>: 开启获得指定属性<color=yellow>[%s][+%d][%s]<color>。\n\n", tItem[1], g_tStringTable.tLevel[tItem[5]], tItem[6], g_tStringTable.tQuality[tItem[7]]);
    local tMenu = {
        format("%s/#Award(%d, %d)", "开启", nSel, nItemIndex),
        "结束对话/nothing",
    };
    Say(szTitle, getn(tMenu), tMenu);

    return 1;
end

function Award(nSel, nItemIndex)
    local tItem = g_tItem_NB[nSel];

    if not tItem then
        return 0;
    end

    if 1 ~= gf_JudgeRoomWeight(1, 1, tItem[1]) then
        return 0;
    end

    g_tPlayerData[GetName()] = g_tPlayerData[GetName()] or {};
    if nItemIndex and nItemIndex > 0 then
        g_tPlayerData[GetName()].nItemIndex = nItemIndex
    end
    if not g_tPlayerData[GetName()].bConfirm or 1 ~= g_tPlayerData[GetName()].bConfirm then
        MakeArmory(nSel);
        return 0;
    end

    local tData            = g_tPlayerData[GetName()];
    local tArmory           = {};
    local tMagicAttribute   = {};

    nItemIndex = nItemIndex or tData.nItemIndex
    local nBind = 1
    if 1 == GetItemStatus(nItemIndex, 1) then
        nBind = 4
    end
    if not tData.nArmory or not tData.nSeries then
        return 0;
    end

    if not g_tArmory[tData.nArmory] or not g_tArmory[tData.nArmory][tItem[5]] or not g_tArmory[tData.nArmory][tItem[5]][tData.nSeries] then
        return 0;
    end

    tArmory = g_tArmory[tData.nArmory][tItem[5]][tData.nSeries][2];

    for k, v in g_tMagicAttribute.tMagicInfo do
        if not tData.tMagicAttribute or not tData.tMagicAttribute[k] or not v[tData.tMagicAttribute[k]] then
            return 0;
        end
        tMagicAttribute[k] = v[tData.tMagicAttribute[k]][5][1 + tItem[5]];
    end

    if 1 ~= DelItemByIndex(nItemIndex, 1) then
        print("DelItemByIndex error ", nItemIndex)
        return 0;
    end

    gf_SetLogCaption(g_szLogCaption);
    local _, nIdx = gf_AddItemEx({tArmory[2], tArmory[3], tArmory[4], 1, nBind, tMagicAttribute[1][2], tMagicAttribute[1][1], tMagicAttribute[2][2], tMagicAttribute[2][1], tMagicAttribute[3][2], tMagicAttribute[3][1], -1, tItem[6]}, tArmory[1]);
    SetArmoryQuality(nIdx, tItem[7]);

    nothing();

    return 1;
end

function MakeArmory(nSel, nStep)
    if not nStep then
        g_tPlayerData[GetName()] = g_tPlayerData[GetName()] or {};
        nStep = 1;
    end

    if 1 == nStep then
        MakeArmory_Armory(nSel, nStep);
    elseif 2 == nStep then
        MakeArmory_Series(nSel, nStep);
    elseif 3 == nStep then
        MakeArmory_MagicAttribute(nSel, nStep, 1);
    elseif 4 == nStep then
        MakeArmory_MagicAttribute(nSel, nStep, 2);
    elseif 5 == nStep then
        MakeArmory_MagicAttribute(nSel, nStep, 3);
    elseif 6 == nStep then
        MakeArmory_Confirm(nSel, nStep);
    elseif 7 == nStep then
        Award(nSel);
    else
        Confirm(nSel);
    end

    return 1;
end
function MakeArmory_Armory(nSel, nStep, nValue)
	local tItem = g_tItem_NB[nSel];

	if not tItem then
		return 0;
	end

--	if not nValue then
--		local szMsg = format("<color=green>[%s]<color>:请选择部位。\n\n", tItem[1]);
--		local tMenu = {
--			format("\n返回	/#MakeArmory(%d, %d)", nSel, nStep - 1),
--			"退出	/nothing",
--		};
--		for k, v in g_tStringTable.tArmoryEx do
--			tinsert(tMenu, 1, format("◆ %s /#MakeArmory_Armory(%d, %d, %d)", v, nSel, nStep, k));
--		end
--
--		Say(szMsg, getn(tMenu), tMenu);
--
--		return 1;
--	end

	g_tPlayerData[GetName()].nArmory = tItem[9];

	MakeArmory(nSel, nStep + 1);

	return 1;
end

function MakeArmory_Series(nSel, nStep, nValue)
	local tItem = g_tItem_NB[nSel];

	if not tItem then
		return 0;
	end

	if not nValue then
		local szMsg = format("<color=green>[%s]<color>:请选择纹饰的部位。\n\n", tItem[1]);
		local tMenu = {
			format("\n返回	/#MakeArmory(%d, %d)", nSel, nStep - 1),
			"退出	/nothing",
		};
		for k, v in g_tStringTable.tSeries do
			tinsert(tMenu, 1, format("纹饰 - %s /#MakeArmory_Series(%d, %d, %d)", v, nSel, nStep, k));
		end

		Say(szMsg, getn(tMenu), tMenu);

		return 1;
	end

	g_tPlayerData[GetName()].nSeries = nValue;

	MakeArmory(nSel, nStep + 1);

	return 1;
end

function MakeArmory_MagicAttribute(nSel, nStep, nAttrIdx, nPageIdx, nValue)
	local tItem = g_tItem_NB[nSel];

	if not tItem then
		return 0;
	end

	nPageIdx = nPageIdx or 0;
	local nLinePerPage = 9;
	if not nValue then
		local szMsg = format("<color=green>[%s]<color>:请选择第 %d 个特殊属性。\n\n", tItem[1], nAttrIdx);
		local tMenu = {
			format("\n返回	/#MakeArmory(%d, %d)", nSel, nStep - 1),
			"退出	/nothing",
		};

		if getn(tItem[8][nAttrIdx]) > (nPageIdx + 1) * nLinePerPage then
			tinsert(tMenu, 1, format("%s/#MakeArmory_MagicAttribute(%d, %d, %d, %d)", "下一页", nSel, nStep, nAttrIdx, nPageIdx + 1));
		end

		if 0 < nPageIdx then
			tinsert(tMenu, 1, format("%s/#MakeArmory_MagicAttribute(%d, %d, %d, %d)", "上一页", nSel, nStep, nAttrIdx, nPageIdx - 1));
		end

		for i = 1, nLinePerPage do
			local nIdx       = tItem[8][nAttrIdx][i + nPageIdx * nLinePerPage];
			if not nIdx then
				break;
			end
			local tMagicInfo = g_tMagicAttribute.tMagicInfo[nAttrIdx][nIdx];
			if not tMagicInfo then
				break;
			end
			tinsert(tMenu, 1, format("@ %s /#MakeArmory_MagicAttribute(%d, %d, %d, %d, %d)", tMagicInfo[5][1], nSel, nStep, nAttrIdx, nPageIdx, nIdx));
		end

		Say(szMsg, getn(tMenu), tMenu);

		return 1;
	end

	g_tPlayerData[GetName()].tMagicAttribute           = g_tPlayerData[GetName()].tMagicAttribute or {};
	g_tPlayerData[GetName()].tMagicAttribute[nAttrIdx] = nValue;

	MakeArmory(nSel, nStep + 1);

	return 1;
end

function MakeArmory_Confirm(nSel, nStep, nValue)
	local tItem = g_tItem_NB[nSel];
	if not tItem then
		return 0;
	end

	local tData = g_tPlayerData[GetName()];
	if not tData then
		return 0;
	end

	if not nValue then
		local szMsg = format("<color=green>[%s]<color>: 确认\n", tItem[1]);

		if not tData.nArmory or not g_tStringTable.tArmoryEx[tData.nArmory] then
			return 0;
		end
		szMsg = szMsg..format("\t\t%s\n", g_tStringTable.tArmoryEx[tData.nArmory]);

		if not tData.nSeries or not g_tStringTable.tSeries[tData.nSeries] then
			return 0;
		end
		szMsg = szMsg..format("\t\t纹饰 - %s\n", g_tStringTable.tSeries[tData.nSeries]);

		for k, v in g_tMagicAttribute.tMagicInfo do
			if not tData.tMagicAttribute or not tData.tMagicAttribute[k] or not v[tData.tMagicAttribute[k]] then
				return 0;
			end
			szMsg = szMsg..format("\t\t特殊属性 - %s\n", v[tData.tMagicAttribute[k]][5][1]);
		end

		local tMenu = {
			format("\n选取	/#MakeArmory_Confirm(%d,%d,%d)", nSel, nStep, 1),
			format("\n确认装备	/#MakeArmory(%d, %d)", nSel, nStep - 1),
			"退出	/nothing",
		};

		Say(szMsg, getn(tMenu), tMenu);

		return 1;
	end

	if 1 == nValue then
		g_tPlayerData[GetName()].bConfirm = 1;
		MakeArmory(nSel, nStep + 1);
	end

	return 1;
end

function nothing()
	g_tPlayerData[GetName()] = nil;
end
