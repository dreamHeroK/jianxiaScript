-- ³ÆºÅ---×ÝºáËÄº£

Include("\\script\\lib\\title.lua");

function OnUse()
	if DelItem(2,96,108,1) == 1 then
		gf_AddTitle(68, 1, 0, 0)
	end
end

