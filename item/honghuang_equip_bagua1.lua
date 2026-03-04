Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItemIndex)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nRouteFlag = gf_IsPlayerRoute();
	local nqianghua = 0
	local nLingqi = 120	
	if nRouteFlag ~= 1 then
		Talk(1,"","侠士还没加入任何流派，不能领取。");
		return
	end;

if DelItemByIndex(nItemIndex,1) == 1 then
		--俊俏男
		if nBody == 1 then
			AddItem(0,103,100,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)
			AddItem(0,100,100,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
			AddItem(0,101,100,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)			
		end;
		--肌肉男
		if nBody == 2 then
			AddItem(0,103,101,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)
			AddItem(0,100,101,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)
			AddItem(0,101,101,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)			
		end;
		--肉麻女
		if nBody == 3 then
			AddItem(0,103,102,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)
			AddItem(0,100,102,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)	
			AddItem(0,101,102,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)			
		end;		
		--可爱女	
		if nBody == 4 then
			AddItem(0,103,103,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)
			AddItem(0,100,103,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)
			AddItem(0,101,103,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)			
		end;
  
end
end
