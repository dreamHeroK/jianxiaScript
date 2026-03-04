------------------------------------------------------------
-- 大包玉灵散的脚本 dabaoyulingsan.lua
-- comment: 打开后获得250个玉灵散
-- creator: Tony(Jizheng)
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Date   : Jul 14th, 2006
-- Item ID:  2,1,480
-- 玉灵散ID: 1,0,14
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,14,250}
	name="玉灵散"
	room = {1,1500}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end