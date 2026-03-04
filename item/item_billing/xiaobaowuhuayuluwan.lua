------------------------------------------------------------
-- 小包五花玉露丸的脚本 xiaobaowuhuayuluwan.lua
-- comment: 打开后获得100个五花玉露丸
-- creator: Tony(Jizheng)
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Date   : Jul 14th, 2006
-- Item ID:  2,1,481
-- 五花玉露丸ID: 1,0,15
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,15,100,5}
	name="五花玉露丸"
	room = {1,600}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end