Include("\\script\\结婚\\marriage_head.lua");
function OnUse(nItemIdx)
	if GetPlayerFaction() == 0 then
		Talk(1,"","没有加入流派无法举行婚礼。");
		return 0;
	end;
	local selTab = {
			format("打开/#open(%d)",nItemIdx),
			"下次再来/nothing",
			}
	Say("你要举行婚礼吗，打开可以获得结婚头饰。",getn(selTab),selTab);
end;
tCloth_Faction = {--租的，买的
		{131,173,	167,213},
		{143,189,	171,217},
		{147,193,	175,221},
		{151,197,	179,225},
		{155,201,	183,229},
		{159,205,	187,233},
		{163,209,	191,237},
		{538,539,	540,541},
		{542,543,	544,545},
		{546,547,	548,549},
		};
function open(nItemIdx)
	if gf_JudgeRoomWeight(1,10) == 0 then
		Talk(1,"","您的背包空间或者负重不足！");
		return 0;
	end;
	local nBody = GetBody();
	local nFaction = GetPlayerFaction();
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(0,108,tCloth_Faction[nFaction][3]+nBody-1,1)
		Msg2Player("您获得了结婚头饰");
		WriteLog("[婚礼]:"..GetName().."开了结婚头饰箱");
	end;
end;