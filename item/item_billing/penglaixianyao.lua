--蓬莱仙药物品脚本
Include("\\script\\lib\\awardtemplet.lua");

function OnUse()
	local nItemNum = GetItemCount(2,95,1503);
	if nItemNum < 1 then
		Talk(1,"","你当前没有蓬莱仙药！")
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	if nItemNum == 1 then
		UseJingYanDan(1)
	else
		AskClientForNumber("UseJingYanDan",1,nItemNum,"需要兑换多少个？");
	end
end

function UseJingYanDan(nCount)
	if DelItem(2,95,1503,nCount) == 1 then
		local nLevel = GetLevel();
		if nLevel < 30 then
			nExpNum = 112800 * nCount
		elseif nLevel >= 30 and nLevel < 70 then
			nExpNum = 425600 * nCount
		elseif nLevel >= 70 and nLevel < 80 then
			nExpNum = 651200 * nCount
		elseif nLevel >= 80 then
			nExpNum = 902400 * nCount
		end
		local tbAward = {nExp = nExpNum, }
		tbAwardTemplet:Give(tbAward, "蓬莱仙药", "获得经验")
	else
		WriteLog("Modify Error:\t"..GetName().." got "..nCount.."失败！");
		Talk(1,"OnUse","当前使用蓬莱仙药失败。")
		return
	end
end