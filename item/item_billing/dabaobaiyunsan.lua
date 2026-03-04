------------------------------------------------------------
-- ´ó°ü°×ÔÆÉ¢µÄ½Å±¾ dabaobaiyunsan.lua
-- comment: ´ò¿ªºó»ñµÃ250¸ö°×ÔÆÉ¢
-- creator: Tony(Jizheng)
-- Update: (ºùÂ«ÍÞ¾ÈÒ¯Ò¯) 2020-04-02
-- Date   : Jul 14th, 2006
-- Item ID:  2,1,486
-- °×ÔÆÉ¢ID: 1,0,4
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,4,250}
	name="°×ÔÆÉ¢"
	room = {1,1500}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end