------------------------------------------------------------
-- 小包万物归元丹的脚本 xiaobaowanwuguiyuandan.lua
-- comment: 打开后获得100个万物归元丹
-- creator: Tony(Jizheng)
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Date   : Jul 14th, 2006
-- Item ID:  2,1,495
-- 万物归元丹ID: 1,0,11
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,11,100,5}
	name="万物归元丹"
	room = {1,700}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end
