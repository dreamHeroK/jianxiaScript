Include("\\script\\online\\snowbattle\\head.lua");
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\ksgvn\\lib.lua");

CR_Head = format("<color=green>%s:<color> Hoπt ÆÈng tuy’t c«u mÁi ngµy sœ mÎ 3 l«n, thÍi gian mÎ lµ 11:30, 17:30 vµ 21:30, hoπt Æ‰ng duy tr◊ 1 ti’ng; Hi÷p s‹ tr™n 80 c p vµ Æ∑ ra nhÀp m´n ph∏i, k›ch hoπt kinh mπch mÌi c„ th” tham gia.", CR_NAME);

function main()
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Bπn Æ∑ bﬁ tr‰ng th≠¨ng rÂi, h∑y v“ thµnh d≠Ïng s¯c Æi.")
		return 0
	end	
	local CR_Menu1 = {
		format("Vµo tr≠Íng tuy’t c«u (Ti™u hao %d vµng Æ≠Óc %d Ti”u tuy’t c«u)",floor(SB_COST/10000), 10) .. "/CR_DoEnter",
		format("%s/getNewYearAward", "NhÀn ph«n th≠Îng hoπt ÆÈng"),
		"Mua Æπn tuy’t c«u/CR_DoShowSaleList",
		"Gi∂i th›ch hoπt ÆÈng/CR_Information",
		"RÍi kh·i/gf_DoNothing"
	}
	local CR_Menu2 = {
		"RÍi kh·i Æ u tr≠Íng tuy’t/CR_DoExit",
		"Mua Æπn tuy’t c«u/CR_DoShowSaleList",
		"Gi∂i th›ch hoπt ÆÈng/CR_Information",
		"RÍi kh·i/gf_DoNothing"
	}
	if 0 == SB_IsInSnowMap() then
		Say(CR_Head, getn(CR_Menu1), CR_Menu1);
	else
		Say(CR_Head, getn(CR_Menu2), CR_Menu2);
	end
end

function getNewYearAward()
	local day1225 = SB_START_TIME[1]*10000+1225
	local day0101 = (SB_START_TIME[1]+1)*10000+0101
	local today = tonumber(date("%Y%m%d"))
	local task = GetTask(SB_TASK_GET_NEWYEAR_AWARD)
	local szAward = "10 c∏i Æπi tuy’t c«u"
	if today == day1225 or today == day0101 then
		if task ~= today then
			SetTask(SB_TASK_GET_NEWYEAR_AWARD, today)
			local nExpireTime = 5 * 24 * 3600
			gf_AddItemEx2({2, 3, 221, 10, 4}, "ßπi tuy’t c«u", "SnowBattle", "NewYearGift", nExpireTime);--10¥Û—©«Ú
			Talk(1, "nothing", format("<color=green>%s<color>: %s", CR_NAME, format("ChÛc mıng bπn Æ∑ thµnh c´ng nhÀn Æ≠Óc %s.", szAward)))
		else
			Talk(1, "nothing", format("<color=green>%s<color>: %s", CR_NAME, "Bπn Æ∑ nhÀn th≠Îng rÂi."))
		end
	else
		local szMsg = format("MÍi c∏c hπ Æ’n vµo ngµy <color=yellow>%s - %s<color>, c„ th” nhÀn mi‘n ph› %s.", KsgDate:ToString(day1225), KsgDate:ToString(day0101), szAward)
		Talk(1, "nothing", format("<color=green>%s<color>: %s", CR_NAME, szMsg))
	end
end

function CR_DoEnter()
	local mapID = GetWorldPos();
 	mapID = SB_MapMap[mapID];
	if 1 ~= SB_CheckState(mapID) then
		Talk(1, "", "MÁi ngµy sœ mÎ 3 l«n, thÍi gian mÎ lµ 11:30-12:30, 17:30-18:30 vµ 21:30-22:30");
		return
	end
	if 1 ~= SB_CheckPlayerCount(mapID) then
		Talk(1, "", "R t ti’c, Æ u tr≠Íng Æ∑ Æ«y, vui lﬂng trÎ lπi l«n sau");
		return
	end
	if gf_CheckBaseCondition(SB_MIN_LEVEL) ~= 1 then
		return 
	end
--	if MeridianGetLevel() < 1 then
--		Talk(1,"","R t ti’c, c∏c hπ ch≠a khai th´ng c∂nh giÌi kinh mπch");
--		return
--	end
--	if 1 ~= SB_CheckEquipment() then
--		Talk(1, "", "∂‘≤ª∆£¨«Î–∂œ¬Œ‰∆˜∫Õ¡Ó≈∆");
--		return
--	end
	if GetTeamSize() > 0 then
		Talk(1,"","ßπi hi÷p h∑y rÍi kh·i tÊ ÆÈi rÂi quay lπi!");
		return
	end
	if GetCash() < SB_COST then
		Talk(1,"","R t ti’c, ng©n l≠Óng c∏c hπ mang theo kh´ng ÆÒ!");
		return
	end	

	mf_JoinMission(SB_MISSION_ID, SB_CAMP_ID, mapID);
end

function CR_DoExit()
	DelMSPlayer(SB_MISSION_ID, SB_CAMP_ID);
end

function CR_DoShowSaleList()
	if gf_CheckDuration(SB_START_TIME, SB_END_TIME) ~= 1 then
		Talk(1,"","Xin lÁi bπn, hoπt ÆÈng Æ∑ h’t thÍi gian.!");
		return
	end
	
	local CR_Menu3_1 = {
		format("%d ßπi tuy’t c«u (%d vµng)",10, 60) .. "/#CR_DoBuy(1)",
		format("%d Trung tuy’t c«u (%d vµng)",10, 40) .. "/#CR_DoBuy(2)",
		format("%d Ti”u tuy’t c«u (%d vµng)",10, 20) .. "/#CR_DoBuy(3)",
		"Ta chÿ gh– ch¨i/gf_DoNothing",
	}
	Say(CR_Head, getn(CR_Menu3_1), CR_Menu3_1);
end

function CR_DoBuy(index)
	local CR_SaleList = {
		{{2, 3, 221}, "ßπi tuy’t c«u", 10, 600000},
		{{2, 3, 220}, "Trung tuy’t c«u", 10, 400000},
		{{2, 3, 219}, "Ti”u tuy’t c«u", 10, 200000},
	}
	local itemID = CR_SaleList[index][1];
	local itemName = CR_SaleList[index][2];
	local itemCount = CR_SaleList[index][3];
	local cost = CR_SaleList[index][4];
	if GetCash() < cost then
		Talk(1,"","Hµnh trang kh´ng ÆÒ ti“n!");
		return
	end
	if 1 == gf_Judge_Room_Weight(1, itemCount, "") then
		if 1 == Pay(cost) then
			local tmpItemID = {itemID[1], itemID[2], itemID[3], itemCount,4};
			gf_AddItemEx2(tmpItemID, itemName, "ß∏nh trÀn tuy’t", "Mua Æπn tuy’t c«u");
		end
	end
	CR_DoShowSaleList();	
end

function CR_Information()
	Talk(1,"","Sau khi Æπi hi÷p vµo khu n–m tuy’t, ÆËi thoπi vÌi Thi™n S¨n Tuy’t Y™u Î ch›nh gi˜a, c„ th” tri÷u hÂi Tuy’t Qu∏i. Sau khi Æ∏nh bπi t t c∂ Tuy’t Qu∏i sœ xu t hi÷n l≠Ót ti’p theo, tÊng cÈng c„ 10 l≠Ót. Sau khi Æ∏nh xong 10 l≠Ót th◊ ÆËi thoπi vÌi Thi™n S¨n Tuy’t Y™u, Æ∏nh bπi BOSS sœ nhÀn Æ≠Óc ph«n th≠Îng phong phÛ. Trong khu n–m tuy’t, chÿ c„ th” dÔng k¸ n®ng tuy’t c«u, trang bﬁ tr™n ng≠Íi sœ tπm thÍi m t hi”u quµ.")
end
