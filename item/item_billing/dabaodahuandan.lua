------------------------------------------------------------
-- 大包大还丹的脚本 dabaodahuandan.lua
-- comment: 打开后获得250个大还丹
-- creator: Tony(Jizheng)
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Date   : Jul 14th, 2006
-- Item ID:  2,1,492
-- 大还丹ID: 1,0,9
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,9,250}
	name="大还丹"
	room = {1,1500}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end