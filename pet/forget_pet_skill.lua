--遗忘宠物技能

NEED_GOLD = 10
MONTE_TO_GOLD_RATE = 10000

t_player_pet_list = {}

function ForgetPetSkillMain()
	_ChoosePet()
end

function _ChoosePet()
	local tbSay = {}
	local nPetCount,tbPetList = GetPetList()
	t_player_pet_list[PlayerIndex] = tbPetList
	if nPetCount > 0 then
		local szTitle = format("你是否对随行的伙伴的辅助技能不满意？别担心，我可以帮你删除这些普通技能，为它们留出更高级的技能位。每次删除技能需要花费%d金币。被删除的技能无法恢复，只能重新学习。请选择需要删除的随行技能:", NEED_GOLD);
		for i = 1, getn(tbPetList) do
			local szItem = format("%s(剩余天资:%d/%d)/#_ChooseSkill(%d)", tbPetList[i].szName, tbPetList[i].nCurTianZi, tbPetList[i].nMaxTianZi, i)
			tinsert(tbSay, szItem)
		end
		tinsert(tbSay, "退出/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
		Talk(1,"","你还没有随行伙伴，无法删除技能!")
	end
end

function _ChooseSkill(nPetListIndex)
	local tbSay = {}
	local tbPetInfo = t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) > 0 then
		local szTitle = format("你确定要删除随行伙伴<color=yellow>%s(剩余天资:%d/%d)<color>的技能吗？<color=red>被删除的技能无法恢复，只能重新学习。<color>请选择需要删除的技能(删除技能需要花费%d金币):"
			, tbPetInfo.szName, tbPetInfo.nCurTianZi, tbPetInfo.nMaxTianZi, NEED_GOLD);
		for i = 1, getn(tbPetSkill) do
			local szItem = format("第%d条: %s%d级 (占用天资: %d)/#_ConfirmDelPetSkill(%d, %d)"
				, tbPetSkill[i].nSkillIndex + 1, tbPetSkill[i].szSkillName, tbPetSkill[i].nSkillLv, tbPetSkill[i].nNeedTianZi
				, nPetListIndex, i)
			tinsert(tbSay, szItem)
		end
		tinsert(tbSay, "返回/_ChoosePet")
		tinsert(tbSay, "退出/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
		local szMsg = format("你的随行伙伴<color=yellow>%s<color>还没有辅助技能，无法删除", tbPetInfo.szName)
		Talk(1,"",szMsg)
	end
end

function _ConfirmDelPetSkill(nPetListIndex, nSkillListIndex)
	local tbSay = {}
	local tbPetInfo = t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) > 0 and getn(tbPetSkill) >= nSkillListIndex then
		local szTitle = format("你确定要让随行伙伴<color=yellow>%s (剩余天资: %d/%d)<color>删除技能<color=yellow>第%d条: %s%d级 (占用天资 %d)<color>吗？成功删除<color=yellow>将返还%d点天资<color>。<color=red>被删除的技能无法恢复，只能重新学习。<color>请最后确认 (删除技能需要花费%d金币):"
			, tbPetInfo.szName, tbPetInfo.nCurTianZi, tbPetInfo.nMaxTianZi
			, tbPetSkill[nSkillListIndex].nSkillIndex + 1, tbPetSkill[nSkillListIndex].szSkillName, tbPetSkill[nSkillListIndex].nSkillLv, tbPetSkill[nSkillListIndex].nNeedTianZi
			, tbPetSkill[nSkillListIndex].nNeedTianZi, NEED_GOLD);
		local szItem = format("确定删除/#_OnDelPetSkill(%d, %d)", nPetListIndex, nSkillListIndex)
		tinsert(tbSay, szItem)
		szItem = format("返回/#_ChooseSkill(%d)", nPetListIndex)
		tinsert(tbSay, szItem)
		tinsert(tbSay, "退出/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
	end
end

function _OnDelPetSkill(nPetListIndex, nSkillListIndex)
	local nNeedMoney = NEED_GOLD * MONTE_TO_GOLD_RATE
	local nCash = GetCash()
	if nCash < nNeedMoney then
		Msg2Player(format("你当前的金币不足%d金币", NEED_GOLD))
		t_player_pet_list[PlayerIndex] = nil
		return
	end
	
	local tbPetInfo =t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) >= nSkillListIndex then
		local nResult = ForgetPetSkill(tbPetInfo.nIndex, tbPetSkill[nSkillListIndex].nSkillIndex, tbPetSkill[nSkillListIndex].nSkillId, tbPetSkill[nSkillListIndex].nSkillLv)
		if nResult == tbPetSkill[nSkillListIndex].nSkillIndex and nSkillListIndex >= 0 then
			Pay(nNeedMoney)
			local szMsg = format("你的随行伙伴%s成功删除了技能%s", tbPetInfo.szName, tbPetSkill[nSkillListIndex].szSkillName)
			Msg2Player(szMsg)
		end
	end
	
	t_player_pet_list[PlayerIndex] = nil
end

function no()
	t_player_pet_list[PlayerIndex] = nil
end