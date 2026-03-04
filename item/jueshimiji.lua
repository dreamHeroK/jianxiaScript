
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItemIdx)
	local nHave = GetItemCount(2,95,146)
	if nHave < 20 then
		Talk(1,"","您需要有<color=yellow>20<color>个[凌波微步残本]才可以合成1本[<color=yellow>凌波微步<color>]秘籍，再检查一下吧。")
		return
	end
	local selTab = {
				"同意/#use("..nItemIdx..")",
				"取消/nothing",
				}
	Say("您同意使用<color=yellow>20<color>个[凌波微步残本]来合成1本[<color=yellow>凌波微步<color>]秘籍吗？",getn(selTab),selTab);
end;

function use(nItemIdx)
	if DelItem(2,95,146, 20) == 1 then
		gf_AddItemEx({0,112,78,1,1})
		Msg2Player("您成功合成了凌波微步");
	end;	
end;

function nothing()
end;