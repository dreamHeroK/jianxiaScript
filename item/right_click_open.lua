Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse()
	local selTab = {
				"是的/open",
				"我再看看/nothing"
				}
	Say("您想打开情人节商店吗？",2,selTab)
end

function open()
	show_equip_shop(4016)
end

function nothing()
end