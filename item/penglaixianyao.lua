Include("\\script\\lib\\globalfunctions.lua")

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local selTab = {};
	local szTitle = ""
	local szTitle = format("<color=green>蓬莱仙药<color>：活动期间可以使用蓬莱仙药兑换成<color=yellow>蓬莱仙丹<color>，也可以领取5万经验。少侠需要兑换吗？")
	tinsert(selTab,"我要换成蓬莱仙丹/do_change_xiandan");
	tinsert(selTab,"我还是换成经验吧/do_change_jingyan");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function do_change_xiandan()
	local nItemNum = GetItemCount(2,95,1503);
	if nItemNum < 1 then
	 	Talk(1,"",format("%s你身上的[蓬莱仙药]不够", NPC_NAME))
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	if nItemNum == 1 then
		_do_change_xiandan(1)
	else
		AskClientForNumber("_do_change_xiandan",1,nItemNum,"需要兑换多少个？");
	end
end;

function _do_change_xiandan(nCount)
	if DelItem(2,95,1503,nCount) == 1 then
		AddItem(2,1,1013,nCount, 4);
		Msg2Player("你成功换取"..nCount.."个蓬莱仙丹");
	else
		WriteLog("Change Error:\t"..GetName().." got "..nCount.."失败！");
		Talk(1,"change_huixing","换取蓬莱仙丹失败。")
		return
	end
end

function do_change_jingyan()
	local nItemNum = GetItemCount(2,95,1503);
	if nItemNum < 1 then
	 	Talk(1,"",format("%s你身上的[蓬莱仙药]不够", NPC_NAME))
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	if nItemNum == 1 then
		_do_change_jingyan(1)
	else
		AskClientForNumber("_do_change_jingyan",1,nItemNum,"需要兑换多少个？");
	end
end;

function _do_change_jingyan(nCount)
	if DelItem(2,95,1503,nCount) == 1 then
		gf_ModifyExp(nCount*50000)
	else
		WriteLog("Change Error:\t"..GetName().." got "..nCount.."失败！");
		Talk(1,"change_huixing","换取蓬莱仙丹失败。")
		return
	end
end
