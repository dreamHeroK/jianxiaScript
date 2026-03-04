--=============================================
--create by baiyun 2009.5.29
--describe:Ô½ÄÏ°æ7ÔÂ·Ý»î¶¯Ö®ÎåÖÖÊ÷
--=============================================
Include("\\script\\online\\viet_event\\200907\\5\\planttrees_head.lua")
Include("\\script\\online_activites\\award.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\plant\\fruit_baoguo.lua");
Include("\\script\\online\\plant\\guoshi13_24.lua");
Include("\\script\\online_activites\\ipbonus\\ipbonus.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")


--------------------------------------
--main()
--Ö÷º¯Êý
--------------------------------------
function main()
	local nPlantTimePassed = 0;
	local nWaterTimePassed = 0;
	local npcIdx, npcModel, npcName = GetTriggeringUnit();--»ñµÃµ±Ç°´¥·¢Æ÷ÀïµÄNPCË÷Òý£¬Ä£°åID£¬ÏÔÊ¾Ãû×Ö
	if npcIdx == 0 then
		WriteLog("[Hoat dong trong cay thang 8 loi]:"..GetName().."Trong lóc t­íi c©y, GetTriggeringUnit thø nhÊt sÏ trë vÒ 0");
		return 0;
	end
	local nNameLen = strlen(GetName());
	local bJudgeByName = 0;
	if GetName() == strsub(npcName, 1, nNameLen) then --ÓÃÃû×ÖÀ´ÅÐ¶ÏÊÇ²»ÊÇÍæ¼ÒµÄÊ÷
		bJudgeByName = 1;
	end
	local bIsTree = 0;
	for i = 1, getn(TREE_TYPE) do
		if npcModel == TREE_TYPE[i][1] then
			bIsTree = 1;
			break;
		end
	end
	if bIsTree == 0 then
		SetNpcScript(npcIdx, "");
		WriteLog("[Hoat dong trong cay thang 8 loi] NPC:"..npcName.."Lçi files gèc");
		return 0;
	end
	local npcTreeIndex = GetTargetNpc(); --»ñÈ¡Íæ¼ÒµÄ¶¯×÷¶ÔÏóNpc
	if npcTreeIndex == 0 then
		WriteLog("[Hoat dong trong cay thang 8 loi]:"..GetName.."Khi t­íi n­íc, GetTargetNpc trÞ quay l¹i lµ 0");
		return 0;
	end;
	if bJudgeByName == 0 then
		Msg2Player("§©y kh«ng ph¶i lµ c©y b¹n trång");
		return 0;
	end
	if npcTreeIndex ~= GetTask(TASK_TREE_INDEX) then
		Msg2Player("§©y kh«ng ph¶i lµ c©y b¹n trång");
		return 0;
	end
	
	local nTreeGrow = GetTask(TASK_TREE_GROW);
	nPlantTimePassed = GetTime() - GetTask(TASK_PLANT_TREE_TIME);
	nWaterTimePassed = GetTime() - GetTask(TASK_WATER_TREE_TIME);
	
	local sSysSth = "";
	local selTab = {};
	--Èç¹ûÊÇ²»ËÀÊ÷
	if GetTask(TASK_PLANT_TREE_TYPE) == 2 then
		if nPlantTimePassed < 240 then
			Talk(1, "", "C©y BÊt Tö vÉn ch­a tr­êng thµnh, b©y giê kh«ng thÓ thu ho¹ch ®­îc, ®îi <color=yellow>" .. 240 - nPlantTimePassed .. " gi©y<color> h·y tiÕp tôc thu ho¹ch");
			return 0;
		else
			tinsert(selTab, "B©y giê thu ho¹ch /getTree");
			tinsert(selTab, "§îi mét lóc h·y thu ho¹ch tiÕp/nothing");
			sSaySth = "C©y ®· tr­ëng thµnh, muèn thu ho¹ch b©y giê? NÕu nh­<color=yellow>" .. 300 - nPlantTimePassed .. "<color> gi©y sau kh«ng thu ho¹ch, c©y sÏ tù ®éng chÕt ®i";
		end
	else
		if nTreeGrow == 1 then
			if nPlantTimePassed	< TREE_PARAM[nTreeGrow][3] then
				Talk(1, "", "CÇn ph¶i ®îi thªm <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][3] - nPlantTimePassed ..
						 "<color> gi©y míi cã thÓ t­íi n­íc, cã ®iÒu ®õng cã ch¹y ®i qu¸ xa, nÕu nh­ <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][2] - nPlantTimePassed .. 
						 "<color> gi©y sau kh«ng t­íi n­íc, c©y thiÕu n­íc sÏ chÕt ®i."
				);	
				return 0;
			end
		end
		if nTreeGrow < 6 and nTreeGrow ~= 1 then
			if nPlantTimePassed > TREE_PARAM[nTreeGrow - 1][3] and nPlantTimePassed	<= TREE_PARAM[nTreeGrow][3] then
				Talk(1, "", "CÇn ph¶i ®îi thªm <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][3] - nPlantTimePassed ..
						 "<color> gi©y míi cã thÓ t­íi n­íc, cã ®iÒu ®õng cã ch¹y ®i qu¸ xa, nÕu nh­ <color=yellow>"
						 .. TREE_PARAM[nTreeGrow][2] - nPlantTimePassed .. 
						 "<color> gi©y sau kh«ng t­íi n­íc, c©y thiÕu n­íc sÏ chÕt ®i."
				);	
				return 0;
			end
		end
		if nTreeGrow == 6 then
			if nPlantTimePassed < TREE_PARAM[nTreeGrow][3] then
				Talk(1, "", TREE_TYPE[GetTask(TASK_PLANT_TREE_TYPE)][2] .. "VÉn ch­a tr­ëng thµnh, nªn kh«ng thÓ thu ho¹ch b©y giê ®­îc<color=yellow>" ..TREE_PARAM[nTreeGrow][3] - nPlantTimePassed .. " gi©y<color> h·y tiÕp tôc thu ho¹ch");
				return 0;
			end
			tinsert(selTab, "B©y giê thu ho¹ch /getTree");
			tinsert(selTab, "§îi mét lóc h·y thu ho¹ch tiÕp/nothing");
			sSaySth = "C©y ®· tr­ëng thµnh, muèn thu ho¹ch b©y giê? NÕu nh­<color=yellow>" .. getDateTimeString(TREE_PARAM[nTreeGrow][2] - nPlantTimePassed) .. "<color> gi©y sau kh«ng thu ho¹ch, c©y sÏ tù ®éng chÕt ®i";
		else
				tinsert(selTab, "T­íi n­íc (cÇn " .. TREE_PARAM[nTreeGrow + 1][4] .. " phÇn Lé Thñy)/giveWater");
				tinsert(selTab, "Sau nµy h·y t­íi./doNothing");
				sSaySth = TREE_TYPE[GetTask(TASK_PLANT_TREE_TYPE)][2] .. " ®ang cÇn t­íi Lé Thñy, cã muèn t­íi kh«ng? NÕu sau <color=yellow>" .. getDateTimeString(TREE_PARAM[nTreeGrow][2] - nPlantTimePassed) .. "<color> gi©y sau kh«ng t­íi n­íc, c©y thiÕu n­íc sÏ chÕt ®i.";
		end
	end
	
	Say(sSaySth, getn(selTab), selTab);
end

function nothing()
end

--------------------------------------
--giveWater()
--¸øÊ÷½½Ë®
--------------------------------------
function giveWater()
	local nTreeGrow = GetTask(TASK_TREE_GROW);
	local npcTreeIndex = GetTargetNpc(); --»ñÈ¡Íæ¼ÒµÄ¶¯×÷¶ÔÏóNpc
	if npcTreeIndex == 0 then
		WriteLog("[Hoat dong trong cay loi]:" .. GetName() .. "Lóc t­íi n­íc, nhiÖm vô biÕn l­îng TASK_TREE_INDEX lµ 0");
		return 0;
	end
	local npcIdx, npcModel, npcName = GetTriggeringUnit()
	local nNameLen = strlen(GetName());
	if GetName() ~= strsub(npcName, 1, nNameLen) then --ÓÃÃû×ÖÀ´ÅÐ¶ÏÊÇ²»ÊÇÍæ¼ÒµÄÊ÷
		Msg2Player("§©y kh«ng ph¶i lµ c©y b¹n trång");
		return 0;
	end
	if npcTreeIndex ~= GetTask(TASK_TREE_INDEX) then
			Msg2Player("§©y kh«ng ph¶i lµ c©y b¹n trång");
			return 0;
	end
	
	if DelItem(2, 0, 351, TREE_PARAM[nTreeGrow][4]) ~= 1 then
		Talk(1, "", "Kh«ng ®ñ Lé Thñy!");
		return 0;
	end

	SetNpcLifeTime(npcTreeIndex, TREE_PARAM[nTreeGrow + 1][2] - (GetTime() - GetTask(TASK_PLANT_TREE_TIME)));
	SetTask(TASK_TREE_GROW, nTreeGrow + 1);
	SetTask(TASK_WATER_TREE_TIME, GetTime());
	
	local nTreeGrow = GetTask(TASK_TREE_GROW);
	nPlantTimePassed = GetTime() - GetTask(TASK_PLANT_TREE_TIME);
	nWaterTimePassed = GetTime() - GetTask(TASK_WATER_TREE_TIME);
	if nTreeGrow < 6 and nTreeGrow ~= 1 then
		StartTimeGuage("T­íi c©y",TREE_PARAM[nTreeGrow][3] - nPlantTimePassed,0,1)
	end
	if nTreeGrow == 6 then
		StartTimeGuage("Thu ho¹ch",TREE_PARAM[nTreeGrow][3] - nPlantTimePassed,0,1)
	end
	Talk(1, "", "T­íi n­íc thµnh c«ng!");
end

--------------------------------------
--getTree()
--°ÎÊ÷
--------------------------------------
function getTree()

-----ÅÐ¶Ï±³°üºÍ¸ºÖØ------------------------
	if gf_Judge_Room_Weight(4, 20, " ") == 0 then
		return 0
	end
	local npcTreeIndex = GetTargetNpc(); --»ñÈ¡Íæ¼ÒµÄ¶¯×÷¶ÔÏóNpc
	
	local npcIdx, npcModel, npcName = GetTriggeringUnit()
	local nNameLen = strlen(GetName());
	if GetName() ~= strsub(npcName, 1, nNameLen) then --ÓÃÃû×ÖÀ´ÅÐ¶ÏÊÇ²»ÊÇÍæ¼ÒµÄÊ÷		
		Msg2Player("§©y kh«ng ph¶i lµ c©y b¹n trång");
		return 0;
	end
	if npcTreeIndex ~= GetTask(TASK_TREE_INDEX) then
			Msg2Player("§©y kh«ng ph¶i lµ c©y b¹n trång");
			return 0;
	end	
	
	local npcTreeIndex = GetTargetNpc();
	if npcTreeIndex == 0 then
		WriteLog("[Hoat dong trong cay thang 8 loi]:" .. GetName() .. "Lóc nhæ c©y, GetTargetNpc trÞ quay l¹i lµ 0");
		return 0;
	end
	local nTreeType = GetTask(TASK_PLANT_TREE_TYPE);
	if nTreeType ~= 1 and nTreeType ~= 2 and nTreeType ~= 3 and nTreeType ~= 4 and nTreeType ~= 5 then
		WriteLog("[Hoat dong trong cay thang 8 loi]:" .. GetName() .. "Trong lóc thu ho¹ch thu ®­îc lo¹i c©y kh«ng ®óng");
		return 0;
	end

	SetNpcScript(npcTreeIndex, "");
	SetNpcLifeTime(npcTreeIndex, 0);
	SetTask(TASK_TREE_INDEX, 0);
	SetTask(TASK_TREE_GROW, 0);
	SetTask(TASK_WATER_TREE_TIME, 0);
	
-----¸ø¾­Ñé½±Àø----------------------
--     Give_Zhongzi_Award();
	 FireEvent("event_mission_task_award", "planttree", "plantseedtree", 0)
	 --SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(3)");	
	 SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(1303)");	
	 
	 SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(2211)");	
        
	local nRand = 0;
	local nExp = 0;
	local nRep = 0;
	local nSuMon = 0;
	if nTreeType == 1 then			--¿Ý¸ÉÊ÷
		nExp = 400000;
		nRep = 3;
		nSuMon = 3
	elseif nTreeType == 2 then	--²»ËÀÊ÷
		nExp = 600000;	
		nRep = 3;
		nSuMon = 3
	elseif nTreeType == 3 then	--°×ÒøÊ÷
		nRand = PlantTree_GetRandItem(WHITE_SILVER_TREE_EXP_REWARD_PARAM);
		nExp = WHITE_SILVER_TREE_EXP_REWARD_PARAM[nRand][1];
		nRep = 3;
		nSuMon = 3
	elseif nTreeType == 4 then	--»Æ½ðÊ÷
		nRand = PlantTree_GetRandItem(YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM);
		nExp = YELLOW_GOLDEN_TREE_EXP_REWARD_PARAM[nRand][1];
		nRep = 18;
		nSuMon = 9
	else 												--°×½ðÊ÷
		nRand = PlantTree_GetRandItem(WHITE_GOLDEN_TREE_EXP_REWARD_PARAM);
		nExp = WHITE_GOLDEN_TREE_EXP_REWARD_PARAM[nRand][1];
		nRep = 36;
		nSuMon = 18
	end
	
--	ModifyExp(nExp);
--	Msg2Player("B¹n nhËn ®­îc " .. nExp .. " Kinh nghiÖm");
	WriteLog("[Hoat dong trong cay]:" .. GetName() .. "NhËn ®­îc " .. nExp .. " Kinh nghiÖm");
	--function thªm phÇn th­ëng
	ThuHoachHatGiong()
   --nhiÖm vô lµm giµu
   	if CFG_NhiemVuLamGiau == 1 then
	     if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 6) == 0 then
	     		gf_SetTaskBit(TSK_LAMGIAU, 6, 1, 0)
	     		TaskTip("Hoµn thµnh nhiÖm vô lµm giµu: Trång thµnh c«ng 01 H¹t Gièng.")
	     end
	end
	-----------------------Chuçi nhiÖm vô §ång Hµnh
	if CFG_NhiemVuDongHanh == 1 then
		if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 17 then
			if DongHanh_GetMissionPart() > 0 then
				DongHanh_SetMissionPart()
				if DongHanh_GetMissionPart() == 0 then
					DongHanh_SetStatus()
				end
			end
		end
	end
	--VET_IpBonusSeedAward()
	--VietGetTreeAward()
	
	-- NhiÖm vô ChuyÓn Sinh 3
	if GetTask(TRANSLIFE_MISSION_ID) == 19 and gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2) < 192 then
		gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK2, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2) == 192 then
			TaskTip("Hoµn thµnh yªu cÇu cña §¶o Chñ §µo Hoa §¶o 192 lÇn trång thµnh c«ng H¹t Gièng")
		end
	end
	
	-- NhiÖm vô ChuyÓn Sinh 4
	if GetTask(TRANSLIFE_MISSION_ID) == 26 and gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) < 48 then
		gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK2, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK2) == 10 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK2, 0)
			gf_SetTaskByte(TRANSLIFE_TASK_34_FLAG, TRANSLIFE_BYTE_TASK2, gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) +1)
		end
		if gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) == 48 then
			TaskTip("Hoµn thµnh yªu cÇu cña B¹ch Tiªn Sinh 480 lÇn trång thµnh c«ng H¹t Gièng")
		end
	end
	
	-- NhiÖm vô chuyÓn sinh 5
	if GetTask(TRANSLIFE_MISSION_ID) == 34 and gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) < 50 then
		gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK2, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK2) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK2) == 10 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK2, 0)
			gf_SetTaskByte(TRANSLIFE_TASK_34_FLAG, TRANSLIFE_BYTE_TASK2, gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) +1)
		end
		if gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK2) == 50 then
			TaskTip("Hoµn thµnh yªu cÇu cña B¹ch Tiªn Sinh 480 lÇn trång thµnh c«ng H¹t Gièng")
		end
	end
	
	
	----- NhËn th­ëng theo sè lÇn	

--	if mod(GetTask(TASK_VNG_PET), 100) > 0 then
--		if nTreeType == 4 then
--			SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (100))
--			Msg2Player("B¹n nhËn ®­îc 1 ®iÓm n©ng cÊp B¹n §ång Hµnh!")
--		elseif nTreeType == 5 then
--			SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (200))
--			Msg2Player("B¹n nhËn ®­îc 2 ®iÓm n©ng cÊp B¹n §ång Hµnh!")
--		end
--	end
	--VietSeedBagAwardsEvent12()
	--VietSeedBagAwardsEvent012012()
	--Give_Iponus_HatGiong()
	-- So lan trong cay trong ngay  
	local nTime = GetTask(TASK_PLANT_TREE_COUNT)
		
--	if nTime >= 5 then
--		ModifyReputation(nRep,1)
--		Msg2Player("B¹n nhËn ®­îc "..nRep.." ®iÓm danh väng");
--		WriteLog("[Hoat dong trong cay]:" .. GetName() .. "NhËn ®­îc " .. nRep .. " ®iÓm danh väng");
--		SetTask(336, GetTask(336) + nSuMon)
--		Msg2Player("B¹n nhËn ®­îc "..nSuMon.." ®iÓm s­ m«n");
--		WriteLog("[Hoat dong trong cay]:" .. GetName() .. "NhËn ®­îc " .. nSuMon .. " ®iÓm s­ m«n");
--	end
--	if nTime == 4 or nTime == 8 then
--		local nReturn, nIndex = AddItem(SEED_AWARD_COUNT[1][2],SEED_AWARD_COUNT[1][3],SEED_AWARD_COUNT[1][4],1);
--		if nReturn == 1 then			
--			SetItemExpireTime(nIndex, SEED_AWARD_COUNT[1][5]);
--			Msg2Player("B¹n nhËn ®­îc "..SEED_AWARD_COUNT[1][1]);				
--			WriteLogEx("Hoat dong trong cay", "H¹t Gièng", 1, SEED_AWARD_COUNT[1][1]);				
--		end	
--	elseif nTime == 6 then
--		local nReturn, nIndex = AddItem(SEED_AWARD_COUNT[2][2],SEED_AWARD_COUNT[2][3],SEED_AWARD_COUNT[2][4],1);
--		if nReturn == 1 then			
--			SetItemExpireTime(nIndex, SEED_AWARD_COUNT[2][5]);
--			Msg2Player("B¹n nhËn ®­îc "..SEED_AWARD_COUNT[2][1]);				
--			WriteLogEx("Hoat dong trong cay", "H¹t Gièng", 1, SEED_AWARD_COUNT[2][1]);				
--		end

--	if nTime == 12 then
--		--local nReturn, nIndex = AddItem(SEED_AWARD_COUNT[1][2],SEED_AWARD_COUNT[1][3],SEED_AWARD_COUNT[1][4],1);
--		--if nReturn == 1 then			
--		--	SetItemExpireTime(nIndex, SEED_AWARD_COUNT[1][5]);
--		--	Msg2Player("B¹n nhËn ®­îc "..SEED_AWARD_COUNT[1][1]);				
--		--	WriteLogEx("Hoat dong trong cay", "H¹t Gièng", 1, SEED_AWARD_COUNT[1][1]);				
--		--end			
--		--local nRand = random(1,1000)		
--		--if nRand > 999 then
--		--		nReturn, nIndex = AddItem(SEED_AWARD_COUNT[4][2],SEED_AWARD_COUNT[4][3],SEED_AWARD_COUNT[4][4],1);
--		--		if nReturn == 1 then			
--		--			SetItemExpireTime(nIndex, SEED_AWARD_COUNT[4][5]);
--		--			Msg2Player("B¹n nhËn ®­îc "..SEED_AWARD_COUNT[4][1]);				
--		--			WriteLogEx("Hoat dong trong cay", "H¹t Gièng", 1, SEED_AWARD_COUNT[4][1]);				
--		--		end
--		--elseif nRand > 980 then
--		--	nReturn, nIndex = AddItem(SEED_AWARD_COUNT[3][2],SEED_AWARD_COUNT[3][3],SEED_AWARD_COUNT[3][4],1);
--		--	if nReturn == 1 then			
--		--		SetItemExpireTime(nIndex, SEED_AWARD_COUNT[3][5]);
--		--		Msg2Player("B¹n nhËn ®­îc "..SEED_AWARD_COUNT[3][1]);				
--		--		WriteLogEx("Hoat dong trong cay", "H¹t Gièng", 1, SEED_AWARD_COUNT[3][1]);				
--		--	end
--		--elseif nRand > 480 then
--		--	nReturn, nIndex = AddItem(SEED_AWARD_COUNT[5][2],SEED_AWARD_COUNT[5][3],SEED_AWARD_COUNT[5][4],1);
--		--	if nReturn == 1 then			
--		--		SetItemExpireTime(nIndex, SEED_AWARD_COUNT[5][5]);
--		--		Msg2Player("B¹n nhËn ®­îc "..SEED_AWARD_COUNT[5][1]);				
--		--		WriteLogEx("Hoat dong trong cay", "H¹t Gièng", 1, SEED_AWARD_COUNT[5][1]);				
--		--	end	
--		--else
--		--	nReturn, nIndex = AddItem(SEED_AWARD_COUNT[2][2],SEED_AWARD_COUNT[2][3],SEED_AWARD_COUNT[2][4],1);
--		--	if nReturn == 1 then			
--		--		SetItemExpireTime(nIndex, SEED_AWARD_COUNT[2][5]);
--		--		Msg2Player("B¹n nhËn ®­îc "..SEED_AWARD_COUNT[2][1]);				
--		--		WriteLogEx("Hoat dong trong cay", "H¹t Gièng", 1, SEED_AWARD_COUNT[2][1]);				
--		--	end
--		--end
--		
--		-- Get id cua server hien hanh 
--		-- local nServerID = GetGlbValue(1023) -- get id cua server hien hanh
--		
--		if mod(GetTask(TASK_VNG_PET), 100) > 0 then
--			SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (100))
--			Msg2Player("B¹n nhËn ®­îc 1 ®iÓm n©ng cÊp B¹n §ång Hµnh!")
--		end
--		
--		local nGroup = fruitcheckserver()
--		gf_AddItemEx2({tFruitAwardJune2010[nGroup][6][1], tFruitAwardJune2010[nGroup][6][2], tFruitAwardJune2010[nGroup][6][3], 12}, tFruitAwardJune2010[nGroup][7], "Hoat Dong Trai Cay", "Trång 12 h¹t gièng")
--		
--		local nDate = tonumber(date("%y%m%d"));
--		if nDate >= 100816 and nDate <= 100829 then
--			gf_AddItemEx2({2, 0, 1162, 3}, "Hoa Hång ®á", "JX2 Idol", "trång 12 h¹t gièng")
--		end
--	end -- end nTime=12
	
	-- **************************************************************************************************************************************
	-- 20101123
	if ( nTime >= 13 and nTime <= 24 ) then
		local nGroup = fruitcheckserverNov()
		if nGroup == 0 then
			nGroup = mod(random(0,1000),20) + 1
		end
		gf_AddItemEx2 ( tFruitAwardNov2010[nGroup][6],  tFruitAwardNov2010[nGroup][7],  "Hoat Dong Trai Cay", "Trång 24 h¹t gièng" )
	end	
	-- **************************************************************************************************************************************
	
	local nDate = tonumber(date("%y%m%d"));
	
	if nDate >= 100416 and nDate <= 100516 then	
		local tCakeCount = {40,40,40,40,40}
		AddItem(2,1,30184,tCakeCount[nTreeType])
		WriteLogEx("Hoat dong thang 4 nam 2010","trång c©y",tCakeCount[nTreeType],"Tói Nguyªn LiÖu")
	end
	
	if nDate >= 100528 and nDate <= 100704 then
		gf_AddItemEx2({2,1,30192,40}, "M©m tr¸i c©y", "Hoat dong thang 6 nam 2010", "nhËn")	
	elseif nDate >= 100709 and nDate <= 100808 then
		gf_AddItemEx2({2,1,30205,40}, "Tói kho¸ng th¹ch", "Hoat dong thang 7 nam 2010", "nhËn")	
	elseif nDate >= 100813 and nDate <= 100912 then
		gf_AddItemEx2({ 2, 1, 30225, 80}, "Nguyªn LiÖu Lµm B¸nh", "Hoat dong thang 8 nam 2010", "nhËn")
	elseif nDate >= 100929 and nDate <= 101024 then
		gf_AddItemEx2({ 2, 1, 30233, 75}, "Bét M×", "Hoat dong thang 9 nam 2010", "Trång H¹t Gièng")
	end
	nTreeType = 0
-----¸øÎïÆ·½±Àø£¬Ö»ÓÐ°×ÒøÊ÷¡¢»Æ½ðÊ÷ºÍ°×½ðÊ÷²Å¸ø
	if nTreeType ~= 0  then
		local nMainType = 0;
		local nSecondryType = 0;
		local nDetailType = 0;
		local nCount = 1;
		local sItemName = "";
		local nLimitFlag = 0;
		local nLimitTime = 0;
		local nItem = 0;
		local nproperty = 0;
		local nReturn = 0;
		local nIndex = 0;
		
			
		if nTreeType == 1 then
			nItem = PlantTree_GetRandItem_new(SMALLEST_TREE_REWARD_ITEM_PARAM, 10000);
			nMainType = SMALLEST_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = SMALLEST_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = SMALLEST_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = SMALLEST_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = SMALLEST_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = SMALLEST_TREE_REWARD_ITEM_PARAM[nItem][6];
			nproperty = SMALLEST_TREE_REWARD_ITEM_PARAM[nItem][8];
		elseif nTreeType == 2 then										-- »Æ½ðÊ÷
			nItem = PlantTree_GetRandItem_new(ETERNAL_TREE_REWARD_ITEM_PARAM, 10000);
			nMainType = ETERNAL_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = ETERNAL_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = ETERNAL_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = ETERNAL_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = ETERNAL_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = ETERNAL_TREE_REWARD_ITEM_PARAM[nItem][6];
			nproperty = ETERNAL_TREE_REWARD_ITEM_PARAM[nItem][8];
		elseif nTreeType == 3 then										-- »Æ½ðÊ÷
			nItem = PlantTree_GetRandItem_new(SILVER_TREE_REWARD_ITEM_PARAM, 10000);
			nMainType = SILVER_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = SILVER_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = SILVER_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = SILVER_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = SILVER_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = SILVER_TREE_REWARD_ITEM_PARAM[nItem][6];
			nproperty = SILVER_TREE_REWARD_ITEM_PARAM[nItem][8];
		elseif nTreeType == 4 then										-- »Æ½ðÊ÷
			nItem = PlantTree_GetRandItem_new(GOLDEN_TREE_REWARD_ITEM_PARAM, 10000);
			nMainType = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][6];
			nproperty = GOLDEN_TREE_REWARD_ITEM_PARAM[nItem][8];
		elseif nTreeType == 5 then								--°×½ðÊ÷
			nItem = PlantTree_GetRandItem_new(WHITE_TREE_REWARD_ITEM_PARAM,10000);
			nMainType = WHITE_TREE_REWARD_ITEM_PARAM[nItem][3];
			nSecondryType = WHITE_TREE_REWARD_ITEM_PARAM[nItem][4];
			nDetailType = WHITE_TREE_REWARD_ITEM_PARAM[nItem][5];
			nCount = WHITE_TREE_REWARD_ITEM_PARAM[nItem][7];			
			sItemName = WHITE_TREE_REWARD_ITEM_PARAM[nItem][1];
			nLimitTime = WHITE_TREE_REWARD_ITEM_PARAM[nItem][6];
			nproperty = WHITE_TREE_REWARD_ITEM_PARAM[nItem][8];
		end
		
--		if nMainType == 0 and nSecondryType == 0 and nDetailType == 0 then		
--			 WriteLogEx("Hoat dong trong cay", "C©y B¹ch Ng©n", nCount, sItemName);
--			 return
--		else
--			if nproperty == 1 then
--				nReturn, nIndex = AddItem(nMainType, nSecondryType, nDetailType, nCount, 1, -1, -1, -1, -1, -1, -1);
--			else
--				nReturn, nIndex = AddItem(nMainType, nSecondryType, nDetailType, nCount);
--			end
--		end		
		
--		if nReturn == 1 then
--			if nLimitTime ~= 0 then
--				SetItemExpireTime(nIndex, nLimitTime);
--			end
--			Msg2Player("B¹n nhËn ®­îc " .. nCount .. " " .. sItemName);	
--			if nTreeType ==1  then	
--				WriteLogEx("Hoat dong trong cay", "C©y HÐo óa", nCount, sItemName);
--			elseif nTreeType == 2 then	
--				WriteLogEx("Hoat dong trong cay", "C©y BÊt Tö", nCount, sItemName);
--			elseif nTreeType == 3 then	
--				WriteLogEx("Hoat dong trong cay", "C©y B¹ch Ng©n", nCount, sItemName);
--			elseif nTreeType == 4 then	
--				WriteLogEx("Hoat dong trong cay", "C©y Hoµng Kim", nCount, sItemName);
--				gf_AddItemEx2({2, 0, 1082, 5},"Th¸i DÞch Hçn Nguyªn C«ng §å","Hoat dong trong cay","C©y B¹ch Kim")
--			elseif nTreeType == 5 then	
--				WriteLogEx("Hoat dong trong cay", "C©y B¹ch Kim", nCount, sItemName);
--				gf_AddItemEx2({2, 0, 1082, 10},"Th¸i DÞch Hçn Nguyªn C«ng §å","Hoat dong trong cay","C©y B¹ch Kim")
--			end		
--		end
	end
end

function Give_Iponus_HatGiong()
	if GetExtPoint(4) == 1 then
		local nTimes = GetTask(2059)
		if  nTimes >= 1 and nTimes <= 6 then
			ModifyExp(100000)
			Msg2Player("B¹n nhËn ®­îc 100000 ®iÓm kinh nghiÖm ") 
			gf_WriteLogEx("IpBonus Hat giong" ,"nhËn 100000 ®iÓm kinh nghiÖm")
		elseif  nTimes >= 7 and nTimes <= 12 then
			ModifyExp(150000)
			Msg2Player("B¹n nhËn ®­îc 150000 ®iÓm kinh nghiÖm ") 
			gf_WriteLogEx("IpBonus Hat giong" ,"nhËn 150000 ®iÓm kinh nghiÖm")
		elseif  nTimes >= 13 and nTimes <= 24 then
			ModifyExp(250000)
			Msg2Player("B¹n nhËn ®­îc 250000 ®iÓm kinh nghiÖm ") 
			gf_WriteLogEx("IpBonus Hat giong" ,"nhËn 250000 ®iÓm kinh nghiÖm")
		else
			return
		end
	end
end
