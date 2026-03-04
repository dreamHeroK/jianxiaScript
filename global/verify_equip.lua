--Include("\\script\\newbattles\\functions.lua");
Include("\\script\\newbattles\\battle_equipment_item.lua")
Include("\\script\\newbattles\\battle_equipment_jungong.lua")
Include("\\script\\newbattles\\battle_equipment_jungong_or_junxian.lua")
-- 登录是判断装备是否有效(装备魔法属性是否加到Player身上)

-- 任务变量说明
-- 764 记录玩家本周的排名,如果未进100名,则设置为999
-- 765 记录玩家获得元帅的次数(不分宋辽,只要是元帅就算)
-- 766 记录玩家获得将军的次数(不分宋辽)
-- 767 记录玩家获得先锋的次数


function VerifyEquip(nGenre, nDetail, nParticular)
	if nGenre ~= 0 then
		return 1
	end
	-- 判断攻城战装备
	if in_taishou_item(nDetail, nParticular) == 1 then
		if IsTitleExist(51, 1) > 0 or IsTitleExist(51, 2) > 0 or IsTitleExist(51, 5) > 0 or IsTitleExist(51, 6) > 0 or IsTitleExist(51, 9) > 0 or IsTitleExist(51, 10) > 0 then
			return 1
		end
		return 0
	elseif in_shiye_item(nDetail, nParticular) == 1 then
		if IsTitleExist(51, 3) > 0 or IsTitleExist(51, 7) > 0 or IsTitleExist(51, 11) > 0 then
			return 1
		end
		return 0
	elseif in_tixia_item(nDetail, nParticular) == 1 then
		if IsTitleExist(51, 4) > 0 or IsTitleExist(51, 8) > 0 or IsTitleExist(51, 12) > 0 then
			return 1
		end
		return 0
	end
	
	-- 判断军衔装备
	local nJXEquipCamp, nJXEquipIdx = in_battle_equip(nGenre, nDetail, nParticular)
	local nJGEquipCamp, nJGEquipIdx = get_jungong_equip_index_in_table_by_gdp(nGenre, nDetail, nParticular)
	if nJXEquipCamp > 0 and nJGEquipCamp > 0 then
		return check_palyer_jungong_or_junxian_equip_state_by_index(nJGEquipCamp,nJGEquipIdx,nJXEquipCamp, nJXEquipIdx)
	elseif nJGEquipCamp > 0 then
		return check_palyer_jungong_equip_state_by_index(nJGEquipCamp,nJGEquipIdx)
	elseif nJXEquipCamp > 0 then
		return ChkBattleEquip(nJXEquipCamp, nJXEquipIdx)
	end
	
	return 1
end

function in_taishou_item(nDetail, nParticular)
	if nDetail == 100 and nParticular >= 8013 and nParticular <= 8016 then
		return 1
	elseif nDetail == 101 and nParticular >= 8013 and nParticular <= 8016 then
		return 1
	elseif nDetail == 103 and nParticular >= 8013 and nParticular <= 8016 then
		return 1
	elseif nDetail == 102 and nParticular >= 8013 and nParticular <= 8020 then
		return 1
	end
	return 0
end

function in_shiye_item(nDetail, nParticular)
	if nDetail == 102 and nParticular >= 8021 and nParticular <= 8022 then
		return 1
	end
	return 0
end

function in_tixia_item(nDetail, nParticular)
	if nDetail == 100 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 101 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 103 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 102 and nParticular >= 8005 and nParticular <= 8008 then
		return 1
	elseif nDetail == 102 and nParticular >= 8023 and nParticular <= 8026 then
		return 1
	end
	return 0
end



--获得装备的阵营及在table中的索引
function in_battle_equip(nGenre, nDetail, nParticular)
	for i=1,getn(tBattleEquip) do 
		for j=1,getn(tBattleEquip[i]) do
			local tEquipInfo = tBattleEquip[i][j][1]
			if tEquipInfo[2] == nGenre and tEquipInfo[3] == nDetail and tEquipInfo[4] == nParticular then
				return i,j	--阵营，在table中的索引
			end
		end
	end
	return 0,0
end

function ChkBattleEquip(nEquipCamp, nEquipIdx)
	local nCurRank = BT_GetData(PT_CURRANK)
	local nPlayerCamp = 0
	local sEquipName = tBattleEquip[nEquipCamp][nEquipIdx][1][1]
	if nCurRank < 0 then
		nPlayerCamp = LIAO_ID
	elseif nCurRank > 0 then
		nPlayerCamp = SONG_ID
	end
	if (nEquipCamp ~= nPlayerCamp) then
Msg2Player("你属于"..tCampNameZ[nPlayerCamp].."阵营，无法使用"..tCampNameZ[nEquipCamp].."阵营的装备。")
		return 0
	end
	
	local nYSChanceCount = GetTask(765)
	local nJJChanceCount = GetTask(766)
	local nXFChanceCount = GetTask(767)
	
	nCurRank = abs(nCurRank)
	local nType = tBattleEquip[nEquipCamp][nEquipIdx][2]
	if nType == 3 then		-- 都统
		if nCurRank >= 3 or					-- 本周是都统或以上军衔
			nYSChanceCount >= 15 or			-- 永久元帅
			nJJChanceCount + nYSChanceCount >= 10 or			-- 永久将军
			nXFChanceCount + nJJChanceCount + nYSChanceCount >= 10 then		-- 永久先锋
			return 1
		end
	elseif nType == 4 then	-- 先锋
		if nCurRank >= 4 or					-- 本周是先锋或以上军衔
			nYSChanceCount >= 15 or			-- 永久元帅
			nJJChanceCount + nYSChanceCount >= 10 or			-- 永久将军
			nXFChanceCount + nJJChanceCount + nYSChanceCount >= 10 then		-- 永久先锋
			return 1
		end
	elseif nType == 5 then	-- 将军
		if nCurRank >= 5 or					-- 本周是大将或以上军衔
			nYSChanceCount >= 15 or			-- 永久元帅
			nJJChanceCount + nYSChanceCount >= 10 then			-- 永久将军
			return 1
		end
	elseif nType == 6 then	-- 元帅
		if nCurRank == 6 then					-- 本周是元帅
			return 1
		end
	elseif nType == 7 then	-- 永久元帅
		if nCurRank >= 6 or					-- 本周是元帅
			nYSChanceCount >= 15 then		-- 永久元帅
			return 1
		end
	end
Msg2Player("你无法使用"..sEquipName.."，因为它只适用于其他阵营。")
	return 0
end
