--file function:item use function 2,1,30321   --ÌìÍâÁ÷ĞÇ
--function design:big bear
--function develop:cunzhang
--develop date:5-24 2011
--modify tips:
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
tbTWLXItemString = {
	[1] = "ÌìÍâÁ÷ĞÇ",
	[2] = {2,1,30299,9,"Ò»ÉÁÑı»Í"},
	[4] = "<color=green>ÏûÏ¢<color>: ´ò¿ª%s ¿ÉÒÔ»ñµÃ<color=green>%d<color> <color=green>%s<color> <color=red>%s<color>, È·¶¨´ò¿ªÂğë?",
	[5] = "(Ëø¶¨)",
	[6] = "È·¶¨´ò¿ª",
	[7] = "Àë¿ª",
}
function OnUse(nItemIndex)
	Say(format(tbTWLXItemString[4],tbTWLXItemString[1],tbTWLXItemString[2][4],tbTWLXItemString[2][5],tbTWLXItemString[5]),
		2,
		tbTWLXItemString[6].."/#use_deal("..nItemIndex..")",
		tbTWLXItemString[7].."/nothing"
	)
end
--ÊÔÓÃ´¦Àí
function use_deal(nItemIndex)
	if gf_JudgeRoomWeight(1,0) ~= 1 then
		return
	end
	
	if DelItemByIndex(nItemIndex,1) == 1 then
		gf_AddItemEx2({tbTWLXItemString[2][1],tbTWLXItemString[2][2],tbTWLXItemString[2][3],tbTWLXItemString[2][4]}, THIENMON_LOG_TITLE, "È¡")
		
--		local bAddFlag = AddItem(tbTWLXItemString[2][1],tbTWLXItemString[2][2],tbTWLXItemString[2][3],tbTWLXItemString[2][4])
--		local szquantity = "chg_suc"
--		if bAddFlag ~= 1 then
--			szquantity = "chg_fail:"..bAddFlag
--		end
--		gf_WriteLogEx("TMZ_mission","item_chg(2,1,30321->2,1,30299,9)",szquantity,tbTWLXItemString[1])
	end
end
function nothing()
end