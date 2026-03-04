------------------------------------------------------------
-- 大包万物归元丹的脚本 dabaowanwuguiyuandan.lua
-- comment: 打开后获得250个万物归元丹
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,496
-- 万物归元丹ID: 1,0,11
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,11,250}
	name="万物归元丹"
	room = {1,1750}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end