Include("\\script\\missions\\yp\\yp_head.lua")

function OnUse()
	Say("使用义气酒可提升与队长的好感度<color=yellow>50点<color>，使用前需要和队长组成队伍，确定要使用吗？",
		2,
		"\n确定/confirm_use",
		"\n取消/nothing")
end

function confirm_use()
	local nSize = GetTeamSize();
	if nSize < 2 then
		Talk(1,"","少侠必须与队长组队才能使用义气酒！");
		return 0;
	end
	if PlayerIndex == GetTeamMember(0) then
		Talk(1,"","您是队长，不能使用义气酒！");
		return 0;
	end
	local nCount = GetItemCount(tPVPItemInfo[16][2],tPVPItemInfo[16][3],tPVPItemInfo[16][4]);
	AskClientForNumber("confirm_use_final",1,nCount,"使用多少个？")
end

function confirm_use_final(nCount)
	local nNum = GetItemCount(tPVPItemInfo[16][2],tPVPItemInfo[16][3],tPVPItemInfo[16][4]);
	if nNum < nCount then
		Talk(1,"","少侠没有这么多义气酒！");
		return 0;
	end
	local nSize = GetTeamSize();
	if nSize < 2 then
		Talk(1,"","少侠必须与队长组队才能使用义气酒！");
		return 0;
	end
	if PlayerIndex == GetTeamMember(0) then
		Talk(1,"","您是队长，不能使用义气酒！");
		return 0;
	end	
	if DelItem(tPVPItemInfo[16][2],tPVPItemInfo[16][3],tPVPItemInfo[16][4],nCount) == 1 then
		ModifyFriendliness(GetName(GetTeamMember(0)),50*nCount);
	end
end