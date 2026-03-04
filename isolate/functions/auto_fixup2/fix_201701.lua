--ÐÞ¸´Ë¢ÈÙÓþ°ïÅÉ±¦Ïä²ú³öµÄ°×¾ÔÍè ÁùÉñÍè ÈýÇåÍè
Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\misc\\taskmanager.lua")
t_Fix_201701 = {
	nTimeLine = 20170119,
	--tMap = {},
	t_Black_list = {
    --	{"account", "role"},
--        {"minisakano1", "oo0LinhMiu0oo"},
--        {"ngockutekute5", "iNMKzQueenBeezz"},
--        {"ngaxinh20109x", "ThoBuffZziiiBh"},
--        {"loveyoumylove619", "oIoDevillDeath"},
--        {"huynhminhthuan2015", "oBackleBo"},
--        {"hoangut2", "iiovzZZombie"},
--        {"duybv1979", "TAHzHaNoiBuon"},
--        {"khanhhoi187", "iozNhoVeEmHT3"},
--        {"mrminhnguyen1210", "oStTieuTuDaTinh0"},
--        {"hoaphuong58", "ThoXinhziiioZ"},
--        {"minhnguyen121083", "Ki?mMaT1T¨¨n2010"},
--        {"ngudocdetulk", "MuaRoiLangTham"},
--        {"quakhuvaanh0001", "iozLeeLeeioz"},
--        {"vcoinlk2012", "jxGhost"},
--        {"nhoccobac1989", "GreenyRose"},
--        {"mrminhnguyen007", "ostLinDaNguyenzx"},
--        {"nuanhhung1210", "ioZBuffThueffBH"},
--        {"servervanlong", "zTNzNhanTaiViet"},
--        {"0947781411", "LzLayVoNguoiTa"},
--        {"heotimheo2013", "IzLayChongNhoBan"},
--        {"tadocchuyendung", "iDocNayYHocBoTay"},
--        {"hanhanloveoxvn", "TAHzYangBee"},
--        {"huynhminhthuann2015", "02Backle02"},
--        {"nguyenthianhthu1995", "IzAudiR8zI"},
--        {"ngocvan123588", "aaaa12"},
--        {"lapsonlavippc", "UCHvItachi"},
--        {"lamnhathuy19942012", "TheKingPk"},
--        {"bomaylao006", "cuichuicuibap"},
--        {"thitxongkhoi1002", "zKungFuPanda"},
--        {"longhotranhhungbsdn1234", "NhutCaNa"},
--        {"tlq2901", "CuuAnThit"},
--        {"anhtrungkaka434", "zzzAnhTrungzzz"},
--        {"luongbenhdi05", "1TienHaSongDieu2"},
--        {"xusothantien261993", "SPzGauSieuNhanII"},
--        {"likapkthuphucyeuma", "CkChieuVkDuc"},
--        {"loveyoumylove2016", "oIoS?tTh?M¨®aQu1t"},
--        {"nhokyumi95", "zS2zKhanhLinho0o"},
--        {"duynht", "iZLamborghiniZi"},
--        {"nguyenthianhmi1986", "zS2AnhNg0k"},
--        {"anh_hung2030", "iiizNoBiTaz"},
--        {"xadixidaradi2109", "DuLongKh?ch"},
--        {"loveover1002", "iiiSiauM¨®aC¨¦t"},
--        {"tranduytanbkv", "phongthanhduong"},
--        {"ngamidanpro91", "iIRvS2GcIi"},
--        {"bictim", "haviet05"},
--        {"nguyenthanhtu62", "PhiMonAnh"},
--        {"doremonbame", "VanTieuDoatMenh"},
--        {"bunpoquakhu", "S2V¨°Kh¨®cS2"},
--        {"haosacdaisutxbt1", "T31110T3"},
--        {"wakeup229", "ALiSuSu"},
--        {"iloveyouxxxyyy", "oTheSilent0fLove"},
--        {"lamtieuphuong199882", "s2MrKeniiAmSoHot"},
--        {"caothanhthuy1990kg", "accposttl2"},
--        {"hohuynhhieu221267", "DGCCodon"},
--        {"ngamy19892016", "MinionNgaMy"},
--        {"volam112233166", "zzFBxGoodCity"},
--        {"nguyenhuunguyen6898", "ZT3ZzTi¨®uSiauChu"},
--        {"volamquan0030", "Ngh¨¬oV¡ÁGame"},
--        {"thoreal97", "ThoReal"},
--        {"dandutday1607", "HoangLamQuanchua"},
--        {"doideoyeu113", "st0oKimHaNao0"},
--        {"tuyetvahoa", "iiBichPhuong"},
--        {"mayantaodi_1", "vinh01"},
--        {"marcjac0bs1991", "JAVzThichToaSang"},
--        {"nghiavanduy", "zJameMoss"},
--        {"anhchangkho3999", "zTAEzNoBiTaS2"},
--        {"bunkorea90", "zNYzPinkSkyo0o"},
--        {"doncbvn2", "DKzTieuSieuChuoi"},
--        {"npcemhdacxtmlx", "izPeMap"},
--        {"canstopnt", "PexyPonggon"},
--        {"taisaozayem2012", "zzLHHzSauTatCa"},
--        {"designhb", "Jx2Trung1102"},
--        {"anahondass", "TaYUnha"},
--        {"truongvanbe1981", "iissBabyGirl1102"},
--        {"laysay987", "LoLzCh¨®Ti¨®uzLoL"},
--        {"tannernguyen2710", "zzDieuNhi"},
--        {"hoanghaitrung0804", "IPeNgheoKuT3"},
--        {"leminhtri2961996", "s2iiiSadMemories"},
--        {"whatalife000702", "iiZzLamTieuDiep"},
--        {"nguyenthikimquyen147", "malanhthien"},
--        {"nhaunhan", "SpoGoodSpeed"},
--        {"titanquest229", "ALiSuShi"},
--        {"nhatphienbangtam147", "nhatphienbangtam"},
--        {"ducoshirma", "JameNico215"},
--        {"volam2432371", "TenEmLagi"},
--        {"tunglatuoitho06", "0ooChangameoo0"},
--        {"duyprovt195", "MrNguy?nDuy"},
--        {"hieuhuyen3101", "oS2oKimThanLong"},
--        {"honghoatientu2007", "ThoTrangZiiizBH"},
--        {"duongmonnguyetung", "SakerFreedom01"},
--        {"nguyendinhphuctk3000", "PC2TongThiennKy"},
--        {"huhu339", "zKzBurberry"},
--        {"conlonnguyetung", "SakerFreedom1"},
--        {"gaoblue01", "NMKxFiora"},
--        {"boyzjn9x9x9x", "oIKh?ngKhaiIo"},
--        {"toanphuong023", "PHzMaiYeu"},
--        {"duytuan0935569355", "0oBanChanViet0o"},
--        {"khocchoniemdau", "BHzXvipXz"},
--        {"lordofthekjng1", "zLordOfTheKings"},
--        {"lamkg1980", "BuBuMapZiiizBH"},
--        {"duongprons555", "NsFxduongkillerx"},
--        {"mayantaodi_11", "o0ongud0co0o"},
--        {"nguyenhuunguyen6890", "T3zYeuSinhLyoo"},
--        {"nguyenhuyenanh34", "iiizXuKaz"},
--        {"toandieuls5", "S?i¡ì?n¡ì¨¦c"},
--        {"letrung191993", "Ng¦ÌnKu¡ì?mM¨¢iM?t"},
--        {"duongmonnguyetung1", "SakerFreedom001"},
--        {"hoanghaitrungw", "S2zzThatTinhBuon"},
--        {"nguyendinhphuctk2000", "Pc2DongYiYiYi"},
--        {"nguyendinhphuctk1000", "Pc2TongThienGiag"},
--        {"trungquan0026", "SoLoBacTrungNam"},
--        {"thienhadenhat12345pt", "ZzthienlanzZZ"},
--        {"vittappk", "izVitNhi"},
--        {"volam112233165", "JxHQ1Moons"},
--        {"hangho1995", "zzNHPzSauTatCa"},
--        {"lekietlevan", "SrTieuLongNhi"},
--        {"tklenh01", "ioizZzKieuNhi"},
--        {"ngamydan19892016", "MinionLaEm"},
--        {"superman01091992", "xxHaiLamTuongVi"},
--        {"hoangdo007", "GCzChiPheo"},
--        {"huungoc1970km", "Jx2SatThuKiem"},
--        {"gara0t0nguyen", "zIztieuthuyetty"},
--        {"hungpronmd", "iZzBHoziLanNhi"},
--        {"toandieuls91", "C?mX¨®cD?ngTr¦Ìo"},
--        {"lizziecarol", "zS2zHyugaHinata1"},
--        {"06huyen161195", "NgocOanhTeamNmk"},
--        {"denhieu2013", "zDNzEmXinCanTeam"},
--        {"huetrang11556", "ioizZzHueNhi"},
--        {"mayantaodi_1994", "cunbayby"},
--        {"zztinhtangzz", "¡ìaT¡ÁnhC?N-?ng"},
	},

T_CK_TASK_LIST = {
	--{enable, name,{condition,desc},{exp,score,exaward_func,ext_rate},{task_index,task_bit_get,task_bit_finish|func_check_finish,task_bit_award}}
	--°ÙÕ½²»´ù Èý·½ÊÆÁ¦ÈÎÎñ
	[1101] = {0, "VËn tiªu", {"Hoµn thµnh 1 lÇn nhiÖm vô vËn tiªu", "§Õn b¶n ®å thÕ lùc chç NPC Tiªu §Çu TrÊn ViÔn Tiªu Côc ®Ó nhËn nhiÖm vô vËn tiªu"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 1, 2, 3}},
	[1102] = {0, "C­íp tiªu", {"Hoµn thµnh 1 lÇn nhiÖm vô c­íp tiªu", "§Õn b¶n ®å thÕ lùc chç NPC Tiªu §Çu TrÊn ViÔn Tiªu Côc ®Ó nhËn nhiÖm vô ®o¹t tiªu"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 4, 5, 6}},
	[1103] = {0, "Thu thËp Ngäc Ph¸ch", {"Thu thËp 1 Ngäc Ph¸ch", "§Õn Th¸i H­ Cæ Thô cña thÕ lùc trång 1 h¹t gièng, thu thËp 1 Ngäc Ph¸ch"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 7, 8, 9}},
	[1104] = {0, "Trém Ngäc Ph¸ch", {"§Õn thÕ lùc kh¸c trém 1 Ngäc Ph¸ch", "Vµo b¶n ®å thÕ lùc kh¸c ®Ó trém 1 Ngäc Ph¸ch"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 10, 11, 12}},
	[1105] = {0, "T©y Vùc TruyÒn §¹o", {"Tham gia tÝnh n¨ng T©y Vùc TruyÒn §¹o, nhÊp vµo 3 th¸nh vËt ®Ó nhËn th­ëng", "Vµo b¶n ®å thÕ lùc tham gia tÝnh n¨ng T©y Vùc TruyÒn §¹o, nhÊp vµo 3 th¸nh vËt ®Ó nhËn th­ëng"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 13, 14, 15}},
	[1106] = {0, "BOSS ThÕ Lùc", {"NhËn b¶o vÖ BOSS cña thÕ lùc vµ tiªu diÖt BOSS cña thÕ lùc phe ®Þch ®Ó nhËn ®­îc phÇn th­ëng", "Buæi tèi sÏ xuÊt hiÖn BOSS cña thÕ lùc phe ta hoÆc phe ®Þch, b¶o vÖ BOSS cña phe ta vµ tiªu diÖt BOSS cña phe ®Þch sÏ nhËn ®­îc phÇn th­ëng"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 16, 17, 18}},
	[1107] = {0, "Thî S¨n TiÒn Th­ëng", {"Hoµn thµnh 1 lÇn nhiÖm vô Thî S¨n TiÒn Th­ëng", "Hoµn thµnh 1 lÇn nhiÖm vô Thî S¨n TiÒn Th­ëng"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 19, 20, 21}},
	[1108] = {0, "NhiÖm vô §µo Kho B¸u", {"Hoµn thµnh 1 lÇn nhiÖm vô §µo Kho B¸u", "Vµo thÕ lùc nhËn 1 Tµng B¶o §å, hoµn thµnh 1 lÇn nhiÖm vô §µo Kho B¸u"}, {5000000, 18, nil, CK_EXT_AWARD}, {8, 22, 23, 24}},
	
	--°ÙÕ½²»´ù ¸±±¾ÈÎÎñ
--	[1201] = {},
--	[1202] = {},
--	[1203] = {},
--	[1204] = {},
--	
--	--°ÙÕ½²»´ù PvPÈÎÎñ
--	[1301] = {},
--	[1302] = {},
--	[1303] =  {0, "Èý·½ÊÆÁ¦pk", {"´ò°ÜÆäËûÊÆÁ¦µÄ1Î»µÐ¶ÔÍæ¼Ò", "É±ËÀµÐ¶ÔÊÆÁ¦µÄ1ÃûÍæ¼Ò£¬Ö¤Ã÷ÄãµÄÄÜÁ¦£¡"}, {8000000, 24}, {8, 25, 26, 27}},
--	[1304] = {},
--	[1305] = {},
--	[1306] = {},
--	[1307] = {},
	
	--ËÙÕ½ËÙ¾ö °ï»áÈÎÎñ
	[2101] = {0, "Gia nhËp bang héi", {"Gia nhËp mét bang héi bÊt kú, trë thµnh mét thµnh viªn trong bang", "Gia nhËp bang héi, cïng víi thµnh viªn kh¸c cè g¾ng ®Ó gióp bang héi ngµy cµng lín m¹nh"}, {3000000, 100}, {9, 0, _ck_check_tong, 1}},
	[2102] = {0, "T¸i chiÕn ThÇn Thó", {"Nép 300 ®iÓm tÝch lòy tö quang (Sau khi giao nhiÖm vô th× hai bªn sÏ bÞ trõ 300 ®iÓm tÝch lòy tö quang)", "ChØ cã ng­¬i míi cã thÓ thuÇn phôc Tö Quang ThÇn Thó!"}, {5000000, 100, _ck_del_300_ziguangjifen}, {9, 0, _ck_check_300_ziguangjifen, 2}},
	[2103] = {0, "Nép ®iÓm cèng hiÕn bang héi", {"Tham gia tÝnh n¨ng Bang Héi Vinh Danh, giao nép 10 ®iÓm cèng hiÕn bang héi", "Tham gia tÝnh n¨ng Bang Héi Vinh Danh, giao nép 10 ®iÓm cèng hiÕn bang héi"}, {8000000, 100}, {9, 0, 3, 4}},
	[2104] = {0, "NhËn phÇn th­ëng Bang Héi Vinh Danh", {"NhËn phÇn th­ëng Bang Héi Vinh Danh", "Tham gia tÝnh n¨ng Bang Héi Vinh Danh vµ nhËn phÇn th­ëng"}, {10000000, 300}, {9, 0, 5, 6}},
	
	[2201] = {0, "ThÎ Th¸ng", {"KÝch ho¹t 1 thÎ th¸ng", "KÝch ho¹t thÎ th¸ng, ch¬i trß ch¬i nhÑ nhµng h¬n"}, {5000000, 1200}, {10, 0, _ck_check_yueka, 1}},
	[2202] = {0, "Gia nhËp thÕ lùc", {"Gia nhËp 1 thÕ lùc trong ba phe", "Gia nhËp 1 thÕ lùc trong ba phe"}, {5000000, 300}, {10, 0, _ck_check_shili, 2}},
	[2203] = {0, "VËn tiªu", {"Hoµn thµnh 1 lÇn vËn tiªu", "Vµo thÕ lùc nhËn nhiÖm vô vËn tiªu, hoµn thµnh 1 lÇn vËn tiªu"}, {5000000, 600}, {10, 0, 3, 4}},
	[2204] = {0, "C­íp tiªu", {"Hoµn thµnh 1 lÇn c­íp tiªu", "Vµo thÕ lùc nhËn nhiÖm vô c­íp tiªu, hoµn thµnh 1 lÇn c­íp tiªu"}, {5000000, 600}, {10, 0, 5, 6}},
	[2205] = {0, "Trång c©y", {"Hoµn thµnh 1 lÇn nhiÖm vô trång c©y", "Vµo thÕ lùc chç C©y Th¸i H­ hoµn thµnh 1 lÇn nhiÖm vô trång c©y"}, {5000000, 600}, {10, 0, 7, 8}},
	[2206] = {0, "§µo r­¬ng", {"Hoµn thµnh 1 lÇn nhiÖm vô ®µo r­¬ng", "Hoµn thµnh 1 lÇn nhiÖm vô ®µo r­¬ng"}, {5000000, 600}, {10, 0, 9, 10}},
	[2207] = {0, "Thî S¨n TiÒn Th­ëng", {"Hoµn thµnh 1 lÇn nhiÖm vô Thî S¨n TiÒn Th­ëng", "Hoµn thµnh 1 lÇn nhiÖm vô Thî S¨n TiÒn Th­ëng"}, {5000000, 600}, {10, 0, 11, 12}},
	[2208] = {0, "T©y Vùc TruyÒn §¹o", {"Dïng 1 ®¹o cô bÊt kú sau ®©y: Kim L¨ng Töu, Tµng KiÕm BÝ TruyÒn T©m Kinh, B¸ch HiÓu Sinh BÝ Ph¸p", "Tham gia tÝnh n¨ng T©y Vùc TruyÒn §¹o, sö dông 1 ®¹o cô bÊt kú sau ®©y: Kim L¨ng Töu, Tµng KiÕm BÝ TruyÒn T©m Kinh, B¸ch HiÓu Sinh BÝ Ph¸p"}, {5000000, 600}, {10, 0, 13, 14}},
},
T_CK_TASK_GROUP_LIST = {
	--name, {type,desc}, {sub_list_group}
	[1] = {
		"Tr¨m TrËn Tr¨m Th¾ng", {1, "H»ng ngµy nhËn ngÉu nhiªn, nhËn ®­îc nhiÒu EXP vµ ®é n¨ng ®éng!"},
		{
			--name, random_count, {task_index_list}
			[1] = {"NhiÖm vô ThÕ Lùc Ba Phe", 4, {1101,1102,1103,1104,1105,1106,1107,1108}}, --°ÙÕ½²»´ù-Èý·½ÊÆÁ¦ÈÎÎñ
		},
	},
	[2] = {
		"Tèc ChiÕn Tèc Th¾ng", {2, "Trong thêi gian ho¹t ®éng chØ hoµn thµnh 1 lÇn, nhËn ®­îc nhiÒu EXP vµ ®é n¨ng ®éng!"},
		{
			[1] = {"NhiÖm vô bang héi", 0, {2101,2102,2103,2104}}, --ËÙÕ½ËÙ¾ö-°ï»áÈÎÎñ
			[2] = {"NhiÖm vô h­íng dÉn", 0, {2201,2202,2203,2204,2205,2206,2207,2208}}, --ËÙÕ½ËÙ¾ö-Ö¸ÒýÈÎÎñ
		},
	},
},
}
function t_Fix_201701:ck_get_task_cfg(nTaskIndex)
	local t = self.T_CK_TASK_LIST[nTaskIndex]
	if not t then
		error(format("CDKey: not find task %d", nTaskIndex))
	end
	return t
end
function t_Fix_201701:ck_get_task_bitset(nTaskIndex)
	local t = self:ck_get_task_cfg(nTaskIndex)
	return t[5]
end

function t_Fix_201701:ck_task_daily_clear()--Ã¿ÈÕÇåÀí
	--°ÙÕ½²»´ùÈÎÎñ±äÁ¿ÇåÀí
	local CK_TASK_GROUP = TaskManager:Create(9, 18);
	local t = self.T_CK_TASK_GROUP_LIST[1][3]
	for _,t1 in t do
		for _,task_index in t1[3] do
			local tBitSet = self:ck_get_task_bitset(task_index)
			local nGroupTaskIndex = tBitSet[1]
			local nBitGet = tBitSet[2]
			local nBitFinish = tBitSet[3]
			local nBitAward = tBitSet[4]
			CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitGet, 0)
			CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitFinish, 0)
			CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitAward, 0)
		end
	end
end
function t_Fix_201701:fix_up(nLastLoginDate)
	--if nLastLoginDate <= self.nTimeLine then
		local szAccount = GetAccount()
		local szRole = GetName()
		local CK_TASK_GROUP = TaskManager:Create(9, 18);
		--if self:is_in_black_list(szAccount, szRole)==1 then
    		local szLog = format("t_Fix_201701:fix_up [%s|%s LastLogin=%d] nTask1=%d nTask2=%d nTask3=%d nTask4=%d nTask5=%d nScore=%d nAward=%d exp=%d", szAccount, szRole, nLastLoginDate
    			, CK_TASK_GROUP:GetTaskBit(1, 1), CK_TASK_GROUP:GetTaskBit(2, 1)
    			, CK_TASK_GROUP:GetTaskBit(3, 1), CK_TASK_GROUP:GetTaskBit(4, 1)
    			, CK_TASK_GROUP:GetTaskBit(5, 1), CK_TASK_GROUP:GetTaskBit(6, 1)
    			, CK_TASK_GROUP:GetTaskBit(7, 1), GetExp()
    		)
    		WriteLog(szLog)
    		--clear_item(2,1,270)--°×¾ÔÍè
    		--clear_item(2,1,1064)--ÁùÉñÍè
    		--clear_item(2,1,1097)--ÈýÇåÍè
    		--SetTask(2501, 0)--°×¾ÔÍèÊ±¼ä
    		--for i=1,2 do
    		--	local n = EatLiushen(1, -2000000000)--ÁùÉñÍèÊ±¼ä
    		---	if 0==n then break end
    		--end
    		--for i=1,2 do
    		--	local n = EatSanqin(1, -2000000000)--ÈýÇåÍèÊ±¼ä
    		--	if 0==n then break end
    		--end
    		--for i=1,100 do
    		--	local n = GetExp()
    		--	local nDel = -2000000000
    		--	if n < 2000000000 then
    		--		nDel = -1 * n
    		--	end
    		--	ModifyExp(nDel)
    		--	n = GetExp()
    		--	if n <= 0 then break end
    		--end
			CK_TASK_GROUP:SetTaskBit(1, 3, 0);
			for i = 12, 31 do
				CK_TASK_GROUP:SetTaskBit(1, i, 0);
			end
			CK_TASK_GROUP:SetTask(2, 0);
			for i = 1, 16 do
				CK_TASK_GROUP:SetTaskBit(3, i, 0);
			end
			--É¾³ý°ÙÕ½²»´ùµÄÈÎÎñ
			for i = 234, 238 do
				DirectDeleteTask(i)
			end
			self:ck_task_daily_clear()
			RemoveTitle(68, 3);
    		local szMsg = format("HiÖn t¹i chøc n¨ng Minh Gi¸o lÖnh ®· t¹m ®ãng! TÊt c¶ nhiÖm vô vµ danh hiÖu sÏ bÞ xãa bá!Bæn trang sÏ tiÕn hµnh söa lçi nµy!")
    		Msg2Player(szMsg)
    		Talk(1,"",szMsg)
    	--end
	--end
	if nLastLoginDate <= self.nTimeLine then
		local szAccount = GetAccount()
		local szRole = GetName()
		local CK_TASK_GROUP = TaskManager:Create(9, 18);
		--if self:is_in_black_list(szAccount, szRole)==1 then
    		local szLog = format("t_Fix_201701:fix_up [%s|%s LastLogin=%d] nTask1=%d nTask2=%d nTask3=%d nTask4=%d nTask5=%d nScore=%d nAward=%d exp=%d", szAccount, szRole, nLastLoginDate
    			, CK_TASK_GROUP:GetTaskBit(1, 1), CK_TASK_GROUP:GetTaskBit(2, 1)
    			, CK_TASK_GROUP:GetTaskBit(3, 1), CK_TASK_GROUP:GetTaskBit(4, 1)
    			, CK_TASK_GROUP:GetTaskBit(5, 1), CK_TASK_GROUP:GetTaskBit(6, 1)
    			, CK_TASK_GROUP:GetTaskBit(7, 1), GetExp()
    		)
    		WriteLog(szLog)
    		--clear_item(2,1,270)--°×¾ÔÍè
    		--clear_item(2,1,1064)--ÁùÉñÍè
    		--clear_item(2,1,1097)--ÈýÇåÍè
    		--SetTask(2501, 0)--°×¾ÔÍèÊ±¼ä
    		--for i=1,2 do
    		--	local n = EatLiushen(1, -2000000000)--ÁùÉñÍèÊ±¼ä
    		---	if 0==n then break end
    		--end
    		--for i=1,2 do
    		--	local n = EatSanqin(1, -2000000000)--ÈýÇåÍèÊ±¼ä
    		--	if 0==n then break end
    		--end
    		--for i=1,100 do
    		--	local n = GetExp()
    		--	local nDel = -2000000000
    		--	if n < 2000000000 then
    		--		nDel = -1 * n
    		--	end
    		--	ModifyExp(nDel)
    		--	n = GetExp()
    		--	if n <= 0 then break end
    		--end
			CK_TASK_GROUP:SetTaskBit(1, 3, 0);
			for i = 12, 31 do
				CK_TASK_GROUP:SetTaskBit(1, i, 0);
			end
			CK_TASK_GROUP:SetTask(2, 0);
			for i = 1, 16 do
				CK_TASK_GROUP:SetTaskBit(3, i, 0);
			end
			--É¾³ý°ÙÕ½²»´ùµÄÈÎÎñ
			for i = 234, 238 do
				DirectDeleteTask(i)
			end
			self:ck_task_daily_clear()
			RemoveTitle(68, 3);
    		local szMsg = format("HiÖn t¹i chøc n¨ng Minh Gi¸o lÖnh ®· t¹m ®ãng! TÊt c¶ nhiÖm vô vµ danh hiÖu sÏ bÞ xãa bá!Bæn trang sÏ tiÕn hµnh söa lçi nµy!")
    		Msg2Player(szMsg)
    		Talk(1,"",szMsg)
    	--end
	end
end
function t_Fix_201701:is_in_black_list(szAccount, szRole)
	for i,v in self.t_Black_list do
		if v[1]==szAccount and v[2]==szRole then
			return 1
		end
	end
	return 0
end

function clear_item(g,d,p)
	local nCnt = BigGetItemCount(g,d,p)
	if nCnt > 0 then
		BigDelItem(g,d,p,nCnt)
	end
end
