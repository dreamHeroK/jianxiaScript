------------------------------------------------------------
-- 大包黑玉断续膏的脚本 dabaoheiyuduanxugao.lua
-- comment: 打开后获得250个黑玉断续膏
-- creator: Tony(Jizheng)
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Date   : Jul 14th, 2006
-- Item ID:  2,1,490
-- 黑玉断续膏ID: 1,0,6
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,6,250}
	name="黑玉断续膏"
	room = {1,1750}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end
