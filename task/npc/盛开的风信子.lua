Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")

function main()
	if tGtTask:check_cur_task(353) ~= 1 and tGtTask:check_cur_task(366) ~= 1 then
		return 0;
	end
	if BigGetItemCount(2, 1, 31047) > 0 then
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
	SetNpcTempData(npcIndex, 2, random(15));
	AddItem(2, 1, 31047, 1);
end