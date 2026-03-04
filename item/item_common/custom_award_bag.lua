--Í¨ÓÃ½±Àø×é·¢½±µÀ¾ß½Å±¾
Import("\\script\\lib\\globalfunctions.lua")

g_tItem2CustomAwardInfo = {
--	[gf_PackItemGDP(g, d, p)] 	  = {szAward, bGiveAll, {RuntimeStat}, }, --ItemName

	[gf_PackItemGDP(2, 1, 31508)] = {"fenghua3",		0, nil,}, --·ç»ª´óÊ¹µÄÀñÎï
	[gf_PackItemGDP(2, 1, 31509)] = {"suolingshixiang",	0, nil,}, --ËøÁéÊ¯Ïä
	[gf_PackItemGDP(2, 1, 31510)] = {"yizhu5_7",		0, nil,}, --ÉÁË¸µÄ²×º£ÒÅÖé(Î´¼ø¶¨)
}

function OnUse(nItemIdx)
	local nItemIdx = tonumber(nItemIdx)
	local g,d,p = GetItemInfoByIndex(nItemIdx)
	local tInfo = g_tItem2CustomAwardInfo[gf_PackItemGDP(g, d, p)]

	if not tInfo then
		Talk(1,"","§¹o cô lçi, xin liªn hÖ CSKH.")
		return 0
	end

	local szAward  = tInfo[1]
	local bGiveAll = tInfo[2]
	local tRsInfo  = tInfo[3]

	if CustomAwardCheckCondition(szAward) ~= 1 then
		return 0
	end

	gf_SetLogCaption(szAward)
	
	if gf_DelItemByIndex(nItemIdx, 1) ~= 1 then
		return 0
	end

	if CustomAwardGiveGroup(szAward, bGiveAll) <= 0 then   --¶þºÅ²ÎÊýÎªÊÇ·ñ¸øÓèÈ«²¿½±Àø
		return 0
	end
	
	if tRsInfo and getn(tRsInfo) >= 4 then
		AddRuntimeStat(tRsInfo[1], tRsInfo[2], tRsInfo[3], tRsInfo[4])
	end

	gf_SetLogCaption("")

	return 1
end