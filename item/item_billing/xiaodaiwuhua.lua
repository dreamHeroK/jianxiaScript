------------------------------------------------------------
-- 小袋五花玉露丸的脚本 xiaodaiwuhua.lua
-- comment: 打开后获得10个五花玉露丸
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,1035
-- 五花玉露丸ID: 1,0,15
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,15,10,5}
	name="五花玉露丸"
	room = {1,60}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end