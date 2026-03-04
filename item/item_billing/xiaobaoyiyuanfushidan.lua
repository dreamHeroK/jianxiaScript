------------------------------------------------------------
-- 小包一元复始丹的脚本 xiaobaoyiyuanfushidan.lua
-- comment: 打开后获得100个一元复始丹
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,493
-- 一元复始丹ID: 1,0,10
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,10,100,5}
	name="一元复始丹"
	room = {1,600}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end