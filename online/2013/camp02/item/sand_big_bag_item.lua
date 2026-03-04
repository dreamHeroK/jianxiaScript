--超大包新年许愿砂物品脚本
Include("\\script\\lib\\awardtemplet.lua");

function OnUse()
	local nItemNum = GetItemCount(2, 95, 1910);
	if nItemNum < 1 then
		Talk(1,"","你当前没有超大包新年许愿砂！")
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	if nItemNum == 1 then
		UseXinNianXuYuanSha(1)
	else
		AskClientForNumber("UseXinNianXuYuanSha",1,nItemNum,"需要兑换多少个？");
	end
end

function UseXinNianXuYuanSha(nCount)
	if DelItem(2, 95, 1910, nCount) == 1 then
		gf_AddItemEx({2, 95, 231, 2500 * nCount})
	else
		WriteLog("Item Error:\t"..GetName().." got "..nCount.."失败！");
		Talk(1,"OnUse","使用超大包新年许愿砂失败。")
		return
	end
end