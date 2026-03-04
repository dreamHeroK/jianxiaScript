Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>H‰c trﬂ thÓ rÃn L≠u: <color>"
tbUyHo_DoiPhe = { --Uy HÊ T≠Ìng
	
}
tbUyHo_nD = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14}
tbUyHo_nP = {32263,32264,32265,32266,32267,32268,32269,32270,32271,32272,32273,32274,32275,32276,32277,32278,32279,32280,32281,32282,32283,32284,
			 32395,32396,32397,32398,32399,32400,32401,32402,32403,32404,32405,32406,32407,32408,32409,32410,32411,32412,32413,32414,32415,32416}


function OnPutinCheck(param, idx, genre, detail, particular)
	local nCheck_nD = 0
	local nCheck_nP = 0
	for i = 1 , getn(tbUyHo_nD) do
		if tbUyHo_nD[i] == detail then
			nCheck_nD = 1
			break
		end	
	end
	for i = 1 , getn(tbUyHo_nP) do
		if tbUyHo_nP[i] == particular then
			nCheck_nP = 1
			break
		end	
	end
	if genre ~= 0 then
		Talk(1,"",szNpcName .. "Ta chÿ nhÀn ÆÊi trang bﬁ VÚ Kh› Uy HÊ T≠Ìng Qu©n.")
		return 0
	end
	if nCheck_nD == 0 then
		Talk(1,"",szNpcName .. "Ta chÿ nhÀn ÆÊi trang bﬁ VÚ Kh› Uy HÊ T≠Ìng Qu©n.")
		return 0
	end
	if nCheck_nP == 0 then
		Talk(1,"",szNpcName .. "Ta chÿ nhÀn ÆÊi trang bﬁ VÚ Kh› Uy HÊ T≠Ìng Qu©n.")
		return 0
	end
	
	return 1
end


function OnPutinComplete(param)
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNpcName.."Hµnh trang ho∆c s¯c l˘c kh´ng ÆÒ, ng≠¨i h∑y sæp x’p lπi nh–!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nG, nD, nP = tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
--	if tbUyHo_DoiPhe[nG][nD][nP] == nil then
--		return 0
--	end
	if nP <= 32284 then
		nP = nP + 132
	else
		nP = nP - 132
	end
	
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,1,30370,10}}, {gdp={2,95,204,10}}}},	--, task={{707, 30000, "T›ch lÚy chi’n tr≠Íng"}}
--		[2] = {item={{gdp={2,1,30370,15}}, {gdp={2,95,204,15}}}},	
	}
--	local nIndex = tbUyHo_DoiPhe[nG][nD][nP][1]
	--=====================
	local nTMKL = 10
	local nTCL = 10

	local nCount1 = GetItemCount(2,1,30370)
	local nCount2 = GetItemCount(2,95,204)
	
	if nCount1 < nTMKL then
		Talk(1, "", szNpcName .. "Bπn kh´ng c„ ÆÒ "..nTMKL.." Thi™n M´n Kim L÷nh Æ” chuy”n ÆÊi trang bﬁ Uy HÊ.")
		return 0
	end						
	if nCount2 < nTCL then
		Talk(1, "", szNpcName .. "Bπn kh´ng c„ ÆÒ "..nTCL.."Thi™n Cang L÷nh Æ” chuy”n ÆÊi trang bﬁ Uy HÊ.")
		return 0
	end			
	--=======================
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[1])
	if nCheck == 0 then
		return 0
	end
	
	local nLevel = 0

	if DelItem(2,1,30370,nTMKL) == 1 and DelItem(2,95,204,nTCL) == 1 then
		local szItemName = GetItemName(nG,nD,nP)
		LIB_Award.szLogTitle = "CHUYEN DOI PHE TRANG BI UY HO TUONG QUAN"
		LIB_Award.szLogAction = "thµnh c´ng"
		local tbNewItem = {item={{gdp={nG, nD, nP, 1,1, -1, -1, -1, -1, -1, -1, -1, nLevel}}}}
	--	LIB_Award:PayMaterial(tbMaterial[nIndex])
		DelItemByIndex(tbUpgradeList[1][1],-1)
		LIB_Award:Award(tbNewItem)
		Talk(1,"",szNpcName.."N©ng c p thµnh c´ng, h∑y nhÀn l y <color=yellow>" .. szItemName .. "<color> cÒa ng≠¨i.")
		return 1
	end
end
