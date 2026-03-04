--IB物品：打包的陨铁精石
--功能描述：让其使用本物品选择并兑换对应的师门秘籍
--代码编写人：赵贵春
--代码编写时间：2007年1月23日
--策划人：刘天
--Item ID:  2,95,614
--陨铁精石ID: 2,1,1009
--Update: (葫芦娃救爷爷) 2020-04-02
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {2,1,1009,300,5}
	name="陨铁精石"
	room = {5,500}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end

