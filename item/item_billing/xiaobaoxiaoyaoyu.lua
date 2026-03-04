------------------------------------------------------------
-- 小包逍遥玉的脚本 xiaobaoxiaoyaoyu.lua
-- comment: 打开后获得100个逍遥玉
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
-- Update: (葫芦娃救爷爷) 2020-04-02
-- Item ID:  2,1,482
-- 逍遥玉ID: 2,1,30603
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {2,1,30603,100}
	name="逍遥玉"
	room = {1,600}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end
