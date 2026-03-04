Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\tmp_task_id_def.lua")

tItemInfo = 
{
	[1] = {2, 95, 929,"拜火绸缎"},
	[2] = {2, 95, 930,"女真毛皮"},
	[3] = {2, 95, 928,"西夏宝珠"},
}

function get_type(nItemIdx)
	local genre,detail,particular = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(tItemInfo) do
		if genre == tItemInfo[i][1] and detail == tItemInfo[i][2] and particular == tItemInfo[i][3] then
			return i;
		end;
	end;
	return 0;
end;

function OnUse(nItemIdx)
	local nType = get_type(nItemIdx);
	if nType == 0 then
		return 0;
	end;
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= nType then
		Talk(1,"","少侠不属于该势力，不能使用势力物品！");
		return 0;
	end
	local selTab = {
				"\n确定/#confirm_use_final("..nItemIdx..")",
				"\n取消/nothing",
				}
	Say(tItemInfo[nType][4].."：使用后，将获得<color=yellow>10点<color>贡献度，确定要使用么？", getn(selTab), selTab);	
end

function confirm_use_final(nItemIdx)
	SetTaskTemp(TEMP_FIELD_PVP_CHOOSE_GXD,nItemIdx);
	local nType = get_type(nItemIdx);
	if nType == 0 then
		return 0;
	end;
	local nCount = GetItemCount(tItemInfo[nType][1],tItemInfo[nType][2],tItemInfo[nType][3]);	
	AskClientForNumber("confirm_use_final_ag",1,nCount,"使用多少？")
end

function confirm_use_final_ag(nCount)
	local nItemIdx = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_GXD);
	local nType = get_type(nItemIdx);
	if nType == 0 then
		return 0;
	end;
	local nNum = GetItemCount(tItemInfo[nType][1],tItemInfo[nType][2],tItemInfo[nType][3]);	
	if nNum < nCount then
		Talk(1,"","少侠没有这么多物品！");
		return 0;
	end 
	if DelItem(tItemInfo[nType][1],tItemInfo[nType][2],tItemInfo[nType][3],nCount) == 1 then
		yp_setValue(1,nCount*10);
	end
end