Include("\\script\\newbattles\\battle_equipment_jungong.lua")
Include("\\script\\newbattles\\battle_equipment_item.lua")


function CanEquip(nItemIdx)
	if check_palyer_jungong_equip_state(nItemIdx,1) == 0 then
		if check_palyer_state(nItemIdx) == 0 then
			return 1;	--不能穿
		end
	end
	return 0;
end;

function OnUse(nItemIdx)
	return 0;
end;

function OnEquip()
	return 0;
end

function OnUnEquip()
	return 0;
end

function check_palyer_jungong_or_junxian_equip_state_by_index(nJunGongEquipCamp,nJungGongEquipIdx, nJunXianEquipCamp,nJungXianEquipIdx)
	if nEquipCamp == 0 then
		Msg2Player("这些不是军装装备");
		return 0;
	end;
	local nPlayerCamp = BT_GetCurCamp()
	local nCurPoint = abs(BT_GetData(PT_RANKPOINT));
	
	local tEquipJG = tJunGongBattleEquip[nJunGongEquipCamp][nJunGongEquipCamp]
	local sEquipName = tEquipJG[1][1]
	local nNeedPoint = tEquipJG[2];
	
	if nPlayerCamp == ALL_ID then
		Msg2Player("您的军衔目前是士兵，无法穿戴"..sEquipName)
		return 0;	
	end;
	
	if (nJunGongEquipCamp ~= nPlayerCamp) then
		if nPlayerCamp == SONG_ID then
			Msg2Player("您当前是宋军将士，无法穿戴辽军军装");
		else
			Msg2Player("您当前是辽军将士，无法穿戴宋军军装");
		end;
		return 0;
	end;
	
	if nCurPoint >= nNeedPoint then --通过
		return 1;
	end;
	
	--local szMsg = format("你的军功不足%d不能装备%s", nNeedPoint, sEquipName)
	---------------------------------------------------------------------------------------------------------------
	local nCurRank = BT_GetData(PT_CURRANK)
	local nPlayerCamp = 0
	local tEquipJX = tBattleEquip[nJunXianEquipCamp][nJungXianEquipIdx]
	local sEquipName = tEquipJX[1][1]
	if nCurRank < 0 then
		nPlayerCamp = LIAO_ID
	elseif nCurRank > 0 then
		nPlayerCamp = SONG_ID
	end
	if (nJunXianEquipCamp ~= nPlayerCamp) then
		Msg2Player("您当前是"..tCampNameZ[nPlayerCamp]..", 不能穿戴"..tCampNameZ[nEquipCamp].."。")
		return 0
	end
	
	local nYSChanceCount = GetTask(765)
	local nJJChanceCount = GetTask(766)
	local nXFChanceCount = GetTask(767)
	
	nCurRank = abs(nCurRank)
	local nType = tEquipJX[2]
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
		if nCurRank == 6 or					-- 本周是元帅
			nYSChanceCount >= 15 then		-- 永久元帅
			return 1
		end
	end
	Msg2Player("您的军衔太低，无法穿戴"..sEquipName)
	return 0
	
end