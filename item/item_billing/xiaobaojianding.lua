------------------------------------------------------------
-- 小包7级鉴定符的脚本 xiaobaojianding.lua
-- comment: 打开后获得10个7级鉴定符
-- creator: Tony(Jizheng)
-- Date   : Feb 9th, 2007
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,1057
-- 7级鉴定符: 2,5,7
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {2,5,7,10,5}
	name="7级鉴定符"
	room = {1,10}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end