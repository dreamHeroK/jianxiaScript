-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 药品释放公共类
-- 文件名：feast.lua
-- Edited by 
-- 2020/12/09 AM 02:30
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");

g_Medicine = {
	[32] = {"迎宾宴", 11, {{"内功点数防御增加60点", "state_i_defence_point_add", 60}, {"外功点数防御增加60点", "state_o_defence_point_add", 60}, {"生命上限提高10%", "state_life_max_percent_add", 10}, {"生命上限增加1000", "state_life_max_point_add", 1000}, {"承受伤害减半概率提高10%", "state_receive_half_damage", 10},},"宴席", "特级食物", },
	[39] = {"金猪全席", 9, {{"所有属性提高20点", "state_add_allability", 20},},"宴席", "特级食物", },
	[40] = {"蒙顶石花茶", 10, {{"外攻提升5%", "state_p_attack_percent_add", 5},{"内攻提升5%", "state_m_attack_percent_add", 5},{"伤害增加20点", "state_damage_point", 20},},"清茶", "特级食物", },
	[277] = {"九转逍遥丹（力根）", 6, {{"力量提高70点", "state_add_strength", 70},{"根骨提高70点", "state_add_vitality", 70}}, "九转逍遥丹", "高级药品", },
	[278] = {"九转逍遥丹（力身）", 6, {{"力量提高70点", "state_add_strength", 70},{"身法提高70点", "state_add_dexterity", 70}}, "九转逍遥丹", "高级药品", },
	[279] = {"九转逍遥丹（力洞）", 6, {{"力量提高70点", "state_add_strength", 70},{"洞察提高70点", "state_add_observe", 70}}, "九转逍遥丹", "高级药品", },
	[280] = {"九转逍遥丹（力内）", 6, {{"力量提高70点", "state_add_strength", 70},{"内功提高70点", "state_add_energy", 70}}, "九转逍遥丹", "高级药品", },
	[281] = {"九转逍遥丹（内根）", 6, {{"内功提高70点", "state_add_energy", 70},{"根骨提高70点", "state_add_vitality", 70}}, "九转逍遥丹", "高级药品", },
	[282] = {"九转逍遥丹（内身）", 6, {{"内功提高70点", "state_add_energy", 70},{"身法提高70点", "state_add_dexterity", 70}}, "九转逍遥丹", "高级药品", },
	[283] = {"九转逍遥丹（内洞）", 6, {{"内功提高70点", "state_add_energy", 70},{"洞察提高70点", "state_add_observe", 70}}, "九转逍遥丹", "高级药品", },
	[284] = {"九转逍遥丹（身根）", 6, {{"身法提高70点", "state_add_dexterity", 70},{"根骨提高70点", "state_add_vitality", 70}}, "九转逍遥丹", "高级药品", },
	[285] = {"九转逍遥丹（身洞）", 6, {{"身法提高70点", "state_add_dexterity", 70},{"洞察提高70点", "state_add_observe", 70}}, "九转逍遥丹", "高级药品", },
	[286] = {"九转逍遥丹（洞根）", 6, {{"洞察提高70点", "state_add_observe", 70},{"根骨提高70点", "state_add_vitality", 70}}, "九转逍遥丹", "高级药品", },
	[287] = {"珍品粽子", 7, {{"外攻提升5%", "state_p_attack_percent_add", 5},{"内攻提升5%", "state_m_attack_percent_add", 5},{"伤害增加30点", "state_damage_point", 30},{"生命上限提高30%", "state_life_max_percent_add", 30},{"内力上限提高20%", "state_neili_max_percent_add", 20},{"所有属性增加140点", "state_add_allability", 140}, }, "粽子", "特级食物", },
	[293] = {"珍品月饼", 8, {{"力量提高50%", "state_strength_add_percent", 50},{"根骨提高50%", "state_vitality_add_percent", 50},{"内功提高50%", "state_energy_add_percent", 50},{"身法提高50%", "state_dexterity_add_percent", 50},{"洞察提高50%", "state_observe_add_percent", 50},},"月饼", "特级食物", },
}

function open_pack_usable(nItemIndex, medicine, time, effect, bit, tID, tNum)
	local szName, G, D, P = get_item_info(nItemIndex)
	local szEffectName = g_Medicine[medicine][1]
	local szGenreName = g_Medicine[medicine][4]
	local szOtherName = g_Medicine[medicine][5]
	local nBitUse = GetBit(GetTask(g_TSK_BIT_USEID), bit); -- 标记是否使用过
	if nBitUse == 1 then
		local szTalk = {"<sex>已使用过"..szGenreName.."或其他"..szOtherName.."，不能使用{"..szName.."}了。",};
		TalkEx("", szTalk);
		return
	end
	if DelItem(G, D, P, 1) == 1 then
		local nStateID = 99 * 10000 + P
		local nEffectID = g_Medicine[medicine][2]
		local tbAttributes = g_Medicine[medicine][3]
		local nTime = time * 60 * 18
		for i = 1, getn(tbAttributes) do
			local tAttr = tbAttributes[i][2]
			local nVal = tbAttributes[i][3]
			CastState(tAttr, nVal, nTime, 1, nStateID + i - 1, effect);
		end
		SetTask(g_TSK_BIT_USEID, SetBit(GetTask(g_TSK_BIT_USEID), bit, 1));
		SyncCustomState(1,nStateID, nEffectID, szEffectName)
		local n = CreateTrigger(1, tID, tNum)
		ContinueTimer(n)
	end
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end


