Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\lib\\vnglib_function.lua")

tbVuKhiHH = {
	[2] = {item={{gdp={0,3,30724,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp §ao"}}},
	[3] = {item={{gdp={0,8,30725,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp Tr­îng"}}},
	[4] = {item={{gdp={0,0,30726,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp Thñ"}}},
	[6] = {item={{gdp={0,1,30727,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp Ch©m"}}},
	[8] = {item={{gdp={0,2,30728,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp KiÕm"}}},
	[9] = {item={{gdp={0,10,30729,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp CÇm"}}},
	[11] = {item={{gdp={0,0,30730,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp Thñ"}}},
	[12] = {item={{gdp={0,5,30731,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp C«n"}}},
	[14] = {item={{gdp={0,2,30732,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp KiÕm"}}},
	[15] = {item={{gdp={0,9,30733,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp Bót"}}},
	[17] = {item={{gdp={0,6,30734,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp Th­¬ng"}}},
	[18] = {item={{gdp={0,4,30735,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp Cung"}}},
	[20] = {item={{gdp={0,7,30736,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp §ao"}}},
	[21] = {item={{gdp={0,11,30737,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp Tr¶o"}}},
	[23] = {item={{gdp={0,2,30738,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp KiÕm"}}},
	[25] = {item={{gdp={0,3,30739,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp §ao"}}},
	[26] = {item={{gdp={0,9,30740,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp Bót"}}},
	[27] = {item={{gdp={0,11,30741,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp Tr¶o"}}},
	[29] = {item={{gdp={0,13,30742,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp PhiÕn"}}},
	[30] = {item={{gdp={0,12,30743,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Hµo HiÖp §Þch"}}},
}
TASK_TICH_LUY_DIEM_THUONG = 2430 -- byte 1 diem tich luy
EVENT_LOG_TITLE = "Doi Diem Tich Luy"
function DoiThuongTichLuy()
	
	local nTichLuyDiem = GetTask(TASK_TICH_LUY_DIEM_THUONG);
	if nTichLuyDiem < 0 then
		WriteLog("[DoiThuongTichLuy]\t"..GetAccount().."\t"..GetName().."\tbÞ ©m"..nTichLuyDiem.."  ®iÓm tÝch lòy.CÇn kiÓm tra l¹i")		
		SetTask(TASK_TICH_LUY_DIEM_THUONG,0);
	end
	local nLevel = GetLevel();
	if nLevel < 73 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","Nh©n vËt cÊp <color=green>73<color> trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia");
		return 0;
	end
	
	local szName = "Chñ TiÒn Trang"
	local szHeader = "<color=green>"..szName.." :<color>Ho¹t ®éng nép vËt phÈm lÊy ®iÓm tÝch lòy :"
	local tbSayDialog = {};
	local nSaySize = 0;
	tinsert(tbSayDialog, "Ta muèn nép vËt phÈm Hoµng Kim §¹i Ng©n PhiÕu/#nop_vatpham(1)")
	tinsert(tbSayDialog, "Ta muèn nép vËt phÈm Bao Tiªu Dao Ngäc/#nop_vatpham(2)")
	tinsert(tbSayDialog, "Ta muèn nép vËt phÈm ChiÕn ThÇn Hoµn/#nop_vatpham(3)")
	tinsert(tbSayDialog, "Ta muèn nép vËt phÈm Cöu Thiªn V« Cùc §¬n/#nop_vatpham(4)")
	tinsert(tbSayDialog, "Ta muèn nép vËt phÈm Linh KhÝ Rùc Rì/#nop_vatpham(5)")
	tinsert(tbSayDialog, "KiÓm tra sè ®iÓm tÝch lòy/checkDiemTichLuy")
	tinsert(tbSayDialog, "Ta muèn ®æi phÇn th­ëng ®iÓm tÝch lòy/DoiThuongDiem")
	tinsert(tbSayDialog, "Ta chØ ghÐ ngang/do_nothing")
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)	
end


function checkDiemTichLuy()
	local nDiem = GetTask(TASK_TICH_LUY_DIEM_THUONG);
	if nDiem == nil then
		nDiem = 0;
	end
	Talk(1,"","C¸c h¹ hiÖn cã <color=green> "..nDiem.."<color> ®iÓm tÝch lòy")
	return 0;
end

function nop_vatpham(nType)
	if nType == 1 then
		JX2VN_DoiEvent_Form1()
	elseif nType == 2 then
		JX2VN_DoiEvent_Form2()
	elseif nType == 3 then
		JX2VN_DoiEvent_Form3()
	elseif nType ==  4 then
		JX2VN_DoiEvent_Form4()
	elseif nType == 5 then
		JX2VN_DoiEvent_Form5()
	else
		Talk(1,"","Cã sù cè x¶y ra! Vui lßng kiÓm tra l¹i!");
		return 0;
	end
end

function JX2VN_DoiEvent_Form1()
	AskClientForNumber("JX2VN_DoiEvent_Kieu1", 1, 20, "Sè l­îng (1-20)")
end

function JX2VN_DoiEvent_Form2()
	AskClientForNumber("JX2VN_DoiEvent_Kieu2", 1, 20, "Sè l­îng (1-20)")
end

function JX2VN_DoiEvent_Form3()
	AskClientForNumber("JX2VN_DoiEvent_Kieu3", 1, 20, "Sè l­îng (1-20)")
end

function JX2VN_DoiEvent_Form4()
	AskClientForNumber("JX2VN_DoiEvent_Kieu4", 1, 20, "Sè l­îng (1-20)")
end

function JX2VN_DoiEvent_Form5()
	AskClientForNumber("JX2VN_DoiEvent_Kieu5", 1, 20, "Sè l­îng (1-20)")
end


function JX2VN_DoiEvent_Kieu1(nCount)
	if GetItemCount(2,1,30490) < (1 * nCount )  then
		Talk(1, "", "B¹n kh«ng ®ñ sè l­îng Hoµng Kim §¹i Ng©n PhiÕu.");
		return 0;
	end
	
	if DelItem(2,1,30490 , 1 * nCount) == 1 then
		local nDiem = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		local nAllPoint = 30 * nCount;
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nDiem + nAllPoint) --gf_SetTaskByte(TASK_TICH_LUY_DIEM_THUONG, 1, nDiem + nAllPoint)	
		Msg2Player("B¹n ®· tÝch lòy thªm ®­îc  "..nAllPoint.." ®iÓm")
		Talk(1,"","B¹n ®· tÝch lòy thªm ®­îc <color=green> "..nAllPoint.."<color> ®iÓm")
	end
end

function JX2VN_DoiEvent_Kieu2(nCount)
	if GetItemCount(2,1,30605) < (1 * nCount )  then
		Talk(1, "", "B¹n kh«ng ®ñ sè l­îng Bao Tiªu Dao Ngäc.");
		return 0;
	end
	
	if DelItem(2,1,30605 , 1 * nCount) == 1 then
		local nDiem = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		local nAllPoint = 30 * nCount;
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nDiem + nAllPoint)
		Msg2Player("B¹n ®· tÝch lòy thªm ®­îc  "..nAllPoint.." ®iÓm")
		Talk(1,"","B¹n ®· tÝch lòy thªm ®­îc <color=green> "..nAllPoint.."<color> ®iÓm")
	end
end

function JX2VN_DoiEvent_Kieu3(nCount)
	if GetItemCount(2,1,1005) < (1 * nCount )  then
		Talk(1, "", "B¹n kh«ng ®ñ sè l­îng ChiÕn ThÇn Hoµn.");
		return 0;
	end
	
	if DelItem(2,1,1005 , 1 * nCount) == 1 then
		local nDiem = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		local nAllPoint = 30 * nCount;
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nDiem + nAllPoint)
		Msg2Player("B¹n ®· tÝch lòy thªm ®­îc  "..nAllPoint.." ®iÓm")
		Talk(1,"","B¹n ®· tÝch lòy thªm ®­îc <color=green> "..nAllPoint.."<color> ®iÓm")
	end
end

function JX2VN_DoiEvent_Kieu4(nCount)
	if GetItemCount(2,1,1006) < (1 * nCount )  then
		Talk(1, "", "B¹n kh«ng ®ñ sè l­îng Cöu Thiªn V« Cùc §¬n.");
		return 0;
	end
	
	if DelItem(2,1,1006 , 1 * nCount) == 1 then
		local nDiem = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		local nAllPoint = 90 * nCount;
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nDiem + nAllPoint)
		Msg2Player("B¹n ®· tÝch lòy thªm ®­îc  "..nAllPoint.." ®iÓm")
		Talk(1,"","B¹n ®· tÝch lòy thªm ®­îc <color=green> "..nAllPoint.."<color> ®iÓm")
	end
end

function JX2VN_DoiEvent_Kieu5(nCount)
	if GetItemCount(2,1,31122) < (1 * nCount )  then
		Talk(1, "", "B¹n kh«ng ®ñ sè l­îng Linh KhÝ Rùc Rì.");
		return 0;
	end
	
	if DelItem(2,1,31122 , 1 * nCount) == 1 then
		local nDiem = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		local nAllPoint = 3000 * nCount;
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nDiem + nAllPoint)
		Msg2Player("B¹n ®· tÝch lòy thªm ®­îc  "..nAllPoint.." ®iÓm")
		Talk(1,"","B¹n ®· tÝch lòy thªm ®­îc <color=green> "..nAllPoint.."<color> ®iÓm")
	end
end


function DoiThuongDiem()
	local szName = "Chñ TiÒn Trang"
	local szHeader = "<color=green>"..szName.." :<color>Ho¹t ®éng nép vËt phÈm lÊy ®iÓm tÝch lòy :"
	local tbSayDialog = {};
	local nSaySize = 0;
	tinsert(tbSayDialog, "Ta muèn ®æi th­ëng thó c­ìi /tichluy_doithuong_thucuoi")
	tinsert(tbSayDialog, "Ta muèn ®æi th­ëng PhÇn th­ëng míi cËp nhËt/tichluy_doithuong_phanthuongmoi")
	tinsert(tbSayDialog, "Ta muèn ®æi 15 Th¸i NhÊt LÖnh (Tiªu tèn 150 ®iÓm)/#tichluy_doiphanthuong(1)")
	tinsert(tbSayDialog, "Ta muèn ®æi 50 Hµo HiÖp LÖnh (Tiªu tèn 250 ®iÓm)/#tichluy_doiphanthuong(2)")
	tinsert(tbSayDialog, "Ta muèn ®æi 50 Linh ThiÕt (Tiªu tèn 500 ®iÓm)/#tichluy_doiphanthuong(3)")
	tinsert(tbSayDialog, "Ta muèn ®æi 1 Phèi Ph­¬ng Vò KhÝ Hµo HiÖp th­êng (Tiªu tèn 750 ®iÓm)/#tichluy_doiphanthuong(4)")
	tinsert(tbSayDialog, "Ta muèn ®æi 1 Phèi Ph­¬ng Hµo HiÖp V« h¹ (Tiªu tèn 1000 ®iÓm)/#tichluy_doiphanthuong(5)")
	tinsert(tbSayDialog, "Ta muèn ®æi 1 bé Kim xµ cÊp 4 (Tiªu tèn 3600 ®iÓm)/#tichluy_doiphanthuong(6)")
	tinsert(tbSayDialog, "Ta muèn ®æi 1 §Þa Long Gi¸p (Tiªu tèn 1220 ®iÓm)/#tichluy_doiphanthuong(7)")
	tinsert(tbSayDialog, "Ta muèn ®æi 1 Ma Lang Gi¸p (Tiªu tèn 1220 ®iÓm)/#tichluy_doiphanthuong(8)")
	tinsert(tbSayDialog, "Ta muèn ®æi 1 Viªm Linh Bè (Tiªu tèn 1220 ®iÓm)/#tichluy_doiphanthuong(9)")
	tinsert(tbSayDialog, "Ta muèn ®æi 1 HuyÒn Viªm C­¬ng (Tiªu tèn 1220 ®iÓm)/#tichluy_doiphanthuong(10)")
	tinsert(tbSayDialog, "Ta muèn ®æi 100 Linh Ngäc (Tiªu tèn 5000 ®iÓm)/#tichluy_doiphanthuong(11)")
	tinsert(tbSayDialog, "Ta muèn ®æi 1 Phôc Sinh §¬n 100/100 (Tiªu tèn 6000 ®iÓm)/#tichluy_doiphanthuong(12)")
	tinsert(tbSayDialog, "Ta muèn ®æi MËt TÞch Siªu CÊp 20% (Tiªu tèn 6000 ®iÓm)/#tichluy_doiphanthuong(13)")
	tinsert(tbSayDialog, "Ta muèn ®æi bé trang bÞ Thiªn H¹ V« Song (Tiªu tèn 700.000 ®iÓm)/tichluy_doitrangbicuoi")
	if gf_GetTaskByte(2162, 4) == 1 and gf_GetTaskByte(2162, 3) == 0 then
		tinsert(tbSayDialog, "Ta muèn nhËn phÇn th­ëng më réng THVS/PhanThuongExt")
	end
	tinsert(tbSayDialog, "Ta chØ ghÐ ngang/do_nothing")
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)	
end

function tichluy_doithuong_phanthuongmoi()
	local szName = "Chñ TiÒn Trang"
	local szHeader = "<color=green>"..szName.." :<color>Ho¹t ®éng nép vËt phÈm lÊy ®iÓm tÝch lòy :"
	local tbSayDialog = {};
	local nSaySize = 0;
	tinsert(tbSayDialog, "Ta muèn ®æi CÆp nhÉn hç trî mËt tÞch 7% (Tiªu tèn 5000 ®iÓm)/#tichluy_doiphanthuong_new(1)")
	tinsert(tbSayDialog, "Ta muèn ®æi Bé trang søc BÝch H¶i (Tiªu tèn 6000 ®iÓm)/#tichluy_doiphanthuong_new(2)")
	tinsert(tbSayDialog, "Ta muèn ®æi Bé trang søc Vâ T­¬ng (Tiªu tèn 6000 ®iÓm)/#tichluy_doiphanthuong_new(3)")
	tinsert(tbSayDialog, "Ta muèn ®æi Bé trang søc Phong Háa (Tiªu tèn 6000 ®iÓm)/#tichluy_doiphanthuong_new(4)")
	tinsert(tbSayDialog, "Ta muèn ®æi Háa Phông Linh (Tiªu tèn 6000 ®iÓm)/#tichluy_doiphanthuong_new(5)")
	tinsert(tbSayDialog, "Ta muèn ®æi Thiªn Cang LÖnh (Tiªu tèn 400 ®iÓm)/#tichluy_doiphanthuong_new(6)")
	tinsert(tbSayDialog, "Ta muèn ®æi Thiªn M«n Kim LÖnh (Tiªu tèn 200 ®iÓm)/#tichluy_doiphanthuong_new(7)")
	tinsert(tbSayDialog, "Ta muèn ®æi Trang søc Hµo HiÖp th­êng(Tiªu tèn 6000 ®iÓm)/#tichluy_doiphanthuong_new(8)")
	tinsert(tbSayDialog, "Ta muèn ®æi Vò KhÝ Hµo HiÖp th­êng (Tiªu tèn 9000 ®iÓm)/#tichluy_doiphanthuong_new(9)")
	tinsert(tbSayDialog, "Ta chØ ghÐ ngang/do_nothing")
	Say(szHeader, getn(tbSayDialog), tbSayDialog)	
end

function tichluy_doiphanthuong_new(nType)
	local szName = "Chñ TiÒn Trang"
	if nType == 1 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 5000  then
			Talk(1, "", "B¹n kh«ng ®ñ 5000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(2,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 2 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 5000)
		gf_AddItemEx2({0,102,8844, 1, 4, -1, -1, -1, -1, -1, -1}, "Huy Hoµng QuËt Khëi ", EVENT_LOG_TITLE , "nhËn")
		gf_AddItemEx2({0,102,8845, 1, 4, -1, -1, -1, -1, -1, -1}, "Vinh Dù QuËt Khëi ", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn CÆp nhÉn hç trî mËt tÞch 7% thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 5000  ®iÓm")
	elseif nType == 2 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B¹n kh«ng ®ñ 6000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(3,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 3 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({0,120,120, 1, 4}, "BÝch H¶i Lam Phong", EVENT_LOG_TITLE , "nhËn", 30*24*3600)
		gf_AddItemEx2({0,121,84, 1, 4}, "BÝch H¶i Lam Phong-Ch©n", EVENT_LOG_TITLE , "nhËn", 30*24*3600)
		gf_AddItemEx2({0,119,96, 1, 4}, "BÝch H¶i Lam Phong-Vai", EVENT_LOG_TITLE , "nhËn", 30*24*3600)
		Msg2Player("C¸c h¹ ®· nhËn Bé trang søc BÝch H¶i thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 6000  ®iÓm")
	elseif nType == 3 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B¹n kh«ng ®ñ 6000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(3,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 3 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({0,120,121, 1, 4}, "Vâ T­¬ng Kim Lu©n", EVENT_LOG_TITLE , "nhËn", 30*24*3600)
		gf_AddItemEx2({0,121,85, 1, 4}, "Vâ T­¬ng Kim Lu©n-Ch©n", EVENT_LOG_TITLE , "nhËn", 30*24*3600)
		gf_AddItemEx2({0,119,97, 1, 4}, "Vâ T­¬ng Kim Lu©n-Vai", EVENT_LOG_TITLE , "nhËn", 30*24*3600)
		Msg2Player("C¸c h¹ ®· nhËn Bé trang søc Vâ T­¬ng thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 6000  ®iÓm")
	elseif nType == 4 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B¹n kh«ng ®ñ 6000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(3,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 3 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({0,120,122, 1, 4}, "Phong Háa Liªn Thµnh", EVENT_LOG_TITLE , "nhËn", 30*24*3600)
		gf_AddItemEx2({0,121,86, 1, 4}, "VÕt ch©n Phong Háa Liªn Thµnh", EVENT_LOG_TITLE , "nhËn", 30*24*3600)
		gf_AddItemEx2({0,119,98, 1, 4}, "Phong Háa Liªn Thµnh-Vai", EVENT_LOG_TITLE , "nhËn", 30*24*3600)
		Msg2Player("C¸c h¹ ®· nhËn Bé trang søc Phong Háa thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 6000  ®iÓm")
	elseif nType == 5 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B¹n kh«ng ®ñ 6000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({2,1,30769, 1, 4}, "Háa Phông Linh", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn Háa Phông Linh  thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 6000  ®iÓm")
	elseif nType == 6 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 400  then
			Talk(1, "", "B¹n kh«ng ®ñ 400 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 400)
		gf_AddItemEx2({2,95,204, 1, 1}, "Thiªn Cang LÖnh", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn Thiªn Cang LÖnh thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 400  ®iÓm")
	elseif nType == 7 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 200  then
			Talk(1, "", "B¹n kh«ng ®ñ 200 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 200)
		gf_AddItemEx2({2,1,30370, 1, 1}, "Thiªn M«n Kim LÖnh", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn Thiªn M«n Kim LÖnh thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 200  ®iÓm")
	elseif nType == 8 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B¹n kh«ng ®ñ 6000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({0,102,random(31126,31127), 1, 1, -1, -1, -1, -1, -1, -1}, "Trang søc hµo hiÖp th­êng", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn Trang søc hµo hiÖp th­êng thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 6000  ®iÓm")
	elseif nType == 9 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 9000  then
			Talk(1, "", "B¹n kh«ng ®ñ 9000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 9000)
		LIB_Award:AwardByRoute(tbVuKhiHH)
		Msg2Player("C¸c h¹ ®· nhËn Vò KhÝ Hµo HiÖp Th­êng thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 9000  ®iÓm")
	else
		Talk(1, "", "Cã lçi xuÊt hiÖn! vui lßng chän ®óng dßng chän!.");
		return 0;
	end
end


function tichluy_doithuong_thucuoi()
	local szName = "Chñ TiÒn Trang"
	local szHeader = "<color=green>"..szName.." :<color>Ho¹t ®éng nép vËt phÈm lÊy ®iÓm tÝch lòy :"
	local tbSayDialog = {};
	local nSaySize = 0;
	tinsert(tbSayDialog, "Ta muèn ®æi Hoµng Hæ B¶o B¶o (Tiªu tèn 10000 ®iÓm)/#tichluy_doiphanthuong_thucuoi(1)")
	tinsert(tbSayDialog, "Ta muèn ®æi B¸o §en B¶o B¶o (Tiªu tèn 10000 ®iÓm)/#tichluy_doiphanthuong_thucuoi(2)")
	tinsert(tbSayDialog, "Ta muèn ®æi B¸o Vµng B¶o B¶o (Tiªu tèn 10000 ®iÓm)/#tichluy_doiphanthuong_thucuoi(3)")
	tinsert(tbSayDialog, "Ta muèn ®æi B¸o Tr¾ng B¶o B¶o (Tiªu tèn 10000 ®iÓm)/#tichluy_doiphanthuong_thucuoi(4)")
	tinsert(tbSayDialog, "Ta muèn ®æi B¹ch Liªn Hoa (Tiªu tèn 6000 ®iÓm)/#tichluy_doiphanthuong_thucuoi(5)")
	tinsert(tbSayDialog, "Ta muèn ®æi Hång Liªn Hoa (Tiªu tèn 6000 ®iÓm)/#tichluy_doiphanthuong_thucuoi(6)")
	tinsert(tbSayDialog, "Ta muèn ®æi Tö Liªn Hoa (Tiªu tèn 6000 ®iÓm)/#tichluy_doiphanthuong_thucuoi(7)")
	tinsert(tbSayDialog, "Ta chØ ghÐ ngang/do_nothing")
	Say(szHeader, getn(tbSayDialog), tbSayDialog)	
end

function tichluy_doiphanthuong_thucuoi(nType)
	local szName = "Chñ TiÒn Trang"
	if nType == 1 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 10000  then
			Talk(1, "", "B¹n kh«ng ®ñ 10000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 10000)
		gf_AddItemEx2({0,105,30026, 1, 4, -1, -1, -1, -1, -1, -1}, "Hoµng Hæ B¶o B¶o", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn Hoµng Hæ B¶o B¶o thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 10000  ®iÓm")
	elseif nType == 2 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 10000  then
			Talk(1, "", "B¹n kh«ng ®ñ 10000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 10000)
		gf_AddItemEx2({0,105,30029, 1, 4, -1, -1, -1, -1, -1, -1}, "B¸o §en B¶o B¶o", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn B¸o §en B¶o B¶o thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 10000  ®iÓm")
	elseif nType == 3 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 10000  then
			Talk(1, "", "B¹n kh«ng ®ñ 10000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 10000)
		gf_AddItemEx2({0,105,30030, 1, 4, -1, -1, -1, -1, -1, -1}, "B¸o Vµng B¶o B¶o", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn B¸o Vµng B¶o B¶o thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 10000  ®iÓm")
	elseif nType == 4 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 10000  then
			Talk(1, "", "B¹n kh«ng ®ñ 10000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 10000)
		gf_AddItemEx2({0,105,30028, 1, 4, -1, -1, -1, -1, -1, -1}, "B¸o Tr¾ng B¶o B¶o", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn B¸o Tr¾ng B¶o B¶o thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 10000  ®iÓm")
	elseif nType == 5 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B¹n kh«ng ®ñ 6000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({0,105,30057, 1, 4, -1, -1, -1, -1, -1, -1}, "B¹ch Liªn Hoa", EVENT_LOG_TITLE , "nhËn", 30*24*3600)
		Msg2Player("C¸c h¹ ®· nhËn B¹ch Liªn Hoa (30 ngµy)  thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 6000  ®iÓm")
	elseif nType == 6 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B¹n kh«ng ®ñ 6000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({0,105,30058, 1, 4, -1, -1, -1, -1, -1, -1}, "Hång Liªn Hoa", EVENT_LOG_TITLE , "nhËn", 30*24*3600)
		Msg2Player("C¸c h¹ ®· nhËn Hång Liªn Hoa  (30 ngµy) thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 6000  ®iÓm")
	elseif nType == 7 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B¹n kh«ng ®ñ 6000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({0,105,30059, 1, 4, -1, -1, -1, -1, -1, -1}, "Tö Liªn Hoa", EVENT_LOG_TITLE , "nhËn", 30*24*3600)
		Msg2Player("C¸c h¹ ®· nhËn Tö Liªn Hoa (30 ngµy) thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 6000  ®iÓm")
	else
		Talk(1, "", "Cã lçi xuÊt hiÖn! vui lßng chän ®óng dßng chän!.");
		return 0;
	end
end

function tichluy_doiphanthuong(nType)
	local szName = "Chñ TiÒn Trang"
	if nType == 1 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 150  then
			Talk(1, "", "B¹n kh«ng ®ñ 150 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 150)
		gf_AddItemEx2({2,1,30687, 15}, "Th¸i NhÊt LÖnh", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn 15 x Th¸i NhÊt LÖnh thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 150  ®iÓm")
	elseif nType == 2 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 250  then
			Talk(1, "", "B¹n kh«ng ®ñ 250 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,100) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 100 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 250)
		gf_AddItemEx2({2,95,2084,50,4}, " Hµo HiÖp LÖnh (Khãa)", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn 50 x Hµo HiÖp LÖnh (Khãa) thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 250  ®iÓm")
	elseif nType == 3 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 500  then
			Talk(1, "", "B¹n kh«ng ®ñ 500 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,100) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 100 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 500)
		gf_AddItemEx2({2,1,30681,50}, " Linh ThiÕt", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn 50 x Linh ThiÕt thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 500 ®iÓm")
	elseif nType == 4 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 750  then
			Talk(1, "", "B¹n kh«ng ®ñ 750 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,5) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 5 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 750)
		gf_AddItemEx2({2,1,30802,1}, " Phèi Ph­¬ng Vò KhÝ Hµo HiÖp", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn Phèi Ph­¬ng Vò KhÝ Hµo HiÖp thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 750 ®iÓm")
	elseif nType == 5 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 1000  then
			Talk(1, "", "B¹n kh«ng ®ñ 1000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,5) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 5 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local szName = "Chñ TiÒn Trang"
		local szHeader = "<color=green>"..szName.." :<color> C¸c h¹ h·y chän 1 trong 3 Phèi Ph­¬ng :"
		local tbSayDialog = {};
		local nSaySize = 0;
		tinsert(tbSayDialog, "Ta muèn ®æi Phèi ph­¬ng V« H¹(Nãn)/#doi_haohiepvoha(1)")
		tinsert(tbSayDialog, "Ta muèn ®æi Phèi ph­¬ng V« H¹(¸o)/#doi_haohiepvoha(2)")
		tinsert(tbSayDialog, "Ta muèn ®æi Phèi ph­¬ng V« H¹(quÇn)/#doi_haohiepvoha(3)")
		tinsert(tbSayDialog, "Ta chØ ghÐ ngang/do_nothing")
		Say(szHeader, getn(tbSayDialog), tbSayDialog)	
	elseif nType == 6 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 3600  then
			Talk(1, "", "B¹n kh«ng ®ñ 3600 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(3,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 3 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local szName = "Chñ TiÒn Trang"
		local szHeader = "<color=green>"..szName.." :<color>C¸c h¹ h·y lùa chän 1 trong 3 bé trang bÞ Kim Xµ :"
		local tbSayDialog = {};
		local nSaySize = 0;
		tinsert(tbSayDialog,"Ta muèn nhËn trang bÞ Kim Xµ V©n Du/#receive_KimXa_cap4(1)")
		tinsert(tbSayDialog,"Ta muèn nhËn trang bÞ Kim Xµ ThiÕt HuyÕt/#receive_KimXa_cap4(2)")
		tinsert(tbSayDialog,"Ta muèn nhËn trang bÞ Kim Xµ Du HiÖp/#receive_KimXa_cap4(3)")
		tinsert(tbSayDialog, "Ta chØ ghÐ ngang/do_nothing")
		Say(szHeader, getn(tbSayDialog), tbSayDialog)	
	elseif nType == 7 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 1220  then
			Talk(1, "", "B¹n kh«ng ®ñ 1220 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,10) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 10 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 1220)
		gf_AddItemEx2({2,1,30678,1}, " §Þa Long Gi¸p", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn 1 x §Þa Long Gi¸p thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 1220  ®iÓm")
	elseif nType == 8 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 1220  then
			Talk(1, "", "B¹n kh«ng ®ñ 1220 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,10) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 10 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 1220)
		gf_AddItemEx2({2,1,30677,1}, " Ma Lang Gi¸p", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn 1 x Ma Lang Gi¸p thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 1220  ®iÓm")
	elseif nType == 9 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 1220  then
			Talk(1, "", "B¹n kh«ng ®ñ 1220 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,10) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 10 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 1220)
		gf_AddItemEx2({2,1,30676,1}, " Viªm Linh Bè", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn 1 x Viªm Linh Bè thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 1220  ®iÓm")
	elseif nType == 10 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 1220  then
			Talk(1, "", "B¹n kh«ng ®ñ 1220 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,10) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 10 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 1220)
		gf_AddItemEx2({2,1,30675,1}, " HuyÒn Viªm C­¬ng", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn 1 x HuyÒn Viªm C­¬ng thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 1220  ®iÓm")
	elseif nType == 11 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 5000  then
			Talk(1, "", "B¹n kh«ng ®ñ 5000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,50) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 50 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 5000)
		gf_AddItemEx2({2,1,30682,100}, " Linh Ngäc", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn 100 x Linh Ngäc thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 5000  ®iÓm")
	elseif nType == 12 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B¹n kh«ng ®ñ 6000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,20) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 20 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
		gf_AddItemEx2({2,1,30814,1}, " Phôc Sinh §¬n", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn 1 x Phôc Sinh §¬n 100/100 thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 6000  ®iÓm")
	elseif nType == 13 then
		if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 6000  then
			Talk(1, "", "B¹n kh«ng ®ñ 6000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
			return 0;
		end
		
		if gf_JudgeRoomWeight(1,20) == 0 then
			Talk(1,"",szName.."C¸c h¹ cÇn 1 « hµnh trang, 20 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
			return 0
		end
		
		local szName = "Chñ TiÒn Trang"
		local szHeader = "<color=green>"..szName.." :<color> C¸c h¹ h·y chän lùa hÖ ph¸i muèn nhËn mËt tÞch :"
		local tbSayDialog = {};
		local nSaySize = 0;
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch ThiÕu L©m Tôc gia/#TraoMatTichSieuCap20(2)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch ThiÕu L©m Vâ t¨ng/#TraoMatTichSieuCap20(4)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch ThiÕu L©m thiÒn t¨ng/#TraoMatTichSieuCap20(3)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch §­êng M«n/#TraoMatTichSieuCap20(6)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch Nga My phËt gia/#TraoMatTichSieuCap20(8)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch Nga My tôc gia/#TraoMatTichSieuCap20(9)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch C¸i Bang TÜnh y/#TraoMatTichSieuCap20(11)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch C¸i Bang ¤ y/#TraoMatTichSieuCap20(12)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch Vâ §ang ®¹o gia/#TraoMatTichSieuCap20(14)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch Vâ §ang tôc gia/#TraoMatTichSieuCap20(15)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch D­¬ng M«n th­¬ng Kþ/#TraoMatTichSieuCap20(17)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch D­¬ng M«n cung Kþ/#TraoMatTichSieuCap20(18)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch HiÖp §éc/#TraoMatTichSieuCap20(20)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch Tµ ®éc/#TraoMatTichSieuCap20(21)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch C«n L«n Thiªn S­/#TraoMatTichSieuCap20(23)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch Minh Gi¸o Th¸nh ChiÕn/#TraoMatTichSieuCap20(25)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch Minh Gi¸o TrËn Binh/#TraoMatTichSieuCap20(26)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch Minh Gi¸o HuyÕt Nh©n/#TraoMatTichSieuCap20(27)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch Thóy Yªn Vò N÷/#TraoMatTichSieuCap20(29)")
		tinsert(tbSayDialog, "Ta muèn ®æi mËt tÞch Thóy Yªn Linh N÷/#TraoMatTichSieuCap20(30)")
		tinsert(tbSayDialog, "Ta chØ ghÐ ngang/do_nothing")
		Say(szHeader, getn(tbSayDialog), tbSayDialog)	
	else
		Talk(1, "", "Cã lçi xuÊt hiÖn! vui lßng chän ®óng dßng chän!.");
		return 0;
	end
end

function TraoMatTichSieuCap20(nRoute)

	local tbMatTich = {
		[2] = {0,107,204, 2,"Kim Cang B¸t Nh· Ch©n QuyÓn"},
		[4] = {0,107,205, 1,"TiÒm Long Tóc DiÖt Ch©n QuyÓn"},
		[3] = {0,107,206, 1,"V« TrÇn Bå §Ò Ch©n QuyÓn"},
		[6] = {0,107,207, 2,"Thiªn La Liªn Ch©u Ch©n QuyÓn"},
		[8] = {0,107,208, 1,"Nh­ ý Kim §Ønh Ch©n QuyÓn"},
		[9] = {0,107,209, 1,"BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"},
		[11] = {0,107,210, 2,"Hçn §én TrÊn Nh¹c Ch©n QuyÓn"},
		[12] = {0,107,211, 2,"Quú Thiªn Du Long Ch©n QuyÓn"},
		[14] = {0,107,212, 1,"HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"},
		[15] = {0,107,213, 2,"Qu©n Tö §íi Phong Ch©n QuyÓn"},
		[17] = {0,107,214, 2,"TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"},
		[18] = {0,107,215, 2,"Xuyªn V©n L¹c Hång Ch©n QuyÓn"},
		[20] = {0,107,216, 2,"HuyÒn Minh Phong Ma Ch©n QuyÓn"},
		[21] = {0,107,217, 1,"Linh Cæ HuyÒn Tµ Ch©n QuyÓn"},
		[23] = {0,107,218,1,"Cöu Thiªn Phong L«i Ch©n QuyÓn"},
		[25] = {0,107,219,2,"Håi Phong Tr¶m NhËt Ch©n QuyÓn"},
		[26] = {0,107,220,2,"Phô Kú Hµnh TrËn Ch©n QuyÓn"},
		[27] = {0,107,221,1,"Ng­ng HuyÕt Phong Hån Ch©n QuyÓn"},
		[29] = {0,107,222,2,"Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[30] = {0,107,223,2,"Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
	}
	local tbRate = {
		[1] = {[1] = 2, nRate = 5},
		[2] = {[1] = 4, nRate = 5},
		[3] = {[1] = 3, nRate = 5},
		[4] = {[1] = 6, nRate = 5},
		[5] = {[1] = 8, nRate = 5},
		[6] = {[1] = 9, nRate = 5},
		[7] = {[1] = 11, nRate = 5},
		[8] = {[1] = 12, nRate = 5},
		[9] = {[1] = 14, nRate = 5},
		[10] = {[1] = 15, nRate = 5},
		[11] = {[1] = 17, nRate = 5},
		[12] = {[1] = 18, nRate = 5},
		[13] = {[1] = 20, nRate = 5},
		[14] = {[1] = 21, nRate = 5},
		[15] = {[1] = 23, nRate = 5},
		[16] = {[1] = 25, nRate = 5},
		[17] = {[1] = 26, nRate = 5},
		[18] = {[1] = 27, nRate = 5},
		[19] = {[1] = 29, nRate = 5},
		[20] = {[1] = 30, nRate = 5},
	}
	if nRoute == nil then
		nIndex = LIB_Award:GetValueByRate(tbRate)
	else
		nIndex = nRoute
	end
	local _, nItemID = AddItem(tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1)
	if tbMatTich[nIndex][4] == 1 then
		SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
	else
		SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
	end
	local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
	SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 6000)
	Msg2Player("B¹n ®· tiªu hao 6000  ®iÓm")
end

tbKimXaVanDu = {
	item = {
		{gdp={0,153,28,1,4,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng V©n Du"},
		{gdp={0,152,28,1,4,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng V©n Du"},
		{gdp={0,154,28,1,4,-1,-1,-1,-1,-1,-1,-1}, name="§¹o Hµi V©n Du"},
	}
}
	
tbKimXaThietHuyet = {
	item = {
		{gdp={0,153,27,1,4,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng ThiÕt HuyÕt"},
		{gdp={0,152,27,1,4,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng ThiÕt HuyÕt"},
		{gdp={0,154,27,1,4,-1,-1,-1,-1,-1,-1,-1}, name="§¹o Hµi ThiÕt HuyÕt"},
	}
}
	
tbKimXaDuHiep = {
	item = {
		{gdp={0,153,26,1,4,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Du HiÖp"},
		{gdp={0,152,26,1,4,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Du HiÖp"},
		{gdp={0,154,26,1,4,-1,-1,-1,-1,-1,-1,-1}, name="§¹o Hµi Du HiÖp"},
	}
}

function receive_KimXa_cap4(nChoice)
	
	if nChoice  == 1 then
		LIB_Award:Award(tbKimXaVanDu)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ V©n Du")
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 3600)
	elseif nChoice == 2 then
		LIB_Award:Award(tbKimXaThietHuyet)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ ThiÕt HuyÕt")
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 3600)
	elseif nChoice == 3 then
		LIB_Award:Award(tbKimXaDuHiep)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ Du HiÖp")
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 3600)
	end	
	Msg2Player("B¹n ®· tiªu hao 3600 ®iÓm")
end

function doi_haohiepvoha(nType)
	local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
	if nType == 1 then
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 1000)
		gf_AddItemEx2({2,1,30941,1}, " Phèi ph­¬ng V« H¹(Nãn)", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn Phèi ph­¬ng V« H¹(Nãn) thµnh c«ng!")
	elseif nType == 2 then
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 1000)
		gf_AddItemEx2({2,1,30942,1}, " Phèi ph­¬ng V« H¹(¸o)", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn Phèi ph­¬ng V« H¹(¸o) thµnh c«ng!")
	elseif nType == 3 then
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 1000)
		gf_AddItemEx2({2,1,30943,1}, " Phèi ph­¬ng V« H¹(QuÇn)", EVENT_LOG_TITLE , "nhËn")
		Msg2Player("C¸c h¹ ®· nhËn Phèi ph­¬ng V« H¹(QuÇn) thµnh c«ng!")
	else
		Talk(1, "", "Cã lçi xuÊt hiÖn! vui lßng chän ®óng dßng chän!.");
		return 0;
	end
	Msg2Player("B¹n ®· tiªu hao 1000 ®iÓm")
end

tbThienHaVoSong = {
	[1] = {item={{gdp={0,100,30207,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thiªn H¹ V« Song Gi¸p"},
					{gdp={0,101,30207,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thiªn H¹ V« Song Trang"},
					{gdp={0,103,30207,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thiªn H¹ V« Song Kh«i"},
				}},
	[2] = {item={{gdp={0,100,30208,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thiªn H¹ V« Song Gi¸p"},
					{gdp={0,101,30208,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thiªn H¹ V« Song Trang"},
					{gdp={0,103,30208,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thiªn H¹ V« Song Kh«i"},
				}},
	[3] = {item={{gdp={0,100,30209,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thiªn H¹ V« Song Gi¸p"},
					{gdp={0,101,30209,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thiªn H¹ V« Song Trang"},
					{gdp={0,103,30209,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thiªn H¹ V« Song Kh«i"},
				}},
	[4] = {item={{gdp={0,100,30210,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thiªn H¹ V« Song Gi¸p"},
					{gdp={0,101,30210,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thiªn H¹ V« Song Trang"},
					{gdp={0,103,30210,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Thiªn H¹ V« Song Kh«i"},
				}},
}

function tichluy_doitrangbicuoi()
	local szName = "Chñ TiÒn Trang"
	local szNpcName = "Chñ TiÒn Trang : "
	if gf_GetTaskByte(2162, 4) == 1 then
		Talk(1, "",szName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi!Kh«ng thÓ tiÕp tôc nhËn!");
		return 0;
	end
	
	local strNpcName = "Chu Tien Trang : "
	
	if GetTask(TASK_TICH_LUY_DIEM_THUONG) < 700000  then
		Talk(1, "", "B¹n kh«ng ®ñ 700.000 ®iÓm ®Ó ®æi vËt phÈm nµy.");
		return 0;
	end
	
	if gf_JudgeRoomWeight(3,100) == 0 then
		Talk(1,"",szName.."C¸c h¹ cÇn 3 « hµnh trang, 100 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
		return 0
	end
	
	LIB_txtData:Init("doithuongtichluy.txt")
	LIB_txtData:LoadData()
	local nNationRank = LIB_txtData.tbTextData[tonumber(1)]
	if nNationRank >= 3 then
		Talk(1, "", strNpcName.."PhÇn th­ëng 3 cao thñ ®Çu tiªn nhËn thiªn h¹ v« song ®· cã chñ nh©n!");
		return	
	end
	
	if LIB_txtData:AddValue(tonumber(1),1,3) == 1 then
		local nBody = GetBody()
		local nCurPoint = GetTask(TASK_TICH_LUY_DIEM_THUONG)
		SetTask(TASK_TICH_LUY_DIEM_THUONG,nCurPoint - 700000)
		gf_SetTaskByte(2162, 4, 1)
		Msg2Player("C¸c h¹ ®· nhËn 1 bé trang bÞ Thiªn H¹ V« Song thµnh c«ng!")
		Msg2Player("B¹n ®· tiªu hao 700.000  ®iÓm")
		LIB_Award.szLogTitle = "NHAN PHAN THUONG CUOI - THIEN HA VO SONG"
		LIB_Award.szLogAction = "thµnh c«ng"
		LIB_Award:Award(tbThienHaVoSong[nBody])
		Talk(1,"",szNpcName.."NhËn phÇn th­ëng cuèi, ng­¬i qu¶ lµ Thiªn h¹ v« song.")
	end
end

tbKimXaHC = {
	item = {
		{gdp={0,153,29,1,4,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng HiÖp Cèt"},
		{gdp={0,152,29,1,4,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng HiÖp Cèt"},
		{gdp={0,154,29,1,4,-1,-1,-1,-1,-1,-1,-1}, name="§¹o Hµi HiÖp Cèt"},
	}
}
	
tbKimXaQP = {
	item = {
		{gdp={0,153,30,1,4,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng Quû Phï"},
		{gdp={0,152,30,1,4,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng Quû Phï"},
		{gdp={0,154,30,1,4,-1,-1,-1,-1,-1,-1,-1}, name="§¹o Hµi Quû Phï"},
	}
}
	
tbKimXaDV = {
	item = {
		{gdp={0,153,31,1,4,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch­¬ng §»ng V©n"},
		{gdp={0,152,31,1,4,-1,-1,-1,-1,-1,-1,-1}, name="¸o Choµng §»ng V©n"},
		{gdp={0,154,31,1,4,-1,-1,-1,-1,-1,-1,-1}, name="§¹o Hµi §»ng V©n"},
	}
}

function NhanPhanThuongKX5()
	local szName = "Chñ TiÒn Trang"
	local szHeader = "<color=green>"..szName.." :<color>C¸c h¹ h·y lùa chän 1 trong 3 bé trang bÞ Kim Xµ cÊp 5 :"
	local tbSayDialog = {};
	local nSaySize = 0;
	tinsert(tbSayDialog,"Ta muèn nhËn trang bÞ Kim Xµ HiÖp Cèt/#receive_KimXa_cap5(1)")
	tinsert(tbSayDialog,"Ta muèn nhËn trang bÞ Kim Xµ Quû Phï/#receive_KimXa_cap5(2)")
	tinsert(tbSayDialog,"Ta muèn nhËn trang bÞ Kim Xµ §»ng V©n/#receive_KimXa_cap5(3)")
	tinsert(tbSayDialog, "Ta chØ ghÐ ngang/do_nothing")
	Say(szHeader, getn(tbSayDialog), tbSayDialog)	
end

function receive_KimXa_cap5(nChoice)
	if nChoice  == 1 then
		LIB_Award:Award(tbKimXaHC)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ HiÖp Cèt")
	elseif nChoice == 2 then
		LIB_Award:Award(tbKimXaQP)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ Quû Phï")
	elseif nChoice == 3 then
		LIB_Award:Award(tbKimXaDV)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ §»ng V©n")
	end	
	for i=1,3 do 
		TraoMatTichSieuCap20()
	end
	gf_AddItemEx2({2,1,30230,10000}, " Xu", EVENT_LOG_TITLE , "nhËn")
	gf_AddItemEx2({2,95,204,30}, " Thiªn Cang LÖnh", EVENT_LOG_TITLE , "nhËn")
	gf_AddItemEx2({2,1,30370,30}, " Thiªn M«n Kim LÖnh", EVENT_LOG_TITLE , "nhËn")
	gf_AddItemEx2({0,102,30037,1,4,-1,-1,-1,-1,-1,-1,-1}, " Thiªn §Þa Giíi ChØ", EVENT_LOG_TITLE , "nhËn")
	gf_AddItemEx2({0,102,30038,1,4,-1,-1,-1,-1,-1,-1,-1}, " NhËt NguyÖt Giíi ChØ", EVENT_LOG_TITLE , "nhËn")
	gf_SetTaskByte(2162, 3, 1)
end

function PhanThuongExt()
	local szName = "Chñ TiÒn Trang :"
	if gf_GetTaskByte(2162, 4) == 0 then
		Talk(1, "",szName.."C¸c h¹ kh«ng ph¶i lµ Thiªn H¹ V« Song! kh«ng thÓ nhËn phÇn th­ëng nµy");
		return 0;
	end
	
	if gf_GetTaskByte(2162, 4) == 1 and gf_GetTaskByte(2162, 3) == 1 then
		Talk(1, "",szName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi!Kh«ng thÓ tiÕp tôc nhËn!");
		return 0;
	end
	
	if gf_JudgeRoomWeight(25,200) == 0 then
		Talk(1,"",szName.."C¸c h¹ cÇn 25 « hµnh trang, 200 søc lùc ®Ó nhËn phÇn th­ëng nµy!");
		return 0
	end
	
	NhanPhanThuongKX5()
end
