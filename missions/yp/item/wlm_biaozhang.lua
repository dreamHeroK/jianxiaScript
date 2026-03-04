Include("\\script\\missions\\yp\\yp_head.lua")

function OnUse()
	Say("使用一个武林盟表彰信可获得<color=yellow>10点<color>武林盟势力声望，确定要使用吗？",
		2,
		"\n确定/confirm_use",
		"\n取消/nothing")
end

function confirm_use()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if GetPop(nCamp) == 0 then
		Talk(1,"","少侠还没开启相关武林盟势力声望，暂时无法使用！");
		return 0;
	end
	local nCount = GetItemCount(tPVPItemInfo[26][2],tPVPItemInfo[26][3],tPVPItemInfo[26][4]);
	AskClientForNumber("confirm_use_final",1,nCount,"使用几个？")
end

function confirm_use_final(nCount)
	local nNum = GetItemCount(tPVPItemInfo[26][2],tPVPItemInfo[26][3],tPVPItemInfo[26][4]);
	if nNum < nCount then
		Talk(1,"","少侠没有这么多武林盟表彰信！");
		return 0;
	end
	if DelItem(tPVPItemInfo[26][2],tPVPItemInfo[26][3],tPVPItemInfo[26][4],nCount) == 1 then
		yp_setValue(5,10*nCount);
		yp_setValue(6,10*nCount);
	end
end