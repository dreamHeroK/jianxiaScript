Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>Gi¸o SÜ: <color>"


tbTS_HHVH_nP = {31128, 31129}


function OnPutinCheck(param, idx, genre, detail, particular)
	local nCheck_nP = 0
	for i = 1 , getn(tbTS_HHVH_nP) do
		if tbTS_HHVH_nP[i] == particular then
			nCheck_nP = 1
			break
		end	
	end
	if genre ~= 0 then
		Talk(1,"",szNpcName .. "Ta chØ nhËn n©ng cÊp trang søc Hµo HiÖp V« H¹ Giíi hoÆc Hµo HiÖp V« H¹ Béi.")
		return 0
	end
	if detail ~= 102 then
		Talk(1,"",szNpcName .. "Ta chØ nhËn n©ng cÊp trang søc Hµo HiÖp V« H¹ Giíi hoÆc Hµo HiÖp V« H¹ Béi.")
		return 0
	end
	if nCheck_nP == 0 then
		Talk(1,"",szNpcName .. "Ta chØ nhËn n©ng cÊp trang søc Hµo HiÖp V« H¹ Giíi hoÆc Hµo HiÖp V« H¹ Béi.")
		return 0
	end
	
	return 1
end


function OnPutinComplete(param)
	local tCondition = { 
				[2] = {{0, 102, 31272, 1},"t¶ giíi Èm huyÕt"},
				[3] = {{0, 102, 31273, 1},"h÷u giíi Èm huyÕt"},
				[4] = {{0, 102, 31415, 1},"trôy Èm huyÕt"},
				[5] = {{0, 102, 31414, 1},"béi Èm huyÕt"},
				
			}
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nG, nD, nP = tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
	
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,1,30370,8}}, {gdp={2,95,204,8}}}},	--, task={{707, 30000, "TÝch lòy chiÕn tr­êng"}}
--		[2] = {item={{gdp={2,1,30370,15}}, {gdp={2,95,204,15}}}},	
	}
--	local nIndex = tbUyHo_DoiPhe[nG][nD][nP][1]
	--=====================
	local nTMKL = 8
	local nTCL = 8

	local nCount1 = GetItemCount(2,1,30370)
	local nCount2 = GetItemCount(2,95,204)
	
	if nCount1 < nTMKL then
		Talk(1, "", szNpcName .. "B¹n kh«ng cã ®ñ "..nTMKL.." Thiªn M«n Kim LÖnh ®Ó n©ng cÊp trang søc Èm HuyÕt.")
		return 0
	end						
	if nCount2 < nTCL then
		Talk(1, "", szNpcName .. "B¹n kh«ng cã ®ñ "..nTCL.."Thiªn Cang LÖnh ®Ó n©ng cÊp trang søc Èm HuyÕt.")
		return 0
	end			
	--=======================
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[1])
	if nCheck == 0 then
		return 0
	end
	
	local nLevel = 0
	local nTypeChoose = VNG_GetTaskPos(TSK_Type_HHVHtoAMHUYET,6,6)
	if nTypeChoose ~= 2 and nTypeChoose ~= 3 and nTypeChoose ~= 4 and nTypeChoose ~= 5 then
		Talk(1,"", "Haizzzz, ta mÖt råi.")
		return 0
	end
	if DelItem(2,1,30370,nTMKL) == 1 and DelItem(2,95,204,nTCL) == 1 then
		local szItemName = GetItemName(tCondition[nTypeChoose][1][1],tCondition[nTypeChoose][1][2],tCondition[nTypeChoose][1][3])
		LIB_Award.szLogTitle = "TIEN CAP AM HUYET BK"
		LIB_Award.szLogAction = "thµnh c«ng"
--		local tbNewItem = {item={{gdp={nG, nD, nP, 1,1, -1, -1, -1, -1, -1, -1, -1, nLevel}}}}
--		LIB_Award:PayMaterial(tbMaterial[nIndex])
		DelItemByIndex(tbUpgradeList[1][1],-1)
--		LIB_Award:Award(tbNewItem)
		gf_AddItemEx2(tCondition[nTypeChoose][1], "trang søc Èm huyÕt 2020", "TIEN CAP AM HUYET", "trang søc Èm huyÕt");

		Talk(1,"",szNpcName.."N©ng cÊp thµnh c«ng, h·y nhËn lÊy <color=yellow>" .. szItemName .. "<color> cña ng­¬i.")
		return 1
	end
end
