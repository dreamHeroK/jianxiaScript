--江湖经验丹物品脚本
Include("\\script\\lib\\awardtemplet.lua");

function OnUse()
	local nItemNum = GetItemCount(2,95,1885);
	if nItemNum < 1 then
		Talk(1,"","你当前没有江湖经验丹！")
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
	if DelItem(2,95,1885,nCount) == 1 then
		local nLevel = GetLevel();
		if nLevel < 30 then
			nExpNum = 128000 * nCount
		elseif nLevel >= 30 and nLevel < 70 then
			nExpNum = 256000 * nCount
		elseif nLevel >= 70 and nLevel < 80 then
			nExpNum = 512000 * nCount
		elseif nLevel >= 80 then
			nExpNum = 1024000 * nCount
		end
		local tbAward = {nExp = nExpNum, }
		tbAwardTemplet:Give(tbAward, "江湖经验丹", "获得经验")
	else
		WriteLog("Modify Error:\t"..GetName().." got "..nCount.."失败！");
		Talk(1,"OnUse","当前使用江湖经验丹失败。")
		return
	end
end