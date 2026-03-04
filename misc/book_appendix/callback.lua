Import("\\script\\lib\\globalfunctions.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
                                   --grade第几条   --newLv属性值      -color图标颜色1-8
function OnBookAppLevelUp(bookIdx, grade, newLv, color)
	--Observer:onEvent(OE_BOOKAPP_LEVELUP, {book=bookIdx, grade=grade, newLv=newLv, color=color});
	--AddStatValue(format("bookapp_levelup_%d_%d", grade, color), 1);
    FireEvent("event_equip_operation", "upgradebookapp", grade, newLv, color, bookIdx)
end

POPUR2POPUR2	= 300;
MaxPopur2Count	= 5000;
function OnExchangePopur2(nCount)
	if nCount <= 0 then return end
	local nMax = get_popur2_left_cap(1)
	if (nMax <= 0) then
		return
	end
	nCount = min(nCount, nMax);
	local nNeed = nCount * POPUR2POPUR2;
	if GetPopur() < nNeed then
		return
	end
	ModifyPopur(-nNeed, 0)
	gf_Modify('Popur2', nCount)
	AddRuntimeStat(39, 1, 0, nCount)
	--AddStatValue("bookapp_zwxw", nNeed);
	--AddStatValue("bookapp_zwyl", nCount);
end

function get_popur2_left_cap(bNotify)
	local TASKID_BOOK_POPUR2				= 3409;	-- 当前阅历点数
	local nMax = MaxPopur2Count - GetTask(TASKID_BOOK_POPUR2);
	if nMax <= 0 and bNotify == 1 then
		Talk(1, "", "当前阅历点数已用尽")
	end
	return nMax
end
