Include("\\script\\lib\\globalfunctions.lua")

VET_TB_FENGSHOUDAI_AWARD =
{
	{1, "小般若树种", {2, 0, 504, 8}, 30 * 24 * 3600,1},
 	{1, "般若树种", {2, 0, 398, 4}, 30 * 24 * 3600,1},
}
function OnUse(itemIndex)
	if (gf_JudgeRoomWeight(14,14,1) ~= 1) then
		return
	end
	if (DelItemByIndex(itemIndex, 1) == 1) then
		gf_EventGiveAllAward(VET_TB_FENGSHOUDAI_AWARD, 100, 1, "丰收袋", format("获得%s奖励","丰收袋"))
	end
end