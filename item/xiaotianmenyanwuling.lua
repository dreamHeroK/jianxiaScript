Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nItemIdx)
	local nItemNum = GetItemCount(2,95,206);
	if nItemNum < 1 then
	 	Talk(1,"",format("%s你身上没有小天门演武令"))
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	if nItemNum == 1 then
		_do_change_tmyanwu(1)
	else
		AskClientForNumber("_do_change_tmyanwu",1,nItemNum,"需要兑换多少个？");
	end
end

function _do_change_tmyanwu(nCount)
	local nCurTmz = nCount * 10
	local nSumTmz = GetTask(369) + nCurTmz
	if nSumTmz >= 50000 then
	 	Talk(1,"", "你的天门阵积分已达上限，不能再兑换了！")
		return
	end
	if DelItem(2,95,206,nCount) == 1 then
		PlayerFunLib:AddTask(369, nCount * 10)
	 	Talk(1,"", "你兑换了"..nCount.."个小天门演武令获得了<color=yellow>"..nCurTmz.."<color>点天门阵积分，当前积分为<color=yellow>"..nSumTmz.."<color>点！")
	else
		WriteLog("Change Error:\t"..GetName().." got "..nCount.."失败！");
		Talk(1,"OnUse","换取天门阵积分失败。")
		return
	end
end
