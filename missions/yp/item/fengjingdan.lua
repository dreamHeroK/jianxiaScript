--凤精丹
Include("\\script\\missions\\yp\\yp_head.lua")

function OnUse()
	yp_clearPlayerData();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		Talk(1,"","少侠需要加入势力才能使用该物品！");
		return 0;
	end
	Say("使用凤精丹可以增加<color=yellow>30点<color>精力值，您确定要使用吗？",
		2,
		"\n确定/confirm_use_final",
		"\n取消/nothing")
end

function confirm_use_final()
	if DelItem(tPVPItemInfo[7][2],tPVPItemInfo[7][3],tPVPItemInfo[7][4],1) == 1 then
		yp_setValue(3,30);
	end
end