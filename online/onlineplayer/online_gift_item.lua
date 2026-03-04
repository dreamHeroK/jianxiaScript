--在线福袋脚本
Include("\\script\\online\\onlineplayer\\head.lua")

function OnUse(nItemIdx)
	if ol_IsOpen() ~= 1 then
		Talk(1,"","活动已结束，已无法开启福袋了！");
		return 0;
	end
	if DelItemByIndex(nItemIdx, -1) == 1 then
		if gf_CheckVipCard() == 1 then
			ol_aw_giveAward_1()
		else
			ol_aw_giveAward_2()
		end
	--	EventAddMaterial(random(1,2)); -- Event
		return 1
	end
end
