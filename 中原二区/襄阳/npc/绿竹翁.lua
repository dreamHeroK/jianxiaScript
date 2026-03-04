--NPCÄ¬ÈÏ¶Ô»°½Å±¾
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")
Include("\\script\\vng\\award\\feature_award.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");

function main()
--	local tbSay = {};
--	
--	if gf_CheckEventDateEx(VET_201402_ACTIVITYID) == 1 then
--		tinsert(tbSay, VET_201402_MAIN);
--	end
--	local nDate = tonumber(date("%Y%m%d"))
--	if nDate <= 20140930 then
--		local nIsGetNV = mod(GetTask(TSK_THANGTIEN_PHUCSINH),10)
--		if nIsGetNV == 0 then
--			tinsert(tbSay, "Ta muèn nhËn nhiÖm vô TÝch Lòy Phôc Sinh/get_TichLuyPhucSinh")		
--		elseif nIsGetNV == 1 then
--			tinsert(tbSay, "Ta muèn ®æi ®iÓm tÝch lòy phôc sinh/getpoint_TLPS")		
--			tinsert(tbSay, "Ta muèn xem sè ®iÓm tÝch lòy phôc sinh/showpoint_TLPS")	
--			tinsert(tbSay, "Ta muèn th¨ng tiÕn phôc sinh (tiªu hao 90 ®iÓm tÝch lòy phôc sinh)/usepoint_TLPS")	
--		end
--	end
--	if nDate >= 20130409 and nDate <= 20130421 then
-- 		tinsert(tbSay, "TÝch lòy 01 Hoµng Kim §¹i Ng©n PhiÕu/#vng_nhiemvuthang4(1)")			
-- 		tinsert(tbSay, "TÝch lòy 10 §¹i Ng©n PhiÕu/#vng_nhiemvuthang4(2)")
-- 		tinsert(tbSay, "NhËn th­ëng hoµn thµnh ®ñ 2 nhiÖm vô tÝch lòy/vng_nhiemvuthang4_finish")
-- 		tinsert(tbSay, "T¹m thêi ta kh«ng muèn lµm/nothing")			
--	end
--	tinsert(tbSay, "Tho¸t/nothing")
--	Say("<color=green>Lôc Tróc ¤ng: <color>®­êng phè h«m nay thËt n¸o nhiÖt.",getn(tbSay),tbSay);
end

function vng_nhiemvuthang4(nType)
	local tbCheck ={
				[1] = {"Hoµng Kim §¹i Ng©n PhiÕu", 30490, 1},
				[2] = {"§¹i Ng©n PhiÕu", 199, 10},	
					}
	local nExp = 400000000
	if gf_GetTaskByte(TSK_NHIEMVUTHANG4,nType) >= 1 then
		Talk(1,"","§¹i hiÖp ®· hoµn thµnh nhiÖm vô tÝch lòy "..tbCheck[nType][1]);
		return 0;
	end		
	if GetItemCount(2,1, tbCheck[nType][2]) < tbCheck[nType][3] then
		Talk(1,"","§¹i hiÖp kh«ng mang theo ®ñ "..tbCheck[nType][3].." "..tbCheck[nType][1].." ®Ó hoµn thµnh nhiÖm vô");
		return 0
	end
	if gf_Judge_Room_Weight(5,200," ") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end	
	if GetPlayerRebornParam(0) < 1 then
		if  nExp > (2000000000 - GetExp()) then
			Talk(1,"", "C¸c h¹ kh«ng nhËn ®­îc ®iÓm kinh nghiÖm v× sÏ v­ît qu¸ 2 tû ®iÓm !!!!")
		end
	end
	if DelItem(2,1,tbCheck[nType][2],tbCheck[nType][3]) == 1 then
		gf_SetTaskByte(TSK_NHIEMVUTHANG4,nType,gf_GetTaskByte(TSK_NHIEMVUTHANG4,nType) + 1)
		ModifyExp(nExp)
		AwardGenuineQi(7000)
		gf_AddItemEx2({2,1,30390,70},"§æi th­ëng lo¹i "..tbCheck[nType][1],"NHIEM VU THANG 4 BK","NhËn thµnh c«ng m¶nh thiªn cang")
		if GetTask(701) >= 0 then
			SetTask(701,GetTask(701) + 7000)
		else
			SetTask(701,GetTask(701) - 7000)
		end		
		Msg2Player("B¹n nhËn ®­îc 7000 ®iÓm c«ng tr¹ngÝ")		
		gf_WriteLogEx("NHIEM VU THANG 4", "nhËn th­ëng thµnh c«ngi", 1, "NhËn th­ëng lo¹i "..tbCheck[nType][1])		
	end
	
end

function vng_nhiemvuthang4_finish()
	local nValue1 = gf_GetTaskByte(TSK_NHIEMVUTHANG4,1)
	local nValue2 = gf_GetTaskByte(TSK_NHIEMVUTHANG4,2)
	local nValue3 = gf_GetTaskByte(TSK_NHIEMVUTHANG4,3)
	if nValue1 < 1 or nValue2 < 1 then
		Talk(1,"", "§¹i hiÖp ch­a hoµn thµnh ®ñ 2 nhiÖm vô tÝch lòy nªn kh«ng thÓ nhËn th­ëng !!")
		return 0
	end
	if nValue3 >= 1 then
		Talk(1,"", "§¹i hiÖp ®· nhËn th­ëng hoµn thµnh ®ñ 2 nhiÖm vô tÝch lòy råi !!")
		return 0
	end
	if gf_Judge_Room_Weight(17,200," ") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end	
	gf_SetTaskByte(TSK_NHIEMVUTHANG4,3,gf_GetTaskByte(TSK_NHIEMVUTHANG4,3) + 1)	
	gf_AddItemEx2({2,1,9977,7},"Hoµn thµnh 2 nv tÝch lòy","NHIEM VU THANG 4 BK","NhËn thµnh c«ng 7 Huy Hoµng", 15 * 24 * 3600)
	gf_AddItemEx2({2,1,9998,7},"Hoµn thµnh 2 nv tÝch lòy","NHIEM VU THANG 4 BK","NhËn thµnh c«ng 7 C«ng §¹i", 15 * 24 * 3600)
	gf_AddItemEx2({2,1,30345,1,1},"Hoµn thµnh 2 nv tÝch lòy","NHIEM VU THANG 4 BK","NhËn thµnh c«ng 1 ChuyÓn Sinh §¬n", 60 * 24 * 3600)	
	gf_WriteLogEx("NHIEM VU THANG 4", "nhËn th­ëng thµnh c«ngi", 1, "NhËn th­ëng hoµn thµnh 2 lÇn tÝch lòy")				
end

function get_TichLuyPhucSinh()
	local nRoute = GetPlayerRoute()
	local tRoute = {[2]=1,[3]=1,[4]=1,[6]=1,[8]=1,[9]=1,[11]=1,[12]=1,[14]=1,[15]=1,[17]=1,[18]=1,[20]=1,[21]=1,[23]=1,[29]=1,[30]=1}
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	if tRoute[nRoute] ~= 1 then	
		Talk(1, "", "<color=green>Lôc Tróc ¤ng: <color>Ch­a gia nhËp hÖ ph¸i, kh«ng thÓ tham gia ho¹t ®éng nµy.");
		return 0
	end	
	if nChuyenSinh < 599 then -- b¾t chuyÓn sinh 7
		Talk(1,"","<color=green>Lôc Tróc ¤ng: <color>Kinh nghiÖm chuyÓn sinh cña ®¹i hiÖp kh«ng ®ñ, ta kh«ng thÓ gióp g× ®­îc c¶ !!!!")
		return 0	
	end	
	if nChuyenSinh >= 600 then -- b¾t chuyÓn sinh 7
		Talk(1,"","<color=green>Lôc Tróc ¤ng: <color>Kinh nghiÖm chuyÓn sinh cña ®¹i hiÖp qu¸ cao, ta kh«ng thÓ gióp g× ®­îc c¶ !!!!")
		return 0	
	end

	SetTask(TSK_THANGTIEN_PHUCSINH,1)
	gf_WriteLogEx("THANG TIEN PHUC SINH", "nhËn nv", 1, "NhËn nhiÖm vô TTPS")	
	Talk(1, "", "<color=green>Lôc Tróc ¤ng: <color>Chóc mõng b¹n ®· nhËn nhiÖm vô Th¨ng TiÕn Phôc Sinh thµnh c«ng")
end

function getpoint_TLPS()
	if TTPS_GetStatus() ~= 1 then
		Talk(1, "", "§¹i hiÖp ch­a nhËn nhiÖm vô.");
		return 0
	end
	local nThaiHu = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,6,6)
	local nThoNuong = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,7,7)
	local nTongLieu = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,8,8)
	local nTodayPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,5,4)
	local nCurrentPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,3,2)
	local nMaxAllow = 90
	if nThaiHu < 1 then
		Talk(1, "", "<color=green>Lôc Tróc ¤ng: <color>H«m nay b¹n ch­a hoµn thµnh 1 lÇn Th¸i H­ (thu phÝ) nªn kh«ng thÓ ®æi ®iÓm tÝch lòy. H·y mau ®i hoµn thµnh nhiÖm vô Th¸i H­ !!!!")
		return 0
	end
	if nThoNuong < 1 then
		Talk(1, "", "<color=green>Lôc Tróc ¤ng: <color>H«m nay b¹n ch­a hoµn thµnh nhiÖm vô Thá N­íng nªn kh«ng thÓ ®æi ®iÓm tÝch lòy. H·y mau ®i hoµn thµnh nhiÖm vô Thá N­íng !!!!")
		return 0
	end	
	if nTongLieu < 1 then
		Talk(1, "", "<color=green>Lôc Tróc ¤ng: <color>H«m nay b¹n ch­a hoµn thµnh 1 nhiÖm vô Tèng Liªu nªn kh«ng thÓ ®æi ®iÓm tÝch lòy. H·y mau ®i hoµn thµnh 1 nhiÖm vô Tèng Liªu !!!!")
		return 0
	end		
--	if nTodayPoint >= 10 then
--		Talk(1, "", "<color=green>Lôc Tróc ¤ng: <color>H«m nay b¹n ®· ®æi ®ñ 10 ®iÓm tÝch lòy råi, ngµy mai h·y quay l¹i nha !!!!")
--		return 0
--	end	
	if nCurrentPoint >= nMaxAllow then
		Talk(1,"","<color=green>Lôc Tróc ¤ng: <color>B¹n ®· ®æi ®ñ 90 ®iÓm råi, h·y thùc hiÖn Th¨ng TiÕn Phôc Sinh ®i !!!!")
		return 0
	end	
	local tbSay = {}
	tinsert(tbSay, "§æi 1 ®iÓm tÝch lòy (tiªu hao 100 triÖu kinh nghiÖm + 10 xu vËt phÈm + 10 vµng/#takePoint(1)")			
	tinsert(tbSay, "§æi 5 ®iÓm tÝch lòy (tiªu hao 500 triÖu kinh nghiÖm + 50 xu vËt phÈm + 50 vµng/#takePoint(5)")			
	tinsert(tbSay, "§æi 10 ®iÓm tÝch lòy (tiªu hao 1 tû kinh nghiÖm + 100 xu vËt phÈm + 100 vµng/#takePoint(10)")					
	tinsert(tbSay, "T¹m thêi ta kh«ng muèn lµm/nothing")			
	
	Say("<color=green>Lôc Tróc ¤ng: <color>Ta cã thÓ gióp ®¹i hiÖp ®æi ®iÓm tÝch lòy Th¨ng TiÕn Phôc Sinh",getn(tbSay),tbSay);	
end

function takePoint(nType)
	if TTPS_GetStatus() ~= 1 then
		Talk(1, "", "§¹i hiÖp ch­a nhËn nhiÖm vô.");
		return 0
	end
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		return 0
	end
	local nCurrentPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,3,2)
	local nTodayPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,5,4)
	local nMaxToday = 10
	local nMaxAllow = 90
	local tbMaterial = {
		[1] = {item={{gdp={2,1,30230,10}}},nExp = 100000000, nGold = 100000},
		[5] = {item={{gdp={2,1,30230,50}}},nExp = 500000000, nGold = 500000},
		[10] = {item={{gdp={2,1,30230,100}}},nExp = 1000000000, nGold = 1000000},
	}
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nType])
	if nCheck == 0 then
		return 0
	end	
	local nCheck_reset = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,9,9)
--	if nCheck_reset == 1 then
--		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 0, 5, 4) -- Reset doi diem moi ngay
--		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 0, 9, 9)
--	end	
	if nCurrentPoint >= nMaxAllow then
		Talk(1,"","<color=green>Lôc Tróc ¤ng: <color>B¹n ®· ®æi ®ñ 90 ®iÓm råi, h·y thùc hiÖn Th¨ng TiÕn Phôc Sinh ®i !!!!")
		return 0
	end	
--	if (nTodayPoint + nType) > nMaxToday then
--		Talk(1,"","<color=green>Lôc Tróc ¤ng: <color>Møc ®iÓm ®æi trong ngµy v­ît qu¸ giíi h¹n "..nMaxToday..", c¸c h¹ h·y chän møc ®æi kh¸c.")
--		return 0
--	end

	LIB_Award:PayMaterial(tbMaterial[nType])
	nCurrentPoint = nCurrentPoint + nType
	nTodayPoint = nTodayPoint + nType
	VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,nCurrentPoint,3,2)
	VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,nTodayPoint,5,4)
	Talk(1, "", "<color=green>Lôc Tróc ¤ng: <color> Chóc mõng ®¹i hiÖp ®æi thµnh c«ng "..nType.." ®iÓm tÝch lòy")
	gf_WriteLogEx("THANG TIEN PHUC SINH", "®æi ®iÓm", 1, nType.." ®iÓm tÝch cùc")							
end

function showpoint_TLPS()
	if TTPS_GetStatus() ~= 1 then
		Talk(1, "", "<color=green>Lôc Tróc ¤ng: <color>§¹i hiÖp ch­a nhËn nhiÖm vô.");
		return 0
	end
	local nPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,3,2)
	local nTodayPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,5,4)
	local zString = "<color=green>Lôc Tróc ¤ng: <color>\n"
	zString = zString.."Tæng ®iÓm tÝch lòy hiÖn t¹i cña b¹n lµ: <color=yellow>"..nPoint.." ®iÓm<color>\n"
	zString =	zString.."§iÓm ®æi trong ngµy lµ: <color=yellow>"..nTodayPoint.." ®iÓm<color>"
				
	Talk(1, "", zString)
end

function usepoint_TLPS()
	if TTPS_GetStatus() ~= 1 then
		Talk(1, "", "<color=green>Lôc Tróc ¤ng: <color>§¹i hiÖp ch­a nhËn nhiÖm vô.");
		return 0
	end
	local nCheckRule = check_rule()
	if nCheckRule == 0 then
		return 0
	end
	local tHeader = "<color=green>Lôc Tróc ¤ng: <color>§¹i hiÖp qu¶ lµ mét kú nh©n trong Vâ L©m, b¾t ®Çu lÜnh ngé bÝ kÝp <color=yellow>Tø Linh Phôc Sinh<color> ®Ó ®ét ph¸ b×nh c¶nh. LÜnh ngé thµnh c«ng cã thÓ kich thÝch tiÒm lùc cña b¶n th©n ®¹t c¶nh giíi míi trong §¶ Th«ng Kinh M¹ch. !!!"
	local tSay = {}	
	tinsert(tSay, "Phôc sinh theo h­íng Long Tö/#cs6_ttps_finish_confrim(1)")			
	tinsert(tSay, "Phôc sinh theo h­íng Hæ Tö/#cs6_ttps_finish_confrim(2)")			
	tinsert(tSay, "Phôc sinh theo h­íng Phông Tö/#cs6_ttps_finish_confrim(4)")			
	tinsert(tSay, "Phôc sinh theo h­íng ¦ng Tö/#cs6_ttps_finish_confrim(3)")		
	tinsert(tSay, "Ta ch­a muèn Phôc Sinh/nothing")		
	Say(tHeader, getn(tSay), tSay)	
end

function cs6_ttps_finish_confrim(nType)
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	local nRoute = GetPlayerRoute()
	local tbType = {"Long Tö", "Hæ Tö", "¦ng Tö", "Phông Tö"}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end	
	if nChuyenSinh < 599 then -- b¾t chuyÓn sinh 7
		Talk(1,"","<color=green>Lôc Tróc ¤ng: <color>Kinh nghiÖm chuyÓn sinh cña ®¹i hiÖp kh«ng ®ñ, ta kh«ng thÓ gióp g× ®­îc c¶ !!!!")
		return 0	
	end	
	if nChuyenSinh >= 600 then -- b¾t chuyÓn sinh 7
		Talk(1,"","<color=green>Lôc Tróc ¤ng: <color>Kinh nghiÖm chuyÓn sinh cña ®¹i hiÖp qu¸ cao, ta kh«ng thÓ gióp g× ®­îc c¶ !!!!")
		return 0	
	end
	--- b¾t ®iÒu kiÖn ë ®©y
	local nCheckRule = check_rule()
	if nCheckRule == 0 then
		return 0
	end
	if MeridianGetLevel() < 2 then	
		Talk(1,"","Kinh m¹ch cña ®¹i hiÖp ch­a ®¹t cÊp ®é Vâ T­íng !!!!")
		return 0			
	end
	DelItem(2,0,1083,2)
	DelItem(2,1,30345,2)

	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs5 = GetTranslifeFaction()	
	local nTransCount = GetTranslifeCount()	
		for i=1, getn(tb_translife_cloth[nType_cs5][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType_cs5][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 30000 + GetBody()
			Pnew1 = 561 + GetBody()			
			Pnew2 = 565 + GetBody()		
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			BigDelItem(G,D,Pnew1,BigGetItemCount(G,D,Pnew1))			
			BigDelItem(G,D,Pnew2,BigGetItemCount(G,D,Pnew2))					
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Tø Linh ViÖt Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end

	RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	

	local tbVanSu = {"V¨n Sö ngo¹i trang",0,108,570,188}
	local nPVanSu = tbVanSu[4]  + GetBody() - 1
	for i = 0, 2 do
		BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
	end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(1,nType) -- ChuyÓn Sinh 6 thµnh c«ng		
	SetLevel(10,0)
	AddTitle(61,05)
--	SetTask(TSK_CS6_TULINH,5)		--hoµn thµnh nhÖm vô chuyÓn sinh
	VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 2, 1, 1)
 	gf_WriteLogEx("THANG TIEN PHUC SINH", "chuyÓn sinh thµnh c«ng", 1, "Finish nv Th¨ng TiÕn Phôc Sinh")	
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())
	Msg2Player("Chóc mõng ®¹i hiÖp ®· Phôc Sinh thµnh c«ng theo h­íng "..tbType[nType])
	Say("Chóc mõng ®¹i hiÖp ®· lÜnh ngé thµnh c«ng bÝ kÝp gia truyÒn Tø Linh Phôc Tinh! H·y ®¨ng nhËp l¹i.",1,"Tho¸t!/go_exit")
end

function check_rule()
	local nPoint = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,3,2)
	if nPoint < 90 then
		Talk(1, "", "<color=green>Lôc Tróc ¤ng: <color>§¹i hiÖp tÝch ch­a lòy ®ñ 90 ®iÓm Th¨ng TiÕn Phôc Sinh.");
		return 0
	end
	if GetItemCount(2,1,30345) < 2 then
		Talk(1, "", "<color=green>Lôc Tróc ¤ng: <color>§¹i hiÖp kh«ng mang ®ñ 2 ChuyÓn Sinh §¬n.");
		return 0
	end
	if GetItemCount(2,0,1083) < 2 then
		Talk(1, "", "<color=green>Lôc Tróc ¤ng: <color>§¹i hiÖp kh«ng mang ®ñ 2 Th¸i DÞch Hçn Nguyªn C«ng Phæ.");
		return 0
	end
	return 1
end


function nothing()

end
