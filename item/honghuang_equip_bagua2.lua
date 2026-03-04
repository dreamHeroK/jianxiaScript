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
			AddItem(0,3,128,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)
         		
		end;

		if nRoute == 4 then
			AddItem(0,0,128,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 3 then
			AddItem(0,8,128,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 6 then
			AddItem(0,1,128,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)				
		end;

		if nRoute == 8 then
			AddItem(0,2,128,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 11 then
			AddItem(0,0,128,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 12 then
			AddItem(0,5,128,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 14 then
			AddItem(0,2,129,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 15 then
			AddItem(0,9,128,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 17 then
			AddItem(0,6,128,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 18 then
			AddItem(0,4,128,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;

		if nRoute == 23 then
			AddItem(0,2,128,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;
  
 		if nRoute == 29 then
			AddItem(0,13,128,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end; 
  
 		if nRoute == 30 then
			AddItem(0,12,128,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end;  

 		if nRoute == 25 then
			AddItem(0,3,129,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end; 

 		if nRoute == 26 then
			AddItem(0,9,129,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end; 

 		if nRoute == 27 then
			AddItem(0,11,129,1,4,0,0,0,0,0,0,0,nqianghua,nLingqi)		
		end; 





		
end
end
