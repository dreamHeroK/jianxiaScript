------------------------------------------------------------
-- 大包一元复始丹的脚本 dabaoyiyuanfushidan.lua
-- comment: 打开后获得250个一元复始丹
-- creator: Tony(Jizheng)
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Date   : Jul 14th, 2006
-- Item ID:  2,1,494
-- 一元复始丹ID: 1,0,10
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,10,250}
	name="一元复始丹"
	room = {1,1500}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end