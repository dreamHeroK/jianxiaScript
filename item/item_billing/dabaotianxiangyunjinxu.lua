------------------------------------------------------------
-- 大包天香云锦续的脚本 dabaotianxiangyunjinxu.lua
-- comment: 打开后获得250个天香云锦续
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,488
-- 天香云锦续ID: 1,0,5
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,5,250}
	name="天香云锦续"
	room = {1,1500}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end