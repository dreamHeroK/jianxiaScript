------------------------------------------------------------
-- Ð¡°ü°×ÔÆÉ¢µÄ½Å±¾ xiaobaobaiyunsan.lua
-- comment: ´ò¿ªºó»ñµÃ100¸ö°×ÔÆÉ¢
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
-- Update: (ºùÂ«ÍÞ¾ÈÒ¯Ò¯) 2020-04-02
-- Item ID:  2,1,485
-- °×ÔÆÉ¢ID: 1,0,4
------------------------------------------------------------
Include("\\script\\item\\props_pack_head.lua");

function OnUse(nItemIndex)
	gdp = {1,0,4,100}
	name="°×ÔÆÉ¢"
	room = {1,600}
	dialog = ""
	condition = 0
	UsePackToItem(PlayerIndex, nItemIndex, gdp, name, room, dialog, condition)
end