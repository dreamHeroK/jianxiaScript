function vng_award_translife(nTransLife, nLevel, nType)
	local nTransVn = nTransLife
	local nTransKs = 0
	if nTransVn > 5 then
		nTransKs = nTransVn - 5
		nTransVn = 5
	end
	local tb_translife_seal_cs6 = {
							{"Long Tö Ên",{2,0,30002,1,1}, "Long Tö"},
							{"Hæ Tö Ên",{2,0,30003,1,1}, "Hæ Tö"},
							{"¦ng Tö Ên",{2,0,30006,1,1}, "¦ng Tö"},
							{"Phông Tö Ên",{2,0,30005,1,1}, "Phông Tö"},							
					}
	local tb_translife_cloth_PS = {
										[1] = {
													{"ChuyÓn Sinh Trang", {0,108,30005,1,4,5,639,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},		
										[2] = {
													{"ChuyÓn Sinh Trang", {0,108,30005,1,4,6,302,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,409,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,110,30005,1,4,5,79,5,80,6,102}},
											},
										[3] = {
													 {"ChuyÓn Sinh Trang", {0,108,30005,1,4,2,13075,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},	
										[4] = {
													 {"ChuyÓn Sinh Trang", {0,108,30005,1,4,5,27,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,110,30005,1,4,4,292,4,293,6,102}},
											},
									}
	tb_translife_cloth_cs7_nhanlai = {
			[1] = {
					[1] = {{0,108,30029,1,4,7,639,3,371,7,102}, {0,109,30029,1,4,5,342,7,102}, {0,110,30029,1,4,4,282,7,250,7,102}},
					[2] = {{0,108,30030,1,4,7,639,3,371,7,102}, {0,109,30030,1,4,5,342,7,102}, {0,110,30030,1,4,4,282,7,250,7,102}},
					[3] = {{0,108,30031,1,4,7,639,3,371,7,102}, {0,109,30031,1,4,5,342,7,102}, {0,110,30031,1,4,4,282,7,250,7,102}},
					[4] = {{0,108,30032,1,4,7,639,3,371,7,102}, {0,109,30032,1,4,5,342,7,102}, {0,110,30032,1,4,4,282,7,250,7,102}},
					[5] = {{0,108,30029,1,4}, {0,109,30029,1,4}, {0,110,30029,1,4}},
					[6] = {{0,108,30030,1,4}, {0,109,30030,1,4}, {0,110,30030,1,4}},
					[7] = {{0,108,30031,1,4}, {0,109,30031,1,4}, {0,110,30031,1,4}},
					[8] = {{0,108,30032,1,4}, {0,109,30032,1,4}, {0,110,30032,1,4}},					
				},	
			[4] = {
					[1] = {{0,108,30029,1,4,7,27,7,102}, {0,109,30029,1,4,5,342,4,409,7,102}, {0,110,30029,1,4,5,292,5,293,7,102}},
					[2] = {{0,108,30030,1,4,7,27,7,102}, {0,109,30030,1,4,5,342,4,409,7,102}, {0,110,30030,1,4,5,292,5,293,7,102}},
					[3] = {{0,108,30031,1,4,7,27,7,102}, {0,109,30031,1,4,5,342,4,409,7,102}, {0,110,30031,1,4,5,292,5,293,7,102}},
					[4] = {{0,108,30032,1,4,7,27,7,102}, {0,109,30032,1,4,5,342,4,409,7,102}, {0,110,30032,1,4,5,292,5,293,7,102}},
					[4] = {{0,108,30029,1,4}, {0,109,30029,1,4}, {0,110,30029,1,4}},
					[6] = {{0,108,30030,1,4}, {0,109,30030,1,4}, {0,110,30030,1,4}},
					[7] = {{0,108,30031,1,4}, {0,109,30031,1,4}, {0,110,30031,1,4}},
					[8] = {{0,108,30032,1,4}, {0,109,30032,1,4}, {0,110,30032,1,4}},					
				},		
			[3] = {
					[1] = {{0,108,30029,1,4,3,13075,7,102}, {0,109,30029,1,4,5,342,2,346,7,102}, {0,110,30029,1,4,4,282,7,250,7,102}},
					[2] = {{0,108,30030,1,4,3,13075,7,102}, {0,109,30030,1,4,5,342,2,346,7,102}, {0,110,30030,1,4,4,282,7,250,7,102}},
					[3] = {{0,108,30031,1,4,3,13075,7,102}, {0,109,30031,1,4,5,342,2,346,7,102}, {0,110,30031,1,4,4,282,7,250,7,102}},
					[4] = {{0,108,30032,1,4,3,13075,7,102}, {0,109,30032,1,4,5,342,2,346,7,102}, {0,110,30032,1,4,4,282,7,250,7,102}},
					[5] = {{0,108,30029,1,4}, {0,109,30029,1,4}, {0,110,30029,1,4}},
					[6] = {{0,108,30030,1,4}, {0,109,30030,1,4}, {0,110,30030,1,4}},
					[7] = {{0,108,30031,1,4}, {0,109,30031,1,4}, {0,110,30031,1,4}},
					[8] = {{0,108,30032,1,4}, {0,109,30032,1,4}, {0,110,30032,1,4}},					
				},											
			[2] = {
					[1] = {{0,108,30029,1,4,6,302,7,409,7,102}, {0,109,30029,1,4,5,13219,5,13220,7,102}, {0,110,30029,1,4,4,290,7,250,7,102}},
					[2] = {{0,108,30030,1,4,6,302,7,409,7,102}, {0,109,30030,1,4,5,13219,5,13220,7,102}, {0,110,30030,1,4,4,290,7,250,7,102}},
					[3] = {{0,108,30031,1,4,6,302,7,409,7,102}, {0,109,30031,1,4,5,13219,5,13220,7,102}, {0,110,30031,1,4,4,290,7,250,7,102}},
					[4] = {{0,108,30032,1,4,6,302,7,409,7,102}, {0,109,30032,1,4,5,13219,5,13220,7,102}, {0,110,30032,1,4,4,290,7,250,7,102}},
					[5] = {{0,108,30029,1,4}, {0,109,30029,1,4}, {0,110,30029,1,4}},
					[6] = {{0,108,30030,1,4}, {0,109,30030,1,4}, {0,110,30030,1,4}},
					[7] = {{0,108,30031,1,4}, {0,109,30031,1,4}, {0,110,30031,1,4}},
					[8] = {{0,108,30032,1,4}, {0,109,30032,1,4}, {0,110,30032,1,4}},					
				},	
		}		
	--=====chuyÓn sinh 5
	if nTransKs == 0 then --ch­a phôc sinh
		--gf_SetTaskByte(1538, 1, nTransVn); 			--1~5ת
		if  IsPlayerDeath() ~= 0 then
			Talk(1,"","Ng­êi ch¬i cßn sèng míi ®­îc chuyÓn sinh")
			return
		end	
		local nRoute = GetPlayerRoute()
		if gf_GetPlayerRebornCount() < 5 and gf_GetPlayerRebornCount() > 0 then
			local nTransCount_1 = GetTranslifeCount()	
			RemoveTitle(ck_tb_translife_tittle[nTransCount_1][nRoute][2], ck_tb_translife_tittle[nTransCount_1][nRoute][3])
		end
		-- Set sè lÇn chuyÓn sinh
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT, 5) --5 lÇn chuyÓn sinh
		-- Set h­íng chuyÓn sinh
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nType)
		local nTransCount = GetTranslifeCount()	
		AddTitle(ck_tb_translife_tittle[nTransCount][nRoute][2], ck_tb_translife_tittle[nTransCount][nRoute][3])	
		ResetProperty()
		SetLevel(90,0)
		local nGetExp = GetExp()
		local nTime = floor(nGetExp/2000000000)
		if nTime >= 1 then
			for i = 1, nTime do
				ModifyExp(-2000000000)
			end
		end
		ModifyExp(-GetExp())
		gf_WriteLogEx("THE VIP", "chuyÓn sinh thµnh c«ng", 1, "THE VIP chuyen sinh 5")	
		return 1
	end
	--================
	if nTransKs == 1 then 	--phôc sinh 1
		local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
		local nRoute = GetPlayerRoute()
		if IsPlayerDeath() ~= 0 then 
			Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
			return
		end	
	
		if nChuyenSinh >= 690 then -- b¾t chuyÓn sinh 7
			Talk(1,"","<color=green>Lôc Tróc ¤ng: <color>Kinh nghiÖm chuyÓn sinh cña ®¹i hiÖp qu¸ cao, ta kh«ng thÓ gióp g× ®­îc c¶ !!!!")
			return 0	
		end
	
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
		SetLevel(90,0)
		AddTitle(61,05)
	 	gf_WriteLogEx("THE VIP", "chuyÓn sinh thµnh c«ng", 1, "THE VIP chuyen sinh 6")	
	 	local nGetExp = GetExp()
		local nTime = floor(nGetExp/2000000000)
		if nTime >= 1 then
			for i = 1, nTime do
				ModifyExp(-2000000000)
			end
		end
		ModifyExp(-GetExp())
		return 1
	end
	if nTransKs == 2 then 	--phôc sinh 2
		local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
		local nRoute = GetPlayerRoute()
		if IsPlayerDeath() ~= 0 then 
			Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
			return
		end	
	
		if nChuyenSinh >= 783 then -- b¾t chuyÓn sinh 7
			Talk(1,"","<color=green>Lôc Tróc ¤ng: <color>Kinh nghiÖm chuyÓn sinh cña ®¹i hiÖp qu¸ cao, ta kh«ng thÓ gióp g× ®­îc c¶ !!!!")
			return 0	
		end
	
		BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
		BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
		BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
		BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
		local nType_cs6 = GetPlayerRebornParam(1)	
		local nTransCount = GetTranslifeCount()	
		for i=1, getn(tb_translife_cloth_PS[nType_cs6]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_PS[nType_cs6][i][2])
			P = P + GetBody() - 1
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))			
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Tø Linh ViÖt Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
		end
	
		RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	
	
		local tbVanSu = {"V¨n Sö ngo¹i trang",0,108,570,188}
		local nPVanSu = tbVanSu[4]  + GetBody() - 1
		for i = 0, 2 do
			BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
		end
		gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
		PlayerReborn(2,nType) -- ChuyÓn Sinh 7 thµnh c«ng		
		SetLevel(83,0)
		RemoveTitle(61,05)
		AddTitle(61,06)
	 	gf_WriteLogEx("THE VIP", "chuyÓn sinh thµnh c«ng", 1, "THE VIP chuyen sinh 7")	
	 	local nGetExp = GetExp()
		local nTime = floor(nGetExp/2000000000)
		if nTime >= 1 then
			for i = 1, nTime do
				ModifyExp(-2000000000)
			end
		end
		ModifyExp(-GetExp())
		return 1
	end
	if nTransKs == 3 then 	--phôc sinh 3
		local nPhucSinh_Count = GetPlayerRebornParam(0) 
		local nRoute = GetPlayerRoute()
		local tbType = {"Long Tö", "Hæ Tö", "¦ng Tö", "Phông Tö"}
		local nType_cs7 = GetPlayerRebornParam(1)
		--============	
		BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
		BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
		BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
		BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
		local nBody = GetBody()	
		for i=1, getn(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody][i])
			--P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		end	
		--=========
		gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
		PlayerReborn(3,nType) -- ChuyÓn Sinh 8 thµnh c«ng (Phôc Sinh 3)
		RemoveTitle(61,6)
		AddTitle(71,1)
		local nGetExp = GetExp()
		local nTime = floor(nGetExp/2000000000)
		if nTime >= 1 then
			for i = 1, nTime do
				ModifyExp(-2000000000)
			end
		end
		ModifyExp(-GetExp())
		gf_WriteLogEx("THE VIP", "chuyÓn sinh thµnh c«ng", 1, "THE VIP chuyen sinh 8")	
		return 1
	end
--	SetLevel(nLevel, 1);						--level
	return 1
end