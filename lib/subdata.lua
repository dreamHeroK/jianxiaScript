-- SubsidiaryData
-- by windle 2016/4/3

SDTYPE_ITEM		= 1
SDTYPE_PLAYER	= 2
SDTYPE_NPC		= 3


-- enum enumSubsidiaryDataEntryType
-- {
	--KItem类的自定义数据类型
	enumCCDT_Item_Mask			= 65536;
	enumCCDT_Item_Book_Appendix	= enumCCDT_Item_Mask + 1;
	--enumCCDT_Item_Maker,
	--enumCCDT_Item_Slot,
	--enumCCDT_Item_JewelAttribute,
	enumCCDT_Item_LeftPearl		= enumCCDT_Item_Mask + 2;

	--KPlayer类的自定义数据类型
	enumCCDT_Player_Mask		= 65536*2;

	--KNpc类的自定义数据类型
	enumCCDT_Npc_Mask			= 65536*4;
-- };

--ItemSubData = {}

function sd_GetItemSubData(nItemIdx, nEntryType, nEntryID)
	nEntryID = nEntryID or -1;
	return GetSubData(SDTYPE_ITEM, nItemIdx, subType, nEntryID)
end

function sd_AddItemSubData(nItemIdx, nEntryType, nEntryID)
	AddSubData(SDTYPE_ITEM, nItemIdx, nEntryType, nEntryID);
	SyncItem2Client(nItemIdx);
end

function sd_DelItemSubData(nItemIdx, nEntryType, nEntryID)
	DelSubData(SDTYPE_ITEM, nItemIdx, nEntryType, nEntryID);
	SyncItem2Client(nItemIdx);
end
