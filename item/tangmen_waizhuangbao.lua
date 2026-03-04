--唐门外装包
--by 
--2020/04/06

Include("\\script\\item\\fac_coat_pack_head.lua");

function OnUse(nItem)
	open_pack_item(nItem, 5, "唐门")
end