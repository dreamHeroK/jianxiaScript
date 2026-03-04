------------------------------------------------------------
-- 大包生生造化散的脚本 dabaoshengshengzaohuasan.lua
-- comment: 打开后获得250个生生造化散
-- creator: Tony(Jizheng) 
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Date   : Jul 14th, 2006
-- Item ID:  2,1,484
-- 生生造化散ID: 1,0,16
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,16,250}
	name="生生造化散"
	room = {1,1750}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end