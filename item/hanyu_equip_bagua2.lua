Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItemIndex)
	local nRoute = GetPlayerRoute();
	local nRouteFlag = gf_IsPlayerRoute();
	local nqianghua = 0
	local nLingqi = 120	
	if nRouteFlag ~= 1 then
		Talk(1,"","侠士还没加入任何流派，不能领取。");
		return
	end;

if DelItemByIndex(nItemIndex,1) == 1 then
		if nRoute == 2 then
			AddItem(0,3,131,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)
         		
		end;

		if nRoute == 4 then
			AddItem(0,0,131,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 3 then
			AddItem(0,8,131,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 6 then
			AddItem(0,1,131,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)				
		end;

		if nRoute == 8 then
			AddItem(0,2,131,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 11 then
			AddItem(0,0,132,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 12 then
			AddItem(0,5,131,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 14 then
			AddItem(0,2,132,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 15 then
			AddItem(0,9,131,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 17 then
			AddItem(0,6,131,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 18 then
			AddItem(0,4,131,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 23 then
			AddItem(0,2,133,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;
  
 		if nRoute == 29 then
			AddItem(0,13,131,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end; 
  
 		if nRoute == 30 then
			AddItem(0,12,131,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;   
		
 		if nRoute == 25 then
			AddItem(0,3,132,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end; 		
		
 		if nRoute == 26 then
			AddItem(0,9,132,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end; 		
		
 		if nRoute == 27 then
			AddItem(0,11,132,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end; 		
		
 		if nRoute == 9 then
			AddItem(0,10,131,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;		
		
 		if nRoute == 21 then
			AddItem(0,11,131,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;			
		
 		if nRoute == 20 then
			AddItem(0,7,131,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;		
		

end
end
