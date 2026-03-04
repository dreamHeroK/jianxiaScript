
TB_TITLE =  {
	[1] =  {
			{2,95,855,"剑心图鉴","剑心"},
			{--属性描述，对应称号表内的大类，副类，持续时间(真实时间)，所需钥匙（绝对值）
				{"所有属性增加12点",		2,12,3600 * 24 * 30,	 0},
				{"武功施展速度提高5%",	2,13,3600 * 24 * 30,	 0},
				{"承受伤害减半概率8%",	2,14,3600 * 24 * 30,	 0},
				{"内外功提高5%",			2,15,3600 * 24 * 30,	 0},
		--		{"闪避值增加300点",		2,16,3600 * 24 * 30,	 0},
		--		{"秘籍加成增加2%",			2,17,3600 * 24 * 30,	 0},
				{"生命上限提高12%",		2,18,3600 * 24 * 30,	 0},
			},
			{12,13,14,15,16,18, },  -- 称号小类
		},
}

function OnUse(nItemIdx)
	nItemIdx = tonumber(nItemIdx);
	local nType = get_item_info(nItemIdx);
	if nType == 0 then
		Talk(1,"","你没有图鉴哦！");
		return 0;
	end;
	local nTbTitle = TB_TITLE[nType][2];
	local selTab = {};
	local szTitle = format("您可以使用<color=green>%s<color>来兑换[<color=yellow>%s<color>]称号，[<color=yellow>%s<color>]称号可选择以下属性：", TB_TITLE[nType][1][4], TB_TITLE[nType][1][5], TB_TITLE[nType][1][5])
	for i = 1, getn(nTbTitle) do
		local szTitle = nTbTitle[i][1];
		local nNeed = nTbTitle[i][5];
		local szNeed = "";
		if nNeed > 0 then
			szNeed = "（需要"..nNeed.."个藏宝箱钥匙）"
		end
		tinsert(selTab, format("%s%s/#use_confirm(%d, %d)", szTitle, szNeed, nItemIdx, i));
	end
	tinsert(selTab,"稍后再说/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function get_item_info(nItemIdx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(TB_TITLE) do
		if TB_TITLE[i][1][1] == nGenre and TB_TITLE[i][1][2] == nDetail and TB_TITLE[i][1][3] == nParticular then
			return i;
		end;
	end;
	return 0;
end;

function use_confirm(nItemIdx,nTitleIdx)
	local nType = get_item_info(nItemIdx);
	local nTbTitle = TB_TITLE[nType][2];
	local nNeed = nTbTitle[nTitleIdx][5];
	local szAttribute = nTbTitle[nTitleIdx][1];
	if nNeed > 0 then
		local nHave = GetItemCount(2, 95, 52)
		if nHave < nNeed then
			Talk(1,"","你的藏宝箱钥匙不足<color=yellow>"..nNeed.."<color>个，不能选择"..szAttribute.."属性！");				
			return 0;
		end
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nGenre,nDetail = nTbTitle[nTitleIdx][2],nTbTitle[nTitleIdx][3];
		local tbTypeTitle = TB_TITLE[nType][3];
		
		local bTitleFlag = 0;
		for _, nTypeTitle in tbTypeTitle do
			if nTypeTitle == nDetail then
				bTitleFlag		= 1;	-- IB标识
				break;
			end
		end

		if bTitleFlag == 1 then
			for i=1,getn(tbTypeTitle) do
				RemoveTitle(2,tbTypeTitle[i]);	--把同图鉴属性删掉
			end;
		end

		if nNeed > 0 then
			DelItem(2, 97, 236, nNeed)
		end

		local nTime = nTbTitle[nTitleIdx][4];
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		SetCurTitle(nGenre, nDetail);
		Msg2Player("你获得["..TB_TITLE[nType][1][5].."]称号");
	end;
end;