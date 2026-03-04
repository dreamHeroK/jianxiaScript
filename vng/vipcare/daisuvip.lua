Include("\\script\\vng\\lib\\vnglib_award.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\config\\vng_feature.lua");

szNPCname = "<color=green>§¹i sø Vip: <color>"
szLogTitle = "VIPCARE"
szLogAction = "nhËn"

tbVipTitle = {
	[1] = {"Vip sao ®ång", "red"},
	[2] = {"Vip sao b¹c", "white"},
	[3] = {"Vip sao vµng", "yellow"},
}

LIB_Award.szLogTitle = szLogTitle
LIB_Award.LogAction = szLogAction

function main()
	do return 0 end
	
	local tbSay = {}
--	local nTuan = ThuongTuan_Get()
--	local nThang = ThuongThang_Get()
--	local nQui = ThuongQui_Get()
	local tbAwardSay = {
				[1] = {"Gi¶i th­ëng 1 triÖu ®iÓm kinh nghiÖm"},
				[2] = {"Gi¶i th­ëng 5 triÖu ®iÓm kinh nghiÖm"},
				[3] = {"Gi¶i th­ëng 10 triÖu ®iÓm kinh nghiÖm"},
				[4] = {"Gi¶i th­ëng 5 Cöu ChuyÓn"},
				[5] = {"Gi¶i th­ëng 1 Tµng R­¬ng"},
				[6] = {"Gi¶i th­ëng 1 Bµn Long BÝch (7 ngµy)"},
				[7] = {"Gi¶i th­ëng 1 Thiªn Kiªu LÖnh (khãa)"},
				[8] = {"Gi¶i th­ëng 1 DÞch C©n §an (30 ngµy)"},
				[9] = {"Gi¶i th­ëng 1 VIP phong hiÖu Ph¸ Qu©n (30 ngµy)"},
				[10] = {"Gi¶i th­ëng 1 Phôc Sinh §¬n (tu luyÖn 100/100)"},
				[11] = {"Gi¶i th­ëng 1 R­¬ng ThÊt §iÒn Sa §µm Hoµn"},
				[12] = {"Gi¶i th­ëng 1 R­¬ng Cöu Hoa Ngäc Lé Hoµn"},
			}
	for i = 1, 12 do
		tinsert(tbSay, tbAwardSay[i][1].."/#getVIP_Award("..i..")")
	end
	--if nTuan > 0 then
	--tinsert(tbSay, "NhËn th­ëng TuÇn ".. (tbVipTitle[nTuan][1] or "") .."/ThuongTuan_Award")
	--end
	--if nThang > 0 then
	--	tinsert(tbSay, "NhËn th­ëng Th¸ng ".. (tbVipTitle[nThang][1] or "") .."/ThuongThang_Award")
	--end
	--if nQui > 0 then
	--	tinsert(tbSay, "NhËn th­ëng QuÝ ".. (tbVipTitle[nQui][1] or "") .."/ThuongQui_Award")
	--end
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say(szNPCname.."Ta chÞu tr¸ch nhiÖm trao quµ th­ëng cho c¸c nh©n sÜ Vip. NÕu c¸c h¹ n»m trong danh s¸ch Vip h·y ®Õn gÆp ta.", getn(tbSay), tbSay)
end

--================ Tuan
--function ThuongTuan_Get()
--	local nResult = mod(GetExtPoint(EXT_VIPCARE),10)
--	if nResult == 3 then
--		return nResult
--	else
--		return 0
--	end
--end

--function ThuongTuan_Set(nValue)
--	local nResult = VNG_PayExtPoint(EXT_VIPCARE, ThuongTuan_Get())
--	return nResult
--end

--function ThuongTuan_Award()
--	local tbAward3 = {nBachCau3 = 36*60, nLucThan3 = 36*60, nTamThanh3 = 36*60, 	nTuLinh3 = 36*60, nGold = 360*10000}
--	local tbAwardSet = {
	--	[3] = {tbAward3, 0, 0},
--	}
--	local nBonus = ThuongTuan_Get()
--	if tbAwardSet[nBonus] == nil then
--		return 0
--	end
--	if gf_JudgeRoomWeight(tbAwardSet[nBonus][2],tbAwardSet[nBonus][3]) == 0 then
--		Talk(1,"",szNPCname.."C¸c h¹ cÇn "..tbAwardSet[nBonus][2].." « hµnh trang, "..tbAwardSet[nBonus][3].." søc lùc ®Ó nhËn phÇn th­ëng nµy!");
--		return 0
--	end
--	if ThuongTuan_Set() == 1 then
--		LIB_Award:Award(tbAwardSet[nBonus][1])
--		Talk(1,"",szNPCname.."C¸c h¹ ®· nhËn thµnh c«ng phÇn th­ëng tuÇn <bclr=".. tbVipTitle[nBonus][2]  ..">".. tbVipTitle[nBonus][1] .."<bclr>.")
--		gf_WriteLogEx(szLogTitle, szLogAction, 1, "TuÇn "..tbVipTitle[nBonus][1])
--	end
--end

--=============== Thang
function ThuongThang_Get()
	local nResult = mod(floor(GetExtPoint(EXT_VIPCARE)/10),10)
	if nResult >= 1 and nResult <= 3 then
		return nResult
	else
		return 0
	end
end

function ThuongThang_Set()
	local nResult = VNG_PayExtPoint(EXT_VIPCARE, ThuongThang_Get()*10)
	return nResult
end

function ThuongThang_Award()
	local tbAward3 = { 
	nBachCau3 = 136*60, nLucThan3 = 136*60, nTamThanh3 = 136*60, 	nTuLinh3 = 136*60, nGold = 18000000,
	item = {
					{ gdp = {2, 1, 30529, 12}, name= "CÊp 3 LuyÖn L« ThiÕt " },
					{ gdp = {2, 1, 30523, 12}, name= "CÊp 3 TÈy T©m Th¹ch" },
					{ gdp = {2, 1, 30491, 1},   name= "VÐ TiÓu Y Vµng" },					 
				},
	 }
	local tbAward2 = { nBachCau3 = 120*60, nLucThan3 = 120*60, nTamThanh3 = 120*60, nTuLinh3 = 120*60,nGold = 13000000,
	 item = { 
	 			{gdp ={2, 1, 30492, 2}, name = "VÐ TiÓu Y B¹c" }
	 		}
	 }
	local tbAward1 = { nBachCau3 = 104*60, nLucThan3 = 104*60, nTamThanh3 = 104*60, nTuLinh3 = 104*60,  nGold = 10000000 }
	
	local tbAwardSet = {
		[1] = {tbAward1, 0, 0},
		[2] = {tbAward2, 0, 0},
		[3] = {tbAward3, 3, 10},
	}
	local nBonus = ThuongThang_Get()
	if tbAwardSet[nBonus] == nil then
		return 0
	end
	if gf_JudgeRoomWeight(tbAwardSet[nBonus][2],tbAwardSet[nBonus][3]) == 0 then
		Talk(1,"",szNPCname.."C¸c h¹ cÇn "..tbAwardSet[nBonus][2].." « hµnh trang, "..tbAwardSet[nBonus][3].." søc lùc ®Ó nhËn phÇn th­ëng nµy!");
		return 0
	end
	if ThuongThang_Set() == 1 then
		LIB_Award:Award(tbAwardSet[nBonus][1])
		Talk(1,"",szNPCname.."C¸c h¹ ®· nhËn thµnh c«ng phÇn th­ëng th¸ng <bclr=".. tbVipTitle[nBonus][2]  ..">".. tbVipTitle[nBonus][1] .."<bclr>.")
		gf_WriteLogEx(szLogTitle, szLogAction, 1, "Th¸ng "..tbVipTitle[nBonus][1])
	end
end

--=============== Qui
--function ThuongQui_Get()
--	local nResult = mod(floor(GetExtPoint(EXT_VIPCARE)/100),10)
--	if nResult >= 1 and nResult <= 3 then
--		return nResult
--	else
--		return 0
--	end
--end

--function ThuongQui_Set()
--	local nResult  = VNG_PayExtPoint(EXT_VIPCARE, ThuongQui_Get()*100)
--	return nResult
--end

--function ThuongQui_Award()
--	local tbAward1 = {nBachCau3 = 240*60, nLucThan3 = 240*60, nTamThanh3 = 240*60, 	nTuLinh3 = 240*60, nGold = 24000000}
--	local tbAward2 = {
--		item={
--			{gdp={2,1,30537,30}, name="LuyÖn L« ThiÕt Kho¸ng"},
--			{gdp={2,1,30536,30}, name="TÈy T©m Th¹ch Kho¸ng"},
--			{gdp={2,1,30071,200}, name="Nh©n S©m V¹n N¨m"},
--		},
--		nGold = 30000000,
--	}
--	local tbAward3 = {
--		item={
--			{gdp={2,1,30535,30}, name="ThiÕt Tinh cÊp 3"},
--			{gdp={2,1,30523,3}, name="CÊp 3 TÈy T©m Th¹ch"},
--			{gdp={2,1,30529,3}, name="CÊp 3 LuyÖn L« ThiÕt"},
--		},
--		nGold = 60000000,
--	}
--	local tbAwardSet = {
--		[1] = {tbAward1, 0, 0},
--		[2] = {tbAward2, 4, 100},
--		[3] = {tbAward3, 5, 100},
--	}
--	local nBonus = ThuongQui_Get()
--	Msg2Player(nBonus)
--	if tbAwardSet[nBonus] == nil then
--		Msg2Player("k0 co phan thuong phu hop0")
--		return 0
--	end
--	if gf_JudgeRoomWeight(tbAwardSet[nBonus][2],tbAwardSet[nBonus][3]) == 0 then
--		Msg2Player("Check hanh trang")
--		Talk(1,"",szNPCname.."C¸c h¹ cÇn "..tbAwardSet[nBonus][2].." « hµnh trang, "..tbAwardSet[nBonus][3].." søc lùc ®Ó nhËn phÇn th­ëng nµy!");
--		return 0
--	end
--	if ThuongQui_Set() == 1 then
--		Msg2Player("Trao thuong")
--		LIB_Award:Award(tbAwardSet[nBonus][1])
--		Talk(1,"",szNPCname.."C¸c h¹ ®· nhËn thµnh c«ng phÇn th­ëng th¸ng <bclr=".. tbVipTitle[nBonus][2]  ..">".. tbVipTitle[nBonus][1] .."<bclr>.")
--		gf_WriteLogEx(szLogTitle, szLogAction, 1, "QuÝ "..tbVipTitle[nBonus][1])
--	end
--end

function getVIP_Award(nType)
	local tbAwardVip = {
		[1] = {nExp = 1000000},
		[2] = {nExp = 5000000},
		[3] = {nExp = 10000000},
		[4] = {item ={{gdp={1,0,32,5}, name="Cöu ChuyÓn"},},},
		[5] = {item ={{gdp={2,1,30341,1}, name="Tµng R­¬ng"},},},
		[6] = {item ={{gdp={2,1,1000,1}, nExpired = 7*24*60*60, name="Bµn Long BÝch"},},},
		[7] = {item ={{gdp={2,97,236,1,4}, name="Thiªn Kiªu LÖnh"},},},
		[8] = {item ={{gdp={2,1,30549,1}, nExpired = 30*24*60*60, name="DÞch C©n §an"},},},
		[9] = {item ={{gdp={2,1,30815,1}, nExpired = 30*24*60*60, name="Ph¸ Qu©n"},},},
		[10] = {item = {{gdp={2,1,30814,1}, name="Phôc Sinh §¬n"},},},
		[11] = {item = {{gdp={2,1,30823,1}, name="R­¬ng ThÊt §iÒn Sa"},},},
		[12] = {item = {{gdp={2,1,30824,1}, name="R­¬ng Cöu Hoa Ngäc Lé"},},},
	}
	local tbExtPointBit = {1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048}
	local nCheckAward = 0
	nCheckAward = gf_GetExtPointBit(EXT_VIPCARE, nType)		--GetExtPoint(EXT_VIPCARE)
--	local nAwardPos = 0
	if gf_Judge_Room_Weight(2, 100," ") ~= 1 then
        	return 0
    end	
    if nCheckAward == 0 then
    	Talk(1, "", szNPCname.."B¹n kh«ng tróng phÇn th­ëng nµy, h·y chän phÇn th­ëng kh¸c.")
    	return 0
    end
--	for i = 1, getn(tbExtPointBit) do
--		if nCheckAward == tbExtPointBit[i] then
--			nAwardPos = i
--			break
--		end
--	end
--	if nAwardPos == 0 then
--		Talk(1, "", szNPCname.."HiÖn kh«ng cã phÇn th­ëng nµo.")
--		return 0
--	end
--	PayExtPoint(EXT_VIPCARE, GetExtPoint(EXT_VIPCARE))
	VNG_SetExtBit(EXT_VIPCARE, nType,0)
	Talk(1, "", szNPCname.."ThËt kh«ng thÓ tin ®­îc, b¹n ®· nhËn thµnh c«ng phÇn th­ëng VIP")
	gf_WriteLogEx(szLogTitle, szLogAction, 1, "PhÇn th­ëng lo¹i "..nType)
	LIB_Award:Award(tbAwardVip[nType])
end

