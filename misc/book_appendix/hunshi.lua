--真武魂石
Include("\\script\\lib\\globalfunctions.lua")

function OnUse()
	local nItemNum = GetItemCount(2,114,143);
	if nItemNum < 1 then
		Talk(1,"","你当前没有真武魂石！")
		return
	end

	if DelItem(2,114,143,1) == 1 then
		local TASKID_BOOK_POPUR2 = 3409;	-- 当前阅历点数
		gf_ModifyTask(TASKID_BOOK_POPUR2, 100);
	else
		WriteLog("Modify Error:\t"..GetName().." got "..nCount.."失败！");
		Talk(1,"OnUse","使用真武魂石失败。")
		return
	end
end

