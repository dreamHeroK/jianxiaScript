Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\weapon_upgrade\\chiencuong_head.lua");

szNpcName = "<color=green>Häc trß thî rÌn L­u: <color>"
tbDieuDuong = {

		}


function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if genre ~= 0 or detail ~= 102 then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang søc DiÖu D­¬ng cÊp 2.")
		return 0
	end
	if particular < 3185 or particular > 3189 then
		Talk(1,"",szNpcName .. "Ta chØ nhËn ®æi trang søc DiÖu D­¬ng cÊp 2.")
		return 0
	end

	return 1
end


function OnPutinComplete(param)
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nItemIndex, nG, nD, nP = tbUpgradeList[1][1], tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
--	if tbDieuDuong[nG][nD][nP] == nil then
--		return 0
--	end
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,95,204,1}, name="Thiªn Cang LÖnh"}, {gdp={2,97,236,50}, name="Thiªn Kiªu LÖnh"},{gdp={2,1,1005,3}, name="ChiÕn ThÇn Hoµn"}}},
	}
	local nNguyenlieu = 1
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nNguyenlieu])
	if nCheck == 0 then
		return 0
	end
	LIB_Award:PayMaterial(tbMaterial[nNguyenlieu])
	DelItemByIndex(nItemIndex,-1)
	gf_AddItemEx2({0,102,nP+5,1,1,-1,-1,-1,-1,-1,-1}, "N©ng cÊp trang søc DiÖu D­¬ng", "NANG CAP DIEU DUONG  - TRANG SUC CAP 3 bk", "nhËn")
	gf_WriteLogEx("NANG CAP DIEU DUONG  - TRANG SUC CAP 3", "thµnh c«ng ", 1, "N©ng cÊp trang søc DiÖu D­¬ng")
	Talk(1,"",szNpcName.."N©ng cÊp thµnh c«ng, h·y nhËn lÊy trang søc DiÖu D­¬ng cÊp 3 cña ng­¬i.")
	return 1
end
