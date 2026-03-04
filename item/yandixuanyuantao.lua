--炎帝轩辕套
--by 
--2020/05/12
Include("\\script\\lib\\globalfunctions.lua");
strTitle = "<color=green>炎帝礼包<color>："



function OnUse(nItemIndex)	
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nSex = GetSex();
	local nRouteFlag = gf_IsPlayerRoute();
    local nQianghua = 0
	if nRouteFlag ~= 1 then
		Talk(1,"", format("%s侠士还没加入任何流派，不能开启炎帝轩辕装备。", strTitle));
		return
	end;
	if gf_Judge_Room_Weight(6,600,"") ~= 1 then
		return 0;
	end
	local t_Weapon = {
		[2] = {"轩辕之碎宇刀", 0, 3, 8801},
		[2] = {"轩辕之碎宇棍", 0, 5, 8802},
		[3] = {"轩辕之九如杖", 0, 8, 8803},
		[4] = {"轩辕之浩然手", 0, 0, 8804},
		[6] = {"轩辕之无形针", 0, 1, 8805},
		[8] = {"轩辕之紫晶剑", 0, 2, 8806},
		[9] = {"轩辕之凤凰琴", 0, 10, 8807},
		[11] = {"轩辕之五岳手", 0, 0, 8808},
		[12] = {"轩辕之破天棍", 0, 5, 8809},
		[14] = {"轩辕之鸿钧剑", 0, 2, 8810},
		[15] = {"轩辕之生死笔", 0, 9, 8811},
		[17] = {"轩辕之破军枪", 0, 6, 8812},
		[18] = {"轩辕之开天弓", 0, 4, 8813},
		[20] = {"轩辕之阴阳刃", 0, 7, 8814},
		[21] = {"轩辕之幽冥爪", 0, 11, 8815},
		[23] = {"轩辕之雷鸣剑", 0, 2, 8816},
		[25] = {"轩辕之斩炎刀", 0, 3, 8817},
		[26] = {"轩辕之光明笔", 0, 9, 8818},
		[27] = {"轩辕之咒印爪", 0, 11, 8819},
		[29] = {"轩辕之凌霄扇", 0, 13, 8820},
		[30] = {"轩辕之繁花笛", 0, 12, 8821},
	};
	local t_Ring = {
		[2] = {{"轩辕战", 0, 102, 8801}, {"轩辕斗", 0, 102, 8802},},
		[3] = {{"轩辕战", 0, 102, 8803}, {"轩辕斗", 0, 102, 8804},},
		[4] = {{"轩辕战", 0, 102, 8805}, {"轩辕斗", 0, 102, 8806},},
		[6] = {{"轩辕战", 0, 102, 8807}, {"轩辕斗", 0, 102, 8808},},
		[8] = {{"轩辕战", 0, 102, 8809}, {"轩辕斗", 0, 102, 8810},},
		[9] = {{"轩辕战", 0, 102, 8811}, {"轩辕斗", 0, 102, 8812},},
		[11] = {{"轩辕战", 0, 102, 8813}, {"轩辕斗", 0, 102, 8814},},
		[12] = {{"轩辕战", 0, 102, 8815}, {"轩辕斗", 0, 102, 8816},},
		[14] = {{"轩辕战", 0, 102, 8817}, {"轩辕斗", 0, 102, 8818},},
		[15] = {{"轩辕战", 0, 102, 8819}, {"轩辕斗", 0, 102, 8820},},
		[17] = {{"轩辕战", 0, 102, 8821}, {"轩辕斗", 0, 102, 8822},},
		[18] = {{"轩辕战", 0, 102, 8823}, {"轩辕斗", 0, 102, 8824},},
		[20] = {{"轩辕战", 0, 102, 8825}, {"轩辕斗", 0, 102, 8826},},
		[21] = {{"轩辕战", 0, 102, 8827}, {"轩辕斗", 0, 102, 8828},},
		[23] = {{"轩辕战", 0, 102, 8829}, {"轩辕斗", 0, 102, 8830},},
		[29] = {{"轩辕战", 0, 102, 8837}, {"轩辕斗", 0, 102, 8838},},
		[30] = {{"轩辕战", 0, 102, 8839}, {"轩辕斗", 0, 102, 8848},},
	};
	local nID2,nID3,nID4 = 0,0,0;
		nID2 = t_Weapon[nRoute][3];
		nID4 = t_Weapon[nRoute][4];
		nID3 = 8000 + nBody
		tRing = t_Ring[nRoute];

	if DelItemByIndex(nItemIndex,1) == 1 then
		fe_AddFactionEquipment(103, nID3, nQianghua)
		fe_AddFactionEquipment(100, nID3, nQianghua)
		fe_AddFactionEquipment(101, nID3, nQianghua)
		fe_AddFactionEquipment(nID2, nID4, nQianghua)
		fe_AddFactionEquipment(102, tRing[1][4], 0)
		fe_AddFactionEquipment(102, tRing[2][4], 0)

	end	
end;

function fe_AddFactionEquipment(nID2, nID3, nQianghua, nTime)
	local name = GetItemName(0,nID2,nID3)
	local nRet, nItemIdx = 0, 0
	if nID2 == 102 or nID2 == 105 or nQianghua == 0 then
		nRet, nItemIdx = AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,-1);
	else
		nRet, nItemIdx = AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,-1,nQianghua);
	end

	Msg2Player("您获得了["..name.."]×1");
end;