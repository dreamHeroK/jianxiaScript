------------------------------------------------------------
-- 大包五花玉露丸的脚本 dabaowuhuayuluwan.lua
-- comment: 打开后获得250个五花玉露丸
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,482
-- 五花玉露丸ID: 1,0,15
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,15,250}
	name="五花玉露丸"
	room = {1,1500}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end