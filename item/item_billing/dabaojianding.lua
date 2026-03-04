------------------------------------------------------------
-- 大包7级鉴定符的脚本 dabaojianding.lua
-- comment: 打开后获得100个7级鉴定符
-- creator: Tony(Jizheng)
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Date   : Feb 9th, 2007
-- Item ID:  2,1,1058
-- 7级鉴定符: 2,5,7
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {2,5,7,100,5}
	name="7级鉴定符"
	room = {1,100}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end
