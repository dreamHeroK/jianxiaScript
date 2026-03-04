Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")

function main()
	if tGtTask:check_cur_task(354) ~= 1 and tGtTask:check_cur_task(367) ~= 1 then
		return 0;
	end
	if BigGetItemCount(2, 1, 31048) >= 10 then
		return 0;
	end
	local npcIndex = GetTargetNpc();
	local nDigTime = GetNpcTempData(npcIndex, 1);
	local nNeedTime = GetNpcTempData(npcIndex, 2);
	local nCurrTime = GetTime();
	if nCurrTime - nDigTime < nNeedTime then
		Talk(1,"","H·y quay l¹i sau!");
		return 0;
	end
	SetNpcTempData(npcIndex, 1, nCurrTime);
	SetNpcTempData(npcIndex, 2, random(30));
	AddItem(2, 1, 31048, 1);
end