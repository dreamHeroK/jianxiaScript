--by liubo
--±¦ÏäÉÌÈË½Å±¾
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\treasure_box\\string.lua")
Import("\\script\\online_activites\\task_values.lua")
Include("\\script\\vng\\config\\newserver.lua");
Include("\\script\\equip_feed\\feed_up_attr_recoup.lua")
Include("\\script\\vng\\weapon_upgrade\\trangbichiencuong.lua")
Include("\\script\\vng\\doinguyenlieu.lua")

FILE_NAME = "\\script\\online_activites\\treasure_box\\npc_treasuer_chests.lua";	
NANGCAPDIEUDUONG_F1 = "\\script\\vng\\weapon_upgrade\\dieuduongcongthuc1.lua";
NANGCAPDIEUDUONG_F2 = "\\script\\vng\\weapon_upgrade\\dieuduongcongthuc2.lua";
NANGCAPDIEUDUONG_NGOCBOI = "\\script\\vng\\weapon_upgrade\\dieuduong_nangcapngocboi.lua"
g_szNpcName = "<color=green>Th­¬ng Nh©n B¶o R­¬ng: <color>";

TSK_TMP_CHANGE_BKVD = 206
function main()
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	--ÊÇ·ñ¿ªÆôÅÐ¶Ï
	if gf_CheckEventDateEx(46) ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[5])
		return 0
	end
	--ÅÐ¶ÏÊÇ·ñÒÑ¾­×ªÉú
	--
	--
--	if GetTask(1538) == 0 then
--		Talk(1,"",tSTRING_TREASUER_NPC[1])
--		return 0
--	end
	local tbSay = {}
	local nSayHead = "<color=green>Tô B¶o Th­¬ng Nh©n:<color> Ta chuyªn b¸n c¸c b¶o vËt quý hiÕm, §¹i hiÖp cÇn t×m vËt phÈm g×: "
	if nDate < 20130904 then
		tinsert(tbSay,"NhËn hç trî trang bÞ Kim Xµ/_On_Repair")
	end
--	tinsert(tbSay, "Ta muèn ®æi nguyªn liÖu lÊy kinh nghiÖm/Trade_Material2Exp_Menu")
--	if tbGioiHanThanTaiBaoRuong[nNation] == nil or nDate >= tbGioiHanThanTaiBaoRuong[nNation] then
		tinsert(tbSay,tSTRING_TREASUER_NPC[3].."/get_wooden")
		tinsert(tbSay,"Ta muèn ®æi 1 B¹ch Kim R­¬ng (tiªu hao 5 Tµng R­¬ng)/get_BKR")
		tinsert(tbSay,"Ta muèn ®æi 1 ThÇn Tµi B¶o R­¬ng (tiªu hao 55 Tµng R­¬ng)/get_TTBR")
	--end
--	tinsert(tbSay,"§æi trang bÞ H¹o NguyÖt/get_haonguyet")
--	tinsert(tbSay,"§æi trang bÞ DiÖu D­¬ng/NangCapDieuDuong")
--	tinsert(tbSay,"N©ng cÊp ngäc béi DiÖu D­¬ng 6% thµnh 8%/NangCapDieuDuong_NgocBoi")
--		"N©ng cÊp B¹ch Kim Viªm §Õ/get_BKVD",
--		tSTRING_TREASUER_NPC[4].."/get_treasure",
--	tinsert(tbSay, "§æi trang bÞ ChiÕn Cuång/TrangBiChienCuong_Form")
	if nDate <= 20200311 then
		tinsert(tbSay,"Ta muèn mua 1 Cæ Kim Th¹ch (+10 v¨n søc)(tiªu hao 1 TCL, 3000 vµng)/#shop_uudai_thang32020(1)")
		tinsert(tbSay,"Ta muèn mua 1 Cæ Kim Th¹ch (+10 v¨n søc)(tiªu hao 1 TMKL, 3000 vµng)/#shop_uudai_thang32020(2)")
		tinsert(tbSay,"Ta muèn mua 1 §iÓm Tinh Ngäc (+15 v¨n søc)(tiªu hao 2 TCL, 3 TMKL)/#shop_uudai_thang32020(3)")
		tinsert(tbSay,"Ta muèn ®æi 1 thó c­ìi B¹ch Lang (vÜnh viÔn)(tiªu hao 17 TCL, 17 TMKL)/#shop_uudai_thang32020(4)")
		tinsert(tbSay,"Ta muèn ®æi 1 thó c­ìi ChiÕn T­îng nguyªn so¸i (vÜnh viÔn)(tiªu hao 22 TCL, 22 TMKL)/#shop_uudai_thang32020(5)")
	end
		--tinsert(tbSay,"Ta muèn ®æi 1 Tói trang bÞ Kim Xµ 7 (19 TMKL, 19 TCL, 1500 TNL)/change_KimXa7")
		--tinsert(tbSay,"Ta muèn ®æi vËt phÈm tÈy luyÖn Kim Xµ 7/menu_tayluyenkimxa7")
		tinsert(tbSay,"Rêi khái/do_nothing")
	
	Say(nSayHead, getn(tbSay), tbSay)
end

function get_wooden()
	local nNum = GetTask(VET_TREASURE_BOX_MNUM)
	local tNumWooden = {2,5,12}
	local nIndex = floor(nNum/20)+1
	if nIndex < 3 then
		Say(TREASURE_NPC_NMAE..format(tSTRING_TREASUER_NPC[5],tNumWooden[nIndex],nIndex*20-nNum),2,format("Ta muèn mua/#pay_award(%d,0,%d)",nIndex*20-nNum,tNumWooden[nIndex]),"Kh«ng cÇn ®©u/do_nothing")
	else
		Say(TREASURE_NPC_NMAE..format(tSTRING_TREASUER_NPC[6],tNumWooden[3]),2,format("Ta muèn mua/#pay_award(%d,0,%d)",999,tNumWooden[3]),"Kh«ng cÇn ®©u/do_nothing")
	end
end

function get_treasure()
	local nNum = GetTask(VET_TREASURE_BOX_CNUM)
	local tNumTreasure = { 60, 150, 400 }
	local nIndex = floor(nNum / 20) + 1
	if nIndex < 3 then
		Say(TREASURE_NPC_NMAE .. format(tSTRING_TREASUER_NPC[5], tNumTreasure[nIndex], nIndex * 20 - nNum), 2, format("Ta muèn mua/#pay_award(%d,1,%d)", nIndex * 20 - nNum, tNumTreasure[nIndex]), "Kh«ng cÇn ®©u/do_nothing")
	else
		Say(TREASURE_NPC_NMAE .. format(tSTRING_TREASUER_NPC[6], tNumTreasure[3]), 2, format("Ta muèn mua/#pay_award(%d,1,%d)", 999, tNumTreasure[3]), "Kh«ng cÇn ®©u/do_nothing")
	end
end

function pay_award(nNum1,nNum2,nNum3)
	local nNum = GetItemCount(2, 1, 30230)
	if nNum2 == 0 then
		if nNum < nNum1 * nNum3 then nNum1 = floor(nNum / nNum3) end
		AskClientForNumber("pay_wooden", 1, nNum1, "H·y nhËp sè l­îng", "")
	end
	if nNum2 == 1 then
		if nNum < nNum1 * nNum3 then nNum1 = floor(nNum / nNum3) end
		AskClientForNumber("pay_treasure", 1, nNum1, "H·y nhËp sè l­îng", "")
	end
end

function pay_wooden(nNum)
	local nNumTask = GetTask(VET_TREASURE_BOX_MNUM)
	local tNumWooden = { 2, 5, 12 }
	local nIndex = floor(nNumTask / 20) + 1
	if nIndex > 3 then nIndex = 3 end
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		Talk(1, "", tSTRING_TREASUER_BOX[4])
		return 0
	end
	if GetItemCount(2, 1, 30230) < nNum * tNumWooden[nIndex] then
		Talk(1, "", format(tSTRING_TREASUER_NPC[7], nNum * tNumWooden[nIndex]))
		return 0
	end
	if DelItem(2, 1, 30230, nNum * tNumWooden[nIndex]) == 1 then
		if gf_AddItemEx({ 2, 1, 30340, nNum }, "Méc R­¬ng", nNum) ~= 1 then
			return 0
		end
		SetTask(VET_TREASURE_BOX_MNUM, nNumTask + nNum)
		return 1
	end
	return 0
end

function pay_treasure(nNum)
	local nNumTask = GetTask(VET_TREASURE_BOX_CNUM)
	local tNumTreasure = { 60, 150, 400 }
	local nIndex = floor(nNumTask / 20) + 1
	if nIndex > 3 then nIndex = 3 end
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		Talk(1, "", tSTRING_TREASUER_BOX[4])
		return 0
  	end
	if GetItemCount(2,1,30230) < nNum * tNumTreasure[nIndex] then
		Talk(1,"",format(tSTRING_TREASUER_NPC[7],nNum * tNumTreasure[nIndex]))
		return 0 
	end	
	if DelItem(2,1,30230,nNum * tNumTreasure[nIndex]) == 1 then
		if gf_AddItemEx2({2,1,30341,nNum},"§æi Tµng R­¬ng lo¹i "..tNumTreasure[nIndex].." xu","Than Tai Bao Ruong","§æi Tµng R­¬ng thµnh c«ng",0,1) ~= 1 then
			return 0
		end
		SetTask(VET_TREASURE_BOX_CNUM, nNumTask + nNum)
		return 1
	end
	return 0
end

function do_nothing()
end

function get_BKVD()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H·y chän trang bÞ cÇn n©ng cÊp."
	
	tinsert(tbSayDialog, "- Ta cÇn ®æi 1 B¹ch Kim Viªm §Õ Kh«i (100 M¶nh B¹ch Kim + 3 B¹ch Kim Hång Bao (cã chøa 4000 vµng + 1 Thiªn Chi Viªm §Õ Kh«i[+12])/#get_BKVD_confirm(1,0)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi 1 B¹ch Kim Viªm §Õ Gi¸p (100 M¶nh B¹ch Kim + 3 B¹ch Kim Hång Bao (cã chøa 4000 vµng + 1 Thiªn Chi Viªm §Õ Gi¸p[+12])/#get_BKVD_confirm(2,0)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi 1 B¹ch Kim Viªm §Õ Trang (100 M¶nh B¹ch Kim + 3 B¹ch Kim Hång Bao (cã chøa 4000 vµng + 1 Thiªn Chi Viªm §Õ Trang[+12])/#get_BKVD_confirm(3,0)")
	tinsert(tbSayDialog, "Trë l¹i/main")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function get_haonguyet()
	do return 0 end
	
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H·y chän trang bÞ cÇn ®æi."
	
	tinsert(tbSayDialog, "- Ta cÇn ®æi Nãn H¹o NguyÖt (8 M¶nh B¹ch Kim + 1 N÷ Oa Tinh Th¹ch + 1 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(1,0)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi ¸o H¹o NguyÖt (6 M¶nh B¹ch Kim + 1 N÷ Oa Tinh Th¹ch + 1 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(2,0)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi QuÇn H¹o NguyÖt (6 M¶nh B¹ch Kim + 1 N÷ Oa Tinh Th¹ch + 1 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(3,0)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi Trang Søc H¹o NguyÖt (12 M¶nh B¹ch Kim + 2 N÷ Oa Tinh Th¹ch + 2 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/get_haonguyet_trangsuc")
	tinsert(tbSayDialog, "- Ta cÇn ®æi Vò KhÝ H¹o NguyÖt (16 M¶nh B¹ch Kim + 4 N÷ Oa Tinh Th¹ch + 4 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(5,0)")
	tinsert(tbSayDialog, "Trë l¹i/main")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function get_haonguyet_trangsuc()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H·y chän trang bÞ cÇn ®æi."
	
	tinsert(tbSayDialog, "- Ta cÇn ®æi H¹o NguyÖt-XÝch T­íc Hoµn (12 M¶nh B¹ch Kim + 2 N÷ Oa Tinh Th¹ch + 2 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(4,1)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi H¹o NguyÖt-Tö Giao Ngäc Béi (12 M¶nh B¹ch Kim + 2 N÷ Oa Tinh Th¹ch + 2 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(4,2)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi H¹o NguyÖt-V©n Hæ LÖnh (12 M¶nh B¹ch Kim + 2 N÷ Oa Tinh Th¹ch + 2 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(4,3)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi H¹o NguyÖt-¤ L©n B¶o Giíi (12 M¶nh B¹ch Kim + 2 N÷ Oa Tinh Th¹ch + 2 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(4,4)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi H¹o NguyÖt-BÝch Quy Liªn (12 M¶nh B¹ch Kim + 2 N÷ Oa Tinh Th¹ch + 2 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(4,5)")
	tinsert(tbSayDialog, "Trë l¹i/get_haonguyet")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function get_BKVD_confirm(nGetType, nSelected)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "","Ph¶i gia nhËp hÖ ph¸i míi n©ng cÊp trang bÞ ®­îc!");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
     end
    	local nItemNum1 = tItem_need[1][3]
	if GetItemCount(2,1,30346) < nItemNum1 then
		Talk(1, "", "B¹n kh«ng ®ñ "..tItem_need[1][1].." ®Ó ®æi trang bÞ B¹ch Kim Viªm §Õ")
		return 0
	end
	    	local nItemNum2 = tItem_need[2][3]
	if GetItemCount(2,1,30229) < nItemNum2 then
		Talk(1, "", "B¹n kh«ng ®ñ "..tItem_need[2][1].." ®Ó ®æi trang bÞ B¹ch Kim Viªm §Õ")
		return 0
	end
	SetTaskTemp(TSK_TMP_CHANGE_BKVD,nGetType)
	local nSlot = BKVD_need[nGetType][1]		
	PutinItemBox("§æi trang bÞ" ,nSlot , "X¸c nhËn muèn thùc hiÖn n©ng cÊp trang bÞ?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	local nGetType = GetTaskTemp(TSK_TMP_CHANGE_BKVD)
	if nGetType == 0 then
		return 0;
	end
	
	local tb_item = BKVD_need[nGetType][3]
	local tItem = {}
	local check = 0

	for i = 1, getn(tb_item) do
		tinsert(tItem,tb_item[i])
	end
	for i=1,getn(tItem) do
		local nG, nD, nP = gf_UnPack(tb_item[i])
		if (GetEquipAttr(idx,2) < 12) and genre == 0 then
			Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 12 trë lªn");
			return 0;		
		end
		if (genre == nG and detail == nD and particular == nP) then	
			check = 1	
		end
	end
	if check == 1 then
		return 1
	end
	Talk(1, "", g_szNpcName.."ChØ cã thÓ bá vµo "..BKVD_need[nGetType][2]);
	return 0;
end

function OnPutinComplete(param)
	local nGetType = GetTaskTemp(TSK_TMP_CHANGE_BKVD)
	if nGetType == 0 then
		Talk(1, "", g_szNpcName.."Bá vµo vËt phÈm kh«ng ®óng");
		return 0;
	end
	if param ~= 1 then
		Talk(1, "", g_szNpcName.."Bá vµo vËt phÈm kh«ng ®óng");
		return 0;
	end
	local t = GetPutinItem()
	if getn(t) ~= BKVD_need[nGetType][1] then
		Talk(1, "", g_szNpcName.."Bá vµo vËt phÈm kh«ng ®óng");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
     end
    	local nItemNum1 = tItem_need[1][3]
	if GetItemCount(2,1,30346) < nItemNum1 then
		Talk(1, "", "B¹n kh«ng ®ñ "..tItem_need[1][1].." ®Ó ®æi trang bÞ B¹ch Kim Viªm §Õ")
		return 0
	end
	    	local nItemNum2 = tItem_need[2][3]
	if GetItemCount(2,1,30229) < nItemNum2 then
		Talk(1, "", "B¹n kh«ng ®ñ "..tItem_need[2][1].." ®Ó ®æi trang bÞ B¹ch Kim Viªm §Õ")
		return 0
	end
	local nResult = 1
	for i = 1, getn(t) do		
		if DelItemByIndex(t[i][1], -1) ~= 1 then
			nResult = 0;
			break;
		end
	end
	local nItemNum1 = tItem_need[1][3]
	local nItemNum2 = tItem_need[2][3]
	local nbody = GetBody()
	if nResult ==1 then
		if DelItem(2,1,30346, nItemNum1) == 1 and DelItem(2,1,30229, nItemNum2) == 1 then
			SetTaskTemp(TSK_TMP_CHANGE_BKVD,0)
			local nItem = BKVD_suc[nGetType][2][nbody]
			gf_AddItemEx2(nItem, "N©ng cÊp trang bÞ thµnh c«ng", "NANG CAP TRANG BI BKVD", "n©ng cÊp thµnh c«ng")
			Talk(1,"","Chóc mõng b¹n nhËn ®­îc 1 trang bÞ B¹ch Kim Viªm §Õ!")
		end
	end
end

function get_haonguyet_confirm(nGetType, nSelected)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "","Ph¶i gia nhËp hÖ ph¸i míi n©ng cÊp trang bÞ ®­îc!");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
     end
     if nGetType == 1 then
    		if GetItemCount(2,1,30346) < 8 then
			Talk(1, "", "B¹n kh«ng ®ñ 8 m¶nh B¹ch Kim ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end
    		if GetItemCount(2,1,30229) < 1 then
			Talk(1, "", "B¹n kh«ng ®ñ 1 B¹ch Kim §¹i Hång Bao ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end		
    		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", "B¹n kh«ng ®ñ 1 N÷ Oa Tinh Th¹ch ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end			
     end
     if nGetType == 2 then
    		if GetItemCount(2,1,30346) < 6 then
			Talk(1, "", "B¹n kh«ng ®ñ 6 m¶nh B¹ch Kim ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end
    		if GetItemCount(2,1,30229) < 1 then
			Talk(1, "", "B¹n kh«ng ®ñ 1 B¹ch Kim §¹i Hång Bao ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end	
    		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", "B¹n kh«ng ®ñ 1 N÷ Oa Tinh Th¹ch ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end					
     end
     if nGetType == 3 then
     		if GetItemCount(2,1,30346) < 6 then
			Talk(1, "", "B¹n kh«ng ®ñ 6 m¶nh B¹ch Kim ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end   
    		if GetItemCount(2,1,30229) < 1 then
			Talk(1, "", "B¹n kh«ng ®ñ 1 B¹ch Kim §¹i Hång Bao ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end	
    		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", "B¹n kh«ng ®ñ 1 N÷ Oa Tinh Th¹ch ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end							
     end     
     if nGetType == 4 then
    		if GetItemCount(2,1,30346) < 12 then
			Talk(1, "", "B¹n kh«ng ®ñ 12 m¶nh B¹ch Kim ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end    	
    		if GetItemCount(2,1,30229) < 2 then
			Talk(1, "", "B¹n kh«ng ®ñ 2 B¹ch Kim §¹i Hång Bao ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end		
    		if GetItemCount(2,1,504) < 2 then
			Talk(1, "", "B¹n kh«ng ®ñ 2 N÷ Oa Tinh Th¹ch ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end					
     end
     if nGetType == 5 then
    		if GetItemCount(2,1,30346) < 16 then
			Talk(1, "", "B¹n kh«ng ®ñ 16 m¶nh B¹ch Kim ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end    	
    		if GetItemCount(2,1,30229) < 4 then
			Talk(1, "", "B¹n kh«ng ®ñ 4 B¹ch Kim §¹i Hång Bao ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end		
    		if GetItemCount(2,1,504) < 4 then
			Talk(1, "", "B¹n kh«ng ®ñ 4 N÷ Oa Tinh Th¹ch ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end					
     end          

	local nbody = GetBody()
	local nfaction = GetPlayerRoute()
     if nGetType == 1 then	
     		if DelItem(2,1,30346, 8) == 1 and DelItem(2,1,30229, 1) == 1 and DelItem(2,1,504, 1) == 1 then
     			local nNon = tHaoNguyet_suc[nGetType][nfaction][2][nbody]
     			gf_AddItemEx2(nNon, "§æi trang bÞ thµnh c«ng", "DOI TRANG BI", "®æi thµnh c«ng")
			Talk(1,"","§æi trang bÞ thµnh c«ng!")
     		end
     end
	if nGetType == 2 then	
     		if DelItem(2,1,30346, 6) == 1 and DelItem(2,1,30229, 1) == 1 and DelItem(2,1,504, 1) == 1 then
     			local nAo = tHaoNguyet_suc[nGetType][nfaction][2][nbody]
     			gf_AddItemEx2(nAo, "§æi trang bÞ thµnh c«ng", "DOI TRANG BI", "®æi thµnh c«ng")
			Talk(1,"","§æi trang bÞ thµnh c«ng!")
     		end
     end
     if nGetType == 3 then	
     		if DelItem(2,1,30346, 6) == 1 and DelItem(2,1,30229, 1) == 1 and DelItem(2,1,504, 1) == 1 then
     			local nQuan = tHaoNguyet_suc[nGetType][nfaction][2][nbody]
     			gf_AddItemEx2(nQuan, "§æi trang bÞ thµnh c«ng", "DOI TRANG BI", "®æi thµnh c«ng")
			Talk(1,"","§æi trang bÞ thµnh c«ng!")
     		end
     end
     if nGetType == 4 then
          	if DelItem(2,1,30346, 12) == 1 and DelItem(2,1,30229, 2) == 1 and DelItem(2,1,504, 2) == 1 then
			local nTrangsuc = tHaoNguyet_suc[nGetType][nSelected][2]
			gf_AddItemEx2(nTrangsuc, "§æi trang bÞ thµnh c«ng", "DOI TRANG BI", "®æi thµnh c«ng ")
			Talk(1,"","§æi trang bÞ thµnh c«ng!")
		end
	end
	if nGetType == 5 then
	 	if DelItem(2,1,30346, 16) == 1 and DelItem(2,1,30229, 4) == 1 and DelItem(2,1,504, 4) == 1 then
			local nVukhi = tHaoNguyet_suc[nGetType][nfaction][2]
			gf_AddItemEx2(nVukhi, "§æi trang bÞ thµnh c«ng", "DOI TRANG BI", "®æi thµnh c«ng ")
			Talk(1,"","§æi trang bÞ thµnh c«ng!")
		end
	end
	
end

function get_item_count(t, id1, id2, id3)
	local nCount = 0
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then  
			nCount = nCount + 1
		end
	end
	return nCount
end

function get_BKR()
	local nCountTR = GetItemCount(2, 1, 30341)
	local nMax = 0
	if nCountTR > 0 then
		nMax = floor(nCountTR / 5)
	end
	AskClientForNumber("Confirm_get_BKR", 0, nMax, "B¹ch Kim R­¬ng")
end
function get_TTBR()
	local nCountTR = GetItemCount(2, 1, 30341)
	local nMax = 0
	if nCountTR > 0 then
		nMax = floor(nCountTR / 55)
	end
	AskClientForNumber("Confirm_get_TTBR", 0, nMax, "ThÇn Tµi R­¬ng")
end

function Confirm_get_BKR(nCount)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	if gf_Judge_Room_Weight(5, 50," ") ~= 1 then
        	return
    end
	if GetItemCount(2,1,30341) < 5 * nCount then
		Talk(1, "", "B¹n kh«ng ®ñ Tµng R­¬ng ®Ó ®æi B¹ch Kim R­¬ng")
		return 0
	end    	
	if DelItem(2,1,30341, 5 * nCount) == 1 then
		gf_AddItemEx2({2,1,30343,nCount}, "B¹ch Kim R­¬ng", "Than Tai Bao Ruong", "nhËn thµnh c«ng")
        gf_WriteLogEx("Than Tai Bao Ruong", "®æi thµnh c«ng", nCount, "Sè l­îng B¹ch Kim R­¬ng")			
	end
end

function Confirm_get_TTBR(nCount)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	if gf_Judge_Room_Weight(5, 50," ") ~= 1 then
        	return
    end
	if GetItemCount(2,1,30341) < 55 * nCount then
		Talk(1, "", "B¹n kh«ng ®ñ Tµng R­¬ng ®Ó ®æi ThÇn Tµi B¶o R­¬ng")
		return 0
	end    	
	if DelItem(2,1,30341, 55 * nCount) == 1 then
		gf_AddItemEx2({2,1,30344,nCount}, "ThÇn Tµi R­¬ng", "Than Tai Bao Ruong", "nhËn thµnh c«ng")
		gf_WriteLogEx("Than Tai Bao Ruong", "®æi thµnh c«ng", nCount, "Sè l­îng ThÇn Tµi R­¬ng")	
	end
end


function NangCapDieuDuong()
	do return 0 end 
	
	local tbSay = {
		"N©ng cÊp b»ng Thiªn M«n Kim LÖnh vµ trang bÞ H¹o NguyÖt/NangCapDieuDuong_CongThuc1_Form",
		"N©ng cÊp b»ng Thiªn M«n Kim LÖnh, Cæ Linh Ngäc vµ trang bÞ H¹o NguyÖt/NangCapDieuDuong_CongThuc2_Form",
	}
	Say("N©ng cÊp trang bÞ H¹o NguyÖt thµnh DiÖu D­¬ng", getn(tbSay), tbSay)
end


function NangCapDieuDuong_CongThuc1_Form()
	local szTitle = "N©ng cÊp trang bÞ H¹o NguyÖt thµnh DiÖu D­¬ng cÇn:\n- Nãn: 5 Thiªn M«n Kim LÖnh\n- ¸o: 6 Thiªn M«n Kim LÖnh\n- QuÇn: 7 Thiªn M«n Kim LÖnh\n- Trang søc: 6 Thiªn M«n Kim LÖnh\n- Vò KhÝ: 11 Thiªn M«n Kim LÖnh"
	local tbSay = {
		"Ta muèn n©ng cÊp/NangCapDieuDuong_CongThuc1",
		"Ta chØ ghÐ xem th«i/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end


function NangCapDieuDuong_CongThuc2_Form()
	local szTitle = "N©ng cÊp trang bÞ H¹o NguyÖt thµnh DiÖu D­¬ng cÇn:\n- Nãn: 3 Thiªn M«n Kim LÖnh, 500 Cæ Linh Ngäc\n- ¸o: 3 Thiªn M«n Kim LÖnh, 500 Cæ Linh Ngäc\n- QuÇn: 3 Thiªn M«n Kim LÖnh, 500 Cæ Linh Ngäc\n- Trang søc: 3 Thiªn M«n Kim LÖnh, 500 Cæ Linh Ngäc\n- Vò KhÝ: 6 Thiªn M«n Kim LÖnh, 1000 Cæ Linh Ngäc"
	local tbSay = {
		"Ta muèn n©ng cÊp/NangCapDieuDuong_CongThuc2",
		"Ta chØ ghÐ xem th«i/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end


function NangCapDieuDuong_CongThuc1()
	do return 0 end 
	
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", NANGCAPDIEUDUONG_F1, 1)
end


function NangCapDieuDuong_CongThuc2()
	do return 0 end 
	
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", NANGCAPDIEUDUONG_F2, 1)
end


function NangCapDieuDuong_NgocBoi()
	do return 0 end 
	
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", NANGCAPDIEUDUONG_NGOCBOI, 1)
end

function shop_uudai_thang32020(nChoose)
	local tCondition = { -- Thiªn cang lÖnh, Thiªn m«n kim lÖnh, vµng, id vËt phÈm
				[1] = {1 , {2,95,204}, 0 , {2,1,30370}, 3000	, {2, 201, 14, 1},"C­êng hãa v¨n søc +10"},
				[2] = {0 , {2,95,204}, 1 , {2,1,30370}, 3000	, {2, 201, 14, 1},"C­êng hãa v¨n søc +10"},
				[3] = {2 , {2,95,204}, 3 , {2,1,30370}, 0	  	, {2, 201, 16, 1},"C­êng hãa v¨n søc +15"},
				[4] = {17, {2,95,204}, 17, {2,1,30370}, 0		, {0, 105, 206,  1,1,-1,-1,-1,-1,-1,-1,-1},"B¹ch lang"},
				[5] = {22, {2,95,204}, 22, {2,1,30370}, 0		, {0, 105, 30033,1,1,-1,-1,-1,-1,-1,-1,-1},"ChiÕn t­îng"},
			}
			
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,95,204) < tCondition[nChoose][1] then
		Talk(1, "", g_szNpcName.."§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][1].." Thiªn Cang LÖnh.")
		return 0
	end
	if GetItemCount(2,1,30370) < tCondition[nChoose][3] then
		Talk(1, "",g_szNpcName.."§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][3].." Thiªn M«n Kim LÖnh.")
		return 0
	end
	if GetCash() < 	tCondition[nChoose][5]*10000 then
		Talk(1, "",g_szNpcName.."§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][5].." vµng.")
		return 0
	end
	local nHor = GetTask(701);
	local nTypeHor = GetTask(704);
	if nChoose == 5 then
		if abs(nHor) < 5000000  then
			Talk(1, "", g_szNpcName.."Ta chØ nhËn b¸n ChiÕn T­îng cho Nguyªn So¸i vµ cã c«ng tr¹ng tõ 5000000 ®iÓm trê lªn.");
			return 0
		end
		if abs(nTypeHor) < 6  then
			Talk(1, "", g_szNpcName.."Ta chØ nhËn b¸n ChiÕn T­îng cho Nguyªn So¸i vµ cã c«ng tr¹ng tõ 5000000 ®iÓm trê lªn!");
			return 0
		end
	end
	--****************
	if nChoose == 1 then
		if DelItem(2,95,204,tCondition[nChoose][1]) == 1 and Pay(tCondition[nChoose][5]*10000) == 1 then
			gf_AddItemEx2(tCondition[nChoose][6], tCondition[nChoose][7], "UU DAI THANG 3 2020 BK", tCondition[nChoose][7]);
			Talk(1, "", "Chóc mõng ®¹i hiÖp ®· n©ng cÊp thµnh c«ng trang bÞ "..tCondition[nChoose][8])	
			gf_WriteLogEx("UU DAI THANG 3 2020", "nhan", 1, tCondition[nChoose][7])
		end
	end
	if nChoose == 2 then
		if DelItem(2,1,30370,tCondition[nChoose][3]) == 1 and Pay(tCondition[nChoose][5]*10000) == 1 then
			gf_AddItemEx2(tCondition[nChoose][6], tCondition[nChoose][7], "UU DAI THANG 3 2020 BK", tCondition[nChoose][7]);
			Talk(1, "", "Chóc mõng ®¹i hiÖp ®· n©ng cÊp thµnh c«ng trang bÞ "..tCondition[nChoose][8])	
			gf_WriteLogEx("UU DAI THANG 3 2020", "nhan", 1, tCondition[nChoose][7])
		end
	end
	if nChoose == 3 or nChoose == 4 or nChoose == 5 then
		if DelItem(2,95,204,tCondition[nChoose][1]) == 1 and DelItem(2,1,30370,tCondition[nChoose][3]) == 1 then
			gf_AddItemEx2(tCondition[nChoose][6], tCondition[nChoose][7], "UU DAI THANG 3 2020 BK", tCondition[nChoose][7]);
			Talk(1, "", "Chóc mõng ®¹i hiÖp ®· n©ng cÊp thµnh c«ng trang bÞ "..tCondition[nChoose][8])	
			gf_WriteLogEx("UU DAI THANG 3 2020", "nhan", 1, tCondition[nChoose][7])
		end
	end

end

function change_KimXa7()
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,30370) < 19 then
		Talk(1, "",g_szNpcName.."§¹i hiÖp kh«ng mang ®ñ 19 Thiªn M«n Kim LÖnh.")
		return 0
	end
	if GetItemCount(2,95,204) < 19 then
		Talk(1, "", g_szNpcName.."§¹i hiÖp kh«ng mang ®ñ 19 Thiªn Cang LÖnh.")
		return 0
	end
	if GetItemCount(2,1,30687) < 1500 then
		Talk(1, "", g_szNpcName.."§¹i hiÖp kh«ng mang ®ñ 1500 Th¸i NhÊt LÖnh.")
		return 0
	end
	if DelItem(2,1,30370,19) == 1 and DelItem(2,95,204,19) == 1 and DelItem(2,1,30687,1500) == 1 then
		gf_AddItemEx2({2,1,31400,1}, "Tói trang bÞ Kim Xµ 7", "CHANGE KIM XA 7 BK", "Tói trang bÞ Kim Xµ 7");
		Talk(1, "", g_szNpcName.."Chóc mõng ®¹i hiÖp ®· ®æi thµnh c«ng Tói trang bÞ Kim Xµ 7")	
		gf_WriteLogEx("CHANGE KIM XA 7", "nhan", 1, "Tói Kim Xµ 7")
	end
end
function menu_tayluyenkimxa7()
	local tbSay = {}
	local szSayHead = g_szNpcName.."§¹i hiÖp muèn ®æi vËt phÈm tÈy luyÖn Kim Xµ 7 theo c¸ch nµo:"
	tinsert(tbSay,"§æi 1 TÈy T©m Th¹ch cÊp 7: cÇn 2 TÈy T©m Th¹ch cÊp 6 + 200 vµng/#change_tayluyenkimxa7(7)")
	tinsert(tbSay,"§æi 1 LuyÖn L« ThiÕt cÊp 7: cÇn 2 LuyÖn L« ThiÕt cÊp 6 + 200 vµng/#change_tayluyenkimxa7(8)")
	tinsert(tbSay,"§æi 1 Táa Linh Th¹ch cao(1) Kim Xµ 7: cÇn 2 Tô Linh QuyÕt + 2 linh th¹ch khãa(1)/#change_tayluyenkimxa7(1)")
	tinsert(tbSay,"§æi 1 Táa Linh Th¹ch cao(2) Kim Xµ 7: cÇn 2 Tô Linh QuyÕt + 2 linh th¹ch khãa(2)/#change_tayluyenkimxa7(2)")
	tinsert(tbSay,"§æi 1 Táa Linh Th¹ch cao(3) Kim Xµ 7: cÇn 2 Tô Linh QuyÕt + 2 linh th¹ch khãa(3)/#change_tayluyenkimxa7(3)")
	tinsert(tbSay,"§æi 1 Táa Linh Th¹ch cao(4) Kim Xµ 7: cÇn 2 Tô Linh QuyÕt + 2 linh th¹ch khãa(4)/#change_tayluyenkimxa7(4)")
	tinsert(tbSay,"§æi 1 Táa Linh Th¹ch cao(5) Kim Xµ 7: cÇn 2 Tô Linh QuyÕt + 2 linh th¹ch khãa(5)/#change_tayluyenkimxa7(5)")
	tinsert(tbSay,"§æi 1 Táa Linh Th¹ch cao(6) Kim Xµ 7: cÇn 2 Tô Linh QuyÕt + 2 linh th¹ch khãa(6)/#change_tayluyenkimxa7(6)")
	tinsert(tbSay,"Rêi khái/do_nothing")
	
	Say(szSayHead, getn(tbSay), tbSay)
end
function change_tayluyenkimxa7(nChoose)
local tCondition = { -- Tô linh quyÕt, linh th¹ch khãa, tÈy t©m th¹ch cÊp 6, luyÖn l« thiÕt cÊp 6, vµng, get item
				[1] = {2, {2,1,31248}, 2, {2,1,30904}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31391,1}, "táa linh thach cao 1"},
				[2] = {2, {2,1,31248}, 2, {2,1,30905}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31392,1}, "táa linh thach cao 2"},
				[3] = {2, {2,1,31248}, 2, {2,1,30906}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31393,1}, "táa linh thach cao 3"},
				[4] = {2, {2,1,31248}, 2, {2,1,30907}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31394,1}, "táa linh thach cao 4"},
				[5] = {2, {2,1,31248}, 2, {2,1,30908}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31395,1}, "táa linh thach cao 5"},
				[6] = {2, {2,1,31248}, 2, {2,1,30909}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31396,1}, "táa linh thach cao 6"},
				[7] = {0, {2,1,31248}, 0, {2,1,30908}, 2, {2,1,30526}, 0, {2,1,30532}, 200, {2,1,31402,1}, "TÈy T©m Th¹ch cÊp 7"},
				[8] = {0, {2,1,31248}, 0, {2,1,30909}, 0, {2,1,30526}, 2, {2,1,30532}, 200, {2,1,31401,1}, "LuyÖn L« ThiÕt cÊp 7"},
			}
			
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,31248) < tCondition[nChoose][1] then
		Talk(1, "", g_szNpcName.."§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][1].." Tô linh quyÕt.")
		return 0
	end
	if GetItemCount(2,1,tCondition[nChoose][4][3]) < tCondition[nChoose][3] then
		Talk(1, "",g_szNpcName.."§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][3].." Linh Th¹ch khãa "..nChoose..".")
		return 0
	end
	if GetItemCount(2,1,30526) < tCondition[nChoose][5] then
		Talk(1, "", g_szNpcName.."§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][5].." TÈy T©m Th¹ch cÊp 6.")
		return 0
	end
	if GetItemCount(2,1,30532) < tCondition[nChoose][7] then
		Talk(1, "", g_szNpcName.."§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][7].." LuyÖn L« ThiÕt cÊp 6.")
		return 0
	end
	if GetCash() < 	tCondition[nChoose][9]*10000then
		Talk(1, "",g_szNpcName.."§¹i hiÖp kh«ng mang ®ñ 200 vµng.")
		return 0
	end
	--*******************************
	if nChoose <= 6 then
		if DelItem(2,1,31248,2) == 1 and DelItem(2,1,tCondition[nChoose][4][3],2) == 1 then
			gf_AddItemEx2({2,1,31390 + nChoose,1}, tCondition[nChoose][11], "CHANGE TAY LUYEN KIM XA 7 BK", tCondition[nChoose][11]);
			Talk(1, "", g_szNpcName.."Chóc mõng ®¹i hiÖp ®· ®æi thµnh c«ng vËt phÈm "..tCondition[nChoose][11])	
			gf_WriteLogEx("CHANGE TAY LUYEN KIM XA 7", "nhan", 1, tCondition[nChoose][11])
		end
	end
	if nChoose == 7 then
		if DelItem(2,1,30526,tCondition[nChoose][5]) == 1 and Pay(tCondition[nChoose][9]*10000) == 1 then
			gf_AddItemEx2(tCondition[nChoose][10], tCondition[nChoose][11], "CHANGE TAY LUYEN KIM XA 7 BK", tCondition[nChoose][11]);
			Talk(1, "", g_szNpcName.."Chóc mõng ®¹i hiÖp ®· ®æi thµnh c«ng TÈy T©m Th¹ch cÊp 7")	
			gf_WriteLogEx("CHANGE TAY LUYEN KIM XA 7", "nhan", 1, tCondition[nChoose][11])
		end
	end
	if nChoose == 8 then
		if DelItem(2,1,30532,tCondition[nChoose][7]) == 1 and Pay(tCondition[nChoose][9]*10000) == 1 then
			gf_AddItemEx2(tCondition[nChoose][10], tCondition[nChoose][11], "CHANGE TAY LUYEN KIM XA 7 BK", tCondition[nChoose][11]);
			Talk(1, "", g_szNpcName.."Chóc mõng ®¹i hiÖp ®· ®æi thµnh c«ng LuyÖn L« ThiÕt cÊp 7")	
			gf_WriteLogEx("CHANGE TAY LUYEN KIM XA 7", "nhan", 1, tCondition[nChoose][11])
		end
	end
end


