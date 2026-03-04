------------------------------------------------------------
-- 小包黑玉断续膏的脚本 xiaobaoheiyuduanxugao.lua
-- comment: 打开后获得100个黑玉断续膏
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,489
-- 黑玉断续膏ID: 1,0,6
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,6,100,5}
	name="黑玉断续膏"
	room = {1,700}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end
