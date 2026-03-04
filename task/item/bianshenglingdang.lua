Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")

function OnUse(nItem)
--	if IsHaveTaskOrCanGet2(243, 246) ~= 1 then
--		DelItemByIndex(nItem, 1);
--		return 0;
--	end
--	if GetWorldPos() ~= 8010 then
--		Say("不在幽难窟不能变身", 0);
--		return 0
--	end
--	if IsNpcChangeModel(PIdx2NpcIdx()) == 1 then
--		NpcChangeModel(PIdx2NpcIdx(),"");
--		return 0;
--	end
--	if CanNpcChangeModel(PIdx2NpcIdx()) ~= 1 then
--		Say("好像不能变身", 0);
--		return 0;
--	end
	NpcChangeModel(PIdx2NpcIdx(),"玉山之灵天玖")
end