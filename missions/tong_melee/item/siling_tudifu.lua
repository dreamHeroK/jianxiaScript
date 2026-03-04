--使用可传送至神兽看护者
Include("\\script\\missions\\tong_melee\\tm_head.lua")

function OnUse(nItem)
	if tm_IsTongMeleeOpen() ~= 1 then
		return 0;
	end
	local nMapId, nMapTemplteId = SubWorldIdx2ID(SubWorld);
	if nMapTemplteId ~= 6074 then
		Talk(1,"","该地图无法使用");
		return 0;
	end
	local oldPlayerIdx = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetItemCount(2, 95, 5426) >= 1 then
			local nMapId, nX, nY = GetWorldPos();
			PlayerIndex = oldPlayerIdx;
			SetPos(nX, nY);
			Msg2Player("使用圣灵传送符将您传送至神兽看护者！");
			break;
		end
	end
	PlayerIndex = oldPlayerIdx;
	SetItemUseLapse(nItem, 30*18);
end