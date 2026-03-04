-- Event ®ua top
-- Created by TuanNA5
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\newserver\\topbanghoi.lua");
Include("\\script\\vng\\newserver\\hoatdong.lua");

strNpcName = "<color=green>S¸t Hæ: <color> "
szLogTitle = "Top SAT HO"
szStartDate = "18-03-2020"
szEndDate = "18-05-2020"
szServerName = "S¸t Hæ"

function main()
	local nDate = tonumber(date("%Y%m%d"))
	
--	if GetCreateTime() <= TOP_CREATED_ROLE then
--		Talk(1,"",strNpcName.."Thêi gian t¹o tµi kho¶n kh«ng hîp lÖ nªn kh«ng thÓ nhËn th­ëng!")
--		return
--	end

	if GetGlbValue(GLB_TSK_SERVER_ID) ~= TOP_SERVER_ID or GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR) ~= TOP_SERVER_ID then
		Talk(1,"",strNpcName.."Ng­¬i kh«ng ph¶i thÇn d©n bæn quèc nªn kh«ng thÓ nhËn th­ëng!")
		return
	end
	local tSay = {}
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then		
--		tinsert(tSay,"NhËn th­ëng th¨ng cÊp dµnh cho 2 hÖ ph¸i míi: C«n L«n KiÕm T«n vµ §­êng M«n NhËm HiÖp/minhgiao_get_award_by_level")
--		tinsert(tSay,"NhËn phÇn th­ëng theo ®¼ng cÊp/get_award_by_level")
--		tinsert(tSay,"NhËn th­ëng l­u ph¸i Thóy Yªn Linh N÷ cÊp 92-99/get_route_award_by_level_menu")
--		tinsert(tSay,"NhËn th­ëng trùc tiÕp lªn chuyÓn sinh 7, 8, 9, 10/vangdanhthienha_get_fast_level")
		tinsert(tSay,"NhËn th­ëng th¨ng cÊp t¹i m¸y chñ míi/vangdanhthienha_get_award_by_level")
		tinsert(tSay,"NhËn th­ëng 1 cao thñ ®Çu tiªn ®¹t 6.600.000 ®iÓm c«ng tr¹ng/confirm_get_1mil_Hornor_award")	--
--		tinsert(tSay,"NhËn phÇn th­ëng ¦u ®·i server " .. szServerName .. "/Say_NhanUuDai")
		tinsert(tSay,"NhËn phÇn th­ëng cao thñ Top 1 mçi hÖ ph¸i/get_top_faction_award")	--
		tinsert(tSay,"NhËn phÇn th­ëng 2 nh©n sÜ ®Çu tiªn mçi phe ®¹t 5.400.000 c«ng tr¹ng/confirm_get_top_Hornor_award")	--
--		tinsert(tSay,"§¨ng ký nhËn th­ëng top 10 chuyÓn sinh 6 cÊp 99/#CS_TopAward(6)")
--		tinsert(tSay,"§¨ng ký top 3 ph¸i Minh Gi¸o ®¹t chuyÓn sinh 7 cÊp 90 ®Çu tiªn/get_fast_MinhGiao")	
		tinsert(tSay,"§¨ng ký nhËn th­ëng 3 nh©n sÜ ®Çu tiªn chuyÓn sinh 10 cÊp 94/#CS_TopAward(7)")	--
--		tinsert(tSay,"§¨ng ký nhËn th­ëng top 100 chuyÓn sinh 3 cÊp 99/#CS_TopAward(3)")
--		tinsert(tSay,"Ho¹t ®éng "..szServerName.."/NewServer_HoatDong_Menu")
	end
	tinsert(tSay,"Bang héi danh gi¸/TopBangHoi_Menu")
	tinsert(tSay,"Xem t×nh h×nh nhËn th­ëng top hÖ ph¸i/get_top_faction_info")
--	tinsert(tSay,"Xem t×nh h×nh nhËn th­ëng top 3 chiÕn tr­êng/get_top_nation_info")
--	tinsert(tSay,"Xem t×nh h×nh ®¨ng ký nhËn th­ëng mËt tÞch/get_top100_award_info")
--	tinsert(tSay,"Ph¸t th­ëng bang héi/PhatThuongBangHoi")
	tinsert(tSay,"Ta biÕt råi/dlgover")	
	
	if nDate >= TOP_START_DATE then
		local strSay = strNpcName.."Ho¹t ®éng <color=yellow>Truy C«ng L·nh Th­ëng<color> diÔn ra tõ ngµy<color=red> "..szStartDate.." ®Õn 24:00 "..szEndDate.."<color>. Trong thêi gian nµy, quý ®ång ®¹o cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng hÊp dÉn. Th«ng tin chi tiÕt quý ®ång ®¹o vui lßng xem t¹i <color=blue>https://volam2.zing.vn<color>"
		Say(strSay,getn(tSay),tSay)
	end
end

function get_award_by_level()
	local tSay = {}
	tSay[0] = strNpcName.."Trong thêi gian tõ ngµy<color=red> "..szStartDate.." ®Õn 24:00 "..szEndDate.."<color>, khi ®¹t ®­îc c¸c mèc ®iÒu kiÖn nhËn th­ëng (xem thªm trªn trang chñ), ®ång ®¹o cã thÓ ®Õn gÆp ta ®Ó nhËn phÇn th­ëng."
	for i=1,getn(tb_topserver_award_limit) do
		if tb_topserver_award_limit[i] ~= nil then
			if tb_topserver_award_limit[i][4] >= gf_GetTaskByte(TSK_TOP_LEVEL,1)  then
				tinsert(tSay, "Ta muèn nhËn phÇn th­ëng cÊp ®é "..i.."/#conf_get_award_by_level("..i..")")
			end
		end
	end
	local nDate = tonumber(date("%Y%m%d"));	
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then
		gf_PageSay(tSay, 1, 6)
	else
		Talk(1,"",strNpcName.."Ho¹t ®éng ®· kÕt thóc!")
	end			
end


-- Truy c«ng l·nh th­ëng theo ®¼ng cÊp
function conf_get_award_by_level(nLevel)
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	if tFactionSkillInfo[nRoute] == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a gia nhËp hÖ ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	if GetLevel() < nLevel then
		Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ ch­a ®ñ "..nLevel..", kh«ng thÓ nhËn th­ëng.");
		return
	end
--	if CheckMaxSkill55() == 0 then
--		Talk(1, "", strNpcName.."C¸c h¹ ch­a häc ®Çy ®ñ vâ c«ng cÊp 55, kh«ng thÓ nhËn th­ëng.");
--		return
--	end
	if gf_GetTaskByte(TSK_TOP_LEVEL,1) > tb_topserver_award_limit[nLevel][4] then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi. Kh«ng thÓ nhËn tiÕp ®­îc n÷a!");
		return
	end	
	local nAwardLevel = TopCheckLevel()
	if nAwardLevel == 0 or nAwardLevel < nLevel then
		Talk(1, "", strNpcName.."Kh«ng ®ñ ®iÒu kiÖn nhËn phÇn th­ëng nµy. Vui lßng kiÓm tra l¹i c¸c ®iÒu kiÖn ®¼ng cÊp, danh väng, s­ m«n, c«ng tr¹ng hoÆc c¸c h¹ ch­a nhËn c¸c phÇn th­ëng tr­íc.");
		return 0
	end
	warning_get_award_by_level(nLevel, nAwardLevel);
end


-- Truy c«ng l·nh th­ëng theo ®¼ng cÊp
function warning_get_award_by_level(nWantLevel, nLevel)
	Say("X¸c nhËn muèn nhËn phÇn th­ëng nµy",
		2,
		"Ta muèn nhËn /#confirm_conf_get_award_by_level("..nWantLevel..")",
		"§Ó ta suy nghÜ l¹i./dlgover");
end


-- Truy c«ng l·nh th­ëng theo ®¼ng cÊp
function confirm_conf_get_award_by_level(nLevel)
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	-- Check quèc tÞch
	if nNationality ~= nNation then
		Talk(1, "", "Ng­¬i kh«ng ph¶i lµ thÇn d©n bæn quèc nªn kh«ng thÓ nhËn th­ëng!")
		return
	end
	
	-- Check hµnh trang
	if gf_Judge_Room_Weight(14,500)~=1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return
	end
	
	if GetLevel() < 76 then
		Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ ch­a ®ñ 76, kh«ng thÓ nhËn th­ëng.");
		return
	end
	if gf_GetTaskByte(TSK_TOP_LEVEL,1) ~= tb_topserver_award_limit[nLevel][4] then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi. Kh«ng thÓ nhËn tiÕp ®­îc n÷a!");
		return
	end
	local nRoute = GetPlayerRoute()
	if tFactionSkillInfo[nRoute] == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a gia nhËp hÖ ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
--	if GetReputation() < 100 then
--		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ 100 ®iÓm Danh väng.");
--		return
--	end
--
--	if GetTask(336) < 50 then
--		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ 50 ®iÓm S­ m«n.");
--		return
--	end
	
	local nRet, nItemIdx = 0,0	
	if nLevel == 83 then
		if GetCash() < 9990000 then
			Talk(1, "", strNpcName.."C¸c h¹ kh«ng cã ®ñ 999 vµng.");
			return 0
		end
	end
	
	-- Bæ sung ®iÒu kiÖn cho c¸c Level sau
	if nLevel >= 99 then
		if GetReputation() < 3000 then
			Talk(1,"","C¸c h¹ kh«ng ®ñ 3000 ®iÓm danh väng")
			return
		end
		if GetTask(336) < 3000 then
			Talk(1,"","C¸c h¹ kh«ng ®ñ 2003 ®iÓm danh väng s­ m«n.")
			return
		end
		if GetItemCount(2,1,30230) < 300 then
			Talk(1,"","C¸c h¹ kh«ng ®ñ xu vËt phÈm nhËn th­ëng.")
			return
		end
		if GetExp() < 300000000 then
			Talk(1,"","C¸c h¹ kh«ng ®ñ ®iÓm kinh nghiÖm nhËn th­ëng.")
			return
		end
	elseif nLevel >= 91 then
		if TopCheckSkill(tFactionSkillInfo,20) == 0 then
			Talk(1, "", strNpcName.."C¸c h¹ ch­a luyÖn thµnh vâ c«ng trÊn ph¸i 20 cÊp.");
			return 0
		end
		if GetReputation() < 500 then
			Talk(1,"","C¸c h¹ kh«ng ®ñ 500 ®iÓm danh väng")
			return 0
		end
		if GetTask(336) < 500 then
			Talk(1,"","C¸c h¹ kh«ng ®ñ 500 ®iÓm danh väng s­ m«n.")
			return 0
		end
		if GetCash() < 500000 then
			Talk(1, "", strNpcName.."C¸c h¹ kh«ng cã ®ñ 50 vµng.");
			return 0
		end
	end
	
	-- Trao thuong
	local nAwardOrder = tonumber(gf_GetTaskByte(TSK_TOP_LEVEL,1))+1
	gf_SetTaskByte(TSK_TOP_LEVEL,1,nAwardOrder)
	--SetTask(TSK_TOP_LEVEL,GetTask(TSK_TOP_LEVEL) + 1)
	if nLevel == 83 then
		Pay(9990000)
	end
	
	if nLevel >= 99 then
		ModifyReputation(-3000,0)
		SetTask(336, GetTask(336) - 3000)
		Msg2Player("B¹n bÞ trõ 3000 ®iÓm s­ m«n!")
		DelItem(2,1,30230,300)
		Msg2Player("B¹n bÞ trõ 300 xu vËt phÈm!")
		ModifyExp(-300000000)
		Msg2Player("B¹n bÞ trõ 300.000.000 ®iÓm kinh nghiÖm!")
	elseif  nLevel > 90 then
		ModifyReputation(-500,0)
		SetTask(336, GetTask(336) - 500)
		Msg2Player("B¹n bÞ trõ 500 ®iÓm s­ m«n!")
		Pay(500000)
	end
	
	for i=1,getn(tb_topserver_award_item[nLevel]) do
		local tb_item = {}
		tb_item = tb_topserver_award_item[nLevel][i]
		if tb_item[1] == 1 then -- item
			if tb_item[4] == 0 then
				gf_AddItemEx2(tb_item[3],tb_item[2], szLogTitle, "nhËn th­ëng cÊp "..nLevel)
			elseif tb_item[4] > 0 then
		 		gf_AddItemEx2(tb_item[3],tb_item[2], szLogTitle, "nhËn th­ëng cÊp "..nLevel, tb_item[4])
		 	end
		elseif tb_item[1] == 2 then -- command
			dostring(format(tb_item[2],tb_item[3]))
			WriteLogEx(szLogTitle,"nhËn th­ëng cÊp "..nLevel,tb_item[3],tb_item[2])
		elseif tb_item[1] == 3 then -- table
			local tb_Award = tb_item[2]
			if tb_item[4] == 0 then
				gf_AddItemEx2(tb_Award[nRoute][2],tb_Award[nRoute][1], szLogTitle,"nhËn th­ëng cÊp "..nLevel)			
			elseif tb_item[4] > 0 then
		 		gf_AddItemEx2(tb_Award[nRoute][2],tb_Award[nRoute][1], szLogTitle,"nhËn th­ëng cÊp "..nLevel, tb_item[4])
		 	end
		 	-- Chän vò khÝ ViÖt Yªn cho TL tôc gia
		 	if nRoute == 2 and nLevel == 292 then
		 		Say("Ta cã 2 mãn vò khÝ dµnh cho c¸c h¹, h·y chän vò khÝ phï hîp:", 2, "ViÖt Yªn Phi Tinh §ao/#ChonVuKhiThieuLam(1)", "ViÖt Yªn Phi Tinh C«n/#ChonVuKhiThieuLam(2)")
		 	end
		else
			Talk(1, "", strNpcName.."§¼ng cÊp kh«ng ®óng!");
			WriteLogEx(szLogTitle,"®¼ng cÊp kh«ng ®óng???");
			return
		end
	end
	
	local szChuyensinh = " "
	if floor(nLevel/100)>0 then
		local szChuyensinh = " (chuyÓn sinh "..floor(nLevel/100)..")"
	end
	Say(strNpcName.."Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng "..mod(nLevel,100).." "..szChuyensinh,0)
end

--Chän Vò khÝ ThiÕu L©m
function ChonVuKhiThieuLam(nOption)
	if nOption==1 then
		gf_AddItemEx2({0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,13},"ViÖt Yªn Phi Tinh §ao",1)
	else
		gf_AddItemEx2({0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,13},"ViÖt Yªn Phi Tinh C«n",1)
	end
end


---- NhËn th­ëng top chuyÓn sinh theo m«n ph¸i  ----------
function get_top_faction_award()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then	
		Say(strNpcName.."NhËn phÇn th­ëng cao thñ hoµn thµnh <color=red>chuyÓn sinh 10 cÊp 92<color> ®Çu tiªn (theo hÖ ph¸i), tiªu hao 10.000 xu vËt phÈm: ",
			2,
			"Ta muèn nhËn/confirm_get_top_faction_award",
			"§Ó ta suy nghÜ l¹i./dlgover");
	else
		Talk(1,"",strNpcName.."Ho¹t ®éng ®· kÕt thóc!")
	end
end

--- NhËn th­ëng top 1 hÖ ph¸i ----
function confirm_get_top_faction_award()
	-- Dieu kien nhan thuong
	local nMonPhai = GetPlayerRoute()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = abs(GetTask(701));
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	local tbRoute = {[2]=1,[3]=1,[4]=1,[6]=1,[8]=1,[9]=1,[11]=1,[12]=1,[14]=1,[15]=1,[17]=1,[18]=1,[20]=1,[21]=1,[23]=1,[25]=1,[26]=1,[27]=1,[29]=1,[30]=1,[31]=1,[32]=1}
	if nNationality ~= nNation then
		Talk(1, "", strNpcName .. "C¸c h¹ kh«ng ph¶i lµ thÇn d©n bæn quèc nªn kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	
	if tbRoute[nMonPhai] ~= 1 then
		Talk(1,"",strNpcName .. "C¸c h¹ ch­a chän hÖ ph¸i nªn kh«ng thÓ nhËn th­ëng.")
		return 0
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_TRANSLIFE1) == 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng top 1 theo hÖ ph¸i råi.");
		return 0
	end
	
	if gf_CheckLevel(10,92) ~= 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®¹t phôc sinh 10 cÊp ®é 92, h·y cè g¾ng thªm..");
		return 0
	end
	
	if nRep < 30000 or nFaction < 30000 or nHor < 4400000  then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÒu kiÖn nhËn th­ëng. Vui lßng kiÓm tra ®iÒu kiÖn danh väng, s­ m«n, c«ng tr¹ng.");
		return 0
	end

	if GetItemCount(2,1,30230) < 10000 then
		Talk(1,"",strNpcName .. "C¸c h¹ kh«ng ®em ®ñ 10.000 xu vËt phÈm.")
		return 0
	end
		
--	if TopCheckSkill(tFactionSkillInfo,20) == 0 then
--		Talk(1, "", strNpcName.."C¸c h¹ ch­a luyÖn thµnh vâ c«ng trÊn ph¸i 20 cÊp.");
--		return	
--	end

	if gf_Judge_Room_Weight(25, 300, strNpcName) == 0 then
		Talk(1,"",strNpcName .. "Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return
	end	

	
	LIB_txtData:Init("top_route.txt")
	LIB_txtData:LoadData()
	local nFactionRank = LIB_txtData.tbTextData[tonumber(nMonPhai)]
	if nFactionRank >= 1 then
		Talk(1, "", strNpcName.."PhÇn th­ëng nµy ®· cã chñ nh©n!");
		return		
	end
	local nRoute = GetPlayerRoute()
	if LIB_txtData:AddValue(tonumber(nMonPhai),1,5) == 1 then
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nhËn"
		if DelItem(2,1,30230,10000) ~= 1 then
			Talk(1,"",strNpcName .. "C¸c h¹ kh«ng ®em ®ñ 10.000 xu vËt phÈm.")
			return 0
		end
		-- Bit 1 nhËn phÇn th­ëng chuyÓn sinh 1
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_TRANSLIFE1,1)
		local nItemLevel = 0
		get_award_daquy123()
		--MËt tÞch cÊp 70
		TraoMatTichCaoCap20(2,nRoute)
			
		--Thó C­ìi	
		local tbAward = {
			item = {
				{gdp = {0,105,30025,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "B¹ch Hæ B¶o B¶o"},
				{gdp = {2,1,30814,1,1}, name = "Phôc Sinh §¬n"},
				{gdp = {2,1,31313,1,4}, name = "S¸t Tinh LÖnh (Nãn)"},
				{gdp = {2,1,31314,1,4}, name = "S¸t Tinh LÖnh (¸o)"},
				{gdp = {2,1,31315,1,4}, name = "S¸t Tinh LÖnh (QuÇn)"},
--				{gdp = {2,1,30973,1,4}, name = "V« H¹ Hµo HiÖp LÖnh (Vò KhÝ)"},
				{gdp = {2,1,1009,100,1}, name = "Thiªn Th¹ch Tinh Th¹ch"},
				{gdp = {0,102,8846, 1,4, -1, -1, -1, -1, -1, -1}, name = "Huy Hoµng QuËt Khëi"},
				{gdp = {0,102,8847, 1,4, -1, -1, -1, -1, -1, -1}, name = "Vinh Dù QuËt Khëi"},
			}	
		}
		
		LIB_Award:Award(tbAward)			
		local tVuKhi = {
				[2] = {0,3,30884, 1,4},
				[3] = {0,8,30885, 1,4},
				[4] = {0,0,30886, 1,4},
				[6] = {0,1,30887, 1,4},
				[8] = {0,2,30888, 1,4},
				[9] = {0,10,30889, 1,4},
				[11] = {0,0,30890, 1,4},
				[12] = {0,5,30891, 1,4},
				[14] = {0,2,30892, 1,4},
				[15] = {0,9,30893, 1,4},
				[17] = {0,6,30894, 1,4},
				[18] = {0,4,30895, 1,4},
				[20] = {0,7,30896, 1,4},
				[21] = {0,11,30897, 1,4},
				[23] = {0,2,30898, 1,4},
				[25] = {0,3,30899, 1,4},
				[26] = {0,9,30900, 1,4},
				[27] = {0,11,30901, 1,4},
				[29] = {0,13,30902, 1,4},
				[30] = {0,12,30903, 1,4},
				[31] = {0,14,32164, 1,4},
				[32] = {0,2,32192, 1,4},
			}
		gf_AddItemEx2(tVuKhi[nRoute], "VK Èm huyÕt", "NHAN THUONG DUA TOP", "nhËn vk Èm huyÕt thµnh c«ng");	
		local tbSay = {}		
		tinsert(tbSay,"Ta muèn nhËn trang bÞ Kim Xµ S¸t Lang/#receive_KimXa_top1_faction(1)")
		tinsert(tbSay,"Ta muèn nhËn trang bÞ Kim Xµ NhuÖ Nha/#receive_KimXa_top1_faction(2)")
		tinsert(tbSay,"Ta muèn nhËn trang bÞ Kim Xµ Méng S¸t/#receive_KimXa_top1_faction(3)")
		Say(strNpcName.."C¸c h¹ h·y lùa chän 1 trong 3 bé trang bÞ Kim Xµ 7: ",getn(tbSay),tbSay)
		--Talk(1,"","NhËn thµnh c«ng phÇn th­ëng h¹ng "..(nFactionRank+1).." m«n ph¸i "..tb_Route_Name[tonumber(nMonPhai)] .. ".")
	end
end

function receive_KimXa_top1_faction(nChoice)
	
	if nChoice  == 1 then
		LIB_Award:Award(tb7KimXaHoanLang)	--tbKimXaVanDu
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ 7 S¸t Lang")
	elseif nChoice == 2 then
		LIB_Award:Award(tb7KimXaDangGiao)	--tbKimXaThietHuyet
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ 7 NhuÖ Nha")
	elseif nChoice == 3 then
		LIB_Award:Award(tb7KimXaKhoiPhuong)	--tbKimXaDuHiep
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ 7 Méng S¸t")
	end	
	
--	receive_DieuDuong_Top1_faction_01(0,1)
end

function receive_DieuDuong_Top1_faction_01(nType,nReceive)
	do return 0 end
	
	local nType = nType or 0
	local nReceive = nReceive or 1
	tbSay = {}
	tinsert(tbSay,format("Ta muèn nhËn trang søc DiÖu D­¬ng(Søc M¹nh)/#receive_DieuDuong_Top1_faction_02(%d,%d,%d)",1,nType,nReceive))
	tinsert(tbSay,format("Ta muèn nhËn trang søc DiÖu D­¬ng(Th©n Ph¸p)/#receive_DieuDuong_Top1_faction_02(%d,%d,%d)",2,nType,nReceive))
	tinsert(tbSay,format("Ta muèn nhËn trang søc DiÖu D­¬ng(Néi C«ng)/#receive_DieuDuong_Top1_faction_02(%d,%d,%d)",3,nType,nReceive))
	tinsert(tbSay,format("Ta muèn nhËn trang søc DiÖu D­¬ng(Linh Ho¹t)/#receive_DieuDuong_Top1_faction_02(%d,%d,%d)",4,nType,nReceive))
	tinsert(tbSay,format("Ta muèn nhËn trang søc DiÖu D­¬ng(G©n Cèt)/#receive_DieuDuong_Top1_faction_02(%d,%d,%d)",5,nType,nReceive))
	Say("C¸c h¹ h·y lùa chän 2 trong 5 mãn sau: ",getn(tbSay),tbSay)
end

function receive_DieuDuong_Top1_faction_02(nChoice,nType,nReceive)
	
	tbDieuDuong = {
		item = {
			[1] = {gdp={0,102,3190,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},
			[2] = {gdp={0,102,3191,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},
			[3] = {gdp={0,102,3192,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},
			[4] = {gdp={0,102,3193,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},
			[5] = {gdp={0,102,3194,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},
		}
	}	
	
	if nChoice == 1 then
		if nReceive == 2 then
			if nType == 1 then
				Talk(1,"#receive_DieuDuong_Top1_faction_01(1,2)","C¸c h¹ ®· nhËn mãn nµy råi!")
			else
				LIB_Award:Award({item={[1] = {gdp={0,102,3190,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
				Msg2Player("C¸c h¹ nhËn th­ëng thµnh c«ng phÇn th­ëng Top 1 m«n ph¸i!")
				return
			end
		else
			LIB_Award:Award({item={[1] = {gdp={0,102,3190,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
			receive_DieuDuong_Top1_faction_01(1,2)
		end
	end
	
	if nChoice  == 2 then
		if nReceive == 2 then
			if nType == 2 then
				Talk(1,"#receive_DieuDuong_Top1_faction_01(2,2)","C¸c h¹ ®· nhËn mãn nµy råi!")
			else
				LIB_Award:Award({item={[1] = {gdp={0,102,3191,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
				return
			end
		else
			LIB_Award:Award({item={[1] = {gdp={0,102,3191,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
			receive_DieuDuong_Top1_faction_01(2,2)
		end
	end
	
	if nChoice  == 3 then
		if nReceive == 2 then
			if nType == 3 then
				Talk(1,"#receive_DieuDuong_Top1_faction_01(3,2)","C¸c h¹ ®· nhËn mãn nµy råi!")
			else
				LIB_Award:Award({item={[1] = {gdp={0,102,3192,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
				return
			end
		else
			LIB_Award:Award({item={[1] = {gdp={0,102,3192,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
			receive_DieuDuong_Top1_faction_01(3,2)
		end
	end
	
	if nChoice  == 4 then
		if nReceive == 2 then
			if nType == 4 then
				Talk(1,"#receive_DieuDuong_Top1_faction_01(4,2)","C¸c h¹ ®· nhËn mãn nµy råi!")
			else
				LIB_Award:Award({item={[1] = {gdp={0,102,3193,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
				return
			end
		else
			LIB_Award:Award({item={[1] = {gdp={0,102,3193,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
			receive_DieuDuong_Top1_faction_01(4,2)
		end
	end
	
	if nChoice  == 5 then
		if nReceive == 2 then
			if nType == 5 then
				Talk(1,"#receive_DieuDuong_Top1_faction_01(5,2)","C¸c h¹ ®· nhËn mãn nµy råi!")
			else
				LIB_Award:Award({item={[1] = {gdp={0,102,3194,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
				return
			end
		else
			LIB_Award:Award({item={[1] = {gdp={0,102,3194,1,1,-1,-1,-1,-1,-1,-1,-1}, name="DiÖu D­¬ng Thiªn Cung"},}})
			receive_DieuDuong_Top1_faction_01(5,2)
		end
	end
	
end

-- NhËn th­ëng top c«ng tr¹ng
function confirm_get_top_Hornor_award()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = GetTask(701);
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	
	local nTongLieu = 1
	if nHor < 0 then
		nTongLieu = 2
	end
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	if nNationality ~= nNation then
		Talk(1, "", strNpcName.."C¸c h¹ kh«ng ph¶i lµ thÇn d©n bæn quèc nªn kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	
	if gf_CheckLevel(10,92) ~= 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®¹t phôc sinh 10 cÊp ®é 92, h·y cè g¾ng thªm..");
		return 0
	end
	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",strNpcName.."C¸c h¹ ch­a gia nhËp hÖ ph¸i!")
		return
	end
	
	--if nRep < 25000 or nFaction < 25000 or abs(nHor) < 860000  then
	if abs(nHor) < 5200000  then
	--	Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÒu kiÖn nhËn th­ëng. Vui lßng kiÓm tra ®iÒu kiÖn danh väng, s­ m«n, c«ng tr¹ng.");
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÒu kiÖn nhËn th­ëng. Vui lßng kiÓm tra ®iÒu kiÖn c«ng tr¹ng.");
		return 0
	end
	
	if abs(GetTask(704)) < 5 then
		Talk(1,"",strNpcName.."C¸c h¹, phÇn th­ëng nµy chØ ®­îc trao tÆng cho t­íng qu©n, C¸c h¹ h·y cè g¾ng thªm nhÐ...");
		return
	end
	
	 if GetItemCount(2,1,30230) < 9000 then
		 Talk(1,"", strNpcName.."C¸c h¹ kh«ng ®em ®ñ 9000 xu vËt phÈm, hay lµ ®· ®Ó quªn trong r­¬ng?")
		 return
	 end
	
	if gf_Judge_Room_Weight(25, 300, strNpcName) == 0 then
		Talk(1,"", strNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_1MIL_HORNOR) == 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng §ua Top C«ng Tr¹ng råi.");
		return	
	end
	
	LIB_txtData:Init("top_nation.txt")
	LIB_txtData:LoadData()
	local nNationRank = LIB_txtData.tbTextData[1]
	--====
	if nTongLieu == 2 then
		nNationRank = LIB_txtData.tbTextData[2]
	end
	--====
	if nNationRank >= 2 then
		Talk(1, "", strNpcName.."PhÇn th­ëng ®· cã chñ nh©n!");
		return	
	end
	--====
	local nCheck_add_value = 0
--	nCheck_add_value =LIB_txtData:AddValue(1,1,3)
	if nTongLieu == 1 then
		nCheck_add_value =LIB_txtData:AddValue(1,1,2)
	elseif nTongLieu == 2 then
		nCheck_add_value =LIB_txtData:AddValue(2,1,2)
	end
	--===	
	if nCheck_add_value == 1 then
		nNationRank = LIB_txtData.tbTextData[1]
		--====
		if nTongLieu == 2 then
			nNationRank = LIB_txtData.tbTextData[2]
		end
		--====
		DelItem(2,1,30230,9000)
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nhËn"
--		local tbAward = {item = {{gdp={2,1,9977,1,1}, name = "Qu©n C«ng Huy Hoµng", nExpired = 90*24*60*60}}}
--		Bit 1 nhËn phÇn th­ëng top c«ng tr¹ng
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_1MIL_HORNOR,1)
		get_award_daquy345(2)
		gf_AddItemEx2({2,1,30821, 1}, "Trøng ThÇn BÝ T©y Vùc ", "DUA TOP 1" , "nhËn trøng")
		if nNationRank == 1 then
			--Thªm trang bÞ Thanh Long --AddTrangBiHoaPhungTuongQuan(10,0)
			AddTrangBiUyHoTuongQuan(0,0)
		elseif nNationRank == 2 then
			--Thªm trang bÞ Thanh Long --AddTrangBiHoaPhungTuongQuan(10,0)
			AddTrangBiUyHoTuongQuan(0,0)
--		elseif nNationRank == 3 then
			--TraoLoiHoTuongQuan(13)
--			AddTrangBiHoaPhungTuongQuan(0,0)
		end
		Talk(1,"","NhËn thµnh c«ng phÇn th­ëng 5.400.000 c«ng tr¹ng")
	end
end


-- NhËn th­ëng top 5.600.000 c«ng tr¹ng
function confirm_get_1mil_Hornor_award()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = GetTask(701);
	
	local nTongLieu = 1
	if nHor < 0 then
		nTongLieu = 2
	end
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	if nNationality ~= nNation then
		Talk(1, "", strNpcName.."C¸c h¹ kh«ng ph¶i lµ thÇn d©n bæn quèc nªn kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",strNpcName.."C¸c h¹ ch­a gia nhËp hÖ ph¸i!")
		return
	end
	
	if gf_CheckLevel(10,92) ~= 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®¹t phôc sinh 10 cÊp ®é 92, h·y cè g¾ng thªm..");
		return 0
	end
	
	--if nRep < 30000 or nFaction < 30000 or abs(nHor) < 2400000  then
	if abs(nHor) < 6400000  then
--		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÒu kiÖn nhËn th­ëng. Vui lßng kiÓm tra ®iÒu kiÖn danh väng, s­ m«n, c«ng tr¹ng.");
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÒu kiÖn nhËn th­ëng. Vui lßng kiÓm tra ®iÒu kiÖn c«ng tr¹ng.");
		return 0
	end
	
	LIB_txtData:Init("top_1milhornor.txt")
	LIB_txtData:LoadData()
		
	local nNationRank = LIB_txtData.tbTextData[1]
	if nNationRank ~= 0 then
		Talk(1,"",strNpcName.."PhÇn th­ëng nµy ®· cã ng­êi nhËn råi, C¸c h¹ h·y chän phÇn th­ëng kh¸c nhÐ !!!!");
		return 0
	end
	if nNationRank == 0 then
		if abs(GetTask(704)) < 6 then
			Talk(1,"",strNpcName.."C¸c h¹, phÇn th­ëng nµy chØ ®­îc trao tÆng cho nguyªn so¸i, C¸c h¹ h·y cè g¾ng thªm nhÐ...");
			return 0
		end
	elseif nNationRank == 1 then
		if abs(GetTask(704)) < 5 then
			Talk(1,"",strNpcName.."C¸c h¹, phÇn th­ëng nµy chØ ®­îc trao tÆng cho t­íng qu©n, C¸c h¹ h·y cè g¾ng thªm nhÐ...");
			return 0
		end
	end
	 if GetItemCount(2,1,30230) < 13000 then
		 Talk(1,"", strNpcName.."C¸c h¹ kh«ng ®em ®ñ 13.000 xu vËt phÈm, hay lµ ®· ®Ó quªn trong r­¬ng?")
		 return 0
	 end
	
	if gf_Judge_Room_Weight(15, 300, strNpcName) == 0 then
		Talk(1,"", strNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_1MIL_HORNOR) == 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng §ua Top C«ng Tr¹ng råi.");
		return	
	end
	
--	local nNationRank = LIB_txtData.tbTextData[tonumber(nTongLieu)]
	if nNationRank >= 1 then
		Talk(1, "", strNpcName.."PhÇn th­ëng nµy ®· cã chñ nh©n!");
		return	
	end
	
	if LIB_txtData:AddValue(1,1,2) == 1 then
		nNationRank = LIB_txtData.tbTextData[1]
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nhËn"
		DelItem(2,1,30230,13000) -- Xu VËt PhÈm
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_1MIL_HORNOR,1)
		get_award_daquy345(1)
		gf_AddItemEx2({2,1,30787, 1}, "trøng b«n ®iÓu", "DUA TOP 1" , "nhËn trøng")
		if nNationRank == 1 then -- Bé Trang bi Hoa Phung Nguyªn So¸i
			--Thªm trang bÞ Thanh Long --AddTrangBiHoaPhungNguyenSoai(10,0)
			AddTrangBiUyHoNguyenSoai(0,0)
--		elseif nNationRank == 2 then
--			TraoLoiHoNguyenSoai(13)
		end
		-- Bit 1 nhËn phÇn th­ëng top c«ng tr¹ng
		--local tbChienTuong = {item = {{gdp={0,105,30033,1,4,-1,-1,-1,-1,-1,-1,-1}, name = "ChiÕn T­îng Nguyªn So¸i"}}}
		--LIB_Award:Award(tbChienTuong)		
		Talk(1,"","NhËn thµnh c«ng phÇn th­ëng 6.600.000 c«ng tr¹ng")
	end
end


-- Xem th«ng tin top 100 nhËn mËt tÞch
function get_top100_award_info()
	LIB_txtData:Init("soluongphanthuong.txt")
	LIB_txtData:LoadData()
	local szList = "Sè l­îng nhËn th­ëng mËt tÞch ®· ®¨ng ký: \n"	
	local szList2 = szList
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do
		szList = szList.."ChuyÓn sinh "..i..": "..LIB_txtData.tbTextData[i].."/100\n"
	end
	Talk(1,"",szList)	
end


-- Xem th«ng tin top m«n ph¸i
function get_top_faction_info()
	LIB_txtData:Init("top_route.txt")
	LIB_txtData:LoadData()
	local szList = "Th«ng tin phÇn th­ëng top 1 hÖ ph¸i ®· nhËn: \n"	
	local szList2 = szList
	local szList3 = szList
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do
		if tb_Route_Name[i] ~= "" then
			if i > 20 then
				szList3 = szList3.."Cao thñ <color=green>"..tb_Route_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
			elseif i > 10 and i <= 20 then
				szList2 = szList2.."Cao thñ <color=green>"..tb_Route_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
			else
				szList = szList.."Cao thñ <color=green>"..tb_Route_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
			end
		end
	end
	Talk(3,"",szList, szList2, szList3)	
end

-- Xem th«ng tin top qu©n c«ng
function get_top_nation_info()
	LIB_txtData:Init("top_nation.txt")
	LIB_txtData:LoadData()
	for i=1,getn(LIB_txtData.tbTextData) do
		print(LIB_txtData.tbTextData[i])
	end
	local szList = "Th«ng tin phÇn th­ëng top 3 vinh dù chiÕn tr­êng: \n"	
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do		
		szList = szList.."Cao thñ phe <color=green>"..tb_Nation_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
	end
	Talk(1,"",szList)	
end

-- NhËn ­u ®·i server míi
function Say_NhanUuDai()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if nNation~=TOP_SERVER_ID then
		Talk(1,"","ChØ cã server " .. szServerName .. " míi nhËn ®­îc phÇn th­ëng")
		return
	end
	tbSay = {"Ta chØ ghÐ ngang/dlgover"}
	for i=getn(tbDieuKienUuDai),1,-1 do
		tinsert(tbSay,1,"CÊp "..tbDieuKienUuDai[i]["nLevel"]..": "..tbDieuKienUuDai[i]["name"].." cÇn "..tbDieuKienUuDai[i]["tbitem"][4].." "..tbDieuKienUuDai[i]["tbitem"][5].."/#UuDaiServerMoi("..i..")")
	end
	Say("Mêi c¸c h¹ nhËn phÇn t­ëng t­¬ng xøng",getn(tbSay), unpack(tbSay))
end

function UuDaiServerMoi(nOrder)
	if type(tbDieuKienUuDai[nOrder]) ~= "table" then
		Talk(1,"","Kh«ng cã phÇn th­ëng cho cÊp ®é nµy")
		return
	end
	
	local tbAward = tbDieuKienUuDai[nOrder]
	local nLevel = GetLevel()
	local nRoute = GetPlayerRoute()
	
	if tbAward["nLevel"] > nLevel then
		Talk(1,"","C¸c h¹ ch­a ®ñ cÊp ®é nhËn th­ëng")
		return
	end
	
	if gf_Judge_Room_Weight(tbAward["nSlot"] ,tbAward["nWeight"] ) ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return
	end
	
	if gf_GetTaskBit(TSK_TOP_LEVEL, tbAward["nBit"]) == 1 then
		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng ­u ®·i nµy råi.")
		return 1
	end
	
	if nRoute == 0 then
		Talk(1,"","C¸c h¹ ch­a gia nhËp hÖ ph¸i nªn kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if GetItemCount(tbAward["tbitem"][1], tbAward["tbitem"][2], tbAward["tbitem"][3]) < tbAward["tbitem"][4] then
		Talk(1,"","C¸c h¹ kh«ng ®em ®ñ "..tbAward["tbitem"][5]..", h·y kiÓm tra l¹i hµnh trang.")
		return
	end
	
	-- Trao th­ëng ¦u ®·i
--	if nOrder == 10 then
--		Say_NhanVuKhiVietYen()
--		return
--	end
	
--	if nOrder < 10 then
		if DelItem(tbAward["tbitem"][1], tbAward["tbitem"][2], tbAward["tbitem"][3], tbAward["tbitem"][4])==1 then
			LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
			LIB_Award.szLogAction = "nhËn"
			gf_SetTaskBit(TSK_TOP_LEVEL, tbAward["nBit"], 1)
			if nOrder == 1 then
				GiveAwardTCTK(7)
			elseif nOrder == 2 then
				GiveAwardTCTK(8)
			elseif nOrder == 3 then
				GiveAwardTCTK(9)
			elseif nOrder == 4 then
				local tbUuDai = {item = {{gdp = {0,102,24,1,1,-1,-1,-1,-1,-1,-1,-1},  name = "§«ng Ph­¬ng Long Ch©u"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 5 then
				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr¸i c©y"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 6 then
				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr¸i c©y"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 7 then
				local tbUuDai = {item = {{gdp={2,1,30368,500}, name = "Cæ Linh Th¹ch"}, {gdp={2,1,30369,1000}, name = "Cæ Linh Ngäc"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 8 then
				local tbUuDai = {item = {{gdp={2,1,30368,1200}, name = "Cæ Linh Th¹ch"}, {gdp={2,1,30369,2000}, name = "Cæ Linh Ngäc"}}}
				LIB_Award:Award(tbUuDai)
			end
--			elseif nOrder == 9 then
--				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr¸i c©y"}}}
--				LIB_Award:Award(tbUuDai)
--			elseif nOrder == 10 then
--				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr¸i c©y"}}}
--				LIB_Award:Award(tbUuDai)
--			elseif nOrder == 11 then
--				local tbUuDai = {item = {{gdp={0,107,tbMatTich70caocap[nRoute][2][3],9}, name = "MËt tÞch 70 cao cÊp"}}}
--				LIB_Award:Award(tbUuDai)
--			elseif nOrder == 12 then
--				local tbUuDai = {item = {{gdp={2,1,30368,500}, name = "Cæ Linh Th¹ch"}, {gdp={2,1,30369,1000}, name = "Cæ Linh Ngäc"}}}
--				LIB_Award:Award(tbUuDai)
--			end
		end
--	end
end

--
--function Say_NhanVuKhiVietYen()
--	local tbListAllVietYen = {
--		[1] = {"ViÖt Yªn Phi Tinh §ao", {0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, 
--		[2] = {"ViÖt Yªn Phi Tinh C«n", {0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[3] =  {"ViÖt Yªn Phi Tinh Tr­îng", {0,8,30003,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[4] =  {"ViÖt Yªn Phi Tinh Thñ", {0,0,30004,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[5] =  {"ViÖt Yªn Tr¶m NguyÖt KiÕm", {0,2,30010,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[6] =  {"ViÖt Yªn Tr¶m NguyÖt Bót", {0,9,30011,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[7] =  {"ViÖt Yªn Phi Tinh KiÕm", {0,2,30006,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[8] =  {"ViÖt Yªn Phi Tinh CÇm", {0,10,30007,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[9] =  {"ViÖt Yªn Phi Tinh Thñ", {0,0,30008,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[10] =  {"ViÖt Yªn Tr¶m NguyÖt C«n", {0,5,30009,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[11] =  {"ViÖt Yªn Phi Tinh Ch©m", {0,1,30005,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[12] =  {"ViÖt Yªn Tr¶m NguyÖt Th­¬ng", {0,6,30012,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[13] =  {"ViÖt Yªn Tr¶m NguyÖt Cung", {0,4,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[14] = {"ViÖt Yªn Tr¶m NguyÖt NhÉn", {0,7,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[15] = {"ViÖt Yªn Tr¶m NguyÖt Tr¶o", {0,11,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--	}
--	tbSay = {"Ta cÇn suy nghÜ l¹i/dlgover"}
--	for i=getn(tbListAllVietYen), 1, -1 do
--		tinsert(tbSay,1,tbListAllVietYen[i][1].."/#NhanVuKhiVietYen("..i..")")
--	end
--	Say("C¸c h¹ h·y chän  vò khÝ tïy thÝch:", getn(tbSay), unpack(tbSay))
--end
--
--function NhanVuKhiVietYen(nOption)
--	local tbAward = tbDieuKienUuDai[10]
--	local tbListAllVietYen = {
--		[1] = {"ViÖt Yªn Phi Tinh §ao", {0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, 
--		[2] = {"ViÖt Yªn Phi Tinh C«n", {0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[3] =  {"ViÖt Yªn Phi Tinh Tr­îng", {0,8,30003,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[4] =  {"ViÖt Yªn Phi Tinh Thñ", {0,0,30004,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[5] =  {"ViÖt Yªn Tr¶m NguyÖt KiÕm", {0,2,30010,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[6] =  {"ViÖt Yªn Tr¶m NguyÖt Bót", {0,9,30011,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[7] =  {"ViÖt Yªn Phi Tinh KiÕm", {0,2,30006,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[8] =  {"ViÖt Yªn Phi Tinh CÇm", {0,10,30007,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[9] =  {"ViÖt Yªn Phi Tinh Thñ", {0,0,30008,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[10] =  {"ViÖt Yªn Tr¶m NguyÖt C«n", {0,5,30009,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[11] =  {"ViÖt Yªn Phi Tinh Ch©m", {0,1,30005,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[12] =  {"ViÖt Yªn Tr¶m NguyÖt Th­¬ng", {0,6,30012,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[13] =  {"ViÖt Yªn Tr¶m NguyÖt Cung", {0,4,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[14] = {"ViÖt Yªn Tr¶m NguyÖt NhÉn", {0,7,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[15] = {"ViÖt Yªn Tr¶m NguyÖt Tr¶o", {0,11,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--	}
--	if DelItem(tbAward["tbitem"][1], tbAward["tbitem"][2], tbAward["tbitem"][3], tbAward["tbitem"][4]) == 1 then
--		gf_SetTaskBit(TSK_TOP_LEVEL, tbAward["nBit"], 1)
--		gf_AddItemEx2(tbListAllVietYen[nOption][2], tbListAllVietYen[nOption][1], "Uu Dai "..szLOGSERVERNAME, "nhËn")
--	end
--end

function dlgover()
end


function PhatThuongBangHoi()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20130519 then
		Talk(1,"","Ch­a ®Õn ngµy trao th­ëng, phiÒn C¸c h¹ ®îi ®Õn 19-05-2013 nhÐ.")
		return 0
	end
	
	local nTongMember = IsTongMember();
	if nTongMember == 0 then
		Talk(1,"","PhÇn th­ëng nµy chØ dµnh cho bang héi, C¸c h¹ h·y gia nhËp bang héi tr­íc ®· nhÐ.")
		return 0
	end
		
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <  15 then
		Talk(1,"","Thêi gian gia nhËp cña c¸c h¹ Ýt h¬n 15 ngµy, kh«ng thÓ nhËn th­ëng nµy!")
		return 0
	end
	
	if gf_GetTaskBit(TSK_TOP_LEVEL, 21) == 1 then
		Talk(1,"","C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
		return 0
	end
	
	if gf_Judge_Room_Weight(25,2100) ~=1 then
		Talk(1,"","C¸c h¹ cÇn chuÈn bÞ 25 « hµnh trang vµ 2100 søc lùc ®Ó nhËn th­ëng.")
		return 0
	end
	
	local szTongName = GetTongName()
	LIB_txtData:Init("banghoinhanthuong.txt")
	LIB_txtData:LoadMultiColumn();
	tbTenBang = LIB_txtData.tbTextData
	if tbTenBang[1] ~= nil and tbTenBang[1][1] ~= nil then
		if tbTenBang[1][1] ~= szTongName then
			Talk(1,"","PhÇn th­ëng nµy ®· trao cho bang ".. tbTenBang[1][1])
			return 0
		end
	else
		if GetTongPopuLadder() ~= 1 then
			Talk(1,"","PhÇn th­ëng nµy chØ trao cho bang héi xÕp h¹ng 1 nh©n khÝ.")
			return 0
		end
		LIB_txtData:AddLine(szTongName)
	end
	
	LIB_Award.szLogTitle = "TOP BANG HOI "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	gf_SetTaskBit(TSK_TOP_LEVEL, 21, 1)
	local tbThuongBangHoi = {item = {
		{gdp={2,0,189,2003,1}, name = "QuÕ Hoa Töu"},
		{gdp={2,1,1208,2,1}, name = "P_th­ëng C«ng Thµnh (th¾ng)"},
		{gdp={2,1,1210,20,1}, name = "B¶o r­¬ng Tµi nguyªn"},
		{gdp={0,105,33,1,4,-1,-1,-1,-1,-1,-1,-1}, name = "Niªn Thó", nExpired = 90*24*60*60}
	}}
	LIB_Award:Award(tbThuongBangHoi)
end


function CS_TopAward(nOption)
	local tbOps = {
		[1] = {nCS = 1, nBit = 22},
		[2] = {nCS = 2, nBit = 23},
		[3] = {nCS = 3, nBit = 24},
		[4] = {nCS = 4, nBit = 25},
		[5] = {nCS = 5, nBit = 26},
		[6] = {nCS = 6, nBit = 27},
		[7] = {nCS = 7, nBit = 28},
	}
	local nTongLieu = 0
	if GetTask(701) > 0 then
		nTongLieu = 1
	elseif  GetTask(701) < 0 then
		nTongLieu = 2
	end
	
	if gf_GetTaskBit(TSK_TOP_LEVEL, tbOps[nOption]["nBit"]) == 1 then
		Talk(1,"","C¸c h¹ ®· ®¨ng ký nhËn phÇn th­ëng nµy råi.")
		return 0
	end
	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",strNpcName.."C¸c h¹ ch­a gia nhËp hÖ ph¸i!")
		return
	end
	
	local nPhucSinh = GetPlayerRebornParam(0)
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + nPhucSinh
	
	if nOption == 6 then
		if gf_CheckLevel(6,99) ~= 1 then
			Talk(1, "", strNpcName.."C¸c h¹ ch­a ®¹t phôc sinh 6 cÊp ®é 99, h·y cè g¾ng thªm..");
			return 0
		end
	end
	
	if nOption == 7 then
		if gf_CheckLevel(10,94) ~= 1 then
			Talk(1, "", strNpcName.."C¸c h¹ ch­a ®¹t phôc sinh 10 cÊp ®é 94, h·y cè g¾ng thªm..");
			return 0
		end
	end
	
	
	if gf_Judge_Room_Weight(10,500) ~=1 then
		Talk(1,"","C¸c h¹ cÇn chuÈn bÞ 10 « hµnh trang vµ 500 søc lùc ®Ó nhËn th­ëng.")
		return 0
	end
	
	LIB_txtData:Init("soluongphanthuong.txt")
	LIB_txtData:LoadData()
	local nAward = LIB_txtData.tbTextData[tonumber(nOption)]
	
	if nOption == 6 then
		if nAward >= 10 then
			Talk(1, "", strNpcName.."§· cã ®ñ 10 cao thñ ®¨ng ký nhËn phÇn th­ëng nµy, c¸c h¹ h·y cè g¾ng chiÕm phÇn th­ëng kh¸c nhÐ!");
			return 0
		end
	end
	
	if nOption == 7 then
		if nAward >= 3 then
			Talk(1, "", strNpcName.."§· cã ®ñ 3 cao thñ ®¨ng ký nhËn phÇn th­ëng nµy, c¸c h¹ h·y cè g¾ng chiÕm phÇn th­ëng kh¸c nhÐ!");
			return 0
		end
	end
	
	local nRoute = GetPlayerRoute()
	if LIB_txtData:AddValue(tonumber(nOption),1,10) == 1 then
		gf_SetTaskBit(TSK_TOP_LEVEL, tbOps[nOption]["nBit"], 1)
		LIB_txtData:Init("danhsachnhanthuong.txt")
		local szLogAward = GetAccount().."	"..GetName().."	"..GetPlayerRoute().."	"..nTongLieu.."	"..nChuyenSinh.."	TOPCS"..nOption.."	"..date("%Y-%m-%d %H:%M:%S")
		LIB_txtData:AddLine(szLogAward)
		Talk(1,"","C¸c h¹ lµ ng­êi thø "..(nAward+1).." nhËn th­ëng thµnh c«ng.")
		
		if nOption == 6 then			
			AddItem(2,1,30344,3)
			TraoMatTichCaoCap20(1,nRoute)
		end
		
		if nOption == 7 then
			AddItem(2,1,30913,300)	--®ång tÕ chi nguyÖn
			AddItem(2,1,30912,5000)	--hiÖp nghÜa chi chøng
			AddItem(2,1,1051,1)	--bao thiªn th¹ch tinh th¹ch
			TraoMatTichCaoCap20(2,nRoute)
			gf_WriteLogEx("DUA TOP 3 CAO THU CS10", "nhËn", 1, "NhËn th­ëng thµnh c«ng")
		end
	end
end


function get_route_award_by_level_menu()
	local tbSay = {}
	tinsert(tbSay, "NhËn th­ëng Thóy Yªn Linh N÷ cÊp 92/#get_route_award_by_level_done(92)")
	tinsert(tbSay, "NhËn th­ëng Thóy Yªn Linh N÷ cÊp 93/#get_route_award_by_level_done(93)")
	tinsert(tbSay, "NhËn th­ëng Thóy Yªn Linh N÷ cÊp 94/#get_route_award_by_level_done(94)")
	tinsert(tbSay, "NhËn th­ëng Thóy Yªn Linh N÷ cÊp 96/#get_route_award_by_level_done(96)")
	tinsert(tbSay, "NhËn th­ëng Thóy Yªn Linh N÷ cÊp 99/#get_route_award_by_level_done(99)")
	tinsert(tbSay, "Ta ch­a muèn nhËn ngay/gf_DoNothing")
	Say("§Ö tö ph¸i C«n L«n nÕu ®¹t ®Õn ®¼ng cÊp nhÊt ®Þnh sÏ ®­îc ta tÆng th­ëng ®Æc biÖt, dÜ nhiªn còng ph¶i cÇn chót thï lao.", getn(tbSay), tbSay)
end


function get_route_award_by_level_done(nOption)
	local tbAward = {
			[92] = {fn="TraoNguLongTuongQuan_TrangBi(7)"},
			[93] = {fn="TraoMatTich70CaoCap(20)"},
			[94] = {fn="TraoNguLongTuongQuan_TrangSuc()"},
			[96] = {fn="ThuongVuKhi_ThuyYenLinhNu()"},
			[99] = {item={
						{gdp={2,1,30345,1,1}, name = "ChuyÓn Sinh §¬n"}, 
						{gdp={2,0,1083,3,1}, name = "Th¸i DÞch Hçn Nguyªn C«ng Phæ"}, 
						{gdp={2,95,204,4,1}, name = "Thiªn Cang LÖnh"}},
					nChankhi = 150000,
			},
	}
	if GetPlayerRoute() == 0 then
		Talk(1,"",strNpcName.."Ng­¬i ch­a gia nhËp hÖ ph¸i, kh«ng thÓ nhËn th­ëng..")
		return
	end
	if GetLevel() < nOption then
		Talk(1,"",strNpcName.."§¼ng cÊp ch­a ®ñ, kh«ng thÓ nhËn th­ëng..")	
		return
	end
	if IsPlayerDeath() == 1 then
		Talk(1,"",strNpcName.."Tr¹ng th¸i hiÖn t¹i kh«ng thÓ nhËn th­ëng.")	
		return
	end
	if IsStalling() == 1 then
		Talk(1,"",strNpcName.."Tr¹ng th¸i hiÖn t¹i kh«ng thÓ nhËn th­ëng.")	
		return
	end
	if TopCheckSkill(tFactionSkillInfo,20) == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a luyÖn thµnh 20 cÊp vâ c«ng trÊn ph¸i.");
		return	
	end
	local tbDieuKien = {
		[92] = {Bit = 1, Route = 30, Quanham = 3, Quancong = 200000, Danhvong = 20000, Sumon = 20000, Slot = 3},
		[93] = {Bit = 2, Route = 30, Quanham = 3, Quancong = 200000, Danhvong = 20000, Sumon = 20000, Slot = 20},
		[94] = {Bit = 3, Route = 30, Quanham = 4, Quancong = 230000, Danhvong = 23000, Sumon = 23000, Slot = 3},
		[96] = {Bit = 4, Route = 30, Quanham = 5, Quancong = 300000, Danhvong = 26000, Sumon = 26000, Slot = 1},
		[99] = {Bit = 5, Route = 30, Quanham = 5, Quancong = 330000, Danhvong = 30000, Sumon = 30000, Slot = 2},
	}
	local tbMaterial = {
		[92] = {Danhvong = 2000, Sumon = 2000, Gold = 2000, Xu = 2000, Exp = 200000000},
		[93] = {Danhvong = 2000, Sumon = 2000, Gold = 2000, Xu = 2000, Exp = 200000000},
		[94] = {Danhvong = 2000, Sumon = 2000, Gold = 2000, Xu = 2000, Exp = 200000000},
		[96] = {Danhvong = 3000, Sumon = 3000, Gold = 3000, Xu = 3000, Exp = 600000000},
		[99] = {Danhvong = 3000, Sumon = 3000, Gold = 3000, Xu = 3000, Exp = 1000000000},
	}
	if tbDieuKien[nOption] == nil then
		return 0
	end
	
	if gf_Judge_Room_Weight(tbDieuKien[nOption]["Slot"],500) ~= 1 then
		Talk(1,"",strNpcName.."CÇn ".. tbDieuKien[nOption]["Slot"] .." hµnh trang , 500 søc lùc. Vui lßng s¾p xÕp l¹i.")
		return
	end
	
	local nRoute = GetPlayerRoute()
	local nQuanham = GetTask(704)
	local nQuancong = GetTask(701)
	local nDanhvong = GetReputation()
	local nSumon = GetTask(336)
	
	if gf_GetTaskBit(TSK_BONUS_CONLON, tbDieuKien[nOption]["Bit"]) ~= 0 then
		Talk(1,"", strNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
		return 0
	end
	
	if nRoute ~= tbDieuKien[nOption]["Route"] then
		Talk(1,"", strNpcName.."HÖ ph¸i kh«ng phï hîp, kh«ng thÓ nhËn th­ëng.")
		return 0
	end
	
	if nDanhvong < tbDieuKien[nOption]["Danhvong"] then
		Talk(1,"", strNpcName.."Danh väng ch­a ®¹t møc "..tbDieuKien[nOption]["Danhvong"]..", ta ch­a thÓ trao th­ëng cho c¸c h¹.")
		return 0
	end
	
	if nSumon < tbDieuKien[nOption]["Sumon"] then
		Talk(1,"", strNpcName.."§iÓm cèng hiÕn s­ m«n ch­a ®¹t møc "..tbDieuKien[nOption]["Sumon"]..", ta ch­a thÓ trao th­ëng cho c¸c h¹.")
		return 0
	end
	
	if abs(nQuanham) < abs(tbDieuKien[nOption]["Quanham"]) then
		Talk(1,"", strNpcName.."Qu©n hµm ch­a ®ñ ®iÒu kiÖn, ng­¬i h·y cè g¾ng thªm.")
		return 0
	end
	
	if abs(nQuancong) < abs(tbDieuKien[nOption]["Quancong"]) then
		Talk(1,"", strNpcName.."Qu©n c«ng ch­a ®ñ "..abs(tbDieuKien[nOption]["Quancong"])..", ng­¬i h·y cè g¾ng thªm.")
		return 0
	end
	
	if GetCash() < tbMaterial[nOption]["Gold"]*10000 then
		Talk(1,"", strNpcName.."Ng­¬i ch­a ®em ®ñ "..tbMaterial[nOption]["Gold"].." vµng, h·y kiÓm tra l¹i nhÐ.")
		return 0
	end
	
	if GetItemCount(2,1,30230) < tbMaterial[nOption]["Xu"] then
		Talk(1,"", strNpcName.."Ng­¬i ch­a ®em ®ñ "..tbMaterial[nOption]["Xu"].." xu vËt phÈm, h·y kiÓm tra l¹i nhÐ.")
		return 0
	end
	
	if GetExp() < tbMaterial[nOption]["Exp"] then
		Talk(1,"", strNpcName.."Ng­¬i ch­a tÝch lòy ®ñ "..tbMaterial[nOption]["Exp"].." ®iÓm kinh nghiÖm, h·y cè g¾ng thªm.")
		return 0
	end

--	****************** Trao th­ëng *************************
	ModifyReputation(-tbMaterial[nOption]["Danhvong"],0)
	SetTask(336, GetTask(336) - tbMaterial[nOption]["Sumon"])
	Msg2Player("B¹n bÞ trõ "..tbMaterial[nOption]["Sumon"].." ®iÓm s­ m«n")
	Pay(tbMaterial[nOption]["Gold"]*10000)
	DelItem(2,1,30230,tbMaterial[nOption]["Xu"])
	Msg2Player("B¹n bÞ trõ "..tbMaterial[nOption]["Xu"].." xu vËt phÈm")
	ModifyExp(-tbMaterial[nOption]["Exp"])
	Msg2Player("B¹n bÞ trõ "..tbMaterial[nOption]["Exp"].." ®iÓm kinh nghiÖm")
	gf_SetTaskBit(TSK_BONUS_CONLON, tbDieuKien[nOption]["Bit"], 1, 0)
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbAward[nOption])
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "PhÇn th­ëng Thóy Yªn Linh N÷ cÊp "..nOption)
end
function get_award_daquy345(nType)
	local nNum3 = 32
	local nNum4 = 32
	local nNum5 = 8
	if nType == 1 then
		nNum3 = 32
		nNum4 = 32
		nNum5 = 16
	elseif nType == 3 then
		nNum3 = 16
		nNum4 = 4
		nNum5 = 0
	end
	
	local tbCheckCase = {
		[1] = {2500},
		[2] = {2500},
		[3] = {2500},
		[4] = {2500},
	}
--	local tbAwardRate = {[1] = 0, [2] = 0, [3] = 0,[4] = 0,}
	for i=1,nNum3 do	--®¸ quÝ level3
		local nIndex = get_random_event_ittem(tbCheckCase, 10000)
		gf_AddItemEx2({2,22,nIndex*100+3, 1}, "®¸ quÝ ", "DUA TOP 1" , "nhËn")
	end
	for i=1,nNum4 do	--®¸ quÝ level4
		local nIndex = get_random_event_ittem(tbCheckCase, 10000)
		gf_AddItemEx2({2,22,nIndex*100+4, 1}, "®¸ quÝ ", "DUA TOP 1" , "nhËn")
	end
	for i=1,nNum5 do	--®¸ quÝ level5
		local nIndex = get_random_event_ittem(tbCheckCase, 10000)
		gf_AddItemEx2({2,22,nIndex*100+5, 1}, "®¸ quÝ ", "DUA TOP 1" , "nhËn")
	end
end
function get_award_daquy123()
	for i=1,4 do	--®¸ quÝ level2
		gf_AddItemEx2({2,22,i*100+4, 8}, "®¸ quÝ 1 hÖ ph¸i", "DUA TOP" , "nhËn")
	end
	for i=1,4 do	--®¸ quÝ level3
		gf_AddItemEx2({2,22,i*100+5, 4}, "®¸ quÝ 1 hÖ ph¸i", "DUA TOP" , "nhËn")
	end
	for i=1,4 do	--®¸ quÝ level4
		gf_AddItemEx2({2,22,i*100+6, 3}, "®¸ quÝ 1 hÖ ph¸i", "DUA TOP" , "nhËn")
	end
end
function get_random_event_ittem(nTab, nDeterminator)
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTab) do
		nBase = nBase + nTab[i][1]
		if nRandom <= nBase then
			return i			
		end
	end	
end
function vangdanhthienha_get_fast_level()
	
	local tSay = {}

--	tinsert(tSay,"Th¨ng tiÕn ®Õn ®¼ng cÊp chuyÓn sinh 6 cÊp 90(ph¶i ®¹t cÊp 73, 3000 danh väng, 4000 s­ m«n, 50000 c«ng tr¹ng)/#vdth_get_level(1)")	----TSK_TT_VANGDANHTHIENHA_DUATOP:sö dông bit 1
	tinsert(tSay,"Th¨ng tiÕn ®Õn ®¼ng cÊp chuyÓn sinh 7 cÊp 90(ph¶i ®¹t cÊp 73, 3000 danh väng, 4000 s­ m«n, 50000 c«ng tr¹ng)/#vdth_get_level(1)")	----TSK_TT_VANGDANHTHIENHA_DUATOP:sö dông bit 1
	tinsert(tSay,"Th¨ng tiÕn ®Õn ®¼ng cÊp chuyÓn sinh 8 cÊp 90(ph¶i ®¹t chuyÓn sinh 7 cÊp 95, 6000 danh väng, 6000 s­ m«n, 120000 c«ng tr¹ng)/#vdth_get_level(2)")	----TSK_TT_VANGDANHTHIENHA_DUATOP:sö dông bit 2
	tinsert(tSay,"Th¨ng tiÕn ®Õn ®¼ng cÊp chuyÓn sinh 9 cÊp 90(ph¶i ®¹t chuyÓn sinh 8 cÊp 95, 6000 danh väng, 6000 s­ m«n, 180000 c«ng tr¹ng)/#vdth_get_level(3)")	----TSK_TT_VANGDANHTHIENHA_DUATOP:sö dông bit 3
	tinsert(tSay,"Th¨ng tiÕn ®Õn ®¼ng cÊp chuyÓn sinh 10 cÊp 10(ph¶i ®¹t chuyÓn sinh 9 cÊp 97, 10000 danh väng, 10000 s­ m«n, 500000 c«ng tr¹ng)/#vdth_get_level(4)")	----TSK_TT_VANGDANHTHIENHA_DUATOP: sö dông bit 4	(2666)
	tinsert(tSay,"Ta biÕt råi/dlgover")	
	local strSay = strNpcName.."Ho¹t ®éng <color=yellow>Truy C«ng L·nh Th­ëng<color> diÔn ra tõ ngµy<color=red> "..szStartDate.." ®Õn 24:00 "..szEndDate.."<color>. Trong thêi gian nµy, quý ®ång ®¹o cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng hÊp dÉn. Th«ng tin chi tiÕt quý ®ång ®¹o vui lßng xem t¹i <color=blue>https://volam2.zing.vn<color>"
	Say(strSay,getn(tSay),tSay)
end
function vangdanhthienha_get_award_by_level()
	local tSay = {}
	tinsert(tSay,"Ta muèn nhËn th­ëng ChuyÓn Sinh 6 cÊp 90/#vdth_get_award(1)")	--TSK_VANGDANHTHIENHA_DUATOP: sö dông bit 1 (2733)
	tinsert(tSay,"Ta muèn nhËn th­ëng ChuyÓn Sinh 7 cÊp 90/#vdth_get_award(2)")	--TSK_VANGDANHTHIENHA_DUATOP: sö dông bit 2
	tinsert(tSay,"Ta muèn nhËn th­ëng ChuyÓn Sinh 7 cÊp 91/#vdth_get_award(3)")	--TSK_VANGDANHTHIENHA_DUATOP: sö dông bit 3
	tinsert(tSay,"Ta muèn nhËn th­ëng ChuyÓn Sinh 8 cÊp 90/#vdth_get_award(4)")	--TSK_VANGDANHTHIENHA_DUATOP: sö dông bit 4
	tinsert(tSay,"Ta muèn nhËn th­ëng ChuyÓn Sinh 8 cÊp 93/#vdth_get_award(5)")	--TSK_VANGDANHTHIENHA_DUATOP: sö dông bit 5
	tinsert(tSay,"Ta muèn nhËn th­ëng ChuyÓn Sinh 9 cÊp 90/#vdth_get_award(6)")	--TSK_VANGDANHTHIENHA_DUATOP: sö dông bit 6
	tinsert(tSay,"Ta muèn nhËn th­ëng ChuyÓn Sinh 9 cÊp 91/#vdth_get_award(7)")	--TSK_VANGDANHTHIENHA_DUATOP: sö dông bit 7
	tinsert(tSay,"Ta muèn nhËn th­ëng ChuyÓn Sinh 9 cÊp 92/#vdth_get_award(8)")	--TSK_VANGDANHTHIENHA_DUATOP: sö dông bit 8
	tinsert(tSay,"Ta muèn nhËn th­ëng ChuyÓn Sinh 9 cÊp 93/#vdth_get_award(9)")	--TSK_VANGDANHTHIENHA_DUATOP: sö dông bit 9
	tinsert(tSay,"Ta muèn nhËn th­ëng ChuyÓn Sinh 10 cÊp 90/#vdth_get_award(10)")	--TSK_VANGDANHTHIENHA_DUATOP: sö dông bit 10
	tinsert(tSay,"Ta muèn nhËn th­ëng ChuyÓn Sinh 10 cÊp 91/#vdth_get_award(11)")	--TSK_VANGDANHTHIENHA_DUATOP: sö dông bit 11
	tinsert(tSay,"Ta muèn nhËn th­ëng ChuyÓn Sinh 10 cÊp 92/#vdth_get_award(12)")	--TSK_VANGDANHTHIENHA_DUATOP: sö dông bit 12
	tinsert(tSay,"Ta muèn nhËn th­ëng ChuyÓn Sinh 10 cÊp 93/#vdth_get_award(13)")	--TSK_VANGDANHTHIENHA_DUATOP: sö dông bit 13
	tinsert(tSay,"Ta muèn nhËn th­ëng ChuyÓn Sinh 10 cÊp 94/#vdth_get_award(14)")	--TSK_VANGDANHTHIENHA_DUATOP: sö dông bit 14
	tinsert(tSay,"Ta biÕt råi/dlgover")	
	local strSay = strNpcName.."Ho¹t ®éng <color=yellow>Truy C«ng L·nh Th­ëng<color> diÔn ra tõ ngµy<color=red> "..szStartDate.." ®Õn 24:00 "..szEndDate.."<color>. Trong thêi gian nµy, quý ®ång ®¹o cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng hÊp dÉn. Th«ng tin chi tiÕt quý ®ång ®¹o vui lßng xem t¹i <color=blue>https://volam2.zing.vn<color>"
	Say(strSay,getn(tSay),tSay)
end
function vdth_get_level(nType)
	do return 0 end
	
	local tbCondition = {--level yªu cÇu, danh väng, s­ m«n, c«ng trang, level lªn						
							[1] = {73, 3000, 4000, 50000, 790, "®¼ng cÊp 73"},
							[2] = {795, 6000, 6000, 120000, 890, "chuyÓn sinh 7 cÊp 95"},
							[3] = {895, 6000, 6000, 180000, 990, "chuyÓn sinh 8 cÊp 95"},
							[4] = {997, 10000, 10000, 500000, 1010, "chuyÓn sinh 9 cÊp 97"},
						}
	if GetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),nType) == 1 then	--Sö dông Bit 1,2,3,4,5
		Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi, nªn kh«ng thÓ nhËn th­ëng ®­îc.")
		return 0
	end						
	local nRoute = gf_CheckPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", "§¹i hiÖp ch­a gia nhËp m«n ph¸i nµo, nªn kh«ng thÓ nhËn th­ëng ®­îc.")
		return 0
	end 
--	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
--	local nPhucSinh = GetPlayerRebornParam(0) or 0
	local nChuyenPhucSinh = gf_GetTransLevel()  -- bao gåm chuyÓn sinh vµ phôc sinh
--	local nLevel = (nChuyenSinh + nPhucSinh)*100 + GetLevel()			
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = abs(GetTask(701));
	if nChuyenPhucSinh < tbCondition[nType][1] then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ "..tbCondition[nType][6].." nªn kh«ng thÓ nhËn th­ëng.");
		return 0
	end
	if nChuyenPhucSinh >= tbCondition[nType][5] then
		Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ qu¸ cao nªn kh«ng thÓ nhËn th­ëng.");
		return 0
	end
	if nRep < tbCondition[nType][2] then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÓm danh väng nªn kh«ng thÓ nhËn th­ëng.");
		return 0
	end
	if nFaction < tbCondition[nType][3] then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÓm s­ m«n nªn kh«ng thÓ nhËn th­ëng.");
		return 0
	end
	if nHor < tbCondition[nType][4] then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®iÓm c«ng trang nªn kh«ng thÓ nhËn th­ëng.");
		return 0
	end
	if gf_JudgeRoomWeight(38,400,strNpcName) == 0 then
		return 0
	end
	if nType == 4 then 					
		if GetItemCount(2,1,30814) < 3 then
			Talk(1, "", strNpcName.."C¸c h¹ kh«ng cã ®ñ 3 phôc sinh ®¬n nªn kh«ng thÓ nhËn th­ëng.");
			return 0
		end
	end
	if nType == 4 then
--		vdth_phucsinh5()
--		vdth_chuyensinh5()
--		MeridianUpdateLevel()
--	elseif nType == 1 then
--		vdth_phucsinh1()
--		MeridianUpdateLevel()
	elseif nType == 1 then
		vdth_phucsinh2()
	elseif nType == 2 then
		vdth_phucsinh3()
	elseif nType == 3 then
		vdth_phucsinh4()		
	end
end
function vdth_chuyensinh5()
	
	local tSay = 	{
							"V·n bèi muèn tu luyÖn theo h­íng Long Tö!/#vdth_chuyensinh5_finish(1)",
							"V·n bèi muèn tu luyÖn theo h­íng Hæ Tö!/#vdth_chuyensinh5_finish(2)",
							"V·n bèi muèn tu luyÖn theo h­íng Phông Tö!/#vdth_chuyensinh5_finish(4)",
							"V·n bèi muèn tu luyÖn theo h­íng ¦ng Tö!/#vdth_chuyensinh5_finish(3)",
							"V·n bèi suy nghÜ l¹i ®·./dlgover",
						}
	Say(strNpcName.."<color=yellow>Hçn Tôc Hßa Quang<color> hÊp thu linh khÝ ©m d­¬ng, v¹n vËt sinh diÖt ®Òu cã thÓ khèng chÕ, ng­¬i muèn tu luyÖn theo h­íng nµo?",getn(tSay),tSay)
end

function vdth_chuyensinh5_finish(nType)
	do return 0 end
	
	local nRoute = GetPlayerRoute()
	-- Set sè lÇn chuyÓn sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT, 5)
	-- Set h­íng chuyÓn sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nType)
	local nTransCount = GetTranslifeCount()	
	gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
	for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
		local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
		P = P + GetBody() - 1
		Pnew = 561 + GetBody()
		lvatt3 = lvatt3 or 0
		att3 = att3 or 0
--		BigDelItem(G,D,P,BigGetItemCount(G,D,P))
--		BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
		gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Tø Linh ViÖt Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
	end
	RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
	AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
	SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
--	SetTaskTrans()
	ResetProperty()
	SetLevel(90,0)
	Msg2Player("§ang tu luyÖn Hçn Nguyªn C«ng chiªu thøc thø t­...")
	AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> tu luyÖn theo h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color> ®· lÜnh héi ®­îc 8 thµnh <color=green>Hçn Nguyªn C«ng<color>!")	
	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),1,1));		
	--phÇn th­ëng thªm
	AddItem(0,152,9,1)
	AddItem(0,153,9,1)
	AddItem(0,154,9,1)
	gf_AddItemEx2({0,102,8844, 1,4, -1, -1, -1, -1, -1, -1},"Huy Hoµng QuËt Khëi","DUA TOP","Huy Hoµng QuËt Khëi")	
	gf_AddItemEx2({0,102,8845, 1,4, -1, -1, -1, -1, -1, -1},"Vinh Dù QuËt Khëi","DUA TOP","Vinh Dù QuËt Khëi")	
	gf_AddItemEx2({2,1,30912,500,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
	gf_AddItemEx2({0,112,78,1,1},"L¨ng Ba Vi Bé","DUA TOP","L¨ng Ba Vi Bé toµn tËp")	
	gf_AddItemEx2({2,1,31068,1},"kh¾c b¶n cÊp 1","DUA TOP","kh¾c b¶n cÊp 1")
	gf_AddItemEx2({2,1,31069,1},"kh¾c b¶n cÊp 1","DUA TOP","kh¾c b¶n cÊp 1")
	gf_AddItemEx2({2,1,31070,1},"kh¾c b¶n cÊp 1","DUA TOP","kh¾c b¶n cÊp 1")
	gf_AddItemEx2({2,1,31071,1},"kh¾c b¶n cÊp 1","DUA TOP","kh¾c b¶n cÊp 1")
	gf_AddItemEx2({2,1,31072,1},"kh¾c b¶n cÊp 1","DUA TOP","kh¾c b¶n cÊp 1")
	TraoTrangBiChienCuong()
	MeridianUpdateLevel()
--	SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (500 * 100)) --®iÓm n©ng cÊp
--	Msg2Player("B¹n nhËn ®­îc 500 §iÓm N©ng CÊp B¹n §ång Hµnh")
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng trïng sinh 5 cÊp 90")
	GiveJue() --yÕu quyÕt theo hÖ ph¸i
	DoWait(15,15,10)
end

function vdth_phucsinh1()
	
	local tSay = 	{}         
	tinsert(tSay, "Phôc sinh theo h­íng Long Tö/#vdth_phucsinh1_finish(1)")			
	tinsert(tSay, "Phôc sinh theo h­íng Hæ Tö/#vdth_phucsinh1_finish(2)")			
	tinsert(tSay, "Phôc sinh theo h­íng Phông Tö/#vdth_phucsinh1_finish(4)")			
	tinsert(tSay, "Phôc sinh theo h­íng ¦ng Tö/#vdth_phucsinh1_finish(3)")		
	tinsert(tSay, "Ta ch­a muèn Phôc Sinh/dlgover")	

	Say(strNpcName.."<color=yellow>Hçn Tôc Hßa Quang<color> hÊp thu linh khÝ ©m d­¬ng, v¹n vËt sinh diÖt ®Òu cã thÓ khèng chÕ, ng­¬i muèn tu luyÖn theo h­íng nµo?",getn(tSay),tSay)
end
function vdth_phucsinh1_finish(nType)
	do return 0 end
	
	local nTransCount = GetTranslifeCount()
	local nRoute = GetPlayerRoute()
	local tbType = {"Long Tö", "Hæ Tö", "¦ng Tö", "Phông Tö"}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end	

	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),1,1));		
--	ModifyExp(-GetExp())
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(1,nType) -- ChuyÓn Sinh 6 thµnh c«ng	
	AddTitle(61,05)
	SetLevel(90,0)
	--phÇn th­ëng thªm
	TraoTrangBiChienCuong()
	gf_AddItemEx2({0,102,8844, 1,4, -1, -1, -1, -1, -1, -1},"Huy Hoµng QuËt Khëi","DUA TOP","Huy Hoµng QuËt Khëi")	
	gf_AddItemEx2({0,102,8845, 1,4, -1, -1, -1, -1, -1, -1},"Vinh Dù QuËt Khëi","DUA TOP","Vinh Dù QuËt Khëi")	
	AddItem(0,152,9,1)
	AddItem(0,153,9,1)
	AddItem(0,154,9,1)
	gf_AddItemEx2({0,112,78,1,1},"L¨ng Ba Vi Bé","DUA TOP","L¨ng Ba Vi Bé toµn tËp")	
	gf_AddItemEx2({2,1,30912,800,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
	MeridianUpdateLevel()
	GiveJue() --yÕu quyÕt theo hÖ ph¸i
	gf_AddItemEx2({2,1,31068,1},"kh¾c b¶n cÊp 1","DUA TOP","kh¾c b¶n cÊp 1")
	gf_AddItemEx2({2,1,31069,1},"kh¾c b¶n cÊp 1","DUA TOP","kh¾c b¶n cÊp 1")
	gf_AddItemEx2({2,1,31070,1},"kh¾c b¶n cÊp 1","DUA TOP","kh¾c b¶n cÊp 1")
	gf_AddItemEx2({2,1,31071,1},"kh¾c b¶n cÊp 1","DUA TOP","kh¾c b¶n cÊp 1")
	gf_AddItemEx2({2,1,31072,1},"kh¾c b¶n cÊp 1","DUA TOP","kh¾c b¶n cÊp 1")
	gf_AddItemEx2({2,1,30944,1,4},"V« H¹ Hµo HiÖp LÖnh nãn","DUA TOP","V« H¹ Hµo HiÖp nãn")	
	
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 1 cÊp 90")
	Say("Chóc mõng ®¹i hiÖp ®· lÜnh ngé thµnh c«ng bÝ kÝp gia truyÒn Tø Linh Phôc Tinh! H·y ®¨ng nhËp l¹i.",1,"Tho¸t!/go_exit")
end
function vdth_phucsinh2()
	
	local tSay = 	{}         
	tinsert(tSay, "Phôc sinh theo h­íng Long Tö/#vdth_phucsinh2_finish(1)")			
	tinsert(tSay, "Phôc sinh theo h­íng Hæ Tö/#vdth_phucsinh2_finish(2)")			
	tinsert(tSay, "Phôc sinh theo h­íng Phông Tö/#vdth_phucsinh2_finish(4)")			
	tinsert(tSay, "Phôc sinh theo h­íng ¦ng Tö/#vdth_phucsinh2_finish(3)")		
	tinsert(tSay, "Ta ch­a muèn Phôc Sinh/dlgover")	

	Say(strNpcName.."<color=yellow>Hçn Tôc Hßa Quang<color> hÊp thu linh khÝ ©m d­¬ng, v¹n vËt sinh diÖt ®Òu cã thÓ khèng chÕ, ng­¬i muèn tu luyÖn theo h­íng nµo?",getn(tSay),tSay)
end
function vdth_phucsinh2_finish(nType)

	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs6 = GetPlayerRebornParam(1)	
	local nTransCount = GetTranslifeCount()	
--	for i=1, getn(tb_translife_cloth_PS_DuaTop[nType_cs6]) do 
--			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_PS_DuaTop[nType_cs6][i][2])
--			P = P + GetBody() - 1
--			BigDelItem(G,D,P,BigGetItemCount(G,D,P))			
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Tø Linh ViÖt Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
--	end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(2,nType) -- ChuyÓn Sinh 7 thµnh c«ng		
	SetLevel(90,0)
	RemoveTitle(61,05)
	AddTitle(61,06)
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())

	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),1,1));		
	
	--phÇn th­ëng thªm
	TraoTrangBiChienCuong()
	gf_AddItemEx2({0,102,8844, 1,4, -1, -1, -1, -1, -1, -1},"Huy Hoµng QuËt Khëi","DUA TOP","Huy Hoµng QuËt Khëi")	
	gf_AddItemEx2({0,102,8845, 1,4, -1, -1, -1, -1, -1, -1},"Vinh Dù QuËt Khëi","DUA TOP","Vinh Dù QuËt Khëi")	
	AddItem(0,152,9,1)
	AddItem(0,153,9,1)
	AddItem(0,154,9,1)
	gf_AddItemEx2({0,112,78,1,1},"L¨ng Ba Vi Bé","DUA TOP","L¨ng Ba Vi Bé toµn tËp")	
	gf_AddItemEx2({2,1,30912,800,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
	MeridianUpdateLevel()
	GiveJue() --yÕu quyÕt theo hÖ ph¸i
	gf_AddItemEx2({2,1,31068,1},"kh¾c b¶n cÊp 1","DUA TOP","kh¾c b¶n cÊp 1")
	gf_AddItemEx2({2,1,31069,1},"kh¾c b¶n cÊp 1","DUA TOP","kh¾c b¶n cÊp 1")
	gf_AddItemEx2({2,1,31070,1},"kh¾c b¶n cÊp 1","DUA TOP","kh¾c b¶n cÊp 1")
	gf_AddItemEx2({2,1,31071,1},"kh¾c b¶n cÊp 1","DUA TOP","kh¾c b¶n cÊp 1")
	gf_AddItemEx2({2,1,31072,1},"kh¾c b¶n cÊp 1","DUA TOP","kh¾c b¶n cÊp 1")
	gf_AddItemEx2({2,1,30944,1,4},"V« H¹ Hµo HiÖp LÖnh nãn","DUA TOP","V« H¹ Hµo HiÖp nãn")	
	gf_AddItemEx2({2,1,30945,1,4},"V« H¹ Hµo HiÖp LÖnh ¸o","DUA TOP","V« H¹ Hµo HiÖp ¸o")	
	gf_AddItemEx2({2,1,30946,1,4},"V« H¹ Hµo HiÖp LÖnh quÇn","DUA TOP","V« H¹ Hµo HiÖp quÇn")	
	
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 2 cÊp 90")
	Say("Chóc mõng ®¹i hiÖp ®· lÜnh ngé thµnh c«ng bÝ kÝp gia truyÒn Tø Linh Phôc Tinh! H·y ®¨ng nhËp l¹i.",1,"Tho¸t!/go_exit")

end
function vdth_phucsinh3()
	
	local tSay = 	{}         
	tinsert(tSay, "Phôc sinh theo h­íng Long Tö/#vdth_phucsinh3_finish(1)")			
	tinsert(tSay, "Phôc sinh theo h­íng Hæ Tö/#vdth_phucsinh3_finish(2)")			
	tinsert(tSay, "Phôc sinh theo h­íng Phông Tö/#vdth_phucsinh3_finish(4)")			
	tinsert(tSay, "Phôc sinh theo h­íng ¦ng Tö/#vdth_phucsinh3_finish(3)")		
	tinsert(tSay, "Ta ch­a muèn Phôc Sinh/dlgover")	

	Say(strNpcName.."<color=yellow>Hçn Tôc Hßa Quang<color> hÊp thu linh khÝ ©m d­¬ng, v¹n vËt sinh diÖt ®Òu cã thÓ khèng chÕ, ng­¬i muèn tu luyÖn theo h­íng nµo?",getn(tSay),tSay)
end
function vdth_phucsinh3_finish(nType)

	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs6 = GetPlayerRebornParam(1)	
	local nTransCount = GetTranslifeCount()	
	for i=1, getn(tb_translife_cloth_PS_DuaTop[nType_cs6]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_PS_DuaTop[nType_cs6][i][2])
			P = P + GetBody() - 1
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))			
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Tø Linh ViÖt Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(3,nType) -- ChuyÓn Sinh 8 thµnh c«ng		
	SetLevel(90,0)
	RemoveTitle(61,06)
	AddTitle(71,1)
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())

	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),2,1));		

	--phÇn th­ëng thªm
	for i=1,4 do	--®¸ quÝ level1
		gf_AddItemEx2({2,22,i*100+1, 8}, "®¸ quÝ 1 hÖ ph¸i", "DUA TOP" , "nhËn")
	end
	for i=1,4 do	--®¸ quÝ level2
		gf_AddItemEx2({2,22,i*100+2, 8}, "®¸ quÝ 2 hÖ ph¸i", "DUA TOP" , "nhËn")
	end
	for i=1,4 do	--®¸ quÝ level3
		gf_AddItemEx2({2,22,i*100+3, 6}, "®¸ quÝ 3 hÖ ph¸i", "DUA TOP" , "nhËn")
	end
--	for i=1,4 do	--®¸ quÝ level4
--		gf_AddItemEx2({2,22,i*100+4, 4}, "®¸ quÝ 4 hÖ ph¸i", "DUA TOP" , "nhËn")
--	end
	gf_AddItemEx2({0,112,158,1,4},"L¨ng Ba Vi Bé","DUA TOP","L¨ng Ba Vi Bé toµn tËp")	
	GiveJue() --yÕu quyÕt theo hÖ ph¸i
	gf_AddItemEx2({2,1,30912,1200,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
	MeridianUpdateLevel()
	AwardGenuineQi(80000)
--	gf_AddItemEx2({2,1,30946,1,4},"V« H¹ Hµo HiÖp LÖnh quÇn","DUA TOP","V« H¹ Hµo HiÖp quÇn")	
	
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 3 cÊp 90")
	Say("Chóc mõng ®¹i hiÖp ®· lÜnh ngé thµnh c«ng bÝ kÝp gia truyÒn Tø Linh Phôc Tinh! H·y ®¨ng nhËp l¹i.",1,"Tho¸t!/go_exit")

end
function vdth_phucsinh4()
	
	local tSay = 	{}         
	tinsert(tSay, "Phôc sinh theo h­íng Long Tö/#vdth_phucsinh4_finish(1)")			
	tinsert(tSay, "Phôc sinh theo h­íng Hæ Tö/#vdth_phucsinh4_finish(2)")			
	tinsert(tSay, "Phôc sinh theo h­íng Phông Tö/#vdth_phucsinh4_finish(4)")			
	tinsert(tSay, "Phôc sinh theo h­íng ¦ng Tö/#vdth_phucsinh4_finish(3)")		
	tinsert(tSay, "Ta ch­a muèn Phôc Sinh/dlgover")	

	Say(strNpcName.."<color=yellow>Hçn Tôc Hßa Quang<color> hÊp thu linh khÝ ©m d­¬ng, v¹n vËt sinh diÖt ®Òu cã thÓ khèng chÕ, ng­¬i muèn tu luyÖn theo h­íng nµo?",getn(tSay),tSay)
end
function vdth_phucsinh4_finish(nType)

	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs6 = GetPlayerRebornParam(1)	
	for i=1, getn(tb_translife_cloth_PS_DuaTop[nType_cs6]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_PS_DuaTop[nType_cs6][i][2])
			P = P + GetBody() - 1
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))			
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Tø Linh ViÖt Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(4,nType) -- ChuyÓn Sinh 9 thµnh c«ng		
	SetLevel(90,0)
	RemoveTitle(71,1)
	AddTitle(73,1)
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())

	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),3,1));		

	--phÇn th­ëng thªm
	for i=1,4 do	--®¸ quÝ level2
		gf_AddItemEx2({2,22,i*100+2, 6}, "®¸ quÝ 2 hÖ ph¸i", "DUA TOP" , "nhËn")
	end
	for i=1,4 do	--®¸ quÝ level3
		gf_AddItemEx2({2,22,i*100+3, 6}, "®¸ quÝ 3 hÖ ph¸i", "DUA TOP" , "nhËn")
	end
	for i=1,4 do	--®¸ quÝ level4
		gf_AddItemEx2({2,22,i*100+4, 4}, "®¸ quÝ 4 hÖ ph¸i", "DUA TOP" , "nhËn")
	end
--	for i=1,4 do	--®¸ quÝ level5
--		gf_AddItemEx2({2,22,i*100+5, 4}, "®¸ quÝ 5 hÖ ph¸i", "DUA TOP" , "nhËn")
--	end
	gf_AddItemEx2({2,1,30912,1500,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
	MeridianUpdateLevel()	
	AwardGenuineQi(100000)
	
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 4 cÊp 80")
	Say("Chóc mõng ®¹i hiÖp ®· lÜnh ngé thµnh c«ng bÝ kÝp gia truyÒn Tø Linh Phôc Tinh! H·y ®¨ng nhËp l¹i.",1,"Tho¸t!/go_exit")

end

function vdth_phucsinh5()
	
	local tSay = 	{}         
	tinsert(tSay, "Phôc sinh theo h­íng Long Tö/#vdth_phucsinh5_finish(1)")			
	tinsert(tSay, "Phôc sinh theo h­íng Hæ Tö/#vdth_phucsinh5_finish(2)")			
	tinsert(tSay, "Phôc sinh theo h­íng Phông Tö/#vdth_phucsinh5_finish(4)")			
	tinsert(tSay, "Phôc sinh theo h­íng ¦ng Tö/#vdth_phucsinh5_finish(3)")		
	tinsert(tSay, "Ta ch­a muèn Phôc Sinh/dlgover")	

	Say(strNpcName.."<color=yellow>Hçn Tôc Hßa Quang<color> hÊp thu linh khÝ ©m d­¬ng, v¹n vËt sinh diÖt ®Òu cã thÓ khèng chÕ, ng­¬i muèn tu luyÖn theo h­íng nµo?",getn(tSay),tSay)
end
function vdth_phucsinh5_finish(nType)

	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return 0
	end	
	if DelItem(2,1,30814,3) ~= 1 then
		Talk(1, "", strNpcName.."C¸c h¹ kh«ng cã ®ñ 3 phôc sinh ®¬n nªn kh«ng thÓ nhËn th­ëng.");
		return 0
	end
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs6 = GetPlayerRebornParam(1)	
--	for i=1, getn(tb_translife_cloth_PS_DuaTop[nType_cs6]) do
--			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_PS_DuaTop[nType_cs6][i][2])
--			P = P + GetBody() - 1
--			BigDelItem(G,D,P,BigGetItemCount(G,D,P))			
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Tø Linh ViÖt Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
--		end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(5,nType) -- ChuyÓn Sinh 10 thµnh c«ng		
	SetLevel(80,0)
	RemoveTitle(73,1)
	AddTitle(76,1)
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())

--	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),4,1));		--Task dïng khi sö dông tÝnh n¨ng Th¨ng TiÕn
	SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),10,1));	
	
	--phÇn th­ëng thªm
	for i=1,4 do	--®¸ quÝ level3
		gf_AddItemEx2({2,22,i*100+3, 6}, "®¸ quÝ 3 hÖ ph¸i", "DUA TOP" , "nhËn")
	end
	for i=1,4 do	--®¸ quÝ level4
		gf_AddItemEx2({2,22,i*100+4, 6}, "®¸ quÝ 4 hÖ ph¸i", "DUA TOP" , "nhËn")
	end
	for i=1,4 do	--®¸ quÝ level5
		gf_AddItemEx2({2,22,i*100+5, 4}, "®¸ quÝ 5 hÖ ph¸i", "DUA TOP" , "nhËn")
	end
	for i=1,4 do	--®¸ quÝ level6
		gf_AddItemEx2({2,22,i*100+6, 1}, "®¸ quÝ 6 hÖ ph¸i", "DUA TOP" , "nhËn")
	end
	gf_AddItemEx2({2,1,30912,2400,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
--	MeridianUpdateLevel()	
--	AwardGenuineQi(100000)
	
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 5 cÊp 10")
	Say("Chóc mõng ®¹i hiÖp ®· lÜnh ngé thµnh c«ng bÝ kÝp gia truyÒn Tø Linh Phôc Tinh! H·y ®¨ng nhËp l¹i.",1,"Tho¸t!/go_exit")

end

function vdth_get_award(nType)
	local tbCondition = {--level, xu , TCL, TMKL, Cöu Thiªn VC§
							[1] = {690, 0,0, 0, 0, "chuyÓn sinh 6 cÊp 90"},
							[2] = {790, 0,0, 0, 0, "chuyÓn sinh 7 cÊp 90"},
							[3] = {791, 500,0, 0, 0,"chuyÓn sinh 7 cÊp 91"},
							[4] = {890, 0,0, 0, 0,"chuyÓn sinh 8 cÊp 90"},
							[5] = {893, 2000,0, 0, 0,"chuyÓn sinh 8 cÊp 93"},
							[6] = {990, 0,0, 0, 0,"chuyÓn sinh 9 cÊp 90"},
							[7] = {991, 0,0, 0, 0,"chuyÓn sinh 9 cÊp 91"},
							[8] = {992, 0,0, 0, 0,"chuyÓn sinh 9 cÊp 92"},
							[9] = {993, 0,0, 0, 0,"chuyÓn sinh 9 cÊp 93"},
							[10] = {1090, 0,8, 8, 0,"chuyÓn sinh 10 cÊp 90"},
							[11] = {1091, 0,5, 5, 0,"chuyÓn sinh 10 cÊp 91"},
							[12] = {1092, 0,0, 0, 0,"chuyÓn sinh 10 cÊp 92"},
							[13] = {1093, 0,0, 0, 0,"chuyÓn sinh 10 cÊp 93"},
							[14] = {1094, 0,0, 0, 0,"chuyÓn sinh 10 cÊp 94"},
						}
	if GetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),nType) == 1 then	--Sö dông Bit 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
		Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi, nªn kh«ng thÓ nhËn th­ëng ®­îc.")
		return 0
	end			
	local nRoute = GetPlayerRoute()
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	local nLevel = (nChuyenSinh + nPhucSinh)*100 + GetLevel()		
	local nChuyenPhucSinh = gf_GetTransLevel()  -- bao gåm chuyÓn sinh vµ phôc sinh	
	if nChuyenPhucSinh < tbCondition[nType][1] then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®¼ng cÊp "..tbCondition[nType][6].." nªn kh«ng thÓ nhËn th­ëng.");
		return 0
	end
--	if nType == 10 then
--		if nChuyenPhucSinh >= 1010 then
--			Talk(1, "", strNpcName.."§¼ng cÊp cña c¸c h¹ qu¸ cao nªn kh«ng thÓ nhËn th­ëng.");
--			return 0
--		end
--	end
	if gf_Judge_Room_Weight(31,500)~=1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return
	end
	if GetItemCount(2,1,30230) < tbCondition[nType][2] then
		Talk(1,"","C¸c h¹ kh«ng ®ñ xu "..tbCondition[nType][2].." vËt phÈm nhËn th­ëng.")
		return
	end
	if GetItemCount(2,95,204) < tbCondition[nType][3] then
		Talk(1,"","C¸c h¹ kh«ng ®ñ "..tbCondition[nType][3].." thiªn cang lÖnh nhËn th­ëng.")
		return
	end
	if GetItemCount(2,1,30370) < tbCondition[nType][4] then
		Talk(1,"","C¸c h¹ kh«ng ®ñ "..tbCondition[nType][4].." thiªn m«n kim lÖnh nhËn th­ëng.")
		return
	end
	if GetItemCount(2,1,1006) < tbCondition[nType][5] then
		Talk(1,"","C¸c h¹ kh«ng ®ñ "..tbCondition[nType][5].." Cöu Thiªn V« Cùc §¬n ®Ó nhËn th­ëng.")
		return
	end
	if nType == 10 or nType == 11 then
		if DelItem(2,95,204,tbCondition[nType][3]) ~= 1 or DelItem(2,1,30370,tbCondition[nType][4]) ~= 1 then
			Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ thiªn cang lÖnh hoÆc thiªn m«n kim lÖnh.")
			return 0
		end
	end
	if nType == 3 or nType == 5 then
		if DelItem(2,1,30230,tbCondition[nType][2]) ~= 1 then
			Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ xu vËt phÈm")
			return 0
		end
	end
	if nType ~= 2 and nType ~= 13 then
		SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),nType,1));		
	end
	
--========================
	if nType == 1 then
		AddItem(0,152,9,1)
		AddItem(0,153,9,1)
		AddItem(0,154,9,1)
		gf_AddItemEx2({2,1,30912,2000,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
		gf_AddItemEx2({2,1,31068,1},"Kh¾c B¶n Vì CÊp 1","DUA TOP","Kh¾c B¶n Vì CÊp")
		gf_AddItemEx2({2,1,31069,1},"Kh¾c B¶n Vì CÊp 1","DUA TOP","Kh¾c B¶n Vì CÊp")
		gf_AddItemEx2({2,1,31070,1},"Kh¾c B¶n Vì CÊp 1","DUA TOP","Kh¾c B¶n Vì CÊp")
		gf_AddItemEx2({2,1,31071,1},"Kh¾c B¶n Vì CÊp 1","DUA TOP","Kh¾c B¶n Vì CÊp")
		gf_AddItemEx2({2,1,31072,1},"Kh¾c B¶n Vì CÊp 1","DUA TOP","Kh¾c B¶n Vì CÊp")
		gf_AddItemEx2({0,102,8844, 1,4, -1, -1, -1, -1, -1, -1},"Huy Hoµng QuËt Khëi","DUA TOP","Huy Hoµng QuËt Khëi")	
		gf_AddItemEx2({0,102,8845, 1,4, -1, -1, -1, -1, -1, -1},"Vinh Dù QuËt Khëi","DUA TOP","Vinh Dù QuËt Khëi")	
		GiveJue() --yÕu quyÕt theo hÖ ph¸i
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng ChuyÓn sinh 6 cÊp 90")
	elseif nType == 2 then
		thangcapnhanthuong_692()
	elseif nType == 3 then
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,1001,1,4},"Hßa ThÞ BÝch","DUA TOP","nhËn hßa thÞ bÝch",7*24*3600,1)
		gf_AddItemEx2({2,1,1009,5,4},"Thiªn Th¹ch Tinh Th¹ch","DUA TOP","nhËn Thiªn Th¹ch Tinh Th¹ch",7*24*3600,1)
		gf_AddItemEx2({2,1,30912,3000,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
		gf_AddItemEx2({2,1,30913,20,4},"§ång TÕ Chi NguyÖn","DUA TOP","§ång TÕ Chi NguyÖn")
		gf_AddItemEx2({2,1,30668,16,1},"UÈn Linh 6","DUA TOP","UÈn Linh 6")
		gf_AddItemEx2({2,1,30847,30,4},"Håi tiªn ®¬n","DUA TOP","Håi tiªn §¬n")
		TraoMatTichCaoCap20(1,nRoute)
		for i=1,4 do	--®¸ quÝ level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "®¸ quÝ 3 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level4
			gf_AddItemEx2({2,22,i*100+4, 3}, "®¸ quÝ 4 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level5
			gf_AddItemEx2({2,22,i*100+5, 1}, "®¸ quÝ 5 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 2 cÊp 91")
--		gf_AddItemEx2({0,112,158,1,1},"L¨ng Ba Vi Bé toµn tËp","DUA TOP","L¨ng Ba Vi Bé toµn tËp")		
--		gf_AddItemEx2({2,95,204,1,1},"Thiªn Cang LÖnh","DUA TOP","nhËn Thiªn Cang LÖnh")
--		gf_AddItemEx2({2,1,30370,1,1},"Thiªn M«n Kim LÖnh","DUA TOP","nhËn Thiªn M«n Kim LÖnh")
--		gf_AddItemEx2({2,1,30368,100,4},"Cæ Linh Th¹ch","DUA TOP","nhËn Cæ Linh Th¹ch")
--		gf_AddItemEx2({2,1,30369,100,4},"Cæ Linh Ngäc","DUA TOP","nhËn Cæ Linh Ngäc")
	elseif nType == 4 then
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,30814,1,4},"Phôc Sinh §¬n","DUA TOP","Phôc Sinh §¬n")
		gf_AddItemEx2({2,1,30912,3000,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
		gf_AddItemEx2({2,1,30913,150,4},"§ång TÕ Chi NguyÖn","DUA TOP","§ång TÕ Chi NguyÖn")
		gf_AddItemEx2({2,1,30668,16,1},"UÈn Linh 6","DUA TOP","UÈn Linh 6")		
		gf_AddItemEx2({2,1,30847,40,4},"Håi tiªn ®¬n","DUA TOP","Håi tiªn §¬n")
		for i=1,4 do	--®¸ quÝ level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "®¸ quÝ 3 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level4
			gf_AddItemEx2({2,22,i*100+4, 3}, "®¸ quÝ 4 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level5
			gf_AddItemEx2({2,22,i*100+5, 1}, "®¸ quÝ 5 hÖ ph¸i", "DUA TOP" , "nhËn")
		end

		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 3 cÊp 90")
	elseif nType == 5 then
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,1113,1},"§¹i §Þnh Hån","DUA TOP","nhËn §¹i §Þnh Hån",7*24*3600,1)
		gf_AddItemEx2({2,1,30814,1,4},"Phôc Sinh §¬n","DUA TOP","Phôc Sinh §¬n")
		gf_AddItemEx2({2,1,1001,1,4},"Hßa ThÞ BÝch","DUA TOP","nhËn hßa thÞ bÝch",7*24*3600,1)
		gf_AddItemEx2({2,1,1009,5,4},"Thiªn Th¹ch Tinh Th¹ch","DUA TOP","nhËn Thiªn Th¹ch Tinh Th¹ch",7*24*3600,1)				
		gf_AddItemEx2({2,1,30368,100,4},"Cæ Linh Th¹ch","DUA TOP","nhËn Cæ Linh Th¹ch")
		gf_AddItemEx2({2,1,30369,100,4},"Cæ Linh Ngäc","DUA TOP","nhËn Cæ Linh Ngäc")
		gf_AddItemEx2({2,95,204,1,1},"Thiªn Cang LÖnh","DUA TOP","nhËn Thiªn Cang LÖnh")
		gf_AddItemEx2({2,1,30370,1,1},"Thiªn M«n Kim LÖnh","DUA TOP","nhËn Thiªn M«n Kim LÖnh")		
		gf_AddItemEx2({2,1,30970,1,4},"Trøng B¸ Ng¹c","DUA TOP","Trøng B¸ Ng¹c")
		TraoMatTichCaoCap20(1,nRoute)
		gf_AddItemEx2({2,1,30912,4000,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
		gf_AddItemEx2({2,1,30847,60,4},"Håi tiªn ®¬n","DUA TOP","Håi tiªn §¬n")

		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 3 cÊp 93")
	elseif nType == 6 then
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,30912,3000,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
		gf_AddItemEx2({2,1,30913,200,4},"§ång TÕ Chi NguyÖn","DUA TOP","§ång TÕ Chi NguyÖn")
		gf_AddItemEx2({2,1,30668,16,1},"UÈn Linh 6","DUA TOP","UÈn Linh 6")
		gf_AddItemEx2({2,1,30847,40,4},"Håi tiªn ®¬n","DUA TOP","Håi tiªn §¬n")
		for i=1,4 do	--®¸ quÝ level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "®¸ quÝ 3 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level4
			gf_AddItemEx2({2,22,i*100+4, 3}, "®¸ quÝ 4 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level5
			gf_AddItemEx2({2,22,i*100+5, 1}, "®¸ quÝ 5 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
--		for i=1,4 do	--®¸ quÝ level6
--			gf_AddItemEx2({2,22,i*100+6, 1}, "®¸ quÝ 6 hÖ ph¸i", "DUA TOP" , "nhËn")
--		end
		
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 4 cÊp 90")
	elseif nType == 7 then
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,30912,3000,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
		gf_AddItemEx2({2,1,30913,300,4},"§ång TÕ Chi NguyÖn","DUA TOP","§ång TÕ Chi NguyÖn")
		gf_AddItemEx2({2,1,30814,1,4},"Phôc Sinh §¬n","DUA TOP","Phôc Sinh §¬n")
--		TraoMatTichCaoCap20(1,nRoute)
		gf_AddItemEx2({2,1,30847,40,4},"Håi tiªn ®¬n","DUA TOP","Håi tiªn §¬n")
		
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 4 cÊp 91")
	elseif nType == 8 then
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,30912,4000,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
		gf_AddItemEx2({2,1,30847,50,4},"Håi tiªn ®¬n","DUA TOP","Håi tiªn §¬n")
		for i=1,4 do	--®¸ quÝ level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "®¸ quÝ 3 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level4
			gf_AddItemEx2({2,22,i*100+4, 4}, "®¸ quÝ 4 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level5
			gf_AddItemEx2({2,22,i*100+5, 2}, "®¸ quÝ 5 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level6
			gf_AddItemEx2({2,22,i*100+6, 1}, "®¸ quÝ 6 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 4 cÊp 92")
	
	elseif nType == 9 then
		gf_AddItemEx2({2,1,31168,1,4},"H¾c B¹ch Kú","DUA TOP","H¾c B¹ch Kú")
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 4 cÊp 93")
	elseif nType == 10 then
		gf_AddItemEx2({2,1,31261,1,4},"Kh¾c b¶n cÊp 3","DUA TOP","Kh¾c b¶n cÊp 3")
		gf_AddItemEx2({2,1,31262,1,4},"Kh¾c b¶n cÊp 3","DUA TOP","Kh¾c b¶n cÊp 3")
		gf_AddItemEx2({2,1,31263,1,4},"Kh¾c b¶n cÊp 3","DUA TOP","Kh¾c b¶n cÊp 3")
		gf_AddItemEx2({2,1,31264,1,4},"Kh¾c b¶n cÊp 3","DUA TOP","Kh¾c b¶n cÊp 3")
		gf_AddItemEx2({2,1,31265,1,4},"Kh¾c b¶n cÊp 3","DUA TOP","Kh¾c b¶n cÊp 3")
			
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 5 cÊp 90")
	elseif nType == 11 then
		gf_AddItemEx2({2,1,31307,1,4},"Chiªu Yªu Kú","DUA TOP","Chiªu Yªu Kú")
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 5 cÊp 91")	
	elseif nType == 12 then
--		duatop_choose_amhuyet()
		for i=1,4 do	--®¸ quÝ level3
			gf_AddItemEx2({2,22,i*100+3, 6}, "®¸ quÝ 3 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level4
			gf_AddItemEx2({2,22,i*100+4, 6}, "®¸ quÝ 4 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level5
			gf_AddItemEx2({2,22,i*100+5, 4}, "®¸ quÝ 5 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level6
			gf_AddItemEx2({2,22,i*100+6, 1}, "®¸ quÝ 6 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		gf_AddItemEx2({2,1,30912,2400,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 5 cÊp 92")	
	elseif nType == 13 then
		duatop_choose_VKamhuyet()
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 5 cÊp 93")
	elseif nType == 14 then
		for i=1,4 do	--®¸ quÝ level7
			gf_AddItemEx2({2,22,i*100+7, 2}, "®¸ quÝ 7 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 5 cÊp 94")	
	end
--========================
end
function thangcapnhanthuong_692()
	local tbSay = {}		
	tinsert(tbSay,"Ta muèn nhËn trang bÞ Kim Xµ V©n Du/#thangcapnhanthuong_692_finish(1)")
	tinsert(tbSay,"Ta muèn nhËn trang bÞ Kim Xµ ThiÕt HuyÕt/#thangcapnhanthuong_692_finish(2)")
	tinsert(tbSay,"Ta muèn nhËn trang bÞ Kim Xµ Du HiÖp/#thangcapnhanthuong_692_finish(3)")
	tinsert(tbSay,"T«i chØ xem th«i/gf_DoNothing");
	Say(strNpcName.."C¸c h¹ h·y lùa chän 1 trong 3 bé trang bÞ Kim Xµ: ",getn(tbSay),tbSay)
end
function thangcapnhanthuong_692_finish(nChoice)
	SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),2,1));	
	if nChoice  == 1 then
		LIB_Award:Award(tbKimXaVanDu7)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ V©n Du")
	elseif nChoice == 2 then
		LIB_Award:Award(tbKimXaThietHuyet7)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ ThiÕt HuyÕt")
	elseif nChoice == 3 then
		LIB_Award:Award(tbKimXaDuHiep7)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ Du HiÖp")
	end	
	AwardGenuineQi(80000)
	gf_AddItemEx2({2,1,30368,100,4},"Cæ Linh Th¹ch","DUA TOP","nhËn Cæ Linh Th¹ch")	
	gf_AddItemEx2({2,1,1009,2,4},"Thiªn Th¹ch Tinh Th¹ch","DUA TOP","nhËn Thiªn Th¹ch Tinh Th¹ch",7*24*3600,1)		
	gf_AddItemEx2({2,1,30497,1000,1},"Ma Tinh","DUA TOP","Ma Tinh")
	gf_AddItemEx2({2,1,30912,2000,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")	
--		gf_AddItemEx2({2,1,30369,100,4},"Cæ Linh Ngäc","DUA TOP","nhËn Cæ Linh Ngäc")	
--		gf_AddItemEx2({2,1,30847,10,4},"Håi tiªn ®¬n","DUA TOP","Håi tiªn ®¬n")	
		for i=1,4 do	--®¸ quÝ level1
			gf_AddItemEx2({2,22,i*100+1, 4}, "®¸ quÝ 1 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level2
			gf_AddItemEx2({2,22,i*100+2, 4}, "®¸ quÝ 2 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "®¸ quÝ 3 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level4
			gf_AddItemEx2({2,22,i*100+4, 1}, "®¸ quÝ 4 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 2 cÊp 90")
end
function thangcapnhanthuong_797()
	receive_DieuDuong_Top1_faction_01(0,1)	--2 ngäc diÖu d­¬ng 8%
	--MËt tÞch cÊp 70
	local nRoute = GetPlayerRoute()
	TraoMatTichCaoCap20(1,nRoute)
	AwardGenuineQi(100000)
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 2 cÊp 97")
end
function go_exit()
	ExitGame()
end
function get_fast_MinhGiao()
	local nRoute = GetPlayerRoute()
	if nRoute ~= 25 and nRoute ~= 26 and nRoute ~= 27 then
		Talk(1, "", strNpcName.."PhÇn th­ëng nµy chØ dµnh cho c¸c hÖ ph¸i Minh Gi¸o!");
		return 0
	end
	local nPhucSinh = GetPlayerRebornParam(0)
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + nPhucSinh
	if gf_CheckLevel(7,90) ~= 1 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®¹t phôc sinh 7 cÊp ®é 90, h·y cè g¾ng thªm..");
		return 0
	end
	if GetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),11) == 1 then		--TSK_VANGDANHTHIENHA_DUATOP: sö dông bit 11
		Talk(1, "", strNpcName.."§¹i hiÖp ®· ®¨ng ký nhËn phÇn th­ëng nµy råi.")
		return 0
	end		
	LIB_txtData:Init("top3minhgiao.txt")
	LIB_txtData:LoadData()
	local nAward = LIB_txtData.tbTextData[1]

	if nAward >= 3 then
		Talk(1, "", strNpcName.."§· cã ®ñ 3 cao thñ Minh Gi¸o ®¨ng ký nhËn phÇn th­ëng nµy, c¸c h¹ h·y cè g¾ng chiÕm phÇn th­ëng kh¸c nhÐ!");
		return 0
	end
	if LIB_txtData:AddValue(1,1,3) == 1 then
		SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),11,1));		
		Talk(1, "", strNpcName.." Chóc mõng ®¹i hiÖp ®· ®¨ng ký nhËn th­ëng thµnh c«ng");
		gf_WriteLogEx("TOP 3 MINH GIAO CS7", "nhËn", 1, "§¨ng ký thµnh c«ng")
	end
end
function minhgiao_get_award_by_level()
	do return 0 end
	local nRoute = GetPlayerRoute()
	if nRoute ~= 31 and nRoute ~= 32 then
		Talk(1, "", strNpcName.."PhÇn th­ëng nµy chØ dµnh cho c¸c hÖ ph¸i: C«n L«n KiÕm T«n vµ §­êng M«n NhËm HiÖp !!!!");
		return 0
	end
	local tSay = {}
	tinsert(tSay,"Ta muèn nhËn th­ëng Trïng Sinh 5 cÊp 94/#minhgiao_get_award(1)")	--TSK_TT_VANGDANHTHIENHA_DUATOP: sö dông bit 1
	tinsert(tSay,"Ta muèn nhËn th­ëng Phôc Sinh 6 cÊp 94/#minhgiao_get_award(2)")	--TSK_TT_VANGDANHTHIENHA_DUATOP: sö dông bit 2
	tinsert(tSay,"Ta muèn nhËn th­ëng Phôc Sinh 6 cÊp 99/#minhgiao_get_award(3)")	--TSK_TT_VANGDANHTHIENHA_DUATOP: sö dông bit 3
	tinsert(tSay,"Ta muèn nhËn th­ëng Phôc Sinh 7 cÊp 94/#minhgiao_get_award(4)")	--TSK_TT_VANGDANHTHIENHA_DUATOP: sö dông bit 4
	tinsert(tSay,"Ta muèn nhËn th­ëng Phôc Sinh 8 cÊp 94/#minhgiao_get_award(5)")	--TSK_TT_VANGDANHTHIENHA_DUATOP: sö dông bit 5
	tinsert(tSay,"Ta biÕt råi/dlgover")	
	local strSay = strNpcName.."Ho¹t ®éng <color=yellow>Truy C«ng L·nh Th­ëng<color> diÔn ra tõ ngµy<color=red> "..szStartDate.." ®Õn 24:00 "..szEndDate.."<color>. Trong thêi gian nµy, quý ®ång ®¹o cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng hÊp dÉn. Th«ng tin chi tiÕt quý ®ång ®¹o vui lßng xem t¹i <color=blue>https://volam2.zing.vn<color>"
	Say(strSay,getn(tSay),tSay)
end

function minhgiao_get_award(nType)
	do return 0 end
	local tbCondition = {--level
							[1] = {594, 0,},
							[2] = {694, 0,},
							[3] = {699, 0,},
							[4] = {794, 0,},
							[5] = {894, 0,}, 
						}
	local nRoute = GetPlayerRoute()
	if nRoute ~= 31 and nRoute ~= 32 then
		Talk(1, "", strNpcName.."PhÇn th­ëng nµy chØ dµnh cho c¸c hÖ ph¸i Minh Gi¸o!");
		return 0
	end						
	if GetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),nType) == 1 then	
		Talk(1, "", strNpcName.."§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi, h·y cè g¾ng lªn cÊp ®Ó nhËn phÇn th­ëng tiÕp theo.")
		return 0
	end			
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	local nLevel = (nChuyenSinh + nPhucSinh)*100 + GetLevel()	
	local nChuyenPhucSinh = gf_GetTransLevel()  -- bao gåm chuyÓn sinh vµ phôc sinh	
	if nChuyenPhucSinh < tbCondition[nType][1] then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a ®ñ ®¼ng cÊp nªn kh«ng thÓ nhËn th­ëng.");
		return 0
	end
	if gf_Judge_Room_Weight(10,500)~=1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return
	end
--	if GetItemCount(2,1,30230) < tbCondition[nType][2] then
--		Talk(1,"","C¸c h¹ kh«ng ®ñ xu vËt phÈm nhËn th­ëng.")
--		return
--	end
--	DelItem(2,1,30230,tbCondition[nType][2])
	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),nType,1));		
	if nType == 1 then
		AwardGenuineQi(20000)
		GiveJue() --yÕu quyÕt theo hÖ ph¸i
		TraoMatTichCaoCap20_loaithuong(1,nRoute)
--		gf_AddItemEx2({2,1,30499,20,4},"Hu©n ch­¬ng anh hïng","DUA TOP","nhËn hßa thÞ bÝch")
--		gf_AddItemEx2({0,152,9,1,1,-1,-1,-1,-1,-1,-1,-1},"¸o Choµng ¢m ChÕ ngò hµnh","DUA TOP","nhËn ¸o choµng")
--		gf_AddItemEx2({0,153,9,1,1,-1,-1,-1,-1,-1,-1,-1},"Huy Ch­¬ng ¢m ChÕ ngò hµnh","DUA TOP","nhËn huy ch­¬ng")
--		gf_AddItemEx2({0,154,9,1,1,-1,-1,-1,-1,-1,-1,-1},"ChiÕn Hµi ¢m ChÕ ngò hµnh","DUA TOP","nhËn chiÕn hµi")
		for i=1,4 do	--®¸ quÝ level2
			gf_AddItemEx2({2,22,i*100+2, 4}, "®¸ quÝ 2", "DUA TOP" , "nhËn")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP PHAI MOI"..szLOGSERVERNAME, "nhËn", 1, "PhÇn th­ëng Trïng sinh 5 cÊp 94")
	elseif nType == 2 then
--		for i=1,4 do	--®¸ quÝ level2
--			gf_AddItemEx2({2,22,i*100+2, 5}, "®¸ quÝ 2", "DUA TOP" , "nhËn")
--		end
		AwardGenuineQi(40000)
		gf_AddItemEx2({2,1,30368,100,4},"Cæ Linh Th¹ch","DUA TOP","nhËn Cæ Linh Th¹ch")
		gf_AddItemEx2({2,1,30369,100,4},"Cæ Linh Ngäc","DUA TOP","nhËn Cæ Linh Ngäc")
		gf_AddItemEx2({2,1,30912,2000,4},"HiÖp NghÜa Chi Chøng","DUA TOP","nhËn Thiªn Cang LÖnh")
		gf_AddItemEx2({2,1,30913,50,4},"§ång TÕ Chi NguyÖn","DUA TOP","Th¸i DÞch")
		for i=1,4 do	--®¸ quÝ level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "®¸ quÝ 3", "DUA TOP" , "nhËn")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP PHAI MOI"..szLOGSERVERNAME, "nhËn", 1, "PhÇn th­ëng Phôc sinh 1 cÊp 94")
	elseif nType == 3 then
		AwardGenuineQi(60000)
		gf_AddItemEx2({2,1,30368,200,4},"Cæ Linh Th¹ch","DUA TOP","nhËn Cæ Linh Th¹ch")
		gf_AddItemEx2({2,1,30369,200,4},"Cæ Linh Ngäc","DUA TOP","nhËn Cæ Linh Ngäc")
		gf_AddItemEx2({2,95,204,1,4},"Thiªn Cang LÖnh","DUA TOP","nhËn Thiªn Cang LÖnh")
		gf_AddItemEx2({2,1,30668,16,1},"UÈn Linh 6","DUA TOP","UÈn Linh 6")
		gf_WriteLogEx("NHAN THUONG DUA TOP PHAI MOI"..szLOGSERVERNAME, "nhËn", 1, "PhÇn th­ëng Phôc sinh 1 cÊp 99")
	elseif nType == 4 then
		gf_AddItemEx2({2,0,1083,2,4},"Th¸i DÞch Hçn Nguyªn","DUA TOP","Th¸i DÞch")
--		get_award_daquy345(3)	
		gf_AddItemEx2({2,1,30370,1,4},"Thiªn M«n Kim LÖnh","DUA TOP","nhËn Thiªn M«n Kim LÖnh")		
		for i=1,4 do	--®¸ quÝ level4
			gf_AddItemEx2({2,22,i*100+4, 4}, "®¸ quÝ 4", "DUA TOP" , "nhËn")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP PHAI MOI"..szLOGSERVERNAME, "nhËn", 1, "PhÇn th­ëng Phôc sinh 2 cÊp 94")
	elseif nType == 5 then
--		AwardGenuineQi(100000)
		TraoMatTichCaoCap20(1,nRoute)
		gf_AddItemEx2({2,1,30847,30,4},"Håi tiªn ®¬n","DUA TOP","Håi tiªn §¬n")
		gf_AddItemEx2({2,1,30814,1,4},"Phôc Sinh §¬n","DUA TOP","Phôc Sinh §¬n")
		gf_AddItemEx2({2,1,30970,1,4},"Trøng B¸ Ng¹c","DUA TOP","Phôc Sinh §¬n")
		gf_WriteLogEx("NHAN THUONG DUA TOP PHAI MOI"..szLOGSERVERNAME, "nhËn", 1, "PhÇn th­ëng Phôc sinh 3 cÊp 94")
	end
end
function duatop_choose_kimxa5(nType)
	
	local tSay = {}
	if nType == 2 then
		tinsert(tSay,"HiÖp Cèt Phi Phong/#finish_duatop_choose_kimxa5(1,"..nType..")");
		tinsert(tSay,"Quû Phï Phi Phong/#finish_duatop_choose_kimxa5(2,"..nType..")");
		tinsert(tSay,"§»ng V©n Phi Phong/#finish_duatop_choose_kimxa5(3,"..nType..")");
	end
	if nType == 3 then
		tinsert(tSay,"HiÖp Cèt Ch­¬ng/#finish_duatop_choose_kimxa5(4,"..nType..")");
		tinsert(tSay,"Quû Phï Ch­¬ng/#finish_duatop_choose_kimxa5(5,"..nType..")");
		tinsert(tSay,"§»ng V©n Ch­¬ng/#finish_duatop_choose_kimxa5(6,"..nType..")");
	end
	if nType == 4 then
		tinsert(tSay,"HiÖp Cèt Ngoa/#finish_duatop_choose_kimxa5(7,"..nType..")");
		tinsert(tSay,"Quû Phï Ngoa/#finish_duatop_choose_kimxa5(8,"..nType..")");
		tinsert(tSay,"§»ng V©n Ngoa/#finish_duatop_choose_kimxa5(9,"..nType..")");
	end
	tinsert(tSay,"T«i chØ xem xem th«i/gf_DoNothing");
	
	Say("§¹i hiÖp h·y chän 1 trang bÞ Kim Xµ 5: ", getn(tSay), tSay);
end
function finish_duatop_choose_kimxa5(nTypeKX, nTypeAward)
	local nRoute = GetPlayerRoute();
	local tbKimXa5 = {
				[1] ={{0,152,29,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "HiÖp Cèt Phi Phong"},	
				[2] ={{0,152,30,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "Quû Phï Phi Phong"},
				[3] ={{0,152,31,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "§»ng V©n Phi Phong"},					
				[4] ={{0,153,29,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "HiÖp Cèt Ch­¬ng"},	
				[5] ={{0,153,30,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "Quû Phï Ch­¬ng"},	
				[6] ={{0,153,31,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "§»ng V©n Ch­¬ng"},			
				[7] ={{0,154,29,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "HiÖp Cèt Ngoa"},					
				[8] ={{0,154,30,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "Quû Phï Ngoa"},							
				[9] ={{0,154,31,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "§»ng V©n Ngoa"},		
			}

	if nTypeAward == 2 then
--		if DelItem(2,1,30230,2000) ~= 1 then
--			Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ xu vËt phÈm")
--			return 0
--		end
		SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),2,1));	
		
		gf_AddItemEx2(tbKimXa5[nTypeKX][1], tbKimXa5[nTypeKX][2], "DUA TOP", "¸o kim xµ 5")
		Msg2Player("B¹n nhËn ®­îc vËt phÈm Kim Xµ 5 "..tbKimXa5[nTypeKX][2])
	
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,1009,2,4},"Thiªn Th¹ch Tinh Th¹ch","DUA TOP","nhËn Thiªn Th¹ch Tinh Th¹ch",7*24*3600,1)
		gf_AddItemEx2({2,1,1001,1,4},"Hßa ThÞ BÝch","DUA TOP","nhËn hßa thÞ bÝch",7*24*3600,1)
		gf_AddItemEx2({2,1,30912,2000,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
		gf_AddItemEx2({2,1,30913,20,4},"§ång TÕ Chi NguyÖn","DUA TOP","§ång TÕ Chi NguyÖn")
		gf_AddItemEx2({2,1,30668,16,1},"UÈn Linh 6","DUA TOP","UÈn Linh 6")
		gf_AddItemEx2({2,1,30847,20,4},"Håi tiªn ®¬n","DUA TOP","Håi tiªn ®¬n")	
		for i=1,4 do	--®¸ quÝ level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "®¸ quÝ 3 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level4
			gf_AddItemEx2({2,22,i*100+4, 3}, "®¸ quÝ 4 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level5
			gf_AddItemEx2({2,22,i*100+5, 1}, "®¸ quÝ 5 hÖ ph¸i", "DUA TOP" , "nhËn")
		end

		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 2 cÊp 90")
	end
	if nTypeAward == 3 then		
		SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),3,1));
		
		gf_AddItemEx2(tbKimXa5[nTypeKX][1], tbKimXa5[nTypeKX][2], "DUA TOP", "ch­¬ng kim xµ 5")
		Msg2Player("B¹n nhËn ®­îc vËt phÈm Kim Xµ 5 "..tbKimXa5[nTypeKX][2])
		
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,30814,1,4},"Phôc Sinh §¬n","DUA TOP","Phôc Sinh §¬n")
		gf_AddItemEx2({2,1,30912,2000,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
		gf_AddItemEx2({2,1,30913,150,4},"§ång TÕ Chi NguyÖn","DUA TOP","§ång TÕ Chi NguyÖn")
		gf_AddItemEx2({2,1,30668,16,1},"UÈn Linh 6","DUA TOP","UÈn Linh 6")
		gf_AddItemEx2({2,1,30847,40,4},"Håi tiªn ®¬n","DUA TOP","Håi tiªn ®¬n")	
		for i=1,4 do	--®¸ quÝ level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "®¸ quÝ 3 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level4
			gf_AddItemEx2({2,22,i*100+4, 3}, "®¸ quÝ 4 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level5
			gf_AddItemEx2({2,22,i*100+5, 1}, "®¸ quÝ 5 hÖ ph¸i", "DUA TOP" , "nhËn")
		end

		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 2 cÊp 92")
	end
	if nTypeAward == 4 then
		if DelItem(2,1,30230,2000) ~= 1 then
			Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ xu vËt phÈm")
			return 0
		end
		local nRoute = GetPlayerRoute()
		SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),4,1));
		
		gf_AddItemEx2(tbKimXa5[nTypeKX][1], tbKimXa5[nTypeKX][2], "DUA TOP", "ngoa kim xµ 5")
		Msg2Player("B¹n nhËn ®­îc vËt phÈm Kim Xµ 5 "..tbKimXa5[nTypeKX][2])
		
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,1113,1,1},"§¹i §Þnh Hån","DUA TOP","§¹i §Þnh Hån",7*24*3600,1)
		gf_AddItemEx2({2,1,30814,1,4},"Phôc Sinh §¬n","DUA TOP","Phôc Sinh §¬n")
		gf_AddItemEx2({2,1,30368,100,4},"Cæ Linh Th¹ch","DUA TOP","nhËn Cæ Linh Th¹ch")
		gf_AddItemEx2({2,1,30369,100,4},"Cæ Linh Ngäc","DUA TOP","nhËn Cæ Linh Ngäc")	
		gf_AddItemEx2({2,1,1009,5,4},"Thiªn Th¹ch Tinh Th¹ch","DUA TOP","nhËn Thiªn Th¹ch Tinh Th¹ch",7*24*3600,1)
		gf_AddItemEx2({2,95,204,1,1},"Thiªn Cang LÖnh","DUA TOP","nhËn Thiªn Cang LÖnh")	
		gf_AddItemEx2({2,1,30370,1,1},"Thiªn M«n Kim LÖnh","DUA TOP","nhËn Thiªn M«n Kim LÖnh")	
		gf_AddItemEx2({2,1,1001,1,4},"Hßa ThÞ BÝch","DUA TOP","nhËn Hßa ThÞ BÝch",7*24*3600,1)
		gf_AddItemEx2({2,1,30970,1,1},"Trøng B¸ Ng¹c","DUA TOP","Phôc Sinh §¬n")
		--MËt tÞch cÊp 70
		TraoMatTichCaoCap20(1,nRoute)
		gf_AddItemEx2({2,1,30912,2000,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")
		gf_AddItemEx2({2,1,30847,60,4},"Håi tiªn ®¬n","DUA TOP","Håi tiªn §¬n")

		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 2 cÊp 95")
	end
end
function duatop_choose_amhuyet()
	local tSay = {}
	tinsert(tSay,"Nãn Èm HuyÕt/#finish_duatop_choose_amhuyet(1)");
	tinsert(tSay,"¸o Èm HuyÕt/#finish_duatop_choose_amhuyet(2)");
	tinsert(tSay,"QuÇn Èm HuyÕt/#finish_duatop_choose_amhuyet(3)");

	tinsert(tSay,"T«i chØ xem th«i/gf_DoNothing");
	
	Say("§¹i hiÖp h·y chän 1 trang bÞ Èm HuyÕt: ", getn(tSay), tSay);
end		
function finish_duatop_choose_amhuyet(nType)				
	local tbamHuyet = {
				[1] ={{0,103,30610,1,4}, "Nãn Èm HuyÕt"},	
				[2] ={{0,100,30610,1,4}, "¸o Èm HuyÕt"},
				[3] ={{0,101,30610,1,4}, "QuÇn Èm HuyÕt"},
			}
	SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),12,1));	

	gf_AddItemEx2(tbamHuyet[nType][1], tbamHuyet[nType][2], "DUA TOP", "trang bÞ Èm huyÕt")
	Msg2Player("B¹n nhËn ®­îc vËt phÈm "..tbamHuyet[nType][2])	
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 5 cÊp 92")
end
function duatop_choose_VKamhuyet()
	local tVuKhi = {
				[2] = {0,3,30884, 1,4},
				[3] = {0,8,30885, 1,4},
				[4] = {0,0,30886, 1,4},
				[6] = {0,1,30887, 1,4},
				[8] = {0,2,30888, 1,4},
				[9] = {0,10,30889, 1,4},
				[11] = {0,0,30890, 1,4},
				[12] = {0,5,30891, 1,4},
				[14] = {0,2,30892, 1,4},
				[15] = {0,9,30893, 1,4},
				[17] = {0,6,30894, 1,4},
				[18] = {0,4,30895, 1,4},
				[20] = {0,7,30896, 1,4},
				[21] = {0,11,30897, 1,4},
				[23] = {0,2,30898, 1,4},
				[25] = {0,3,30899, 1,4},
				[26] = {0,9,30900, 1,4},
				[27] = {0,11,30901, 1,4},
				[29] = {0,13,30902, 1,4},
				[30] = {0,12,30903, 1,4},
				[31] = {0,14,32164, 1,4},
				[32] = {0,2,32192, 1,4},
			}
		local nRoute = GetPlayerRoute()
		SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),13,1));	
		gf_AddItemEx2(tVuKhi[nRoute], "VK Èm huyÕt", "NHAN THUONG DUA TOP", "nhËn vk Èm huyÕt thµnh c«ng");	
		Msg2Player("B¹n nhËn ®­îc vËt phÈm Vò KhÝ Èm HuyÕt")	
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 5 cÊp 93")
end