Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\online\\viet_event\\top_server\\npc_top.lua");

nMAXPOINT = 100
TOPBANGHOI_FILENAME = "newserver_topbanghoi.txt"
LIB_txtData.szPattern = "[A-Za-z0-9¸µ¶·¹¡¾»¼½Æ¢ÊÇÈÉËEÐÌÎÏÑ£ÕÒÓÔÖãßáâä¤èåæçé¥íêëìîóïñòô¦øõö÷ùÝ×ØÜÞýúûüþ§¸µ¶·¹¨¾»¼½Æ©ÊÇÈÉËÐÌÎÏÑªÕÒÓÔÖãßáâä«èåæçé¬íêëìîóïñòô­øõö÷ùÝ×ØÜÞýúûüþ®_]"
szNpcName =  "<color=green>S¸t Hæ<color>: "
szLOGSERVERNAME = "SAT HO"
LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
LIB_Award.szLogAction = "nhËn"
DuaTopBangHoi_NhanThuongDate = 20200520
DuaTopBangHoi_EndDate = 20200518

tbCongHienBang_NguyenLieu = {
	[1] = {1, {item={{gdp={2,1,30230,1}}},nExp = 1000000}, "1 ®iÓm cèng hiÕn: tiªu hao 1.000.000 kinh nghiÖm, 1 xu"},
	[2] = {10, {item={{gdp={2,1,30230,10}}},nExp = 10000000}, "10 ®iÓm cèng hiÕn: tiªu hao 10.000.000 kinh nghiÖm, 10 xu"},
	[3] = {100, {item={{gdp={2,1,30230,100}}},nExp = 100000000}, "100 ®iÓm cèng hiÕn: tiªu hao 100.000.000 kinh nghiÖm, 100 xu"},
--	[4] = {1000, {nExp = 1000000000, nGold = 10000000}, "1000 ®iÓm cèng hiÕn: tiªu hao 1.000.000.000 kinh nghiÖm, 1000 vµng"},
}

function TopBangHoi_Menu()
	local nDate = tonumber(date("%Y%m%d"))
	local tbSay = {}
	if nDate <= DuaTopBangHoi_EndDate then
		tinsert(tbSay, "Ta muèn ®¨ng ký ®ua top cèng hiÕn bang héi/TopBangHoi_DangKy")
		tinsert(tbSay, "Ta muèn cèng hiÕn cho bang héi hïng m¹nh/TopBangHoi_CongHien_Menu")
	end
	tinsert(tbSay, "Xem ®iÓm cèng hiÕn cña bang héi/TopBangHoi_XemDiem")
--	tinsert(tbSay, "Xem danh s¸ch bang héi ®¨ng ký ®ua top")
	if nDate == DuaTopBangHoi_NhanThuongDate then
		tinsert(tbSay, "Thµnh viªn nhËn th­ëng bang héi h¹ng 1,2,3/#TopBangHoi_NhanThuong(1)")		--TSK_TT_VANGDANHTHIENHA_DUATOP: sö dông bit 11
		local nTongLevel = IsTongMember()
		if nTongLevel == 1 then
			tinsert(tbSay, "Bang chñ nhËn th­ëng bang héi h¹ng 1,2,3/#TopBangHoi_NhanThuong(2)")	--TSK_TT_VANGDANHTHIENHA_DUATOP: sö dông bit 10
		end
	end
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say("", getn(tbSay), tbSay)
end


function TopBangHoi_DangKy()
	--local tbMaterial = {item={{gdp={2,1,30490,10}, name="Hoµng Kim §¹i Ng©n PhiÕu"}}}
	local szTong = GetTongName()
	local szAcc = GetAccount()
	local nTongLevel = IsTongMember()
	local szRole = GetName()
	-- kiem tra Maxx Skill 55 va dang cap 81
	local nMaxSkill = CheckMaxSkill55()
	local nLevel = GetLevel();
	if nLevel <  90 then
		Talk(1,"",szNpcName.."§¼ng cÊp cña c¸c h¹ kh«ng ®ñ cÊp 90, kh«ng thÓ ®¨ng ký tham gia!")
		return 0
	end
	if nMaxSkill ~= 1 then
		Talk(1, "",szNpcName.."Kû n¨ng skill 55 cña c¸c h¹ ch­a ®ñ. NÕu muèn ®¨ng ký tham gia, h·y n©ng cÊp kû n¨ng cÊp 55 råi ®Õn gÆp ta.");
		return 0
	end
	if nTongLevel ~= 1 then
		Talk(1, "",szNpcName.."C¸c h¹ kh«ng ph¶i bang chñ. NÕu muèn ®¨ng ký tham gia, h·y mêi bang chñ c¸c h¹ ®Õn gÆp ta.");
		return 0
	end
	if LIB_txtData:CheckString(szTong) > 0 then
		Talk(1, "",szNpcName.."Tªn bang héi c¸c h¹ cã nhiÒu ch÷ l¹ qu¸, ta kh«ng biÕt ghi l¹i nh­ thÕ nµo n÷a. Hay lµ ®æi bang kh¸c ®i nhÐ.")
--		return 0
	end
	--local nCheck = 0
	--nCheck = LIB_Award:CheckMaterial(tbMaterial)
	--if nCheck ~= 1 then
	--	return 0
	--end
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nCheckTongName = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheckTongName = i
			break
		end
	end
	if nCheckTongName > 0 then
		Talk(1,"",szNpcName.."Bang héi c¸c h¹ ®· ®¨ng ký thµnh c«ng, kh«ng cÇn ®¨ng ký thªm lÇn n÷a.")
		return 0
	end
	--LIB_Award:PayMaterial(tbMaterial)
	local szLogAward = szTong.."	"..szAcc.."	"..szRole.."	0"
	local nResult = LIB_txtData:AddLine(szLogAward)
	Talk(1,"",szNpcName.."Bang héi c¸c h¹ b¸o danh thµnh c«ng vµo cuéc ®ua vinh danh bang héi danh gi¸ , h·y b¸o tin cho c¸c thµnh viªn tÝch cùc x©y dùng danh tiÕng bang héi.")
	gf_WriteLogEx(szLogTitle, "nhËn", 1, "§¨ng ký thµnh c«ng")
end


function TopBangHoi_CongHien_Menu()
	local szTong = GetTongName() or ""
	if szTong == "" then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã trong danh s¸ch bÊt kú bang nµo. H·y t×m chç gia nhËp tr­íc ®· nhÐ.")
		return 0
	end
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nCheckTongName = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheckTongName = i
			break
		end
	end
	if nCheckTongName == 0 then
		Talk(1,"",szNpcName.."Bang héi c¸c h¹ kh«ng cã trong danh s¸ch ®¨ng ký vinh danh.")
		return 0
	end
	local tbSay = {}
	for i=1,getn(tbCongHienBang_NguyenLieu) do
		tinsert(tbSay, tbCongHienBang_NguyenLieu[i][3].."/#TopBangHoi_CongHien_Done("..i..")")
	end
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say(szNpcName.."§«ng ng­êi thªm søc m¹nh. Ng­¬i h·y cèng hiÕn cho bang héi b»ng hÕt kh¶ n¨ng m×nh cã.", getn(tbSay), tbSay)
end


function TopBangHoi_CongHien_Done(nOption)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Tr¹ng th¸i hiÖn t¹i kh«ng thÓ cèng hiÕn.")
		return
	end	
	-- kiem tra Maxx Skill 55 va dang cap 81
	local nMaxSkill = CheckMaxSkill55()
	local nLevel = GetLevel();
	if nLevel <  90 then
		Talk(1,"",szNpcName.."§¼ng cÊp cña c¸c h¹ kh«ng ®ñ 90, kh«ng thÓ tham gia cèng hiÕn!")
		return 0
	end
	if nMaxSkill ~= 1 then
		Talk(1, "",szNpcName.."Kû n¨ng skill 55 cña c¸c h¹ ch­a ®ñ. NÕu muèn ®¨ng ký tham gia, h·y n©ng cÊp kû n¨ng cÊp 55 råi ®Õn gÆp ta.");
		return 0
	end
	local szName = GetName()
	local szTong = GetTongName() or ""
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbCongHienBang_NguyenLieu[nOption][2])
	if nCheck == 0 then
		return 0
	end
	local nPoint = VNG_GetTaskPos(TSK_CONGHIENBANG, 4,1)
	if (nPoint + tbCongHienBang_NguyenLieu[nOption][1]) > nMAXPOINT then
		Talk(1,"",szNpcName.."Møc cèng hiÕn ng­¬i chän v­ît qu¸ sè ®iÓm tèi ®a mçi ngµy. H·y chän møc kh¸c hoÆc mai quay l¹i nhÐ.")
		return 0
	end
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nBang = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nBang = i
			break
		end
	end
	if nBang == 0 then
		return 0
	end
	LIB_Award:PayMaterial(tbCongHienBang_NguyenLieu[nOption][2])
	VNG_SetTaskPos(TSK_CONGHIENBANG, (nPoint + tbCongHienBang_NguyenLieu[nOption][1]), 4, 1)
	LIB_txtData.tbTextData[nBang][4] = LIB_txtData.tbTextData[nBang][4] + tbCongHienBang_NguyenLieu[nOption][1]
	sort(LIB_txtData.tbTextData, function(x,y) return tonumber(x[4]) > tonumber(y[4]) end)
	LIB_txtData:SaveMultiColumn()
	if tbCongHienBang_NguyenLieu[nOption][1] == 100 then
	AddGlobalNews(szName.." ®· cèng hiÕn 100 ®iÓm cho bang ".. szTong ..". M¹nh Th­êng Qu©n ®· xuÊt hiÖn t¹i bang "..szTong..".")
		--AddGlobalNews(szName.." ®· cèng hiÕn 10 ®iÓm cho bang ".. szTong .." thËt ®¸ng ng­ìng mé.")
	--elseif tbCongHienBang_NguyenLieu[nOption][1] == 100 then
	--	AddGlobalNews(szName.." ®· cèng hiÕn 100 ®iÓm cho bang ".. szTong ..". M¹nh Th­êng Qu©n ®· xuÊt hiÖn t¹i bang "..szTong..".")
	end
	local nNewRank = 10000
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nNewRank = i
			break
		end
	end
	if nBang >= nNewRank then
		if LIB_txtData.tbTextData[(nNewRank+1)] ~= nil then
			AddGlobalNews(szName.." ®· gióp bang héi "..LIB_txtData.tbTextData[nNewRank][1].." v­ît qua bang héi "..LIB_txtData.tbTextData[(nNewRank+1)][1]..". D­êng nh­ bang "..LIB_txtData.tbTextData[(nNewRank+1)][1].." cã biÓu hiÖn ®uèi søc.")
		end
	end
	Msg2Player("B¹n ®· cèng hiÕn "..tbCongHienBang_NguyenLieu[nOption][1].." cho bang héi.")
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogaction, 1, "Cèng hiÕn "..tbCongHienBang_NguyenLieu[nOption][1].." ®iÓm")
	TopBangHoi_CongHien_Menu()
end


function TopBangHoi_XemDiem()
	local tbData = {}
	tinsert(tbData,szNpcName.."KÕt qu¶ hiÖn t¹i:\n")
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	for i=1,getn(LIB_txtData.tbTextData) do
		local nIndex = floor(i/10)+1
		if tbData[nIndex] == nil then
			tinsert(tbData, szNpcName.."KÕt qu¶ hiÖn t¹i:\n")
		end
		tbData[nIndex] = tbData[nIndex] .. i.." - ".."<color=yellow>"..LIB_txtData.tbTextData[i][1].."<color>: <color=red>"..LIB_txtData.tbTextData[i][4].." ®iÓm<color>\n"
	end
	for i=1, getn(tbData) do
		Talk(1,"",tbData[i])
	end
end


function TopBangHoi_NhanThuong(nOption)
	local szTong = GetTongName() or ""
	if szTong == "" then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a gia nhËp bang héi, kh«ng thÓ nhËn th­ëng.")
		return 0
	end
	if nOption == 1 then
		if GetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),11) == 1 then	--Sö dông Bit 11 cho thµnh viªn vµ 10 cho bang chñ
			Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng thµnh viªn råi, kh«ng thÓ nhËn thªm lÇn n÷a.")
			return 0
		end
	elseif nOption == 2 then
		if GetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),10) == 1 then	--Sö dông Bit 11 cho thµnh viªn vµ 10 cho bang chñ
			Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng Bang chñ råi, kh«ng thÓ nhËn thªm lÇn n÷a.")
			return 0
		end
	end
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nCheckTongName = 10000
	local nDiemCongHien = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheckTongName = i
			nDiemCongHien =  LIB_txtData.tbTextData[i][4]
			break
		end
	
	end
	
	-- local nConditionRank = 10000

	-- if max(tonumber(nDiemCongHien) >= 180000 then
		-- nConditionRank = 1
	-- elseif tonumber(nDiemCongHien) >= 175000 then
		-- nConditionRank = 2
	-- elseif tonumber(nDiemCongHien) >= 160000 then
		-- nConditionRank = 3
	-- else
		-- nConditionRank = 4
	-- end
	
	if tonumber(nDiemCongHien) < 150000 then
		Talk(1,"",szNpcName.."§iÓm cèng hiÕn kh«ng ®ñ 150000 kh«ng thÓ nhËn th­ëng ®ua top.")
		return 0
	end
		
	-- nCheckTongName = min(nCheckTongName,nConditionRank)
	if nOption == 1 then
		if nCheckTongName <= 3 then
			TopBangHoi_NhanThuong_ThanhVien(nCheckTongName)
		else
			Talk(1,"",szNpcName.."Bang héi c¸c h¹ kh«ng cã trong danh s¸ch nhËn th­ëng.")
		end
	elseif nOption == 2 then
		if nCheckTongName <= 3 then
			TopBangHoi_NhanThuong_BangChu(nCheckTongName)
		else
			Talk(1,"",szNpcName.."Bang héi c¸c h¹ kh«ng cã trong danh s¸ch nhËn th­ëng.")
		end
	end
end


function TopBangHoi_NhanThuong_ThanhVien(nRank)
	if gf_Judge_Room_Weight(20, 300) == 0 then
		Talk(1,"", szNpcName.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
--	if VNG_GetTaskPos(TSK_CONGHIENBANG,5,5) == 1 then
	if GetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),11) == 1 then	--Sö dông Bit 11 cho thµnh viªn vµ 10 cho bang chñ
		Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng thµnh viªn råi, kh«ng thÓ nhËn thªm lÇn n÷a.")
		return 0
	end
	
	local nChuyenSinh = 5	--gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	local nLevel = (nChuyenSinh + nPhucSinh)*100 + GetLevel()				
	if nLevel <  790 then
		Talk(1,"",szNpcName.."§¼ng cÊp cña c¸c h¹ kh«ng ®ñ nhËn th­ëng!")
		return 0
	end
	
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(1*24*3600));
	if nDayCount <=  1 then
		Talk(1,"",szNpcName.."Thêi gian gia nhËp cña c¸c h¹ Ýt h¬n 1 ngµy, kh«ng thÓ nhËn th­ëng!")
		return 0
	end
--	VNG_SetTaskPos(TSK_CONGHIENBANG, 1, 5, 5)
	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),11,1));
	local tbAward1 = {
		item = {
			{gdp={2,1,30912,4000,4}}, -- hiÖp nghÜa chi chøng
			{gdp={2,1,30913,180,4}}, -- ®ång tÕ chi nguyÖn
--			{gdp={2,1,30612,200,4}}, -- ThiÕt tinh cÊp 4
			{gdp={2,1,1113,1,4}, nExpired=7*24*3600}, -- §¹i §Þnh Hån
			{gdp={0,105,164,1,4,-1,-1,-1,-1,-1,-1,-1}}, -- Háa Hå
			{gdp={2,22,100+6, 2}}, -- ®¸ quÝ 6
			{gdp={2,22,200+6, 2}}, -- ®¸ quÝ 6
			{gdp={2,22,300+6, 2}}, -- ®¸ quÝ 6
			{gdp={2,22,400+6, 2}}, -- ®¸ quÝ 6
		},
--		nExp = 200000000,
	}
	
	local tbAward2 = {
		item = {
			{gdp={2,1,30912,3000,4}}, -- hiÖp nghÜa chi chøng
			{gdp={2,1,30913,120,4}}, -- ®ång tÕ chi nguyÖn
--			{gdp={2,1,30612,150,4}}, -- ThiÕt tinh cÊp 4
			{gdp={2,1,1113,1,4}, nExpired=7*24*3600}, -- §¹i §Þnh Hån
			{gdp={0,105,164,1,4,-1,-1,-1,-1,-1,-1,-1}}, -- Háa Hå
			{gdp={2,22,100+6, 1}}, -- ®¸ quÝ 6
			{gdp={2,22,200+6, 1}}, -- ®¸ quÝ 6
			{gdp={2,22,300+6, 1}}, -- ®¸ quÝ 6
			{gdp={2,22,400+6, 1}}, -- ®¸ quÝ 6
		},
--		nExp = 100000000,
	}
	
	local tbAward3 = {
		item = {
			{gdp={2,1,30912,1500,4}}, -- hiÖp nghÜa chi chøng
			{gdp={2,1,30913,80,4}}, -- ®ång tÕ chi nguyÖn
--			{gdp={2,1,30612,100,4}}, -- ThiÕt tinh cÊp 4
			{gdp={2,1,1113,1,4}, nExpired=7*24*3600}, -- §¹i §Þnh Hån
			{gdp={0,105,164,1,4,-1,-1,-1,-1,-1,-1,-1}}, -- Háa Hå
			{gdp={2,22,100+5, 2}}, -- ®¸ quÝ 5
			{gdp={2,22,200+5, 2}}, -- ®¸ quÝ 5
			{gdp={2,22,300+5, 2}}, -- ®¸ quÝ 5
			{gdp={2,22,400+5, 2}}, -- ®¸ quÝ 5
		},
--		nExp = 80000000,
	}
	tbAward = {
		[1] = tbAward1,
		[2] = tbAward2,
		[3] = tbAward3,
	}
	
	LIB_Award:Award(tbAward[nRank])
	
	Talk(1,"",szNpcName.."NhËn thµnh c«ng phÇn t­ëng dµnh cho thµnh viªn bang h¹ng "..nRank)
	gf_WriteLogEx("TOP BANG HOI THANH VIEN", "thµnh c«ng", 1, "PhÇn th­ëng thµnh viªn bang héi h¹ng "..nRank)
end


function TopBangHoi_NhanThuong_BangChu(nRank)
	local nBody = GetBody()
	if gf_Judge_Room_Weight(20, 300) == 0 then
		Talk(1,"", szNpcName.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
--	if VNG_GetTaskPos(TSK_CONGHIENBANG,6,6) == 1 then
	if GetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),10) == 1 then	--Sö dông Bit 11 cho thµnh viªn vµ 10 cho bang chñ
		Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng bang chñ råi, kh«ng thÓ nhËn thªm lÇn n÷a.")
		return 0
	end
	local nTongLevel = IsTongMember()
	if nTongLevel ~= 1 then
		Talk(1, "",szNpcName.."C¸c h¹ kh«ng ph¶i bang chñ. NÕu muèn nhËn th­ëng, h·y mêi bang chñ c¸c h¹ ®Õn gÆp ta.");
		return 0
	end
	
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if (nNow - nLastAssignTime) < (7*24*3600)   then
		Talk(1,"",szNpcName.."Thêi gian t¹i vÞ cña c¸c h¹ Ýt h¬n 7 ngµy, kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP BANG HOI SERVER"..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
--	VNG_SetTaskPos(TSK_CONGHIENBANG, 1, 6, 6)
	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),10,1));	
	if nRank == 1 then
		--Thªm trang bÞ Thanh Long --AddTrangBiHoaPhungTuongQuan(0,0)
--		AddTrangBiThanhLongTuongQuan(0,0)
		AddTrangBiUyHoTuongQuan(0,0)
		TraoMatTichCaoCap20(7)
		local tbAward = {item={{gdp={0,105,30029,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
											{gdp={2,22,100+6, 1}}, -- ®¸ quÝ 6
											{gdp={2,22,200+6, 1}}, -- ®¸ quÝ 6
											{gdp={2,22,300+6, 1}}, -- ®¸ quÝ 6
											{gdp={2,22,400+6, 1}}, -- ®¸ quÝ 6	
												}}
		LIB_Award:Award(tbAward)
	elseif nRank == 2 then
--		AddTrangBiHoaPhungTuongQuan(13,0)
		AddTrangBiThanhLongTuongQuan(10,0)
		TraoMatTichCaoCap20(5)
		local tbAward = {item={{gdp={0,105,30026,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
											{gdp={2,22,100+6, 1}}, -- ®¸ quÝ 6
											{gdp={2,22,200+6, 1}}, -- ®¸ quÝ 6
											{gdp={2,22,300+6, 1}}, -- ®¸ quÝ 6
											{gdp={2,22,400+6, 1}}, -- ®¸ quÝ 6	
										}}
		LIB_Award:Award(tbAward)
--		TraoLoiHoTuongQuan(13)	
--		Receive_KimXa(10,nRank)		
	elseif nRank == 3 then
--		AddTrangBiHoaPhungTuongQuan(0,0)
		AddTrangBiThanhLongTuongQuan(0,0)
		local tbAward = {item={{gdp={0,105,30026,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
											{gdp={2,22,100+6, 1}}, -- ®¸ quÝ 6
											{gdp={2,22,200+6, 1}}, -- ®¸ quÝ 6
											{gdp={2,22,300+6, 1}}, -- ®¸ quÝ 6
											{gdp={2,22,400+6, 1}}, -- ®¸ quÝ 6	
										}}
		LIB_Award:Award(tbAward)
--		TraoMatTichCaoCap20(3)	
--		Receive_KimXa(7,nRank)	
	end
	
	Talk(1,"",szNpcName.."NhËn thµnh c«ng phÇn t­ëng dµnh cho bang h¹ng "..nRank)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogaction, 1, "PhÇn th­ëng bang chñ bang héi h¹ng "..nRank)
end

function Receive_KimXa(nLevel,nRank)
	local tbSay = {}		
		tinsert(tbSay,"Ta muèn nhËn trang bÞ Kim Xµ V©n Du/#Receive_KimXa_01(1,"..nLevel..","..nRank..")")
		tinsert(tbSay,"Ta muèn nhËn trang bÞ Kim Xµ ThiÕt HuyÕt/#Receive_KimXa_01(2,"..nLevel..","..nRank..")")
		tinsert(tbSay,"Ta muèn nhËn trang bÞ Kim Xµ Du HiÖp/#Receive_KimXa_01(3,"..nLevel..","..nRank..")")
		Say(strNpcName.."C¸c h¹ h·y lùa chän 1 trong 3 bé trang bÞ Kim Xµ: ",getn(tbSay),tbSay)
end

function Receive_KimXa_01(nChoice,nLevel,nRank)	
	local	tbKimXaVanDu = {
		item = {
			{gdp={0,153,28,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Huy Ch­¬ng V©n Du"},
			{gdp={0,152,28,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="¸o Choµng V©n Du"},
			{gdp={0,154,28,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="§¹o Hµi V©n Du"},
		}
	}
		
	local tbKimXaThietHuyet = {
		item = {
			{gdp={0,153,27,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Huy Ch­¬ng ThiÕt HuyÕt"},
			{gdp={0,152,27,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="¸o Choµng ThiÕt HuyÕt"},
			{gdp={0,154,27,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="§¹o Hµi ThiÕt HuyÕt"},
		}
	}
	
	local tbKimXaDuHiep = {
		item = {
			{gdp={0,153,26,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Huy Ch­¬ng Du HiÖp"},
			{gdp={0,152,26,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="¸o Choµng Du HiÖp"},
			{gdp={0,154,26,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="§¹o Hµi Du HiÖp"},
		}
	}	
	
	if nChoice  == 1 then
		LIB_Award:Award(tbKimXaVanDu)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ V©n Du")
	elseif nChoice == 2 then
		LIB_Award:Award(tbKimXaThietHuyet)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ ThiÕt HuyÕt")
	elseif nChoice == 3 then
		LIB_Award:Award(tbKimXaDuHiep)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ Du HiÖp")
	end	
	
	if nRank == 3 then
		receive_DieuDuong_Top1_faction_01(0,1)
	end
end
