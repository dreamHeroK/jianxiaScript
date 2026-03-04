--create date:07-11-23
--author:yanjun
--describe:use the battle title
Include("\\script\\newbattles\\functions.lua");
TB_NEW_TITLE = 
{
	[1] = 
		{
			{2,1,10001,"破阵督护密令","破阵督护"},
			{--是否需永久元帅军衔，属性描述，对应称号表内的大类，副类，持续时间(真实时间)，所需军功（绝对值），所需天骄令（绝对值）
				{1,"内外攻提高15%",	30,13,3600 * 24 * 30,	300000,	0},
				{1,"增加伤害100点",	30,15,3600 * 24 * 30,	300000,	0},
			},
			{3000,2400,1800,1200,600},
			{{13,15,39,41},{14,16,40,42}},  -- 称号小类
		},
	[2] = 
		{
			{2,1,10003,"镇军虎骑密令","镇军虎骑"},
			{
				{0,"伤害减半概率25%",30,17,3600 * 24 * 30,	450000,	0},
			},
			{4500,3600,2700,1800,900},
			{{17,43,45,47,49,51,53,55},{18,44,46,48,50,52,54,56}},  -- 称号小类
		},
	[3] = 
		{
			{2,1,10002,"铁骨龙卫密令","铁骨龙卫"},
			{
				{0,"全属性增加60点",30,19,3600 * 24 * 30,	400000,	0},
			},
			{4000,3200,2400,1600,800},
			{{19,57,59,61,63,65,67,69},{20,58,60,62,64,66,68,70}},  -- 称号小类
		},
	[4] = 
		{
			{2,1,10004,"无双飞将密令","无双飞将"},
			{
				{0,"生命上限增加10000点",30,21,3600 * 24 * 30,	500000,	0},
			},
			{5000,4000,3000,2000,1000},
			{{21,71,73,75},{22,72,74,76}},  -- 称号小类
		},
	[5] = 
		{
			{2,1,10000,"御敌猛士密令","御敌猛士"},
			{
				{1,"全属性增加40点",30,23,3600 * 24 * 30,	250000,	0},
			},
			{2500,2000,1500,1000,500},
			{{23,77,79,81},{24,78,80,82}},  -- 称号小类
		},
	[6] = 
		{
			{2,1,10005,"破虏元帅密令","破虏元帅"},
			{
				{0,"受伤动作时间缩短70%",30,27,3600 * 24 * 30,	600000,	0},
			},
			{6000,4800,3600,2400,1200},
			{{27},{28}},  -- 称号小类
		},
}

function OnUse(nItemIdx)
	nItemIdx = tonumber(nItemIdx);
	local nType = get_item_info(nItemIdx);
	local nCurCamp = BT_GetCurCamp();
	if nType == 0 then
		Talk(1,"","你没有密令哦！");
		return 0;
	end;
	local nCurYinQuan = ModifyYinJuan(0, 1)
	local npay = pay_player_state(nType,1);
	local szEverMarshal = ""
	if GetTask(765) >= 15 then
		szEverMarshal = "或已是永久元帅军衔";	--是永久元帅
	end;
	local nTbTitle = TB_NEW_TITLE[nType][2];
	local nNeedJunGong = nTbTitle[1][6];
	local szPayMsg = "，侠士当前的军功已有<color=yellow>"..nNeedJunGong.."<color>点"..szEverMarshal.."，可以免银券使用";
	if npay ~= 1 then
		szPayMsg = "，根据侠士当前的军功，需要<color=yellow>"..npay.."<color>银券才可兑换";
	end;
	local selTab = {};
	local szTitle = format("您可以使用<color=green>%s<color>来兑换[<color=yellow>大%s%s<color>]称号%s，[<color=yellow>大%s%s<color>]称号可选择以下属性：", TB_NEW_TITLE[nType][1][4], tCampNameZ[nCurCamp], TB_NEW_TITLE[nType][1][5], szPayMsg, tCampNameZ[nCurCamp], TB_NEW_TITLE[nType][1][5])
	for i = 1, getn(nTbTitle) do
		local szTitle = nTbTitle[i][2];
		local nNeedTianJiao = nTbTitle[i][7];
		local szNeedTianJiao = "";
		if nNeedTianJiao > 0 then
			szNeedTianJiao = "（需要"..nNeedTianJiao.."天骄令）"
		end
		tinsert(selTab, format("%s%s/#use_confirm(%d, %d)", szTitle, szNeedTianJiao, nItemIdx, i));
	end
	tinsert(selTab,"稍后再说/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function get_item_info(nItemIdx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(TB_NEW_TITLE) do
		if TB_NEW_TITLE[i][1][1] == nGenre and TB_NEW_TITLE[i][1][2] == nDetail and TB_NEW_TITLE[i][1][3] == nParticular then
			return i;
		end;
	end;
	return 0;
end;

function pay_player_state(nItemType,nTitleIdx)
	local nNeedJunGong = TB_NEW_TITLE[nItemType][2][nTitleIdx][6];
	local nNeedEverRank = TB_NEW_TITLE[nItemType][2][nTitleIdx][1];
	local nNeedYinList = TB_NEW_TITLE[nItemType][3];
	local nCurJunGong = BT_GetData(PT_RANKPOINT);
	local bEverMarshal = 0;
	local nCurCamp = BT_GetCurCamp();
	if GetTask(765) >= 15 then
		bEverMarshal = 1;	--是永久元帅
	end;
	if nNeedEverRank == 1 then
		if bEverMarshal == 0 and abs(nCurJunGong) < nNeedJunGong then
			if nCurCamp < nNeedYinList[1] * 500 and nCurCamp >= nNeedYinList[2] * 500 then		
				return tonumber(nNeedYinList[5]);
			elseif nCurCamp < nNeedYinList[2] * 500 and nCurCamp >= nNeedYinList[3] * 500 then		
				return tonumber(nNeedYinList[4]);
			elseif nCurCamp < nNeedYinList[3] * 500 and nCurCamp >= nNeedYinList[4] * 500 then		
				return tonumber(nNeedYinList[3]);
			elseif nCurCamp < nNeedYinList[4] * 500 and nCurCamp >= nNeedYinList[5] * 500 then		
				return tonumber(nNeedYinList[2]);
			elseif nCurCamp < nNeedYinList[5] * 500 then		
				return tonumber(nNeedYinList[1]);
			end
		end;
	else
		if abs(nCurJunGong) < nNeedJunGong then
			if nCurCamp < nNeedYinList[1] * 500 and nCurCamp >= nNeedYinList[2] * 500 then		
				return tonumber(nNeedYinList[5]);
			elseif nCurCamp < nNeedYinList[2] * 500 and nCurCamp >= nNeedYinList[3] * 500 then		
				return tonumber(nNeedYinList[4]);
			elseif nCurCamp < nNeedYinList[3] * 500 and nCurCamp >= nNeedYinList[4] * 500 then		
				return tonumber(nNeedYinList[3]);
			elseif nCurCamp < nNeedYinList[4] * 500 and nCurCamp >= nNeedYinList[5] * 500 then		
				return tonumber(nNeedYinList[2]);
			elseif nCurCamp < nNeedYinList[5] * 500 then		
				return tonumber(nNeedYinList[1]);
			end
		end;
	end;
	return 1;
end;

function check_player_state(nItemType,nTitleIdx)
	local nNeedJunGong = TB_NEW_TITLE[nItemType][2][nTitleIdx][6];
	local nNeedEverRank = TB_NEW_TITLE[nItemType][2][nTitleIdx][1];
	local nCurJunGong = BT_GetData(PT_RANKPOINT);
	local bEverMarshal = 0;
	local nCurCamp = BT_GetCurCamp();
	if GetTask(765) >= 15 then
		bEverMarshal = 1;	--是永久元帅
	end;
	if nNeedEverRank == 1 then
		if bEverMarshal == 0 and abs(nCurJunGong) < nNeedJunGong then
			Talk(1,"","你的大"..tCampNameZ[nCurCamp].."的军功不足<color=yellow>"..nNeedJunGong.."<color>点，暂时不能领取大"..tCampNameZ[nCurCamp].."的战场称号！");				
			return 0;
		end;
	else
		if abs(nCurJunGong) < nNeedJunGong then
			Talk(1,"","你的大"..tCampNameZ[nCurCamp].."的军功不足<color=yellow>"..nNeedJunGong.."<color>点！");				
			return 0;
		end;
	end;
	return 1;
end;

function use_confirm(nItemIdx,nTitleIdx)
	local nCurCamp = BT_GetCurCamp();
	local nType = get_item_info(nItemIdx);
	local nCurYinQuan = ModifyYinJuan(0, 1)
	local npay = pay_player_state(nType,nTitleIdx);
--	if check_player_state(nType,nTitleIdx) ~= 1 then
--		return 0;
--	end;
	local nTbTitle = TB_NEW_TITLE[nType][2];
	if npay ~= 1 then
		if nCurYinQuan < npay then
			Talk(1,"","你的银券不足<color=yellow>"..npay.."<color>，不能换取大"..tCampNameZ[nCurCamp].."的战场称号！");				
			return 0;
		end
	end;
	local nNeedTianJiao = nTbTitle[nTitleIdx][7];
	local szAttribute = nTbTitle[nTitleIdx][2];
	if nNeedTianJiao > 0 then
		local nHaveTianJiao = GetItemCount(2, 97, 236)
		if nHaveTianJiao < nNeedTianJiao then
			Talk(1,"","你的天骄令不足<color=yellow>"..nNeedTianJiao.."<color>个，不能选择"..szAttribute.."属性！");				
			return 0;
		end
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nGenre,nDetail = nTbTitle[nTitleIdx][3],nTbTitle[nTitleIdx][4];
		local szCampName = "大宋";
		local szCampSubTitle = {13,15,17,19,21,23,27,25};  -- 大宋称号小类
		local tbTypeTitle = {};
		if nCurCamp == LIAO_ID then
			nDetail = nDetail + 1;
			szCampName = "大辽";
		end;
		if mod(nDetail,2) == 1 then	--宋方的
			tbTypeTitle = TB_NEW_TITLE[nType][4][1];
			for i=1,getn(szCampSubTitle) do
				RemoveTitle(30,szCampSubTitle[i]+1);	--把辽的全删掉
			end;
		else	--辽方的
			tbTypeTitle = TB_NEW_TITLE[nType][4][2];
			for i=1,getn(szCampSubTitle) do
				RemoveTitle(30,szCampSubTitle[i]);	--把宋的全删掉
			end;			
		end;
		
		local bTitleFlag = 0;
		for _, nTypeTitle in tbTypeTitle do
			if nTypeTitle == nDetail then
				bTitleFlag		= 1;	-- IB标识
				break;
			end
		end

		if bTitleFlag == 1 then
			for i=1,getn(tbTypeTitle) do
				RemoveTitle(30,tbTypeTitle[i]);	--把同密令属性删掉
			end;
		end

		if npay ~= 1 then
    			local nRet = PayVMoney(2, npay)
		end;
		if nNeedTianJiao > 0 then
			DelItem(2, 97, 236, nNeedTianJiao)
		end
		local nTime = nTbTitle[nTitleIdx][5];
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		Msg2Player("你获得"..szCampName..TB_NEW_TITLE[nType][1][5].."称号");
		SetCurTitle(nGenre, nDetail);
	end;
end;