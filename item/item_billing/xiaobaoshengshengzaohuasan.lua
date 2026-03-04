------------------------------------------------------------
-- 小包生生造化散的脚本 xiaobaoshengshengzaohuasan.lua
-- comment: 打开后获得100个生生造化散
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,483
-- 生生造化散ID: 1,0,16
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,16,100,5}
	name="生生造化散"
	room = {1,700}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end