------------------------------------------------------------
-- 小袋黑玉断续膏的脚本 xiaodaiheiyu.lua
-- comment: 打开后获得10个黑玉断续膏
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,1032
-- 黑玉断续膏ID: 1,0,6
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,6,10,5}
	name="黑玉断续膏"
	room = {1,70}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end