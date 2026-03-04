Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nItemIdx)
	local nItemNum = GetItemCount(2,111,100);
	if nItemNum < 1 then
	 	Talk(1,"","你身上没有天门银券宝箱！")
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	if nItemNum == 1 then
		_do_change_yinquan(1)
	else
		AskClientForNumber("_do_change_yinquan",1,nItemNum,"需要兑换多少个？");
	end
end

function _do_change_yinquan(nCount)
	if DelItem(2,111,100,nCount) == 1 then
		gf_ModifyYinQuan(nCount*25)
	else
		WriteLog("Change Error:\t"..GetName().." got "..nCount.."失败！");
		Talk(1,"change_yinquan","换取银券失败。")
		return
	end
end
