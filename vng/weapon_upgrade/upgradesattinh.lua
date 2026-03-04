Import("\\script\\lib\\globalfunctions.lua")
DSN_NPC = "<color=green>§ç Tø N­¬ng<color>: ";


function updateSatTinh()
	local tSay = {};
	tinsert(tSay,"Ta muèn n©ng cÊp Nãn S¸t Tinh/#upgradeSatTinh(1)")
	tinsert(tSay,"Ta muèn n©ng cÊp ¸o S¸t Tinh/#upgradeSatTinh(2)")
	tinsert(tSay,"Ta muèn n©ng cÊp QuÇn S¸t Tinh/#upgradeSatTinh(3)")
	tinsert(tSay,"Ta muèn n©ng cÊp Trang Søc S¸t Tinh/#upgradeSatTinh(4)")
	tinsert(tSay,"Ta muèn n©ng cÊp Vò KhÝ S¸t Tinh/#upgradeSatTinh(5)")
	
	tinsert(tSay, "Ta chØ xem qua th«i./nothing")
	local szHeader = DSN_NPC.."§¹i hiÖp muèn n©ng cÊp trang bÞ S¸t Tinh cÇn cã:\n"..
								"<color=yellow>- N©ng cÊp Nãn/¸o/QuÇn S¸t Tinh: <color>1 Èm HuyÕt (Nãn/¸o/QuÇn), 20 TMKL, 20 TCL, 10 HB§ \n"..
								"<color=yellow>- N©ng cÊp Trang Søc S¸t Tinh: <color>1 Èm HuyÕt (Trang Søc), 25 TMKL, 25 TCL, 10 HB§, 1 CTVC§\n"..
								"<color=yellow>- N©ng cÊp Vò KhÝ S¸t Tinh: <color>1 Èm HuyÕt (Vò KhÝ), 45 TMKL, 45 TCL, 10 HB§, 1 CTVC§\n"
								
	Say(szHeader, getn(tSay), tSay);
end
function nothing()

end

function upgradeSatTinh(nType)
	local nNguyenLieu = {--Thiªn M«n Kim LÖnh, Thiªn Cang LÖnh, HuyÕt Bå §Ò, Cöu Thiªn V« Cùc §¬n, Èm HuyÕt 
								[1] = {{2,1,30370,20}, {2,95,204,20}, {2,1,31241,10}, {2,1,1006,0},{0, 103, 30610, 1},"Nãn S¸t Tinh", 31313}, 
								[2] = {{2,1,30370,20}, {2,95,204,20}, {2,1,31241,10}, {2,1,1006,0},{0, 100, 30610, 1},"¸o S¸t Tinh", 31314}, 
								[3] = {{2,1,30370,20}, {2,95,204,20}, {2,1,31241,10}, {2,1,1006,0},{0, 101, 30610, 1},"QuÇn S¸t Tinh", 31315}, 
								[4] = {{2,1,30370,25}, {2,95,204,25}, {2,1,31241,10}, {2,1,1006,1},{ },"Trang Søc S¸t Tinh", 31317}, 
								[5] = {{2,1,30370,45}, {2,95,204,45}, {2,1,31241,10}, {2,1,1006,1},{ },"Vò KhÝ S¸t Tinh", 31316}, 
							}
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"",szNpcName.."Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return
	end
	local nCount1 = GetItemCount(nNguyenLieu[nType][1][1],nNguyenLieu[nType][1][2],nNguyenLieu[nType][1][3])
	local nCount2 = GetItemCount(nNguyenLieu[nType][2][1],nNguyenLieu[nType][2][2],nNguyenLieu[nType][2][3])
	local nCount3 = GetItemCount(nNguyenLieu[nType][3][1],nNguyenLieu[nType][3][2],nNguyenLieu[nType][3][3])
	local nCount4 = GetItemCount(nNguyenLieu[nType][4][1],nNguyenLieu[nType][4][2],nNguyenLieu[nType][4][3])
	local nCount5 = 0
	if nType == 4 then
		nCount5 = check_amHuyet(1)
	elseif nType == 5 then
		nCount5 = check_amHuyet(2)
	else	
		nCount5 = GetItemCount(nNguyenLieu[nType][5][1],nNguyenLieu[nType][5][2],nNguyenLieu[nType][5][3])
	end	
		
	if nCount1 < nNguyenLieu[nType][1][4] then
		Talk(1, "", DSN_NPC.."B¹n kh«ng cã ®ñ Thiªn M«n Kim LÖnh ®Ó ®æi trang bÞ "..nNguyenLieu[nType][6])
		return 0
	end						
	if nCount2 < nNguyenLieu[nType][2][4] then
		Talk(1, "", DSN_NPC.."B¹n kh«ng cã ®ñ Thiªn Cang LÖnh ®Ó ®æi trang bÞ "..nNguyenLieu[nType][6])
		return 0
	end		
	if nCount3 < nNguyenLieu[nType][3][4] then
		Talk(1, "", DSN_NPC.."B¹n kh«ng cã ®ñ HuyÕt Bå §Ò ®Ó ®æi trang bÞ "..nNguyenLieu[nType][6])
		return 0
	end				
	if nCount4 < nNguyenLieu[nType][4][4] then
		Talk(1, "", DSN_NPC.."B¹n kh«ng cã ®ñ Cöu Thiªn V« Cùc §¬n ®Ó ®æi trang bÞ "..nNguyenLieu[nType][6])
		return 0
	end	
	if nCount5 < 1 then
		Talk(1, "", DSN_NPC.."B¹n kh«ng cã ®ñ trang bÞ Èm HuyÕt ®Ó ®æi trang bÞ "..nNguyenLieu[nType][6])
		return 0
	end	
	local nDelItem1 = DelItem(nNguyenLieu[nType][1][1],nNguyenLieu[nType][1][2],nNguyenLieu[nType][1][3],nNguyenLieu[nType][1][4])
	local nDelItem2 = DelItem(nNguyenLieu[nType][2][1],nNguyenLieu[nType][2][2],nNguyenLieu[nType][2][3],nNguyenLieu[nType][2][4])
	local nDelItem3 = DelItem(nNguyenLieu[nType][3][1],nNguyenLieu[nType][3][2],nNguyenLieu[nType][3][3],nNguyenLieu[nType][3][4])		
	local nDelItem4 = DelItem(nNguyenLieu[nType][4][1],nNguyenLieu[nType][4][2],nNguyenLieu[nType][4][3],nNguyenLieu[nType][4][4])	
	local nDelItem5 = 0
	if nType == 4 then
		nDelItem5 = check_amHuyet(3)
	elseif nType == 5 then
		nDelItem5 = check_amHuyet(4)
	else	
		nDelItem5 = DelItem(nNguyenLieu[nType][5][1],nNguyenLieu[nType][5][2],nNguyenLieu[nType][5][3],nNguyenLieu[nType][5][4])	
	end	
	
	
	if nDelItem1 == 1 and nDelItem2 == 1 and nDelItem3 == 1 and nDelItem4 == 1 and nDelItem5 == 1 then
		Talk(1, "", DSN_NPC.."Chóc mõng b¹n n©ng cÊp trang bÞ S¸t Tinh thµnh c«ng.")
		gf_AddItemEx2({2,1,nNguyenLieu[nType][7],1,4}, "Nang cap sat tinh", "NANG CAP SAT TINH BK", "N©ng cÊp S¸t Tinh")
		gf_WriteLogEx("NANG CAP SAT TINH", "Thanh Cong", 1, "§æi lo¹i "..nType)
	else
		gf_WriteLogEx("NANG CAP SAT TINH", "That bai", 1, "§æi lo¹i "..nType)
	end
end

function check_amHuyet(nType)
	local tVuKhi = {
				[1] = {0,3,30884, 1},
				[2] = {0,8,30885, 1},
				[3] = {0,0,30886, 1},
				[4] = {0,1,30887, 1},
				[5] = {0,2,30888, 1},
				[6] = {0,10,30889, 1},
				[7] = {0,0,30890, 1},
				[8] = {0,5,30891, 1},
				[9] = {0,2,30892, 1},
				[10] = {0,9,30893, 1},
				[11] = {0,6,30894, 1},
				[12] = {0,4,30895, 1},
				[13] = {0,7,30896, 1},
				[14] = {0,11,30897, 1},
				[15] = {0,2,30898, 1},
				[16] = {0,3,30899, 1},
				[17] = {0,9,30900, 1},
				[18] = {0,11,30901, 1},
				[19] = {0,13,30902, 1},
				[20] = {0,12,30903, 1},
				[21] = {0,14,32164, 1},
				[22] = {0,2,32192, 1},
			}
	local tTrangSuc = {		
				[1] = {0, 102, 31272, 1},
				[2] = {0, 102, 31273, 1},
				[3] = {0, 102, 31415, 1},
				[4] = {0, 102, 31414, 1},
			}
	if nType == 1 then 		
		local nCount1 = 0
		for i = 1, 4 do
			nCount1 = GetItemCount(tTrangSuc[i][1],tTrangSuc[i][2],tTrangSuc[i][3])	
			if nCount1 > 0 then
				break
			end
		end
		return nCount1
	end
	if nType == 3 then 		
		local nDell_amHuyet1 = 0
		for i = 1, 4 do
			nDell_amHuyet1 = DelItem(tTrangSuc[i][1],tTrangSuc[i][2],tTrangSuc[i][3],1)	
			if nDell_amHuyet1 > 0 then
				break
			end
		end
		if nDell_amHuyet1 == 1 then
			return nDell_amHuyet1
		else
			return 0
		end
	end			
	if nType == 2 then 		
		local nCount2 = 0
		for i = 1, 22 do
			nCount2 = GetItemCount(tVuKhi[i][1],tVuKhi[i][2],tVuKhi[i][3])	
			if nCount2 > 0 then
				break
			end
		end
		return nCount2
	end
	if nType == 4 then 		
		local nDell_amHuyet2 = 0
		for i = 1, 22 do
			nDell_amHuyet2 = DelItem(tVuKhi[i][1],tVuKhi[i][2],tVuKhi[i][3],1)	
			if nDell_amHuyet2 > 0 then
				break
			end
		end
		if nDell_amHuyet2 == 1 then
			return nDell_amHuyet2
		else
			return 0
		end
	end			
end
