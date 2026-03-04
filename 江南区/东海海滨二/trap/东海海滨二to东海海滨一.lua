--东海海滨2to东海海滨1.lua
--GGH

function main(sel)
	local nMapid = GetWorldPos()
	if nMapid == 951 or nMapid == 952 or nMapid == 953 or nMapid == 954 or nMapid == 955 or nMapid == 956 or nMapid == 957 or nMapid == 958 or nMapid == 959 or nMapid == 960 then
		return
	end
	NewWorld(103,1870,3150)
	SetFightState(1);	
end;
