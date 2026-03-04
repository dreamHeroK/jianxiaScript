Include("\\script\\vng\\book15\\book15_define.lua");
Import("\\script\\lib\\globalfunctions.lua");
--Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\lib\\vnglib_award.lua") 


szNpcName = "<color=green>Vâ L©m TruyÒn Kú 15: <color>"
function OnUse()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr¹ng th¸i hiÖn t¹i kh«ng thÓ tham gia !!!")
		return 0
	end
	local nDate = tonumber(date("%y%m%d"))
	local tbSayDialog = {};
	local nSaySize = 0;
	local nAccept_Mission = checkStatus_book15()
	local szSayHead = szNpcName.."Ta chuyªn phô tr¸ch nhiÖm vô MËt §å ThÇn BÝ, ch­¬ng tr×nh diÔn ra tõ ngµy 01-07-2020 ®Õn 07-10-2020.\n"
	if nFlag_Book15 == 0 then
		return 0
	end
	if nAccept_Mission == 0 then
		szSayHead = szSayHead.."<color=yellow>Mét tµi kho¶n chØ cã mét nh©n vËt (tÊt c¶ server) cã thÓ tham gia nhËn NhiÖm vô MËt §å ThÇn BÝ. B¹n h·y suy nghÜ cÈn thËn: <color>"
		
		tinsert(tbSayDialog,"§ång ý nhËn nhiÖm vô MËt §å ThÇn BÝ/get_mission")
	end
	if nAccept_Mission == 1 then
		local nCur_Lev_ByTsk = getLevelBook_book15()
		local nCur_Point = getPointBook_book15()
		local nCheckin = VNG_GetTaskPos(TSK_Book_CountMissDaily_1, 1, 1) --check ®· checkin 1 lÇn trong ngµy
--		local nUp_Next_Lev = nCur_Lev_ByTsk + 1
--		local nUp_Next_Point = tbBookLev[nUp_Next_Lev][1]
		szSayHead =	szSayHead.." - CÊp MËt §å ThÇn BÝ hiÖn t¹i lµ: <color=yellow>"..nCur_Lev_ByTsk.." / 200<color>\n"
		szSayHead =	szSayHead.." - Sè ®iÓm kinh nghiÖm MËt §å ThÇn BÝ hiÖn cã lµ: <color=yellow>"..nCur_Point.."<color>\n"
--		szSayHead =	szSayHead.." - T¨ng MËt §å ThÇn BÝ lªn cÊp <color=red>"..nUp_Next_Lev.."<color> cÇn <color=red>"..nUp_Next_Point.."<color> ®iÓm kinh nghiÖm MËt §å ThÇn BÝ."
	
--	tinsert(tbSayDialog,"Test - Set ®iÓm nhiÖm vô/test_test")
--	tinsert(tbSayDialog,"Test - View th«ng tin/show_regis")
		if nDate >= 200701 and nDate <= 201007 then
			if nCheckin < 1 then
				tinsert(tbSayDialog,"§iÓm danh mçi ngµy/book15_DailyCheckin")
			end
			tinsert(tbSayDialog,"T¨ng cÊp MËt §å ThÇn BÝ/book15_UpLevelSach")
			tinsert(tbSayDialog,"Xem t×nh h×nh nhiÖm vô h»ng ngµy/book15_DailyMissionView")
		end
		if nDate >= 200701 and nDate <= 201021 then
			tinsert(tbSayDialog,"NhËn th­ëng theo cÊp MËt §å ThÇn BÝ/book15_GetAward")		
			tinsert(tbSayDialog,"NhËn th­ëng quay sè may m¾n/book15_Lucky_GetAward")
		end
	end
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over")
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function dialog_over()
	return 0
end

function book15_UpLevelSach()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr¹ng th¸i hiÖn t¹i kh«ng thÓ tham gia !!!")
		return 0
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local nCur_Lev_ByTsk = getLevelBook_book15()
	local nCur_Point = getPointBook_book15()	
	if nCur_Lev_ByTsk >= nMax_Book15 then
		Talk(1, "", szNpcName.."CÊp MËt §å ThÇn BÝ cña b¹n ®· ®¹t tèi ®a. B¹n h·y ®i nhËn th­ëng ®i.")
		return 0
	end
	local nUp_Next_Lev = nCur_Lev_ByTsk + 1
	local nUp_Next_Point = tbBookLev[nUp_Next_Lev][1]
	local szSayHead = szNpcName.."Ta chuyªn phô tr¸ch nhiÖm vô vÒ MËt §å ThÇn BÝ.\n"
	szSayHead =	szSayHead.." - CÊp MËt §å ThÇn BÝ hiÖn t¹i lµ: <color=yellow>"..nCur_Lev_ByTsk.." / 200<color>\n"
	szSayHead =	szSayHead.." - Sè ®iÓm kinh nghiÖm MËt §å ThÇn BÝ hiÖn cã lµ: <color=yellow>"..nCur_Point.."<color>\n"
	szSayHead =	szSayHead.." - T¨ng MËt §å ThÇn BÝ lªn cÊp <color=red>"..nUp_Next_Lev.."<color> cÇn <color=red>"..nUp_Next_Point.."<color> ®iÓm kinh nghiÖm MËt §å ThÇn BÝ."
	
	tinsert(tbSayDialog,"§ång ý t¨ng cÊp MËt §å ThÇn BÝ/confirm_book15_UpLevelSach")
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over")
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function confirm_book15_UpLevelSach()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr¹ng th¸i hiÖn t¹i kh«ng thÓ tham gia !!!")
		return 0
	end
	local nCur_Lev_ByTsk = getLevelBook_book15()
	local nCur_Point = getPointBook_book15()
	local nUp_Next_Lev = nCur_Lev_ByTsk + 1
	
	if nUp_Next_Lev > nMax_Book15 then
		Talk(1, "", szNpcName.."CÊp MËt §å ThÇn BÝ cña b¹n ®· ®¹t tèi ®a. B¹n h·y ®i nhËn th­ëng ®i.")
		return 0
	end
	local nUp_Next_Point = tbBookLev[nUp_Next_Lev][1]
	local nNew_Point = nCur_Point - nUp_Next_Point
	local sAcc = GetAccount()
	local sRole = GetName()
	local sDate = date("%Y-%m-%d")
	local sTime = date("%H:%M:%S")
	local nCheck_Is_Exist = 0 -- 0: ch­a cã -- 1: ®· cã
	if nCur_Point < nUp_Next_Point then
		Talk(1, "", szNpcName.."B¹n kh«ng ®ñ ®iÓm kinh nghiÖm MËt §å ThÇn BÝ ®Ó t¨ng cÊp cho MËt §å ThÇn BÝ.")
		return 0
	end
	
	if nNew_Point >= 0 then
		VNG_SetTaskPos(TSK_Book_Lev_Award, nCur_Lev_ByTsk + 1, 4, 2) --up level MËt §å ThÇn BÝ +1 trªn task
		SetTask(TSK_Book_CountPoint, nNew_Point)		--set ®iÓm tæng sau khi trõ ®iÓm ®Ó up level MËt §å ThÇn BÝ
		
		nCur_Lev_ByTsk = getLevelBook_book15()
		----------
		--ghi file txt
			--update level cho acc ë linux ®· ®¨ng ký nhiÖm vô
		LIB_txtData_book15:Init("book15_level.txt")
		LIB_txtData_book15:LoadMultiColumn()
		for i=1, getn(LIB_txtData_book15.tbTextData) do
			if sAcc == LIB_txtData_book15.tbTextData[i][1] then
				local nCurLev_inFile = LIB_txtData_book15.tbTextData[i][3]
				if tonumber(nCurLev_inFile) >= nCur_Lev_ByTsk then
					Talk(1, "", "Lçi kh«ng ®ång bé")
					return 0
				end
			
				LIB_txtData_book15.tbTextData[i][3] = nCur_Lev_ByTsk
				LIB_txtData_book15.tbTextData[i][4] = sDate
				LIB_txtData_book15.tbTextData[i][5] = sTime
				nCheck_Is_Exist = 1
			end
		end
		LIB_txtData_book15:SaveMultiColumn()
			--update level cho acc kh¸c linux ®· ®¨ng ký nhiÖm vô
		if nCheck_Is_Exist == 0 then
			local szData = sAcc.."	".. sRole .. "	" .. nCur_Lev_ByTsk .. "	" .. sDate .. "	" .. sTime
			LIB_txtData_book15:Init("book15_level.txt")
			LIB_txtData_book15:AddLine(szData)
		end
		----------
		nCur_Point = getPointBook_book15()
		Msg2Player("CÊp MËt §å ThÇn BÝ hiÖn t¹i cña b¹n lµ: "..nCur_Lev_ByTsk)
		gf_WriteLogEx(szLogTitle, szLogAction, 1, "Level MËt §å ThÇn BÝ: "..nCur_Lev_ByTsk) 
		gf_WriteLogEx(szLogTitle_bk, szLogAction, 1, "Level MËt §å ThÇn BÝ: "..nCur_Lev_ByTsk)		--l­u log bk 
		gf_WriteLogEx(szLogTitle_bk, szLogAction, 1, "Kinh nghiÖm hiÖn t¹i: "..nCur_Point)		
	end
	book15_UpLevelSach()
end
function get_mission() --nhËn MËt §å ThÇn BÝ lÇn ®Çu
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr¹ng th¸i hiÖn t¹i kh«ng thÓ tham gia !!!")
		return 0
	end
	if nFlag_Book15 == 0 then
		return 0
	end
	local nRoute = gf_CheckPlayerRoute()
	local nChuyenPhucSinh = gf_GetTransLevel()
	if nRoute == 0 then
		Talk(1, "", szNpcName.."§¹i hiÖp ch­a gia nhËp m«n ph¸i nµo, nªn kh«ng thÓ nhËn nhiÖm vô ®­îc.")
		return 0
	end
--	if gf_Check55MaxSkill() == 0 then
--		Talk(1, "", szNpcName.."§¹i hiÖp ch­a häc ®Çy ®ñ vâ c«ng cÊp 55, nªn kh«ng thÓ nhËn nhiÖm vô ®­îc.");
--		return 0
--	end	
	if nChuyenPhucSinh < 690 then
		Talk(1, "", szNpcName.."§¹i hiÖp ch­a ®ñ chuyÓn sinh 6 cÊp 90, nªn kh«ng thÓ nhËn nhiÖm vô ®­îc.");
		return 0
	end
	local sAcc = GetAccount()
	local sRole = GetName()
	local nFirst_Level = 0
	local sDate = date("%Y-%m-%d")
	local sTime = date("%H:%M:%S")
	local nAccept_Mission = checkStatus_book15()
	if nAccept_Mission >= 1 then
		Talk(1, "", szNpcName.."NhËn nhiÖm vô råi.")
		return 0
	end
	if nAccept_Mission == 0 then
		Talk(1, "", szNpcName.."B¹n nhËn nhiÖm vô MËt §å ThÇn BÝ thµnh c«ng.")
--		PayExtPoint(EXT_BOOK15, GetExtPoint(EXT_BOOK15))
--		AddExtPoint(EXT_BOOK15, 1)	--set ExtPoint nhËn nhiÖm vô
		VNG_SetExtBit(EXT_BOOK15, 1, 1)				--set ExtPoint nhËn nhiÖm vô
		VNG_SetTaskPos(TSK_Book_Lev_Award, 1, 1, 1)	--set Task NhËn nhiÖm vô
		
		gf_WriteLogEx(szLogTitle, szLogAction, 1, "NhËn MËt §å ThÇn BÝ thµnh c«ng")
		--ghi file txt
		local szData = sAcc.."	".. sRole .. "	" .. nFirst_Level .. "	" .. sDate .. "	" .. sTime
		LIB_txtData_book15:Init("book15_level.txt")
		LIB_txtData_book15:AddLine(szData)
	end
end
--chi tiÕt nhiÖm vô hµng ngµy
function book15_DailyMissionView()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr¹ng th¸i hiÖn t¹i kh«ng thÓ tham gia !!!")
		return 0
	end
	if nFlag_Book15 == 0 then
		return 0
	end
	local nAccept_Mission = checkStatus_book15()
	if nAccept_Mission < 1 then
		Talk(1, "", szNpcName.."B¹n ch­a nhËn nhiÖm vô MËt §å ThÇn BÝ.")
		return 0
	end
	local szMsg = szNpcName .."Chi tiÕt hoµn thµnh nhiÖm vô mçi ngµy :\n"
	for i=1, getn(tbbook15_DailyConfig) do
		local nCount = VNG_GetTaskPos(tbbook15_DailyConfig[i][1],tbbook15_DailyConfig[i][4],tbbook15_DailyConfig[i][5])
		local nColor = "red"
		if nCount == tbbook15_DailyConfig[i][3] then
			nColor = "yellow"
		end
		szMsg = szMsg .. tbbook15_DailyConfig[i][2]..": ®­îc <color="..nColor..">".. VNG_GetTaskPos(tbbook15_DailyConfig[i][1],tbbook15_DailyConfig[i][4],tbbook15_DailyConfig[i][5]) .."<color> / <color=yellow>"..tbbook15_DailyConfig[i][3].."<color> lÇn.\n"
	end
	Talk(1,"",szMsg)
end
--®iÓm danh mçi ngµy
function book15_DailyCheckin()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr¹ng th¸i hiÖn t¹i kh«ng thÓ tham gia !!!")
		return 0
	end
	if nFlag_Book15 == 0 then
		return 0
	end
	book15_DailyMissionComplete(1)
end
--hoµn thµnh nhiÖm vô ngµy
function book15_DailyMissionComplete(nMissionID)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr¹ng th¸i hiÖn t¹i kh«ng thÓ tham gia !!!")
		return 0
	end
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 201007 then		
		nFlag_Book15 = 0
	end
	if nFlag_Book15 == 0 then
			return 0
		end
	local nAccept_Mission = checkStatus_book15()
	if nAccept_Mission < 1 then
--		Talk(1, "", szNpcName.."B¹n ch­a nhËn nhiÖm vô kû niÖm Vâ L©m TruyÒn Kú 15.")
		return 0
	end
	local tbMission = tbbook15_DailyConfig[nMissionID]
	local nQty = VNG_GetTaskPos(tbMission[1], tbMission[4], tbMission[5])
	local nExp = tbMission[6]
	local szMsg = tbMission[3]
	local szNameMiss = tbMission[2]
	local nCurPoint = getPointBook_book15()
	if nQty < tbMission[3] then
		VNG_SetTaskPos(tbMission[1], nQty + 1, tbMission[4], tbMission[5])
--		Talk(1,"",szNpcName.."B¹n hoµn thµnh 1 lÇn nhiÖm vô "..szNameMiss.." cña MËt §å ThÇn BÝ.")
--		SetTask(TSK_Book_CountPoint,nCurPoint + nExp)	--set ®iÓm nhiÖm vô vµo MËt §å ThÇn BÝ
--		gf_WriteLogEx(szLogTitle, szLogAction, 1, "Exp MËt §å ThÇn BÝ: "..nExp) 
--		Talk(1,"",szNpcName.."B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm MËt §å ThÇn BÝ.")
--		Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm MËt §å ThÇn BÝ.")
		nQty = VNG_GetTaskPos(tbMission[1], tbMission[4], tbMission[5])
		if nQty == tbMission[3] then
			SetTask(TSK_Book_CountPoint,nCurPoint + nExp)	--set ®iÓm nhiÖm vô vµo MËt §å ThÇn BÝ
			gf_WriteLogEx(szLogTitle, szLogAction, 1, "Exp MËt §å ThÇn BÝ: "..nExp) 
	--		Talk(1,"",szNpcName.."B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm MËt §å ThÇn BÝ.")
			Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm MËt §å ThÇn BÝ.")
			Talk(1,"",szNpcName.."H«m nay b¹n ®· hoµn thµnh nhiÖm vô "..szNameMiss.." hµng ngµy. B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm MËt §å ThÇn BÝ.")
			return 0
		end
	end
	
end

function book15_GetAward()
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 201021 then		
		return 0
	end
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr¹ng th¸i hiÖn t¹i kh«ng thÓ tham gia !!!")
		return 0
	end
	if gf_JudgeRoomWeight(5,100) == 0 then
		Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return 0
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = szNpcName.."Ta chuyªn phô tr¸ch nhiÖm vô MËt §å ThÇn BÝ.\n"
	local nCur_Award_ByTsk = getAward_book15()
	local nCur_Lev_ByTsk = getLevelBook_book15()
	
	for i=1, getn(tbbook15_Award) do
		if nCur_Lev_ByTsk < i then
			break
		end
		if tbbook15_Award[i][1] == 1 and nCur_Award_ByTsk < i then
			tinsert(tbSayDialog, "NhËn th­ëng MËt §å ThÇn BÝ cÊp  "..i.."/#confirm_book15_GetAward("..i..")")		
		end
	end
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over")
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function confirm_book15_GetAward(nType)
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 201021 then		
		return 0
	end
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr¹ng th¸i hiÖn t¹i kh«ng thÓ tham gia !!!")
		return 0
	end
	if nFlag_Book15 == 0 then
		return 0
	end
	if gf_JudgeRoomWeight(5,100) == 0 then
		Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return 0
	end
	local nCur_Lev_ByTsk = getLevelBook_book15()
	local nCur_Award_ByTsk = getAward_book15()
	if nCur_Lev_ByTsk < nType then
		Talk(1,"", szNpcName.."CÊp MËt §å ThÇn BÝ cña b¹n ch­a ®¹t cÊp "..nType.." ®Ó nhËn th­ëng. H·y cè g¾ng lªn.")
		return 0
	end
	if nCur_Award_ByTsk >= nType then
		Talk(1,"", szNpcName.."B¹n ®· nhËn phÇn th­ëng cÊp "..nType.." råi. H·y chän phÇn th­ëng kh¸c.")
		return 0
	end
	local ncountCheck = 1
	for i=1, nCur_Lev_ByTsk do
		if i >= 190 then
			break
		end
		if tbbook15_Award[nCur_Award_ByTsk+1][1] == 0 then
			if tbbook15_Award[nCur_Award_ByTsk+2][1] == 0 then
				ncountCheck = 3
				break
			end
			ncountCheck = 2
		end
	end
	if nCur_Award_ByTsk + ncountCheck < nType then
		Talk(1,"", szNpcName.."B¹n ch­a nhËn phÇn th­ëng cña cÊp MËt §å ThÇn BÝ tr­íc ®ã. H·y chän phÇn th­ëng kh¸c.")
		return 0
	end
	if tbbook15_Award[nType][1] ~= 1 then
		gf_WriteLogEx(szLogTitle, "Fail Award", 1, "Lçi phÇn th­ëng cÊp : "..nType) 
		return 0
	end
	VNG_SetTaskPos(TSK_Book_Lev_Award, nType, 7, 5)
	LIB_Award.szLogTitle = szLogTitle
	LIB_Award.szLogAction = szLogActionAward..nType
	LIB_Award:Award(tbbook15_Award[nType][2])	
	
end
function book15_Lucky_GetAward()
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 201021 then		
		return 0
	end
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr¹ng th¸i hiÖn t¹i kh«ng thÓ tham gia !!!")
		return 0
	end
	if nFlag_Book15 == 0 then
		return 0
	end
	local nCount_Award_Web = VNG_GetTaskPos(TSK_Book_Lev_Award, 9, 8)
	if nCount_Award_Web >= 35 then
		Talk(1, "", szNpcName.."§¹i hiÖp ®· nhËn th­ëng qu¸ nhiÒu råi, nªn kh«ng thÓ nhËn nhiÖm vô ®­îc.");
		return 0
	end	
	local nChuyenPhucSinh = gf_GetTransLevel()
	if nChuyenPhucSinh < 690 then
		Talk(1, "", szNpcName.."§¹i hiÖp ch­a ®ñ chuyÓn sinh 6 cÊp 90, nªn kh«ng thÓ nhËn nhiÖm vô ®­îc.");
		return 0
	end	
	if gf_JudgeRoomWeight(5,100) == 0 then
		Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return 0
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local nAccept_Mission = checkStatus_book15()
	local szSayHead = szNpcName.."Ta chuyªn phô tr¸ch nhiÖm vô MËt §å ThÇn BÝ.\n"
	if nFlag_Book15 == 0 then
		return 0
	end
	local nLuck2, nLuck3, nLuck4, nLuck5, nLuck6, nLuck7 = checkAward_Lucky()
	if nLuck2 == 0 and nLuck3 == 0 and nLuck4 == 0 and nLuck5 == 0 and nLuck6 == 0 and nLuck7 == 0 then
		Talk(1,"", szNpcName.."HiÖn t¹i b¹n kh«ng cã phÇn th­ëng nµo ®Ó nhËn.")
		return 0
	end
	if nLuck2 == 1 then
		tinsert(tbSayDialog,"Thanh Long: 1 tû ®iÓm kinh nghiÖm/#confirm_book15_Lucky_GetAward(2)")
	end	
	if nLuck3 == 1 then	
		tinsert(tbSayDialog,"Cµn Kh«n: 1 s¸ch b¹n ®ßng hµnh cÊp 6 ngÉu nhiªn/#confirm_book15_Lucky_GetAward(3)")
	end	
	if nLuck4 == 1 then
		tinsert(tbSayDialog,"Thiªn §Þa: 1 tói ®¸ quý cÊp 2/#confirm_book15_Lucky_GetAward(4)")
	end
	if nLuck5 == 1 then
		tinsert(tbSayDialog,"HuyÒn Vò: 1 tói ®¸ quý cÊp 3/#confirm_book15_Lucky_GetAward(5)")
	end
	if nLuck6 == 1 then
		tinsert(tbSayDialog,"Chu T­íc: 20 m¶nh kim xµ 6 ngÉu nhiªn/#confirm_book15_Lucky_GetAward(6)")		
	end	
	if nLuck7 == 1 then	
		tinsert(tbSayDialog,"B¹ch Hæ: 1 lÖnh bµi trang søc hµo hiÖp v« h¹/#confirm_book15_Lucky_GetAward(7)")
	end
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over")
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function confirm_book15_Lucky_GetAward(nType)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr¹ng th¸i hiÖn t¹i kh«ng thÓ tham gia !!!")
		return 0
	end
	if nFlag_Book15 == 0 then
		return 0
	end
	local nCount_Award_Web = VNG_GetTaskPos(TSK_Book_Lev_Award, 9, 8)
	if nCount_Award_Web >= 35 then
		Talk(1, "", szNpcName.."§¹i hiÖp ®· nhËn th­ëng qu¸ nhiÒu råi, nªn kh«ng thÓ nhËn nhiÖm vô ®­îc.");
		return 0
	end	
	if checkStatus_book15() < 1 then
		return 0
	end
	if gf_JudgeRoomWeight(5,100) == 0 then
		Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return 0
	end
	local nLuck_Type = checkAward_Lucky_by_Type(nType)
	if nLuck_Type ~= 1 then
		gf_WriteLogEx(szLogTitle, "Fail Award Lucky", 1, "Lçi phÇn th­ëng lucky : "..nType) 
		return 0
	end
	if tbbook15_LuckyAward[nType][1] == 0 then
		return 0
	end
	VNG_SetTaskPos(TSK_Book_Lev_Award, nCount_Award_Web + 1, 9, 8)
	VNG_SetExtBit(EXT_BOOK15, nType, 0)
	
	LIB_Award.szLogTitle = szLogTitle
	LIB_Award.szLogAction = szLogActionAwardWeb..tbbook15_LuckyAward[nType][2]
	LIB_Award:Award(tbbook15_LuckyAward[nType][3])	
end
-----------------
function show_regis()
	do return 0 end
	LIB_txtData_book15:Init("book15_level.txt")
	LIB_txtData_book15:LoadMultiColumn()
	local szList = "\n"
	for i=1, getn(LIB_txtData_book15.tbTextData) do
			szList = szList .. LIB_txtData_book15.tbTextData[i][1] .. ": "..LIB_txtData_book15.tbTextData[i][3] .. "\n "
	end
	Talk(1,"", szNpcName.."§· ®¨ng ký gåm: "..szList)

end
function test_test()
	do return 0 end
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = szNpcName.."Ta chuyªn phô tr¸ch nhiÖm vô MËt §å ThÇn BÝ.\n"
	
	for i=1, getn(tbbook15_DailyConfig) do
		tinsert(tbSayDialog, "- "..tbbook15_DailyConfig[i][2].."/#set_taskhoanthanh("..i..")")
	end
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/dialog_over")
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function set_taskhoanthanh(nType)
	book15_DailyMissionComplete(nType)
--	VNG_SetTaskPos(tbbook15_DailyConfig[nType][1], tbbook15_DailyConfig[nType][3], tbbook15_DailyConfig[nType][4], tbbook15_DailyConfig[nType][5])
end
