--燕云剑戈军需包物品脚本
Include("\\script\\lib\\awardtemplet.lua");

function OnUse()
	local nItemNum = GetItemCount(2,97,212);
	if nItemNum < 1 then
		Talk(1,"","你当前没有燕云剑戈军需包！")
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	if nItemNum == 1 then
		UseJunXuBao(1)
	else
		AskClientForNumber("UseJunXuBao",1,nItemNum,"需要兑换多少个？");
	end
end

function UseJunXuBao(nCount)
	if DelItem(2,97,212,nCount) == 1 then
		gf_Modify("Money",10000 * nCount);
	else
		WriteLog("Modify Error:\t"..GetName().." got "..nCount.."失败！");
		Talk(1,"OnUse","使用燕云剑戈军需包失败。")
		return
	end
end