--create date:07-11-23
--author:yanjun
--describe:use the battle title
Include("\\script\\newbattles\\functions.lua");
TB_NEW_TITLE = 
{
	[1] = 
		{
			{2,1,9961,"破阵督护密令","大宋破阵督护"},
			{--是否需永久元帅军衔，属性描述，对应称号表内的大类，副类，持续时间(真实时间)，所需军功（绝对值）
				{1,"内外攻提高15%",	30,13,3600 * 24 * 30,	300000},
				{1,"增加伤害100点",	30,15,3600 * 24 * 30,	300000},
			},
		},
	[2] = 
		{
			{2,1,9963,"镇军虎骑密令","大宋镇军虎骑"},
			{
				{0,"伤害减半概率25%",30,17,3600 * 24 * 30,	450000},
			},
		},
	[3] = 
		{
			{2,1,9962,"铁骨龙卫密令","大宋铁骨龙卫"},
			{
				{0,"全属性增加60点",30,19,3600 * 24 * 30,	400000},
			},
		},
	[4] = 
		{
			{2,1,9964,"无双飞将密令","大宋无双飞将"},
			{
				{0,"生命上限增加10000点",30,21,3600 * 24 * 30,	500000},
			},
		},
	[5] = 
		{
			{2,1,9960,"御敌猛士密令","大宋御敌猛士"},
			{
				{1,"全属性增加40点",30,23,3600 * 24 * 30,	250000},
			},
		},
	[6] = 
		{
			{2,1,9965,"朝圣统帅密令","大宋朝圣统帅"},
			{
				{1,"受伤动作时间缩短70%",30,25,3600 * 24 * 30,	250000},
			},
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
	if nType == 1 then	--特例：如果是破阵督护令
		local selTab = {
					format("内外攻提高15%%/#use_confirm(%d,%d)",nItemIdx,1),
					format("增加伤害100点/#use_confirm(%d,%d)",nItemIdx,2),
					"待会再来/nothing",
					}
		Say("您可以使用<color=yellow>"..TB_NEW_TITLE[nType][1][4].."<color>来领取<color=yellow>大"..tCampNameZ[nCurCamp]..TB_NEW_TITLE[nType][1][4].."<color>称号，当前称号可以选择如下属性： ",getn(selTab),selTab);
	else
		local selTab = {
					format("确定/#use_confirm(%d,%d)",nItemIdx,1),
					"待会再来/nothing",
					}
		Say("您可以使用<color=yellow>"..TB_NEW_TITLE[nType][1][4].."<color>领取<color=yellow>大"..tCampNameZ[nCurCamp]..TB_NEW_TITLE[nType][1][5].."<color>称号",getn(selTab),selTab);
	end;
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

function check_player_state(nItemType,nTitleIdx)
	local nNeedJunGong = TB_NEW_TITLE[nItemType][2][nTitleIdx][6];
	local nNeedEverRank = TB_NEW_TITLE[nItemType][2][nTitleIdx][1];
	local nCurJunGong = BT_GetData(PT_RANKPOINT);
	local bEverMarshal = 0;
	local nCurCamp = BT_GetCurCamp();
--	if BT_GetData(PT_MARSHAL_WEEK) >= 15 then
--		bEverMarshal = 1;	--是永久元帅
--	end;
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
	local nType = get_item_info(nItemIdx);
	if check_player_state(nType,nTitleIdx) ~= 1 then
		return 0;
	end;
	local nCurCamp = BT_GetCurCamp();
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nGenre,nDetail = TB_NEW_TITLE[nType][2][nTitleIdx][3],TB_NEW_TITLE[nType][2][nTitleIdx][4];
		if nCurCamp == LIAO_ID then
			nDetail = nDetail + 1;
		end;
		if mod(nDetail,2) == 1 then	--宋方的
			for i=7,12 do
				RemoveTitle(30,2*i);	--把辽的全删掉
			end;
		else	--辽方的
			for i=6,11 do
				RemoveTitle(30,2*i+1);	--把宋的全删掉
			end;			
		end;
		if nDetail <= 16 then	--如果是大宋/辽破阵督护令
			for i=13,16 do
				RemoveTitle(30,i);
			end;
		end;
		local nTime = TB_NEW_TITLE[nType][2][nTitleIdx][5];
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		Msg2Player("你获得"..TB_NEW_TITLE[nType][1][5].."称号");
		SetCurTitle(nGenre, nDetail);
	end;
end;