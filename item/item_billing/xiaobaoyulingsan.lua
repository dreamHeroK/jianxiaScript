------------------------------------------------------------
-- 小包玉灵散的脚本 xiaobaoyulingsan.lua
-- comment: 打开后获得100个玉灵散
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,479
-- 玉灵散ID: 1,0,14
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,14,100}
	name="玉灵散"
	room = {1,600}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end