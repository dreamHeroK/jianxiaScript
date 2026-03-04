Import("\\script\\lib\\globalfunctions.lua")
DSN_NPC = "<color=green>L·o §¹i<color>: ";
FilePath = "\\script\\vng\\bandonghanh6\\bandonghanh6.lua"
TSK_CHOOSE_CHOICE = 2664
function pet_changebooklv6()
	local tSay = {};
	tinsert(tSay,"§æi 1 s¸ch B§H cÊp 6 (tiªu hao: 1 s¸ch B§H cÊp 5 bÊt kú + 1 TMKL)/#choose_changebooklv6(1)")
	tinsert(tSay,"§æi 1 s¸ch B§H cÊp 6 (tiªu hao: 1 s¸ch B§H cÊp 5 bÊt kú + 1 TCL)/#choose_changebooklv6(2)")
	tinsert(tSay,"§æi 1 s¸ch B§H cÊp 6 (tiªu hao: 1 s¸ch B§H cÊp 5 bÊt kú + 6000 vµng)/#choose_changebooklv6(3)")
	       	
	tinsert(tSay, "Ta chØ xem qua th«i./nothing")
	local szHeader = DSN_NPC.."<color=yellow>§¹i hiÖp muèn ®æi 1 s¸ch B¹n §ång Hµnh cÊp 6 cÇn tiªu hao 1 trong 3 c¸ch sau:<color>\n"..
								"- Tiªu hao: 1 s¸ch b¹n ®ång hµnh cÊp 5 bÊt kú + 1 TMKL \n"..
								"- Tiªu hao: 1 s¸ch b¹n ®ång hµnh cÊp 5 bÊt kú + 1 TCL \n"..
								"- Tiªu hao: 1 s¸ch b¹n ®ång hµnh cÊp 5 bÊt kú + 6000 vµng\n"
								
	Say(szHeader, getn(tSay), tSay);
end
function nothing()

end

function choose_changebooklv6(nType)
	local nCheck = check_nguyenlieu(nType)
	if nCheck ~= 1 then
		return 0
	end
	SetTask(TSK_CHOOSE_CHOICE, nType)
	PutinItemBox("§æi S¸ch B¹n §ång Hµnh cÊp 6" ,1 , "CÇn dïng 1 S¸ch B¹n §ång Hµnh cÊp 5 bÊt kú ®æi 1 S¸ch B¹n §ång Hµnh cÊp 6 ngÉu nhiªn, x¸c nhËn ®æi?", %FilePath, 1)
end
function OnPutinCheck(param, idx, genre, detail, particular)
    -- print(param, idx, genre, detail, particular)
    if param ~= 1 then
        return 0;
    end
    if genre ~= 2 or detail ~= 150 or particular < 67 or particular > 86 then
        Talk(1, "", "ChØ ®­îc ®Æt vµo S¸ch B¹n §ång Hµnh CÊp 5.");
        return 0;
    end
    return 1;
end
function OnPutinComplete(param)
    if param ~= 1 then
        Talk(1, "", "VËt phÈm ®Æt vµo kh«ng ph¶i s¸ch B¹n §ång Hµnh cÊp 5.");
        return 0;
    end
	local nType = GetTask(TSK_CHOOSE_CHOICE)
	local nCheck = check_nguyenlieu(nType)
	if nCheck ~= 1 then
		return 0
	end
	local tbItemList = GetPutinItem();
	local nResult = 1;
	for i=1, getn(tbItemList) do
		if DelItemByIndex(tbItemList[i][1], -1) ~= 1 then
			nResult = 0;
		end
	end
	local nXoaNguyenLieu = xoa_nguyenlieu(nType)
	if nResult ~= 1 or nXoaNguyenLieu ~= 1 then
		Talk(1,"", "Xãa vËt phÈm thÊt b¹i")
		gf_WriteLogEx("SACH PET LEVEL 6", "nhËn thÊt b¹i", 1, "s¸ch b®h cÊp 6")	
		return 0
	end
	local tPet_BookLev6 = {
					{1, 6000, "Ch©n khÝ hé thÓ", {2,150,87,1}, 0},
					{1, 6000, "Ých thä diªn th­¬ng", {2,150,88,1}, 0},
					{1, 6000, "C­êng th©n b¸ thÓ", {2,150,89,1}, 0},
					{1, 6000, "¢m phong thùc cèt", {2,150,90,1}, 0},
					{1, 5000, "HuyÒn vò v« song", {2,150,91,1}, 0},
					{1, 5000, "V« hµnh v« t­¬ng", {2,150,92,1}, 0},
					{1, 5000, "Kim linh phô thÓ", {2,150,93,1}, 0},
					{1, 5000, "Méc linh phô thÓ", {2,150,94,1}, 0},
					{1, 5000, "Thñy linh phô thÓ", {2,150,95,1}, 0},
					{1, 5000, "Háa linh phô thÓ", {2,150,96,1}, 0},
					{1, 5000, "Thæ linh phô thÓ", {2,150,97,1}, 0},
					{1, 5000, "Ph¸ kh«ng tr¶m ¶nh", {2,150,98,1}, 0},
					{1, 5000, "S¸t th­¬ng gia n©ng", {2,150,99,1}, 0},
					{1, 5000, "Khinh linh tÊn tËt", {2,150,100,1}, 0},
					{1, 5000, "V« h×nh chi cæ", {2,150,101,1}, 0},
					{1, 5000, "Linh quang nhÊt thiÓm", {2,150,102,1}, 0},
					{1, 5800, "Ng­ng thÇn quyÕt", {2,150,103,1}, 0},
					{1, 5000, "Kinh ®µo quyÕt", {2,150,104,1}, 0},
					{1, 2600, "Nguyªn thñy b¹o né", {2,150,105,1}, 0},
					{1, 2600, "ThiÕt bè sam", {2,150,106,1}, 0},
					}

	gf_EventGiveRandAward(tPet_BookLev6, 100000, 1, "SACH PET LEVEL 6 BK", "award ngÉu nhiªn");
	gf_WriteLogEx("SACH PET LEVEL 6", "nhËn", 1, "s¸ch b®h cÊp 6")	
end

function check_nguyenlieu(nType)
	local nNguyenLieu = {--Thiªn M«n Kim LÖnh, Thiªn Cang LÖnh, vµng
								[1] = {{2,1,30370,1}, {2,95,204,0}, 0}, 
								[2] = {{2,1,30370,0}, {2,95,204,1}, 0}, 
								[3] = {{2,1,30370,0}, {2,95,204,0}, 6000}, 
							}
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"",szNpcName.."Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return 0
	end
	local nCount1 = GetItemCount(nNguyenLieu[nType][1][1],nNguyenLieu[nType][1][2],nNguyenLieu[nType][1][3])
	local nCount2 = GetItemCount(nNguyenLieu[nType][2][1],nNguyenLieu[nType][2][2],nNguyenLieu[nType][2][3])
	local nCount3 = GetCash()

		
	if nCount1 < nNguyenLieu[nType][1][4] then
		Talk(1, "", DSN_NPC.."B¹n kh«ng cã ®ñ Thiªn M«n Kim LÖnh ®Ó ®æi s¸ch B¹n §ång Hµnh cÊp 6 ")
		return 0
	end						
	if nCount2 < nNguyenLieu[nType][2][4] then
		Talk(1, "", DSN_NPC.."B¹n kh«ng cã ®ñ Thiªn Cang LÖnh ®Ó ®æi s¸ch B¹n §ång Hµnh cÊp 6 ")
		return 0
	end	
	if nCount3 < nNguyenLieu[nType][3]*10000 then
		Talk(1, "", DSN_NPC.."B¹n kh«ng cã ®ñ 6000 vµng ®Ó ®æi s¸ch B¹n §ång Hµnh cÊp 6 ")
		return 0
	end
	return 1
end
function xoa_nguyenlieu(nType)
	local nNguyenLieu = {--Thiªn M«n Kim LÖnh, Thiªn Cang LÖnh, vµng
								[1] = {{2,1,30370,1}, {2,95,204,0}, 0}, 
								[2] = {{2,1,30370,0}, {2,95,204,1}, 0}, 
								[3] = {{2,1,30370,0}, {2,95,204,0}, 6000}, 
							}
	local nDelItem1 = DelItem(nNguyenLieu[nType][1][1],nNguyenLieu[nType][1][2],nNguyenLieu[nType][1][3],nNguyenLieu[nType][1][4])
	local nDelItem2 = DelItem(nNguyenLieu[nType][2][1],nNguyenLieu[nType][2][2],nNguyenLieu[nType][2][3],nNguyenLieu[nType][2][4])
	local nDelItem3 = Pay(nNguyenLieu[nType][3]*10000)
	if nType == 1 or nType == 2 then
		if nDelItem1 == 1 and nDelItem2 == 1 then
			return 1
		end
	elseif nType == 3 then
		if nDelItem3 == 1 then
			return 1
		end
	end
	
	return 0
end

function buy_bachyeunguyenthan()
	local nCash = GetCash()
	if nCash < 40000000 then
		Talk(1,"", "B¹n kh«ng mang ®ñ 4000 vµng ®Ó mua B¸ch Yªu Nguyªn ThÇn")
		return 0
	end
	if Pay(40000000) == 1 then
		gf_AddItemEx2({2,1,31318,1}, "b¸ch yªu nguyªn thÇn", "BUY BYNT", "mua bynt");
	end
end
function buy_chieuyeuky()
	local nCount_TMKL = GetItemCount(2,1,30370)
	local nCount_TCL = GetItemCount(2,95,204)
	local nCount_CTVCD = GetItemCount(2,1,1006)
	if nCount_TMKL < 15 then
		Talk(1,"", "B¹n kh«ng mang ®ñ 15 Thiªn M«n Kim lÖnh ®Ó mua Chiªu Yªu Kú")
		return 0
	end
	if nCount_TCL < 15 then
		Talk(1,"", "B¹n kh«ng mang ®ñ 15 Thiªn Cang lÖnh ®Ó mua Chiªu Yªu Kú")
		return 0
	end
	if nCount_CTVCD < 1 then
		Talk(1,"", "B¹n kh«ng mang ®ñ 1 Cöu Thiªn V« Cùc §¬n ®Ó mua Chiªu Yªu Kú")
		return 0
	end
	if DelItem(2,1,30370,15) == 1 and DelItem(2,95,204,15) == 1 and DelItem(2,1,1006,1) == 1 then
		gf_AddItemEx2({2,1,31307,1}, "Chiªu yªu kú", "BUY CYK", "mua cyk");
	end
end


