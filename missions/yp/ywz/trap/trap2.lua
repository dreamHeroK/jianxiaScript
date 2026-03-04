Import("\\script\\missions\\yp\\ywz\\mission_head.lua")

function main()
	local nCamp = ywzm_GetCamp()
	if 1 == nCamp then
		SetPos(1641, 3957);
		return 1;
	end
	local nIndex = ywzm_GetIndex()
	if nIndex ~= 1 then
		SetPos(1641, 3957);
		return 1;
	end
	if ywzm_GetMissionState() ~= 1 then
		SetPos(1572, 4026);
		Talk(1,"","Hi÷n Æang lµ giai Æoπn chu»n bﬁ, xin vui lﬂng ÆÓi.");
		return 1;
	end
	SetFightState(1);
	RestoreAll();
end