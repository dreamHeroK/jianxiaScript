------------------------------------------------------------
-- 小包天香云锦续的脚本 xiaobaotianxiangyunjinxu.lua
-- comment: 打开后获得100个天香云锦续
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,487
-- 天香云锦续ID: 1,0,5
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,5,100,5}
	name="天香云锦续"
	room = {1,600}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end
