Include("\\script\\newbattles\\functions.lua");

tBattleEquip = 
{
    [SONG_ID] = 
    {
        {{"白犀牛	",0,105,2071},5},
        {{"战象	",0,105,1271},6},
    },

    [LIAO_ID] = 
    {
        {{"白犀牛	",0,105,2072},5},
        {{"战象	",0,105,1272},6},
    },
}

function CanEquip(nItemIdx)
	if check_palyer_state(nItemIdx) == 0 then
		return 1;	--不能穿
	end;
	return 0;
end;

function OnUse(nItemIdx)
	return 0;
end;

function OnEquip()
	CleanInteractive();
	InteractiveEnable(0);
	return 0;
end

function OnUnEquip()
	InteractiveEnable(1);
	return 0;
end

--获得装备的阵营及在table中的索引
function get_equip_index(nItemIdx)
	local nGenre = GetItemGenre(nItemIdx);
	local nDetail = GetItemDetail(nItemIdx);
	local nParticular = GetItemParticular(nItemIdx);
	for i=1,getn(tBattleEquip) do 
		for j=1,getn(tBattleEquip[i]) do
			local tEquipInfo = tBattleEquip[i][j][1];
			if tEquipInfo[2] == nGenre and tEquipInfo[3] == nDetail and tEquipInfo[4] == nParticular then
				return i,j;	--阵营，在table中的索引
			end;
		end;
	end;
	return 0,0;
end;

function check_palyer_state(nItemIdx)
	local nEquipCamp,nEquipIdx = get_equip_index(nItemIdx);
	if nEquipCamp == 0 then
		Msg2Player("这不是军队专属坐骑");
		return 0;
	end;
	local nCurRank = BT_GetData(PT_CURRANK);
	local nPlayerCamp = 0;
	local sEquipName = tBattleEquip[nEquipCamp][nEquipIdx][1][1];
	if nCurRank < 0 then
		nPlayerCamp = LIAO_ID;
	elseif nCurRank > 0 then
		nPlayerCamp = SONG_ID;
	end;
	if nPlayerCamp == ALL_ID then
		Msg2Player("您当前还是个士兵，不能骑"..sEquipName.."坐骑")
		return 0;	
	end;
	local nNeedRank = tBattleEquip[nEquipCamp][nEquipIdx][2];
	if (nEquipCamp ~= nPlayerCamp) then
		if nPlayerCamp == SONG_ID then
			Msg2Player("你当前是宋军阵营，不能骑辽军坐骑");
		else
			Msg2Player("你当前辽军阵营，不能骑宋军坐骑");
		end;
		return 0;
	end;
	nCurRank = abs(nCurRank);
	if nCurRank < nNeedRank then
		Msg2Player("您的军衔太低，暂时不能骑"..sEquipName.."坐骑");
		return 0;
	end;
	return 1;
end;
