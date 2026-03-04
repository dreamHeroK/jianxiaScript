
function OnUse(nItemIdx)
	if GetStoreBoxPageCount() >= 5 then
		Talk(1,"","您的储物箱已经扩充至5页了，无法再次扩充！");
		SetTask(1152, 5);
		return 0;
	end
	if GetTask(1152) >= 5 then
		Talk(1,"","储物箱金钥匙最多可扩充您的储物箱至5页。");
		return 0;
	end;
	if GetFightState() == 1 then
		Talk(1,"","战斗状态不能扩充您的储物箱！");
		return 0;
	end;
	local selTab = {
				"同意/#use("..nItemIdx..")",
				"取消/nothing",
				}
	Say("您同意使用<color=yellow>储物箱金钥匙<color>来扩充您的储物箱吗？",getn(selTab),selTab);
end;

function use(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nPage = GetStoreBoxPageCount();
		SetStoreBoxPageCount(nPage+1);
		Msg2Player("您的储物箱成功扩充了1页");
		SetTask(1152, GetTask(1152) + 1);
	end;	
end;

function nothing()
end;