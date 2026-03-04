--随机传送符纸

Include("\\script\\missions\\yp\\yp_head.lua")

function OnUse()
	local nMapID = GetWorldPos();
	if nMapID ~= 5077 then
		Talk(1,"","此送符纸只能在云中地图上使用！");
		return 0;
	end
	if DelItem(2,97,36,1) == 1 then
		DoWait(129,130,5);
	end
end

function yp_suijifu_sur()
	local nMapID = GetWorldPos();
	if nMapID ~= 5077 then
		return 0;
	end
	local nRand = random(1,getn(tBzPos[5077]));
	SetFightState(1);
	SetPos(tBzPos[5077][nRand][1],tBzPos[5077][nRand][2]);
end

function yp_suijifu_fail()
	return 0;
end