-- 修真要诀
-- 增加修为点数1000点
-- lizhi 2006-11-2 11:53
-- Update by 
-- 2020/04/02 PM 18:32

nInsPopur = 1000

function OnUse()
	-- 判断增加后修为是否到达上限
	nCount = GetItemCount(2,0,554)
	if nCount == 1 then
		yes_say()
	else
		AskClientForNumber("various_to_use", 1, nCount,"使用多少(1-999)")
	end
end

function yes_say()
	local nPopurLimit = GetPopurLimit()

	local nPopur = GetPopur()
	if (nPopur + nInsPopur) > nPopurLimit then
		Talk(1,"","你的修为已达到你的等级上限，暂时不能使用<color=yellow>修真要诀<color>!")
		return 0
	end
	if DelItem(2, 0, 554, 1) == 1 then
		ModifyPopur(nInsPopur)
		Msg2Player("你使用了修身要诀，增长了"..nInsPopur.."点修为")
	end
end

function various_to_use(nCount)
	if nCount == 0 then
		return 0
	end
	local nPopurLimit = GetPopurLimit()

	local nPopur = GetPopur()
	if (nPopur + (nInsPopur*nCount)) > nPopurLimit then
		Talk(1,"","你的修为以达到你的等级上限，暂时不能使用<color=yellow>修真要诀<color>!")
		return 0
	end
	
	if DelItem(2, 0, 554, nCount) == 1 then
		ModifyPopur(nInsPopur*nCount)
		Msg2Player("你使用了"..nCount.."本修身要诀，增长了"..(nInsPopur*nCount).."点修为")
	else
		Talk(1,"","未知错误，不能使用<color=green>修真要诀<color>获得修为")
	end
end

function no_say()
end