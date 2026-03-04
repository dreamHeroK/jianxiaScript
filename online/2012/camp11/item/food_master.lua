Include("\\script\\lib\\title.lua");


function OnUse()
	if DelItem(2,95,1827,1) == 1 then
		gf_AddTitle(3, 46, 0, 0)
	end
end

