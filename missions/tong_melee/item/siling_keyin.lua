--召唤队友
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
	DoWait(117, 118, 3);
	SetItemUseLapse(nItem, 2*60*18);
end

function dowait_cb()
	local sName = GetName();
	local nMapId, nX, nY = GetWorldPos();
	local oldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex ~= oldPlayerIndex then
			SetTaskTemp(TMP_TASK_TONG_MELEE_X, nX);
			SetTaskTemp(TMP_TASK_TONG_MELEE_Y, nY);
			SetPlayerScript("\\script\\missions\\tong_melee\\item\\siling_keyin.lua");
			Say(format("%s使用[圣灵客引]召唤你！", sName), 2, "回应召唤/ensure", "有点忙/nothing");
		end
	end
	PlayerIndex = oldPlayerIndex;
end

function ensure() 
	SetPos(GetTaskTemp(TMP_TASK_TONG_MELEE_X), GetTaskTemp(TMP_TASK_TONG_MELEE_Y));
	Msg2Player("您回应了神兽守护者的召唤！");
end

function nothing()
end