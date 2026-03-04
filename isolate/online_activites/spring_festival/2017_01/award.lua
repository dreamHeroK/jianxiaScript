--各种奖励写在这里

function sf2017_GiveAward(szAward)
	if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
		return 0
	end
	if CustomAwardGiveGroup(szAward, 0) > 0 then     --二号参数为是否给予全部奖励,如果是则1
		return 1
	end
	return 0
end

function sf2017_use_taohua_award()
    local bRes = sf2017_GiveAward("xnhd_cth")
	return bRes;
end

function sf2017_give_fushen_award()
    local bRes =sf2017_GiveAward("xnhd_fsjl")
	return bRes;
end

function sf2017_use_box_award(nIndex)
    if sf2017_GiveAward("xnhd_xcbx") == 1 then
		DelItemByIndex(nIndex,1)
	end
end