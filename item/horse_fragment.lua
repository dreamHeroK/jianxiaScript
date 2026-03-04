Include("\\script\\lib\\talktmp.lua")
Import("\\script\\lib\\globalfunctions.lua")

--2, 1, 31386
itempart_horse	= 10; --×øÆï
eCOLLECTION_T_HORSE = 3; --×øÆïµÄÊÕ²ØÀàÐÍ

T_HORSE_IMPROVE_CONFIG ={
	--Ô­Ê¼Âí						  	--ºÏ³ÉÂí{g,d,p,name,ÂíËéÆ¬ÏûºÄÊýÁ¿},
	-- [gf_PackItemGDP(0, 105, 181)] = {0,105,30205,"»ªÀöµÄ°×Â¶Ëª»ª½£",1000},
	-- [gf_PackItemGDP(0, 105, 117)] = {0,105,30204,"Æ¯ÁÁµÄöÌ¹â",1000},
}

function hf_init_config()
	local szConfigPath = "\\settings\\item\\collect\\horse_upgrade.txt"
	local tConfig = ff_GetTabFileTableEx(szConfigPath,2)
	tConfig = gf_TableNumberElementToNumber(tConfig)

	for i=1, getn(tConfig) do
		tinsert(
			T_HORSE_IMPROVE_CONFIG, 
			gf_PackItemGDP(tConfig[i]["G"], tConfig[i]["D"], tConfig[i]["P"]),
			{
				tConfig[i]["tG"],
				tConfig[i]["tD"],
				tConfig[i]["tP"],
				GetItemName(tConfig[i]["tG"], tConfig[i]["tD"], tConfig[i]["tP"]),
				tConfig[i]["CostPiece"],
			}
		)
	end
	T_HORSE_IMPROVE_CONFIG.n = nil
end

hf_init_config()

function OnUse(nItemIdx)
	--2,1,31386
	local nItemIdx = tonumber(nItemIdx);
	local nHorseIdx = GetPlayerEquipIndex(itempart_horse);

	if not nHorseIdx or nHorseIdx <= 0 then
		Talk(1,"","H·y mang thó c­ìi muèn n©ng cÊp thµnh tèc ®é 140% lªn ng­êi");
		return 0;
	end

	local nHG, nHD, nHP = GetItemInfoByIndex(nHorseIdx);
	local nGDP = gf_PackItemGDP(nHG, nHD, nHP);

	if not T_HORSE_IMPROVE_CONFIG or not T_HORSE_IMPROVE_CONFIG[nGDP] then
		Talk(1,"","Thó c­ìi ®ang dïng kh«ng thÓ n©ng cÊp");
		return 0;
	end

	if hf_check_is_collected(eCOLLECTION_T_HORSE, nHG, nHD, nHP) <= 0 then
		Talk(1,"","ChØ thó c­ìi ®· tõng ®­îc ®­a vµo L­u tr÷ trong tñ ¸o biÕn thiªn míi cã thÓ n©ng cÊp");
		return 0;
	end

	local tTargetHorseInfo = T_HORSE_IMPROVE_CONFIG[nGDP];
	local nTG, nTD, nTP = tTargetHorseInfo[1], tTargetHorseInfo[2], tTargetHorseInfo[3];
	local bIsCollected = hf_check_is_collected(eCOLLECTION_T_HORSE, nTG, nTD, nTP);

	if bIsCollected > 0 then
		Talk(1,"","Trong L­u tr÷ trong tñ ¸o biÕn thiªn ®· cã thó c­ìi ®­îc n©ng cÊp, kh«ng thÓ t¨ng n÷a");
		return 0;
	elseif bIsCollected < 0 then
		Talk(1,"","Thó c­ìi nµy bÞ lçi d÷ liÖu, xin liªn hÖ CSKH ®Ó xö lý");
		return 0;
	end

	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
	local szItemName = GetItemName(nItemIdx);
	local nExchangeNeedNum = tTargetHorseInfo[5] or -1;

	if nExchangeNeedNum <= 0 then
		Talk(1,"",format("Sè <color=yellow>%d<color> cÇn thiÕt bÞ lçi, xin liªn hÖ CSKH ®Ó xö lý", szItemName) );
		return 0;
	end

	if  GetItemCount(nGenre, nDetail, nParticular) < nExchangeNeedNum then
		Talk(1,"",format("<color=yellow>%d<color> kh«ng ®ñ <color=red>%d<color>", szItemName, nExchangeNeedNum) );
		return 0;
	end

	Say(format("Dïng <color=yellow>%d<color> %s n©ng cÊp thó c­ìi nµy thµnh <color=gold>%s<color>? (Thó c­ìi hiÖn cã <color=green>kh«ng biÕn mÊt<color>, thó c­ìi ®­îc n©ng cÊp xong sÏ <color=green>tù ®­a vµo L­u tr÷ trong tñ ¸o biÕn thiªn <color>)",
				nExchangeNeedNum, szItemName, GetItemName(nTG, nTD, nTP) ), 2,
		format("§ång ý/#improve_horse_sure(%d, %d, %d, %d, %d, %d, %d)", nTG, nTD, nTP, nGenre, nDetail, nParticular, nExchangeNeedNum), "Hñy bá/nothing");

end

function improve_horse_sure(nTG, nTD, nTP, nG, nD, nP, nNeedNum)
	if not nNeedNum or nNeedNum <= 0 then
		return 0;
	end

	local nCoIndex = GetCollectionIndex(eCOLLECTION_T_HORSE, nTG, nTD, nTP);
	if not nCoIndex or nCoIndex <= 0 then
		return 0;
	end

	if DelItem(nG, nD, nP, nNeedNum) ~= 1 then
		return 0;
	end

	local nRet = SetPlayerCollectionData(eCOLLECTION_T_HORSE, nCoIndex, 1);
	local szLog = format("[Role:%s (acc:%s)] [ImproveHorse]", GetName(), GetAccount() );
	if nRet > 0 then
		Talk(1,"",format("N©ng cÊp thó c­ìi thµnh c«ng! Ngµi ®· ®­a <color=gold>%s<color> vµo chuång, nhËn ®­îc <color=green>®iÓm QuyÕn Rò<color>, cã thÓ <color=green>vµo chuång<color> xem", GetItemName(nTG,nTD,nTP) ) );
		AddRuntimeStat(94, 1, 0, 1);
		WriteLog(format("%s [AddHorseCollection: success]", szLog));
	elseif nRet == 0 then
		WriteLog(format("%s [AddHorseCollection: faild] [HasOwned]", szLog ));
	else
		WriteLog(format("%s [AddHorseCollection: faild] [Error]", szLog ));
	end
end

function hf_check_is_collected(nType, nG, nD, nP)
	local nCoIndex = GetCollectionIndex(nType, nG, nD, nP);
	if not nCoIndex or nCoIndex <= 0 then
		return -1;
	end

	return GetPlayerCollectionData(nType, nCoIndex) or -1;
end