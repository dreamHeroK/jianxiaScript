Import("\\script\\lib\\globalfunctions.lua")

TLP_NPC = "<color=green>Hoa Th¸nh L¹c Phi: <color>";
function nothing()

end

function change_VanSuc_cap2()
	local nDate = tonumber(date("%Y%m%d"));
	--if nDate > 20200731 then
	--	Talk(1, "", "HiÖn t¹i ta ®· hÕt hµng, ®¹i hiÖp h·y quay l¹i sau nha.")
	--	return 0 
	--end
	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "N©ng cÊp trang bÞ V¨n Søc cÊp 2 cÇn tiªu hao: Thiªn M«n Kim LÖnh, Thiªn Cang LÖnh"
	
	tinsert(tbSayDialog,"N©ng cÊp Kh¾c b¶n linh ho¹t cÊp 2 (§Çu)(tiªu hao 3 TMKL, 3 TCL) /#updateVanSuc_choose(1)")
	tinsert(tbSayDialog,"N©ng cÊp Kh¾c b¶n linh ho¹t cÊp 2 (¸o)(tiªu hao 4 TMKL, 4 TCL) /#updateVanSuc_choose(2)")
	tinsert(tbSayDialog,"N©ng cÊp Kh¾c b¶n linh ho¹t cÊp 2 (QuÇn)(tiªu hao 4 TMKL, 4 TCL) /#updateVanSuc_choose(3)")
	tinsert(tbSayDialog,"N©ng cÊp Kh¾c b¶n linh ho¹t cÊp 2 (NhÉn)(tiªu hao 6 TMKL, 6 TCL) /#updateVanSuc_choose(4)")
	tinsert(tbSayDialog,"N©ng cÊp Kh¾c b¶n linh ho¹t cÊp 2 (Ngäc Béi)(tiªu hao 6 TMKL, 6 TCL) /#updateVanSuc_choose(5)")
	tinsert(tbSayDialog,"T«i chØ xem xem th«i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(TLP_NPC..msg, nSaySize, tbSayDialog);
end

function updateVanSuc_choose(nChoose)
	local tCondition = { --Thiªn m«n kim lÖnh, Thiªn cang lÖnh, Cöu thiªn v« cùc ®¬n
				[1] = {3, {2,1,30370}, 3, {2,95,204}, 0, {2,1,1006}, {2, 1, 31073, 1},"Kh¾c b¶n cÊp 2 ®Çu"},
				[2] = {4, {2,1,30370}, 4, {2,95,204}, 0, {2,1,1006}, {2, 1, 31074, 1},"Kh¾c b¶n cÊp 2 ¸o"},
				[3] = {4, {2,1,30370}, 4, {2,95,204}, 0, {2,1,1006}, {2, 1, 31075, 1},"Kh¾c b¶n cÊp 2 quÇn"},
				[4] = {6, {2,1,30370}, 6, {2,95,204}, 0, {2,1,1006}, {2, 1, 31076, 1},"Kh¾c b¶n cÊp 2 nhÉn"},
				[5] = {6, {2,1,30370}, 6, {2,95,204}, 0, {2,1,1006}, {2, 1, 31077, 1},"Kh¾c b¶n cÊp 2 ngäc béi"},
			}
			
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,30370) < tCondition[nChoose][1] then
		Talk(1, "","§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][1].." Thiªn M«n Kim LÖnh.")
		return 0
	end
	if GetItemCount(2,95,204) < tCondition[nChoose][3] then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][3].." Thiªn Cang LÖnh.")
		return 0
	end
--	if GetItemCount(2,1,1006) < tCondition[nChoose][5] then
--		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][5].." Cöu Thiªn V« Cùc §¬n.")
--		return 0
--	end
	if DelItem(2,1,30370,tCondition[nChoose][1]) ~= 1 then
		Talk(1,"", "Xãa kh«ng thµnh c«ng vËt phÈm 1")
		gf_WriteLogEx("NANG CAP VAN SUC", "xoa", 1, "xãa vËt phÈm TMKL")
		return 0
	end
	if DelItem(2,95,204,tCondition[nChoose][3]) ~= 1 then
		Talk(1,"", "Xãa kh«ng thµnh c«ng vËt phÈm 2")
		gf_WriteLogEx("NANG CAP VAN SUC", "xoa", 1, "xãa vËt phÈm TCL")
		return 0
	end
--	if DelItem(2,1,1006,tCondition[nChoose][5]) ~= 1 then
--		Talk(1,"", "Xãa kh«ng thµnh c«ng vËt phÈm 3")
--		gf_WriteLogEx("NANG CAP VAN SUC", "xoa", 1, "xãa vËt phÈm CTVCD")
--		return 0
--	end	
	gf_AddItemEx2(tCondition[nChoose][7], tCondition[nChoose][8], "TIEN CAP VAN SUC", "Trang bÞ v¨n søc cÊp 2");
	Talk(1, "", "Chóc mõng ®¹i hiÖp ®· n©ng cÊp thµnh c«ng trang bÞ "..tCondition[nChoose][8])	
	gf_WriteLogEx("NANG CAP VAN SUC", "nhan", 1, "N©ng cÊp thµnh c«ng")
end

function buy_nguyenlieuvansuc()
	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "Mua nguyªn liÖu c­êng hãa trang bÞ V¨n Søc: L­u Kim vµ Thiªn V¨n Th¹ch"
	
	tinsert(tbSayDialog,"Ta muèn mua 1 L­u Kim (tiªu hao 80 xu vËt phÈm) /#finish_buy_nguyenlieuvansuc(1)")
	tinsert(tbSayDialog,"Ta muèn mua 1 Thiªn V¨n Th¹ch (tiªu hao 50 xu vËt phÈm) /#finish_buy_nguyenlieuvansuc(2)")
	
	tinsert(tbSayDialog,"T«i chØ xem xem th«i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(TLP_NPC..msg, nSaySize, tbSayDialog);
end

function finish_buy_nguyenlieuvansuc(nType)
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > 20180630 then
		Talk(1, "", "HiÖn t¹i ta ®· hÕt hµng, ®¹i hiÖp h·y quay l¹i sau nha.")
		return 0 
	end
	local tnguyenlieu = {--
			[1] = {2,1,31096,1, "L­u Kim", 80},	
			[2] = {2,201,13,1, "Thiªn V¨n Th¹ch", 50},	
		}
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"","Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return
	end
	if GetItemCount(2,1,30230) < tnguyenlieu[nType][6] then
		Talk(1, "", "§¹i hiÖp kh«ng mang theo ®ñ "..tnguyenlieu[nType][6].." xu vËt phÈm.")
		return 0
	end
	if  DelItem(2,1,30230,tnguyenlieu[nType][6]) ~= 1 then
		Talk(1, "", "X¶y ra lçi 1")
		return 0
	end

	gf_AddItemEx2({tnguyenlieu[nType][1],tnguyenlieu[nType][2],tnguyenlieu[nType][3],tnguyenlieu[nType][4]}, "nguyªn liÖu", "NGUYEN LIEU CUONG HOA VAN SUC", "Mua nguyªn liÖu lo¹i "..tnguyenlieu[nType][5])
end

function change_VanSuc_cap3()
--	local nDate = tonumber(date("%Y%m%d"));
--	if nDate > 20180731 then
--		Talk(1, "", "HiÖn t¹i ta ®· hÕt hµng, ®¹i hiÖp h·y quay l¹i sau nha.")
--		return 0 
--	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "Ta cã thÓ gióp ®¹i hiÖp n©ng cÊp trang bÞ V¨n Søc Hoµn Mü CÊp 3"
		
	tinsert(tbSayDialog,"N©ng cÊp Kh¾c B¶n Hoµn Mü cÊp 3 (§Çu): tiªu hao 3 Kh¾c b¶n linh ho¹t cÊp 2 /#updateVanSuccap3_choose(1)")
	tinsert(tbSayDialog,"N©ng cÊp Kh¾c B¶n Hoµn Mü cÊp 3 (¸o): tiªu hao 3 Kh¾c b¶n linh ho¹t cÊp 2 /#updateVanSuccap3_choose(2)")
	tinsert(tbSayDialog,"N©ng cÊp Kh¾c B¶n Hoµn Mü cÊp 3 (QuÇn): tiªu hao 3 Kh¾c b¶n linh ho¹t cÊp 2 /#updateVanSuccap3_choose(3)")
	tinsert(tbSayDialog,"N©ng cÊp Kh¾c B¶n Hoµn Mü cÊp 3 (NhÉn): tiªu hao 3 Kh¾c b¶n linh ho¹t cÊp 2 /#updateVanSuccap3_choose(4)")
	tinsert(tbSayDialog,"N©ng cÊp Kh¾c B¶n Hoµn Mü cÊp 3 (Ngäc Béi): tiªu hao 3 Kh¾c b¶n linh ho¹t cÊp 2 /#updateVanSuccap3_choose(5)")
	tinsert(tbSayDialog,"T«i chØ xem xem th«i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(TLP_NPC..msg, nSaySize, tbSayDialog);
end
function updateVanSuccap3_choose(nType)

	local tbSayDialog = {};
	local nSaySize = 0;
	local tmsg = {
				[1] = {"N©ng cÊp Kh¾c B¶n Hoµn Mü cÊp 3(§Çu): tiªu hao 1 V¨n Søc Hoµn Mü CÊp 2 (®Çu) + 3 Kh¾c b¶n linh ho¹t cÊp 2 (®Çu)"},
				[2] = {"N©ng cÊp Kh¾c B¶n Hoµn Mü cÊp 3(¸o): tiªu hao 1 V¨n Søc Hoµn Mü CÊp 2 (¸o) + 3 Kh¾c b¶n linh ho¹t cÊp 2 (¸o)"},
				[3] = {"N©ng cÊp Kh¾c B¶n Hoµn Mü cÊp 3(QuÇn): tiªu hao 1 V¨n Søc Hoµn Mü CÊp 2 (¸o) + 3 Kh¾c b¶n linh ho¹t cÊp 2 (quÇn)"},
				[4] = {"N©ng cÊp Kh¾c B¶n Hoµn Mü cÊp 3(NhÉn): tiªu hao 1 V¨n Søc Hoµn Mü CÊp 2 (¸o) + 3 Kh¾c b¶n linh ho¹t cÊp 2 (nhÉn)"},
				[5] = {"N©ng cÊp Kh¾c B¶n Hoµn Mü cÊp 3(Ngäc béi): tiªu hao 1 V¨n Søc Hoµn Mü CÊp 2 (¸o) + 3 Kh¾c b¶n linh ho¹t cÊp 2 (ngäc béi)"},
			}

	tinsert(tbSayDialog,"§ång ý ®æi Kh¾c B¶n Hoµn Mü cÊp 3/#finish_updateVanSuccap3_choose("..nType..")")
	tinsert(tbSayDialog,"T«i chØ xem xem th«i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(TLP_NPC..tmsg[nType][1], nSaySize, tbSayDialog);
end

function finish_updateVanSuccap3_choose(nType)
	local tDieuKien = { --V¨n søc cÊp 2, Kh¾c b¶n linh ho¹t cÊp 2, Kh¾c b¶n cÊp 3
				[1] = {1, {0,116,20},"V¨n Søc Hoµn Mü CÊp 2 (®Çu)", 3, {2,1,31073},"Kh¾c b¶n linh ho¹t cÊp 2", {2, 1, 31261, 1},"Kh¾c b¶n cÊp 3 ®Çu"},
				[2] = {1, {0,113,20},"V¨n Søc Hoµn Mü CÊp 2 (¸o)", 3, {2,1,31074},"Kh¾c b¶n linh ho¹t cÊp 2", {2, 1, 31262, 1},"Kh¾c b¶n cÊp 3 ¸o"},
				[3] = {1, {0,114,20},"V¨n Søc Hoµn Mü CÊp 2 (quÇn)", 3, {2,1,31075},"Kh¾c b¶n linh ho¹t cÊp 2", {2, 1, 31263, 1},"Kh¾c b¶n cÊp 3 quÇn"},
				[4] = {1, {0,115,20},"V¨n Søc Hoµn Mü CÊp 2 (nhÉn)", 3, {2,1,31076},"Kh¾c b¶n linh ho¹t cÊp 2", {2, 1, 31264, 1},"Kh¾c b¶n cÊp 3 nhÉn"},
				[5] = {1, {0,117,19},"V¨n Søc Hoµn Mü CÊp 2 (ngäc béi)", 3, {2,1,31077},"Kh¾c b¶n linh ho¹t cÊp 2", {2, 1, 31265, 1},"Kh¾c b¶n cÊp 3 ngäc béi"},
			}
	local tVansuc2 = {--0,116,16--20
				[1] = {0,116,16,"V¨n Søc Hoµn Mü CÊp 2 (®Çu)"},
				[2] = {0,113,16,"V¨n Søc Hoµn Mü CÊp 2 (¸o)"},
				[3] = {0,114,16,"V¨n Søc Hoµn Mü CÊp 2 (quÇn)"},
				[4] = {0,115,16,"V¨n Søc Hoµn Mü CÊp 2 (nhÉn)"},
				[5] = {0,117,16,"V¨n Søc Hoµn Mü CÊp 2 (ngäc béi)"},
			}		
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
--	if GetItemCount(tDieuKien[nType][2][1],tDieuKien[nType][2][2],tDieuKien[nType][2][3]) < tDieuKien[nType][1] then
--		Talk(1, "","§¹i hiÖp kh«ng mang ®ñ 1 "..tDieuKien[nType][3])
--		return 0
--	end
	local nCheckVanSuc = 0
	for i = 16, 20 do
		if GetItemCount(tVansuc2[nType][1],tVansuc2[nType][2],i) >= 1 then
			nCheckVanSuc = 1
			break
		end	
	end
	if nCheckVanSuc == 0 then
		Talk(1, "",TLP_NPC.."§¹i hiÖp kh«ng mang ®ñ 1 "..tVansuc2[nType][4])
		return 0
	end
	if GetItemCount(tDieuKien[nType][5][1],tDieuKien[nType][5][2],tDieuKien[nType][5][3]) < tDieuKien[nType][4] then
		Talk(1, "",TLP_NPC.."§¹i hiÖp kh«ng mang ®ñ 3 "..tDieuKien[nType][6])
		return 0
	end
	if nCheckVanSuc == 1 then
		for i = 16, 20 do
			if DelItem(tVansuc2[nType][1],tVansuc2[nType][2],i,1) == 1 then
				break
			end	
		end
	else
		Talk(1, "",TLP_NPC..": §¹i hiÖp kh«ng mang ®ñ 1 "..tVansuc2[nType][4])
		return 0
	end
--	if DelItem(tDieuKien[nType][2][1],tDieuKien[nType][2][2],tDieuKien[nType][2][3],tDieuKien[nType][1]) ~= 1 then
--		Talk(1,"", "Xãa kh«ng thµnh c«ng vËt phÈm 1")
--		gf_WriteLogEx("NANG CAP VAN SUC 3", "xoa", 1, "xãa vËt phÈm v¨n søc cÊp 2")
--		return 0
--	end
	if DelItem(tDieuKien[nType][5][1],tDieuKien[nType][5][2],tDieuKien[nType][5][3],tDieuKien[nType][4]) ~= 1 then
		Talk(1,"", "Xãa kh«ng thµnh c«ng vËt phÈm 2")
		return 0
	end	
	gf_AddItemEx2(tDieuKien[nType][7], tDieuKien[nType][8], "TIEN CAP VAN SUC", "Trang bÞ v¨n søc cÊp 2");
	Talk(1, "", "Chóc mõng ®¹i hiÖp ®· n©ng cÊp thµnh c«ng trang bÞ "..tDieuKien[nType][8])	
	gf_WriteLogEx("NANG CAP VAN SUC CAP 3", "nhan", 1, "N©ng cÊp thµnh c«ng")
end
function check_condition()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > 20191031 then
		Talk(1, "", "HiÖn t¹i ta ®· hÕt hµng, ®¹i hiÖp h·y quay l¹i sau nha.")
		return 0 
	end
	--check sö dông 30 N÷ Oa/ngµy
	if GetTask(2156) < 30 then	--VET_201003_01_TASK_USE_BAOHE_COUNT = 2156
    	Talk(1,"", "B¹n ®· ch­a sö dông ®ñ 30 N÷ Oa B¶o H¹p trong ngµy, h·y sö dông thªm råi ®Õn gÆp ta!")
    	return 0
    end
	--check sö dông 2 Ng«i sao/ngµy
	local nUsed = mod(GetTask(2661), 100) 				-- 2 so cuoi luu so lan su dung trong ngay TSK_LUCKY_STAR_201011 = 2661
	if nUsed < 2 then
		Talk(1,"","B¹n ®· ch­a sö dông ®ñ 2 Ng«i Sao May M¾n trong ngµy, h·y sö dông thªm råi ®Õn gÆp ta")
		return 0
	end
	return 1
end
function get_free_NguyenLieuCuongHoaVS()
	local nCheck = check_condition()
	if nCheck == 0 then
		return 0
	end
	local nCheckFree = VNG_GetTaskPos(TSK_CUONGHOA_VANSUC, 9, 9)
	if nCheckFree >= 1 then
		Talk(1,"","B¹n ®· nhËn miÔn phÝ trang bÞ c­êng hãa V¨n Søc h«m nay råi, ngµy mai h·y quay l¹i tiÕp nha.")
		return 0
	end
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"","Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return 0
	end

	gf_AddItemEx2({2,1,31096, 2}, "L­u Kim", "CUONG HOA VAN SUC BK", "NhËn free")
	gf_AddItemEx2({2,201,13, 1}, "Thiªn V¨n Th¹ch", "CUONG HOA VAN SUC BK", "NhËn free")
	Msg2Player("B¹n nhËn ®­îc 1 Thiªn V¨n Th¹ch vµ 2 L­u Kim")
	VNG_SetTaskPos(TSK_CUONGHOA_VANSUC, nCheckFree + 1, 9, 9)	
	gf_WriteLogEx("CUONG HOA VAN SUC", "nhËn free thµnh c«ng", 1, "NhËn free thµnh c«ng trang bÞ c­êng hãa v¨n søc")
end

function get_NguyenLieuCuongHoaVS()
	local nCheck = check_condition()
	if nCheck == 0 then
		return 0
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "Mua gi¸ rÎ nguyªn liÖu c­êng hãa trang bÞ V¨n Søc: L­u Kim vµ Thiªn V¨n Th¹ch (mçi dßng chän cã thÓ mua 20 lÇn/1 ngµy"
	
	tinsert(tbSayDialog,"Ta muèn mua 1 L­u Kim (tiªu hao 15 xu vËt phÈm) /#finish_get_NguyenLieuCuongHoaVS(1)")
	tinsert(tbSayDialog,"Ta muèn mua 1 L­u Kim (tiªu hao 75 vµng) /#finish_get_NguyenLieuCuongHoaVS(3)")
	tinsert(tbSayDialog,"Ta muèn mua 1 Thiªn V¨n Th¹ch (tiªu hao 5 xu vËt phÈm) /#finish_get_NguyenLieuCuongHoaVS(5)")
	tinsert(tbSayDialog,"Ta muèn mua 1 Thiªn V¨n Th¹ch (tiªu hao 25 vµng) /#finish_get_NguyenLieuCuongHoaVS(7)")
	
	tinsert(tbSayDialog,"T«i chØ xem xem th«i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(TLP_NPC..msg, nSaySize, tbSayDialog);
end
function finish_get_NguyenLieuCuongHoaVS(nType)
	local tnguyenlieu = {--xu vËt phÈm, vµng, G,D,P,....
			[1] = {15,   0, 2,1,31096,1, "L­u Kim xu"},
			[3] = {0 , 75, 2,1,31096,1, "L­u Kim vµng"},	
			[5] = {5,   0, 2,201,13,1, "Thiªn V¨n Th¹ch xu"},	
			[7] = {0 , 25, 2,201,13,1, "Thiªn V¨n Th¹ch vµng"},	
		}
	local nCheckBuy = VNG_GetTaskPos(TSK_CUONGHOA_VANSUC, nType+1, nType)
	if nCheckBuy >= 20 then
		Talk(1,"","H«m nay b¹n ®· mua 20 lÇn gi¸ rÎ lo¹i trang bÞ c­êng hãa V¨n Søc nµy råi, ngµy mai h·y quay l¹i tiÕp nha.")
		return 0
	end
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"","Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return 0
	end
	if GetItemCount(2,1,30230) < tnguyenlieu[nType][1] then
		Talk(1, "", "§¹i hiÖp kh«ng mang theo ®ñ "..tnguyenlieu[nType][1].." xu vËt phÈm.")
		return 0
	end
	if GetCash() < tnguyenlieu[nType][2]*10000 then
		Talk(1, "", "§¹i hiÖp kh«ng mang theo ®ñ "..tnguyenlieu[nType][2].." Vµng.")
		return 0
	end
	if nType == 1 or nType == 5 then
		if DelItem(2,1,30230,tnguyenlieu[nType][1]) ~= 1 then
			Talk(1, "", "X¶y ra lçi 1")
			return 0
		end
		gf_WriteLogEx("CUONG HOA VAN SUC", "mua thµnh c«ng", 1, "Mua thµnh c«ng b»ng xu")
	elseif nType == 3 or nType == 7 then
		if Pay(tnguyenlieu[nType][2]*10000) ~= 1 then
			Talk(1, "", "X¶y ra lçi 2")
			return 0
		end
		gf_WriteLogEx("CUONG HOA VAN SUC", "mua thµnh c«ng", 1, "Mua thµnh c«ng b»ng vµng")
	end
	VNG_SetTaskPos(TSK_CUONGHOA_VANSUC, nCheckBuy + 1, nType+1, nType)	
	gf_WriteLogEx("CUONG HOA VAN SUC", "mua thµnh c«ng", 1, "Mua thµnh c«ng trang bÞ c­êng hãa v¨n søc")
	Msg2Player("B¹n nhËn ®­îc 1 "..tnguyenlieu[nType][7])
	gf_AddItemEx2({tnguyenlieu[nType][3],tnguyenlieu[nType][4],tnguyenlieu[nType][5],tnguyenlieu[nType][6]}, "nguyªn liÖu", "CUONG HOA VAN SUC BK", "Mua nguyªn liÖu lo¹i "..tnguyenlieu[nType][7])
end
