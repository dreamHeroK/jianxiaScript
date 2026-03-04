Include("\\script\\结婚\\marriage_head.lua");
function OnUse(nItemIdx)
	if in_fields() ~= 1 then
		Talk(1,"","当前地图无法使用！");
		return 0;
	end;
	local selTab = {
				"是的/#set_up_fireworks("..nItemIdx..")",
				"再想想/nothing",
				}
	Say("你确定要使用吗？",getn(selTab),selTab);

end;

function set_up_fireworks(nItemIdx)
	local nMapID = GetWorldPos();
	local nFieldType = map_field2type[nMapID];
	local nLihuaCount = GetMissionV(27);
	if nLihuaCount >= field_lihua_limit[nFieldType] then
		Talk(1,"","该区域不能再燃放烟花！");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nNpcIndex = CreateNpc("透明人","结婚礼花",GetWorldPos());
		SetNpcLifeTime(nNpcIndex,2*60*60);
		SetCurrentNpcSFX(nNpcIndex,935,1,1);
		SetNpcScript(nNpcIndex,"\\script\\结婚\\npc\\礼花.lua")
		SetMissionV(27,nLihuaCount+1)
	end;
end;