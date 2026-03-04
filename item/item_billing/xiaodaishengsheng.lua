------------------------------------------------------------
-- 小袋生生造化散的脚本 xiaodaishengsheng.lua
-- comment: 打开后获得10个生生造化散
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,1036
-- 生生造化散ID: 1,0,16
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,16,10,5}
	name="生生造化散"
	room = {1,70}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end