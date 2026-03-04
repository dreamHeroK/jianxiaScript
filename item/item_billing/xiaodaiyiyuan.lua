------------------------------------------------------------
-- 小袋一元复始丹的脚本 xiaodaiyiyuan.lua
-- comment: 打开后获得10个一元复始丹
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,1033
-- 一元复始丹ID: 1,0,10
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,10,10,5}
	name="一元复始丹"
	room = {1,60}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end