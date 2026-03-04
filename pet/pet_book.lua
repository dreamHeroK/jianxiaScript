--Include("\\script\\pet\\pet_book_exchange.lua")
--Include("\\script\\pet\\pet_update.lua")
--Include("\\script\\pet\\forget_pet_skill.lua")
--ENABLE_PET_NPC_TEST=1

--通过宠物技能书学习宠物技能
--MONEY_NEED_RATE = 50000
MONTE_TO_GOLD_RATE = 10000

function OnUse(id)
	local tbSay = {}
	local nPetCount,tbPetList = GetPetList()
	local szBookName = GetItemName(id)
	if nPetCount > 0 then
		local nLevel = GetItemLevel(id)
		local nNeedMoney = _get_need_money(nLevel)
		local nNeedGold = floor(nNeedMoney / MONTE_TO_GOLD_RATE)
		local szTitle = format("你是否想让随行的伙伴<color=yellow>[%s]<color>学习这本书 (需要消耗%d金币)？学习后宠物将拥有更强的实力，并且可以更好地帮助你完成任务。 <enter><color=red>注意：宠物学习后将不能替换已有技能，只能通过遗忘技能来替换。<color>", szBookName, nNeedGold);
		for i = 1, getn(tbPetList) do
			local szItem = format("%s(天资槽位:%d/%d)/#_OnLearnOnPet(%d, %d)", tbPetList[i].szName, tbPetList[i].nCurTianZi, tbPetList[i].nMaxTianZi, id, tbPetList[i].nIndex)
			tinsert(tbSay, szItem)
		end
--		if ENABLE_PET_NPC_TEST then
--			tinsert(tbSay, "我要升级伙伴/PetUpdateMain")
--			tinsert(tbSay, "我要兑换伙伴技能书/PetBookExchangeMain")
--			tinsert(tbSay, "我要遗忘伙伴技能/ForgetPetSkillMain")
--		end
		tinsert(tbSay, "取消, 我不想学习/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		Talk(1,"","你还没有随行伙伴，无法使用此技能书!")
	end
end

function _OnLearnOnPet(nBookId, nPetIndex)
	local nLevel = GetItemLevel(nBookId)
	local nNeedMoney = _get_need_money(nLevel)
	local nCash = GetCash()
	if nCash < nNeedMoney then
		Msg2Player(format("你当前的金币不足%d金币", floor(nNeedMoney/MONTE_TO_GOLD_RATE)))
		return
	end
	
	local nRet = LearnPetSkill(nBookId, nPetIndex)
	if nRet > 0 then
		DelItemByIndex(nBookId, -1)--先删除技能书
		Pay(nNeedMoney)
		if nRet > 1 then
			Msg2Player("宠物学习技能成功!")
		else
			Msg2Player("宠物已经掌握该技能!")
		end
		WriteLog(format("[Account:%s Role:%s]Use pet skill book %s(%d,%d,%d) ItemIdx=%d, PayMoney=%d, RetValue=%d(2=success)"
			, GetAccount(), GetName(), GetItemName(nBookId), GetItemGenre(nBookId), GetItemDetail(nBookId), GetItemParticular(nBookId)
			, nBookId, nNeedMoney, nRet
			))
	end
end

function _get_need_money(nLevel)
	local tMoney = {
		2*10000,
		4*10000,
		10*10000,
		50*10000,
		200*10000,
	}
	if nLevel>=1 and nLevel<=getn(tMoney) then
		return tMoney[nLevel]
	else
		return 100*10000
	end
end

function no()
end