Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")

function OnUse(nItem)
	if tGtTask:check_cur_task(365) ~= 1 then
		DelItemByIndex(nItem, 1)
		return 0;
	end
	local nMapId, nX, nY = GetWorldPos();
	if nMapId ~= 6400 then
		Say("Kh«ng thÓ dïng ë b¶n ®å nµy!", 0);
		return 0
	end
	if (nX - 1845)^2 + (nY -3492)^2 > 72 then
		Talk(1,"","ch­a ®Õn ®Þa ®iÓm sö dông");
		return 0;
	end
	local nNpcIndex = CreateNpc("LSM_QY", "KiÒu D­¬ng", 6400, 1845, 3492);
	if nNpcIndex > 0 then
		BigDelItem(2,1,31046,1);
		SetNpcLifeTime(nNpcIndex, 15*60);
		SetNpcDeathScript(nNpcIndex, "\\script\\task\\item\\ÌØÖÆµÄÒ¹Ã÷Öé.lua");
	end	
end

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex, 0);
end