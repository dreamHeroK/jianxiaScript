--IB物品：九转回魂丹包裹
--代码编写人：吴志威
--代码编写时间：2008年6月18日
-- comment: 打开后获得10个九转回魂丹
-- Item ID:  2,1,3380
-- 九转回魂丹ID: 1,0,32
-- Update: 葫芦娃救爷爷) 2020-04-02
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,32,100,1}
	name="九转回魂丹"
	room = {10,30}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end