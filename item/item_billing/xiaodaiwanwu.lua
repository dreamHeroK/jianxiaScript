------------------------------------------------------------
-- 小袋万物归元丹的脚本 xiaodaiwanwu.lua
-- comment: 打开后获得10个万物归元丹
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,1034
-- 万物归元丹ID: 1,0,11
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,11,10,5}
	name="万物归元丹"
	room = {1,70}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end
