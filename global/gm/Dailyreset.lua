-- 通告
Include("\\script\\global\\gm\\gm_script.lua");     
function main(indxe)
	zxianbucID = indxe
	GMsNameID = GetName()
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
    local ID,name,ID4 = z_Playerwupbc(player,GMsNameID) 
    player = NextPlayer(player)	
	end
end

function z_Playerwupbc(nIndex,GMsName)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
      yunzhonglachu(nIndex)	  
	  PlayerIndex = nOldPlayer	
	return 
end
function yunzhonglachu(nIndex)
local nMapID, nX, nY = GetWorldPos()
 	if nMapID == 5074 or nMapID == 5075 or nMapID == 5076 or nMapID == 5077 or nMapID == 5078 or nMapID == 5079 then
	SetDeathPunish(1)
	LeaveTeam();	--离开队伍
	CleanInteractive();	--解除玩家互动动作 added by  2020-10-04
	SetFightState(0);
	SetDeathScript("");
	SetCampToPlayer("");
	NewWorld(604,1378,2840);	
	
    end
end