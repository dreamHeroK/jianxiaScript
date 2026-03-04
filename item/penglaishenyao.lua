Include("\\script\\lib\\globalfunctions.lua")

function OnUse(idx)
	local nItemNum = GetItemCount(2,95,5423);
	if nItemNum < 1 then
	 	Talk(1,"",format("%s你身上的[蓬莱圣药]不够", NPC_NAME))
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	if nItemNum == 1 then
		_do_change_jingyan(1)
	else
		AskClientForNumber("_do_change_jingyan",1,nItemNum,"需要兑换多少个？");
	end
end

function _do_change_jingyan(nCount)
	if DelItem(2,95,5423,nCount) == 1 then
		gf_ModifyExp(nCount*100000)
	else
		WriteLog("Change Error:\t"..GetName().." got "..nCount.."失败！");
		Talk(1,"change_huixing","换取经验失败。")
		return
	end
end
