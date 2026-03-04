--Code by PhucNG,TrungBT2
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\lib\\vnglib_award.lua") 

PROMOTION_EVERYDAY = "KHUYEN MAI MOI NGAY"
SALEOFF_START_DATE = 20151116
SALEOFF_END_DATE = 20151130
SALEOFF_START_TIME = 1900
SALEOFF_END_TIME = 2100
szNpcName = "<color=green>Tô B¶o Th­¬ng Nh©n: <color>"

tbItemSaleOff = {
	{"Hßa ThÞ BÝch",2,1,1001,1,{2,1,1001,1}, 30*24*60*60},	
	{"Tói Thiªn Th¹ch Tinh Th¹ch",2,1,3356,1,{2,1,3356,1}, 30*24*60*60},
	{"Bao Thiªn Th¹ch Tinh Th¹ch",2,1,1051,1,{2,1,1051,1}, 30*24*60*60},
	{"C­êng Hãa QuyÓn 12",2,1,30424,1,{2,1,30424,1}, 30*24*60*60},
	{"C­êng Hãa QuyÓn 13",2,1,30425,1,{2,1,30425,1}, 30*24*60*60},
	{"C­êng Hãa QuyÓn 14",2,1,30426,1,{2,1,30426,1}, 30*24*60*60},
--	{"C­êng Hãa QuyÓn 15",2,1,30427,1,{2,1,30427,1}, 30*24*60*60},
}

--tbThuCuoi = {
--		[1] = {"§éc Gi¸c Thó B¶o B¶o", 0,105,30032},
--		[2] = {"Kim Kú L©n B¶o B¶o", 0,105,30017},
--		[3] = {"Kim Mao Ng­u B¶o B¶o", 0,105,30022},
--		[4] = {"B¸o Vµng B¶o B¶o", 0,105,30030},
--}

function main()
	local nSaySize = 0;
	local szSayHead = "<color=green>Chñ TiÒn Trang: <color>Ta cã rÊt nhiÒu b¶o vËt quÝ hiÕm, ®¹i hiÖp cÇn t×m g×?"
	local tbSay = {}
	local nDate = tonumber(date("%Y%m%d"))
	
	if nDate >= 20180421 and nDate <= 20180430 then
		szSayHead = "<color=green>Chñ TiÒn Trang: <color>Ta cã thÓ gióp ®¹i hiÖp cã ®­îc ngo¹i trang <color=yellow>BØ Dùc Song Phi (vÜnh viÔn)<color> cÇn: 1 BØ Dùc Song Phi, 10 Thiªn Cang LÖnh, 10 Thiªn M«n Kim LÖnh"
		tinsert(tbSay,"Ta muèn ®æi BØ Dùc Song Phi vÜnh viÔn/Change_SongPhiYen")
	end
	if nDate >= 20151116 and nDate <= 20151130 then
		tinsert(tbSay,"Nguyªn LiÖu Event/menu_get_nguyenlieu11")
	end
	if nDate >= SALEOFF_START_DATE and nDate <= SALEOFF_END_DATE then
--		for i=1, getn(tbThuCuoi) do
--			tinsert(tbSay, "Mua "..tbThuCuoi[i][1].." gi¸ rÎ (999 vµng)/#MuaThuCuoi("..i..")")
--		end
		tinsert(tbSay,"Kinh Th­ Trao Tay/menu_get_KinhThu")		
	end
	tinsert(tbSay,"Ta chØ ghÐ xem/gf_Nothing")
	Say(szSayHead, getn(tbSay), tbSay)
	--:::::::::::::::::: Sieu Khuyen Mai :::::::::::::::::::::::::::
--	local nDate = tonumber(date("%Y%m%d"))
--	local nTime = tonumber(date("%H%M"))
--	if nDate >= SALEOFF_START_DATE and nDate <=SALEOFF_END_DATE then
--		if nTime >= SALEOFF_START_TIME and nTime < SALEOFF_END_TIME then
--			tbSayDialog = SaleOff_CreateMenu()
--		else
--			Talk(1,"",szNpcName.."Cöa tiÖm cña ta chØ më cöa tõ 19:00 ®Õn 21:00, c¸c h¹ h·y tranh thñ ®Õn vµo ®óng thêi ®iÓm.!")
--			return 0
--		end
--	end
--	gf_PageSay(tbSayDialog, 1, 6)
	--------------------------------------------------------------
end
function menu_get_nguyenlieu11()
	local nSaySize = 0;
	local szSayHead = "<color=green>Chñ TiÒn Trang: <color> Nguyªn LiÖu Event ah, ta cã vµi c¸i, ng­¬i cã muèn mua kh«ng?"
	local tbSay = {}	
	tinsert(tbSay,"Ta muèn mua 1000 Tói Quµ (tiªu hao 23 Tiªu Dao Ngäc)/#get_nguyenlieu11(1)")
	tinsert(tbSay,"Ta muèn mua 1000 GiÊy B¹c (tiªu hao 23 Tiªu Dao Ngäc)/#get_nguyenlieu11(2)")
	tinsert(tbSay,"Ta muèn mua 1000 ThiÖp T«n S­ (tiªu hao 31 Tiªu Dao Ngäc)/#get_nguyenlieu11(3)")
	tinsert(tbSay,"Ta chØ ghÐ xem/gf_Nothing")
	Say(szSayHead, getn(tbSay), tbSay)
end
function menu_get_KinhThu()
	local nSaySize = 0;
	local szSayHead = "<color=green>Chñ TiÒn Trang: <color>Kinh Th­ ta cã rÊt nhiÒu, ng­¬i cã muèn nhËn kh«ng?"
	local tbSay = {}
	tinsert(tbSay,"Ta muèn nhËn 111 V« Tù Kinh Th­/#get_KinhThu(1)")
	tinsert(tbSay,"Ta muèn nhËn 222 V« Tù Kinh Th­/#get_KinhThu(2)")
	tinsert(tbSay,"Ta muèn nhËn 333 V« Tù Kinh Th­/#get_KinhThu(3)")
	tinsert(tbSay,"Ta chØ ghÐ xem/gf_Nothing")
	Say(szSayHead, getn(tbSay), tbSay)
end
function gf_Nothing()

end
function MuaThuCuoi(nOption)
	if gf_JudgeRoomWeight(1,200) == 0 then
		Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ!");
		return 0
	end
	if GetCash() < 9990000 then
		Talk(1,"",szNpcName.."ThuËn mua võa b¸n, <color=yellow>999<color> vµng cña ng­¬i ®©u? §ñ tiÒn ta míi giao hµng nhÐ!!");
		return 0
	end
	if Pay(9990000) == 1 then
		local tbAward = {item={{gdp={tbThuCuoi[nOption][2],tbThuCuoi[nOption][3],tbThuCuoi[nOption][4],1,1,-1,-1,-1,-1,-1,-1,-1}, name= tbThuCuoi[nOption][1], nExpired = 7*24*60*60}}}
		LIB_Award.szLogTitle = "BAN THU CUOI GIA RE"
		LIB_Award.szLogAction = "mua"
		LIB_Award:Award(tbAward)
	end
end

--****************************************************************
--			Siªu khuyÕn m·i - BEGIN
--****************************************************************
function SaleOff_CreateMenu()
	local tSay = {}
	local szFileName = date("%Y%m%d") .. ".txt"
--	local nQuay =  5 - GetTask(TSK_QUAYSOMAYMAN)
	LIB_txtData:Init(szFileName)
	local nRet = LIB_txtData:LoadMultiColumn();
		if nRet > 0 then
			tSay[0] =  szNpcName.."Ta míi ®em vÒ l« hµng gi¸ ®Æc biÖt, mêi vâ l©m hµo kiÖt ®Õn xem thö!!!"
			--tinsert(tSay,"Ta muèn quay sè may m¾n mõng n¨m míi(Cßn l¹i "..nQuay.." lÇn quay - Tiªu hao 20 tiªu dao ngäc)/QuaySoMayMan")
			for i = 1, getn(LIB_txtData.tbTextData) do
				local szItem = tbItemSaleOff[i][1]
				local nQty = tonumber(LIB_txtData.tbTextData[i][1])
				local nPrize = tonumber(LIB_txtData.tbTextData[i][2])
				local szExpired = ""
				if tonumber(LIB_txtData.tbTextData[i][3]) > 0 then
					szExpired = ", h¹n sö dông ".. LIB_txtData.tbTextData[i][3] .. "ngµy"
				end
				if i >= 1 and i <= 3 then
					tinsert(tSay ,szItem..": Gi¸ " .. nPrize  .. " Bao Tiªu dao ngäc" .. szExpired .." (cßn l¹i: " .. nQty ..")/#MuaSieuKhuyenMai("..i..")")
				else
					tinsert(tSay ,szItem..": Gi¸ " .. nPrize  .. " Tói Tiªu dao ngäc" .. szExpired .." (cßn l¹i: " .. nQty ..")/#MuaSieuKhuyenMai("..i..")")
				end
			end
		else
			tSay[0] =  szNpcName.."Hµng hãa h«m nay kh«ng cã, khi kh¸c c¸c h¹ ®Õn nhÐ!!!"
		end	
	return tSay
end
--
--
function MuaSieuKhuyenMai(nOption)
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return 0
	end
	local nTime = GetTime()
	if nTime < (GetGlbValue(GLB_TASK_PROMOTION) + 5) then
		local nTimeRemain = (GetGlbValue(GLB_TASK_PROMOTION) + 5) - GetTime()
		Talk(1,"","NhiÒu ng­êi mua qu¸, cho ta nghØ mÖt mét tÝ. H·y quay l¹i sau "..nTimeRemain.." gi©y n÷a !!!")
		return 0
	end
	
	local szFileName = date("%Y%m%d") .. ".txt"
	LIB_txtData:Init(szFileName)
	local nRet = LIB_txtData:LoadMultiColumn();
	if nRet == 0 then
		return 0
	end
	local nQty = tonumber(LIB_txtData.tbTextData[nOption][1])
	if nQty <= 0 then
		Talk(1,"",szNpcName.."<color=yellow>"..tbItemSaleOff[nOption][1].." ®· hÕt, hay lµ c¸c h¹ h·y chän mãn kh¸c nhÐ!.")
		return 0
	end
	if nOption <= 3 then
		if GetItemCount(2,1,30605) <  tonumber(LIB_txtData.tbTextData[nOption][2]) then
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng ®ñ bao tiªu dao ngäc ®Ó mua mãn nµy, hay chän mãn kh¸c rÎ h¬n?.")
			return 0
		end
	else
		if GetItemCount(2,1,30604) <  tonumber(LIB_txtData.tbTextData[nOption][2]) then
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng ®ñ tói tiªu dao ngäc ®Ó mua mãn nµy, hay chän mãn kh¸c rÎ h¬n?.")
			return 0
		end
	end
	LIB_txtData.tbTextData[nOption][1] = nQty - 1
	LIB_txtData:SaveMultiColumn()
	
	LIB_Award.szLogTitle = "SIEU KHUYEN MAI THANG 10/2015"
	LIB_Award.szLogAction = "mua"
	local nHSD = tonumber(LIB_txtData.tbTextData[nOption][3]) * 24*60*60
	local tbAward = {
			item={gdp={tbItemSaleOff[nOption][2],tbItemSaleOff[nOption][3],tbItemSaleOff[nOption][4],1}, name = tbItemSaleOff[nOption][1], nExpired = nHSD}
	}
	if nOption <= 3 then
		if DelItem(2,1,30605,tonumber(LIB_txtData.tbTextData[nOption][2])) ~= 1 then
			return 0
		end
	else
		if DelItem(2,1,30604,tonumber(LIB_txtData.tbTextData[nOption][2])) ~= 1 then
			return 0
		end
	end
	LIB_txtData.tbTextData[nOption][1] = nQty - 1
	LIB_txtData:SaveMultiColumn()
	--LIB_Award:Award(tbAward)
	SetGlbValue(GLB_TASK_PROMOTION, GetTime())
	--Talk(1,"","Thanh cong - " ..nHSD)
	gf_AddItemEx2(tbItemSaleOff[nOption][6], tbItemSaleOff[nOption][1], PROMOTION_EVERYDAY, "mua "..tbItemSaleOff[nOption][1], tbItemSaleOff[nOption][7])
end

function QuaySoMayMan()
	local tbRate =
	{
		[1] = {1398,"Thiªn Kiªu LÖnh"},
		[2] = {100,"Bao Thiªn Kiªu LÖnh Nhá"},
		[3] = {1000,"Thiªn Th¹ch Tinh Th¹ch"},
		[4] = {1,"Tiªn Du KiÕm"},
		[5] = {1,"B¸o ®en B¶o B¶o"},
		[6] = {1500,"Minh NguyÖt D¹"},
		[7] = {1500,"B¸nh Bét Vµng"},
		[8] = {1000,"Bµn Long BÝch"},
		[9] = {1500,"10.000.000 kinh nghiÖm"},
		[10] = {2000,"5.000.000 kinh nghiÖm"},
	}		
	
	local nQuay =  5 - GetTask(TSK_QUAYSOMAYMAN)
	if nQuay <= 0 then
		Talk(1,"",szNpcName.."L­ît quay h«m nay ®· hÕt. Xin quay l¹i ngµy h«m sau!")
		return 0 
	end
	
	if gf_CheckLevel(5,90) ~= 1 then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng ®¹t chuyÓn sinh 5 cÊp 90, kh«ng thÓ quay sè may m¾n!")
		return 0
	end
	
	if gf_Judge_Room_Weight(2,100) ~= 1 then
		Talk(1,"",szNpcName.."Hµnh trang c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return 0
	end
	
	if GetItemCount(2,1,30603) < 20 then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng ®em ®ñ 20 Tiªu dao ngäc trong ng­êi!")
		return 0
	end
	
	SetTask(TSK_QUAYSOMAYMAN,GetTask(TSK_QUAYSOMAYMAN) + 1)
	DelItem(2,1,30603,20)
	
	local nIdRate = get_random_event_item(tbRate,10000)
	local szFileName = "quayso"..date("%Y%m%d") .. ".txt"
	LIB_txtData:Init(szFileName)
	LIB_txtData:LoadMultiColumn()
	
	local nNum = tonumber(LIB_txtData.tbTextData[nIdRate][2])
	if nNum <= 0 then
		--Talk(1,"",szNpcName.."C¸c h¹ ®· tróng th­ëng "..tbRate[nIdRate][2].. " xin chóc mõng. Xui thay,phÇn th­ëng lo¹i nµy ®· hÕt, xin h·y kiªn tr× quay l¹i lÇn n÷a!")
		--return 0
		nIdRate = 9
	end		
	
	if nIdRate == 1 then
		gf_AddItemEx2({2,97,236 , 1}, "Thiªn Kiªu LÖnh", "Quay So May Man 2015", "Nhan",0,1)
	end
	
	if nIdRate == 2 then
		gf_AddItemEx2({2,95,2086 , 1}, "Bao Thiªn Kiªu LÖnh Nhá", "Quay So May Man 2015", "Nhan",0,1)
	end
	
	if nIdRate == 3 then
		gf_AddItemEx2({2,1,1009 , 1}, "Thiªn Th¹ch Tinh Th¹ch", "Quay So May Man 2015", "Nhan",3600 * 24 * 7,1)
	end
	
	if nIdRate == 4 then
		gf_AddItemEx2({0,105,10110 , 1,4,-1,-1,-1,-1,-1,-1,-1,0}, "Tiªn Du KiÕm", "Quay So May Man 2015", "Nhan",0,1)
	end
	
	if nIdRate == 5 then
		gf_AddItemEx2({0,105,30029 , 1,4,-1,-1,-1,-1,-1,-1,-1,0}, "B¸o §en B¶o B¶o", "Quay So May Man 2015", "Nhan",0,1)
	end
	
	if nIdRate == 6 then
		gf_AddItemEx2({1,1,17 , 10}, "Minh NguyÖt D¹", "Quay So May Man 2015", "Nhan",0,1)
	end
	
	if nIdRate == 7 then
		gf_AddItemEx2({1,1,15 , 10}, "B¸nh Bét Vµng", "Quay So May Man 2015", "Nhan",0,1)
	end
	
	if nIdRate == 8 then
		gf_AddItemEx2({2,1,1000 , 1}, "Bµn Long BÝch", "Quay So May Man 2015", "Nhan",3600*24*7,1)
	end
	
	if nIdRate == 9 then
		gf_Modify("Exp",10000000)
		gf_WriteLogEx("Quay So May Man 2015", "nhËn thµnh c«ng", 1, "10000000 Kinh Nghiem")
	end
	
	if nIdRate == 10 then
		gf_Modify("Exp",5000000)
		gf_WriteLogEx("Quay So May Man 2015", "nhËn thµnh c«ng", 1, "5000000 Kinh Nghiem")
	end	
	
	AddGlobalNews("Sù kiÖn quay sè may m¾n: C¸c h¹ "..GetName().." ®· tróng th­ëng "..tbRate[nIdRate][2])
	LIB_txtData.tbTextData[nIdRate][2] = tonumber(LIB_txtData.tbTextData[nIdRate][2]) - 1
	LIB_txtData:SaveMultiColumn()
	SetGlbValue(GLB_TASK_PROMOTION, GetTime())
end

function get_random_event_item(nTab, nDeterminator)
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTab) do
		nBase = nBase + nTab[i][1]
		if nRandom <= nBase then
			return i
		end
	end
	return getn(nTab)
end




--****************************************************************
--			Siªu khuyÕn m·i - END
--****************************************************************
--function get_selloff()
--	local nTime = tonumber(date("%H%M"))
--	if nTime < 0800 or nTime > 2400 then
--		Talk(1,"","HiÖn t¹i ch­a ®Õn giê b¸n, ®¹i hiÖp h·y quay l¹i sau nha !!!")		
--		return
--	end
--	local tbSayDialog = {};
--	tinsert(tbSayDialog, "§ång ý /confirm_buy")
--	tinsert(tbSayDialog, "Ta chØ ghÐ ngang /do_nothing")	
--	Say("Ch­¬ng tr×nh khuyÕn m·i gi¸ rÎ", getn(tbSayDialog), tbSayDialog);
--end
--function get_infor()
--	proday:load()
--	local nNumremain = 0
--	local nDate = tonumber(date("%Y%m%d"))
--	if nDate ~= proday.tList["baothienthach"][2] then
--		nNumremain = 500
--	else
--		nNumremain = proday.tList["baothienthach"][1]
--	end
--	Talk(1,"","Sè l­îng cßn cã thÓ mua trong ngµy hiÖn t¹i lµ: "..nNumremain.." c¸i")	
--end
--
--function confirm_buy()
--	proday:load()
--	---------------------------------
--	local nDate = tonumber(date("%Y%m%d"))
--	local nTime = GetTime()
--	print(proday.tList["baothienthach"][2])
--	if nDate ~= proday.tList["baothienthach"][2] then
--		proday.tList["baothienthach"][1] = 500
--	end
--	
--	if nTime < (GetGlbValue(GLB_TASK_PROMOTION) + 6) then
--		local nTimeRemain = (GetGlbValue(GLB_TASK_PROMOTION) + 6) - GetTime()
--		Talk(1,"","NhiÒu ng­êi mua qu¸, cho ta nghØ mÖt mét tÝ. H·y quay l¹i sau "..nTimeRemain.." gi©y n÷a !!!")
--		return
--	end
--	---------------------------------
--	if proday.tList["baothienthach"][1] <= 0 then
--		Talk(1,"","ThËt ®¸ng tiÕc! §· hÕt hµng gi¶m gi¸ råi. Ngµy mai ®¹i hiÖp nhí ghÐ sím nhÐ  !!!")
--		return
--	end
--	if IsPlayerDeath() ~= 0 then 
--		Talk(1, "", "HiÖn t¹i kh«ng thÓ mua !!!")
--		return
--	end
--	if gf_Judge_Room_Weight(2, 100," ") ~= 1 then
--        	return
--    end
--	if GetItemCount(2,1,30230) < 500 then
--		Talk(1,"","HiÖn kh«ng cã ®ñ Xu, ®¹i hiÖp vui lßng quay l¹i vµo lóc kh¸c!")
--		return
--	end
--
--	SetGlbValue(GLB_TASK_PROMOTION, GetTime())
--	gf_WriteLogEx("THAM GIA KHUYEN MAI", "mua thµnh c«ng")
--	proday:register()
--	if DelItem(2, 1, 30230, 500) == 1  then
----		gf_WriteLogEx("THAM GIA KHUYEN MAI", "mua thµnh c«ng")
--		gf_AddItemEx2({2, 1, 1001, 1}, "Hoa Thi Bich", PROMOTION_EVERYDAY, "mua Hßa ThÞ BÝch", 7*24*60*60)
--		Talk(1,"","C¸c h¹ ®· mua thµnh c«ng 1 Hßa ThÞ BÝch")
--		Msg2Player("C¸c h¹ ®· mua thµnh c«ng 1 Hßa ThÞ BÝch")
--	--	AddGlobalNews("Chóc mõng ®¹i hiÖp <color=yellow>"..GetName().."<color> ®· mua thµnh c«ng 1 Bao Thiªn Th¹ch Tinh Th¹ch víi gi¸ rÎ.")
--	end
--end
--
--function do_nothing()
--
--end
function get_lucky_2thang9()
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	local nQuay = VNG_GetTaskPos(TSK_MATTICH_TIEUDAO, 7,6)	
--	if nChuyenSinh < 590 then 
--		Talk(1,"","<color=green>Chñ TiÒn Trang: <color>§¹i hiÖp ch­a ®¹t chuyÓn sinh 5 cÊp 90, ta kh«ng thÓ gióp g× ®­îc c¶ !!!!")
--		return 0	
--	end
	if gf_Judge_Room_Weight(4,100) ~= 1 then
		Talk(1,"","<color=green>Chñ TiÒn Trang: <color>Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
        	return 0
	end
	if nQuay >= 15 then
		Talk(1,"","<color=green>Chñ TiÒn Trang: <color>H«m nay ®¹i hiÖp ®· thö hÕt lÇn quay may m¾n.")
        	return 0
	end
	if GetItemCount(2,1,30603) < 27 then
		Talk(1,"","<color=green>Chñ TiÒn Trang: <color>§¹i hiÖp kh«ng mang ®ñ 27 tiªu dao ngäc.")
        	return 0
	end
	if DelItem(2,1,30603,27) ~= 1 then
		gf_WriteLogEx("EVENT 2 THANG 9 NAM 2015 bk", "kh«ng thµnh c«ng", 1, "quay kh«ng thµnh c«ng")
		return 0
	end
	--SetTask(TSK_EVENT_NIEMVUI, GetTask(TSK_EVENT_NIEMVUI)+1)
	VNG_SetTaskPos(TSK_MATTICH_TIEUDAO, nQuay+1, 7, 6)	
	local tAward2thang9 = {
					{31, 17998, "get_ChanKhi(3000)", 0},
					{1, 10000, "ThiÕt tinh cÊp 3", {2, 1, 30535, 3}, 0},
					{1, 15000, "TÈy t©m cÊp 3", {2, 1, 30523, 3}, 0},
					{1, 15000, "LuyÖn L« ThiÕt cÊp 3", {2, 1, 30529, 3}, 0},
					{1, 12000, "Kinh m¹ch ®ång nh©n", {2, 1, 30730, 3}, 0},
					{1, 15000, "B¨ng Tinh Th¹ch", {2, 1, 30554, 5}, 0},
					{1, 15000, "Bµn Long bÝch", {2, 1, 1000, 1}, 15*24*3600},
					{1, 1, "Hßa ThÞ BÝch", {2, 1, 1001, 1}, 15*24*3600},
					{1, 1, "Bao Thiªn Kiªu LÖnh", {2, 95, 2087, 1}, 30*24*3600},
					}
	ModifyExp(5311015)	--th­ëng exp mçi lÇn quay				
	gf_EventGiveRandAward(tAward2thang9, 100000, 1, "EVENT 2 THANG 9 NAM 2015 bk", "award ngÉu nhiªn");				
--	gf_AddItemEx2({2,1,30191,2}, "ng«i sao", "EVENT 2 THANG 9 NAM 2015 bk", "nhËn th­ëng thµnh c«ng",7 * 24 * 3600)
	gf_WriteLogEx("EVENT 2 THANG 9 NAM 2015", "thµnh c«ng", 1, "quay thµnh c«ng")
	if nQuay == 14 then	--quay 14 lÇn+lÇn ®ang quay = 15 lÇn
		local nBody = GetBody()	
		for i = 1, 3 do
			gf_AddItemEx2({0,107+i,679+nBody,1,4}, "Ngo¹i trang ©m hån", "EVENT 2 THANG 9 NAM 2015", "nhËn ngo¹i trang",7 * 24 * 3600)
		end
	end
end
function get_ChanKhi(nDiem)
	AwardGenuineQi(nDiem);
end
function get_KinhThu(nType)
	local nCheck = VNG_GetTaskPos(TSK_MATTICH_TIEUDAO, nType+2,nType+2)
	if nCheck >= 1 then
		Talk(1,"", "<color=green>Chñ TiÒn Trang: <color>H«m nay ®¹i hiÖp ®· nhËn Kinh Th­ lo¹i nµy råi, h·y chän lo¹i kh¸c hoÆc quay l¹i vµo ngµy mai.")
		return 0
	end
	if GetItemCount(2,1,199) < nType then
		Talk(1,"", "<color=green>Chñ TiÒn Trang: <color>§¹i hiÖp kh«ng mang ®ñ "..nType.." §¹i Ng©n PhiÕu ®Ó ®æi Kinh Th­.")
		return 0
	end
	if gf_Judge_Room_Weight(1,100) ~= 1 then
		Talk(1,"","<color=green>Chñ TiÒn Trang: <color>Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
        	return 0
	end
	if DelItem(2,1,199,nType) ~= 1 then
		return 0
	end
	if nType == 1 or nType == 2 or nType == 3 then
		VNG_SetTaskPos(TSK_MATTICH_TIEUDAO, 1, nType+2, nType+2)		
		gf_AddItemEx2({2,1,30785,111*nType,4}, "v« tù kinh th­", "KINH THU TRAO TAY bk", "nhËn")
		gf_WriteLogEx("KINH THU TRAO TAY", "thµnh c«ng "..nType, 1, "Mua dßng "..nType)
	else
		Talk(1,"", "HiÖn t¹i ta kh«ng cã g× ®­a cho c¸c h¹.")
		return 0
	end
end
function get_nguyenlieu11(nType)
	local tbCondition = {--So luong TieuDaoNgoc, ID TieuDaoNgoc, ID VatPhamEvent, Sè l­îng VatPhamEvent
								[1] = {23, 30603, 1000, 30933}, --Tói quµ
								[2] = {23, 30603, 1000, 30934}, --GiÊy b¹c	
								[3] = {31, 30603, 1000, 30935}, --ThiÖp T«n S­
							}
	if gf_Judge_Room_Weight(2,100) ~= 1 then
		Talk(1,"","<color=green>Chñ TiÒn Trang: <color>Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
        	return 0
	end
	if GetItemCount(2,1,tbCondition[nType][2]) < tbCondition[nType][1] then
		Talk(1,"", "<color=green>Chñ TiÒn Trang: <color>§¹i hiÖp kh«ng mang ®ñ "..tbCondition[nType][1].." Tiªu Dao Ngäc ®Ó ®æi nguyªn liÖu.")
		return 0
	end
	if DelItem(2,1,tbCondition[nType][2],tbCondition[nType][1]) == 1 then
		gf_AddItemEx2({2,1,tbCondition[nType][4],tbCondition[nType][3]}, "nguyªn liÖu", "MUA NGUYEN LIEU EVENT bk", "nhËn")
		gf_WriteLogEx("MUA NGUYEN LIEU EVENT", "thµnh c«ng "..nType, 1, "Mua dßng "..nType)
	end
end

function Change_SongPhiYen()
	local tPhiYen = {
						[1] = {0,120,259},
						[2] = {0,120,260},
						[3] = {0,120,261},
						[4] = {0,120,262},
					}
	local nCheck = 0
	if gf_Judge_Room_Weight(2,100) ~= 1 then
		Talk(1,"","<color=green>Chñ TiÒn Trang: <color>Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
        	return 0
	end
	for i = 1, getn(tPhiYen) do
		if GetItemCount(tPhiYen[i][1],tPhiYen[i][2],tPhiYen[i][3]) > 0 then
			nCheck = 1
			break
		end
	end
	if nCheck == 0 then
		Talk(1,"", "<color=green>Chñ TiÒn Trang: <color>§¹i hiÖp kh«ng cã BØ Dùc Song Phi trong hµnh trang ®Ó ®æi.")
		return 0
	end
	if GetItemCount(2,95,204) < 10 then
		Talk(1,"", "<color=green>Chñ TiÒn Trang: <color>§¹i hiÖp kh«ng mang ®ñ 10 Thiªn Cang LÖnh.")
		return 0
	end
	if GetItemCount(2,1,30370) < 10 then
		Talk(1,"", "<color=green>Chñ TiÒn Trang: <color>§¹i hiÖp kh«ng mang ®ñ 10 Thiªn M«n Kim LÖnh.")
		return 0
	end
	if DelItem(2,95,204,10) == 1 and DelItem(2,1,30370,10) == 1 then
		for i = 1, getn(tPhiYen) do
			if GetItemCount(tPhiYen[i][1],tPhiYen[i][2],tPhiYen[i][3]) > 0 then
				DelItem(tPhiYen[i][1],tPhiYen[i][2],tPhiYen[i][3],1)
				nCheck = 2
				break
			end
		end
		if nCheck == 2 then
			local nKHinh = GetBody()
			gf_AddItemEx2({tPhiYen[nKHinh][1],tPhiYen[nKHinh][2],tPhiYen[nKHinh][3],1,4}, "nguyªn liÖu", "DOI SONG PHI YEN bk", "nhËn")			
		end
		gf_WriteLogEx("DOI SONG PHI YEN", "thµnh c«ng kiÓu h×nh"..nKHinh, 1, "§æi dßng "..nKHinh)
	end

end