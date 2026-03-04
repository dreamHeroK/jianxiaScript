Include("\\script\\online\\spring2021\\head.lua")

function OnDeath(Index,f,x)
	local nMap, nX, nY = GetNpcWorldPos(Index);
	local npcName = GetNpcName(Index);
	local killer = "";
	if f == 0 then
		sp_aw_giveAward_3()
	end
	--刷小年兽
	for i = 1, 50 do
		local smallBox = CreateNpc("11年小年兽", "小年兽", nMap, nX + random(-i, i), nY + random(-i, i));
		if smallBox > 0 then
			SetNpcScript(smallBox, "\\script\\online\\spring2021\\box_small.lua");
			AddUnitStates(smallBox, 6, GetTime())
			SetNpcLifeTime(smallBox, 25 * 60);
		end
	end
	--删掉尸体
	SetNpcRemoveScript(Index, "");
	SetNpcLifeTime(Index, 0);
end
