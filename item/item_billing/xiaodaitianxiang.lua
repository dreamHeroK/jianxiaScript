------------------------------------------------------------
-- 小袋天香云锦续的脚本 xiaodaitianxiang.lua
-- comment: 打开后获得10个天香云锦续
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,1031
-- 天香云锦续ID: 1,0,5
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,5,10,5}
	name="天香云锦续"
	room = {1,60}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end