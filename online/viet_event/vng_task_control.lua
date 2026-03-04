-- TaskID for VNG
-- Created by TuanNA5 (noob)

Include("\\script\\vng\\define_vng.lua")

function ResetTask()	
	local tTask ={}
	if tonumber(date("%y%m%d%H")) >= 10070200 then
		if GetTask(2437) <= 11 then
			tTask = {
							2428,2429,2430,2431,2436,2538,2539,2540,2542,2545,1533,1534,1535,1536,1541,1542,
							2157,2158,2159,2160,2276,2279,
						}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,13)
		end
	end	
	if tonumber(date("%y%m%d%H")) >= 10071400 then
		if GetTask(2437) == 13 then
			tTask = {2164,2165}	
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,14)
		end
	end
	if tonumber(date("%y%m%d%H")) >= 10080100 then
		if GetTask(2437) == 14 then
			tTask = {2166,2167}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,15)
		end
	end
	if tonumber(date("%y%m%d%H")) >= 10080500 then
		if GetTask(2437) == 15 then
			tTask = {2493,2494}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,16)
		end
	end	
	if tonumber(date("%y%m%d%H")) >= 10080600 then
		if GetTask(2437) == 16 then
			tTask = {2168,2169}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,17)
		end
	end	
	if tonumber(date("%y%m%d%H")) >= 10081500 then
		if GetTask(2437) == 17 then
			tTask = {2495,2496, 2595, 2596}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,18)
		end
	end	
	if tonumber(date("%y%m%d%H")) >= 10082700 then
		if GetTask(2437) <= 19 then
			tTask = {2170,2171,2186,2187}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,20)
		end
	end
--	Reset ®iÓm trång c©y	
	if tonumber(date("%y%m%d%H")) >= 10090600 then
		tTask = {2255,2275}
		if GetTask(2437) <= 20 then
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,21)
		end
	end

--	Reset task idol sö dông cho STD
	if tonumber(date("%y%m%d%H")) >= 10090900 then
	if GetTask(2437) <= 21 then
			tTask = {1533}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,22)
		end
	end	
	
	if tonumber(date("%y%m%d%H")) >= 10091700 then		
		if GetTask(2437) <= 22 then
			tTask = {2434}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,23)
		end
	end
--	Reset task tÆng b¸nh
	if tonumber(date("%y%m%d%H")) >= 10092200 then		
		if GetTask(2437) <= 23 then
			tTask = {2430}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,24)
		end
	end
-- Reset task mua code HKLB
	if tonumber(date("%y%m%d%H")) >= 10092800 then		
		if GetTask(2437) <= 24 then
			tTask = {2435}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,25)
		end
	end	
-- Reset task ¨n B¸nh N­íng Vu«ng (event T10/2010)
	if tonumber(date("%y%m%d%H")) >= 10100900 then		
		if GetTask(2437) <= 25 then
			tTask = {2607}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,26)
		end
	end	
	-- Reset pet level 2
	if tonumber(date("%y%m%d%H")) >= 10100900 then		
		if GetTask(2437) <= 26 then
			tTask = {1535,1536,1541,1542}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,27)
		end
	end
	-- Reset cuéc chiÕn hoa hång tuÇn 1
	if tonumber(date("%y%m%d%H")) >= 10101500 then		
		if GetTask(2437) <= 27 then
			tTask = {2157}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,28)
		end
	end	
	-- Reset task chØnh qu©n c«ng Huy ¦ng
	if tonumber(date("%y%m%d%H")) >= 10102200 then		
		if GetTask(2437) <= 28 then
			tTask = {2158}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,29)
		end
	end	
	-- Reset cuéc chiÕn hoa hång tuÇn 2 
	if tonumber(date("%y%m%d%H")) >= 10102200 then		
		if GetTask(2437) <= 29 then
			tTask = {2157}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,30)
		end
	end	
	-- Thêi gian t¹o acc HKLB
	if tonumber(date("%y%m%d%H")) >= 10102200 then		
		if GetTask(2437) <= 30 then
			tTask = {2185}
			for k,v in tTask do
				SetTask(v,0)				
			end	
			if GetExtPoint(0) >= 1 then
				if GetCreateTime() < 1287968400 then
					SetTask(2185,GetCreateTime())
				end
			end
			SetTask(2437,31)
		end
	end	
	-- Reset task sö dông cho BHTA4
	if tonumber(date("%y%m%d%H")) >= 10102500 then		
		if GetTask(2437) <= 31 then
			tTask = {2538,2428,2429}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,32)
		end
	end
	-- Reset cuéc chiÕn hoa hång tuÇn 3
	if tonumber(date("%y%m%d%H")) >= 10102900 then		
		if GetTask(2437) <= 32 then
			tTask = {2157}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,33)
		end
	end	
	-- Thêi gian t¹o acc HKLB
	if tonumber(date("%y%m%d%H")) >= 10102200 then		
		if GetTask(2437) <= 33 then
			tTask = {2185}
			for k,v in tTask do
				SetTask(v,0)				
			end	
			if GetExtPoint(0) >= 1 then
				if GetCreateTime() < 12880710000 then
					SetTask(2185,GetCreateTime())
				end
			end
			SetTask(2437,34)
		end
	end
	-- Task sö dông Ng«i Sao May M¾n
	if tonumber(date("%y%m%d%H")) >= 10110900 then		
		if GetTask(2437) <= 34 then
			tTask = {2160, 2172}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,35)
		end
	end
	-- Reset task chuyÓn sinh 3  
	if tonumber(date("%y%m%d%H")) >= 10102900 then		
		if GetTask(2437) <= 35 then
			tTask = {2279}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,36)
		end
	end
	
	-- Reset task BHTA4 ®Ó sö dông cho Vâ L©m B¶o H¹p, lÊy task 2539 dïng cho quay sè mõng sn VL2
	if tonumber(date("%y%m%d%H")) >= 10112900 then		
		if GetTask(2437) <= 36 then
			tTask = {2538, 2539}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,37)
		end
	end
	
	-- Reset task sö dông Niªn Thó con
	if tonumber(date("%y%m%d%H")) >= 10113000 then		
		if GetTask(2437) <= 37 then
			tTask = {2175, 2176}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,38)
		end
	end
	
	-- Reset task sö dông cho B¹n §ång Hµnh v­ît Th¸i H­
	if tonumber(date("%y%m%d%H")) >= 10113000 then		
		if GetTask(2437) <= 38 then
			tTask = {2173, 2174, 2177}
			for k,v in tTask do
				SetTask(v,0)
			end	
			SetTask(2437,39)
		end
	end
	
	-- Reset task sö dông cho reset qu©n c«ng
	if tonumber(date("%y%m%d%H")) >= 10122800 then		
		if GetTask(2437) <= 39 then
			tTask = {2184}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,40)
		end
	end
	
	-- Reset task sö dông cho nhËn th­ëng C©y Tø Linh
	if tonumber(date("%y%m%d%H")) >= 10122800 then		
		if GetTask(2437) <= 40 then
			tTask = {2182, 2183}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,41)
		end
	end
	
	-- Reset task sö dông cho tİnh n¨ng Tr¸i C©y
	if tonumber(date("%y%m%d%H")) >= 10122800 then		
		if GetTask(2437) <= 41 then
			tTask = {2184, 2177, 2178, 2179, 2180, 2181}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,42)
		end
	end
	-- Reset task sö dông cho nép Cñi Kh«
	if tonumber(date("%y%m%d%H")) >= 10122800 then		
		if GetTask(2437) <= 42 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,43)
		end
	end
	
	if tonumber(date("%y%m%d%H")) >= 11011300 then		
		if GetTask(2437) <= 43 then
			tTask = {2428, 2429, 2430, 2158}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,44)
		end
	end
	
	if tonumber(date("%y%m%d%H")) >= 11011300 then		
		if GetTask(2437) <= 44 then
			tTask = {2660}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,45)
		end
	end
	
	if tonumber(date("%y%m%d%H")) >= 11011500 then		
		if GetTask(2437) <= 45 then
			tTask = {2661}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,46)
		end
	end
	
	if tonumber(date("%y%m%d%H")) >= 11012000 then		
		if GetTask(2437) <= 46 then
			tTask = {2662, 2663, 2664}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,47)
		end
	end
	
	if tonumber(date("%y%m%d%H")) >= 11031700 then		
		if GetTask(2437) <= 47 then
			tTask = {2665, 2666}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,48)
		end
	end
	
	-- reset task nhËn th­ëng hoa hång BHTA5 tuÇn 1
	if tonumber(date("%y%m%d%H")) >= 11032700 then		
		if GetTask(2437) <= 48 then
			tTask = {2667}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,49)
		end
	end
	
	-- reset task nhËn th­ëng hoa hång BHTA5 tuÇn  2
	if tonumber(date("%y%m%d%H")) >= 11040400 then		
		if GetTask(2437) <= 49 then
			tTask = {2667}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,50)
		end
	end

	-- reset task nhËn th­ëng hoa hång BHTA5 tuÇn  3
	if tonumber(date("%y%m%d%H")) >= 11041100 then		
		if GetTask(2437) <= 50 then
			tTask = {2667}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,51)
		end
	end
	
	-- reset task sö dông nhËn th­ëng BHTA5
	if tonumber(date("%y%m%d%H")) >= 11041400 then		
		if GetTask(2437) <= 51 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,52)
		end
	end
	
	-- reset task sö dông nhËn th­ëng BHTA5
	if tonumber(date("%y%m%d%H")) >= 11041500 then		
		if GetTask(2437) <= 52 then
			tTask = {2669, 2670}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,53)
		end
	end
	
	-- Reset task sö dông cho ChuyÓn Sinh 4
	if tonumber(date("%y%m%d%H")) >= 11041800 then		
		if GetTask(2437) <= 53 then
			tTask = {2542}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,54)
		end
	end

	--Reset Task Karaoke
	if tonumber(date("%y%m%d%H")) >= 11052200 then		
		if GetTask(2437) <= 54 then
			tTask = {2665}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,55)
		end
	end
	
	-- Reset Task sö dông cho HKLB v3
	if tonumber(date("%y%m%d%H")) >= 11053000 then		
		if GetTask(2437) <= 55 then
			tTask = {2538, 2434, 2431, 1534, 2539, 2540, 2187}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,56)
		end
	end	
	
	-- Reset Task sö dông cho sell HKLB v3 in-game
	if tonumber(date("%y%m%d%H")) >= 11053000 then		
		if GetTask(2437) <= 56 then
			tTask = {2435}
			for k,v in tTask do
				SetTask(v,0)
			end
			-- Reset chç l­u string HKLB
			CustomDataSave("code_hklb","s","")
			SetTask(2437,57)
		end
	end
	
	-- Reset Task sö dông cho CSM5.0
	if tonumber(date("%y%m%d%H")) >= 11062800 then		
		if GetTask(2437) <= 57 then
			tTask = {2670, 2671}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,58)
		end
	end
	
	-- Reset task qu©n c«ng new server
	if tonumber(date("%y%m%d%H")) >= 11070100 then		
		if GetTask(2437) <= 58 then
			tTask = {2158}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,59)
		end
	end
	
	-- Task nép Socola thang 7/2011
	if tonumber(date("%y%m%d%H")) >= 11072200 then		
		if GetTask(2437) <= 60 then
			tTask = {2675}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,61)
		end
	end
	
	-- Sö dông l­u server hiÖn hµnh ®Ó ®¸nh dÊu chuyÓn server - Quang ¦ng
	if tonumber(date("%y%m%d%H")) >= 11072200 then
		if GetTask(2437) <= 61 then
			tTask = {2676}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,62)
		end
	end
	
	-- Sö dông l­u server hiÖn hµnh ®Ó ®¸nh dÊu chuyÓn server - Duy Long
	if tonumber(date("%y%m%d%H")) >= 11080500 then
		if GetTask(2437) <= 62 then
			tTask = {2676}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,63)
		end
	end
	
	-- Task Ph¸o Hoa
	if tonumber(date("%y%m%d%H")) >= 11082000 then
		if GetTask(2437) <= 63 then
			tTask = {2429,2428}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,64)
		end
	end
	--Reset Task Vâ L©m B¶o h¹p
	if tonumber(date("%y%m%d%H")) >= 11090600 then
		if GetTask(2437) <= 64 then
			tTask = {2672,2673,2674}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,65)
		end
	end
	-- Reset task B×nh chän s¸ng t¸c truyÖn tranh
	if tonumber(date("%y%m%d%H")) >= 11090600 then
		if GetTask(2437) <= 65 then
			tTask = {2665}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,66)
		end
	end
	-- Reset VLTB cöa hµng
	if tonumber(date("%y%m%d%H")) >= 11091200 then
		if GetTask(2437) <= 66 then
			tTask = {2539}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,67)
		end
	end
	
	--Reset Task Cuéc chiÕn hoa hång
	if tonumber(date("%y%m%d%H")) >= 11093000 then
		if GetTask(2437) <= 67 then
			tTask = {2665,2666,2667,2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,68)
		end
	end
	
	---- Reset task nhËn th­ëng BHTA6 tuÇn
	if tonumber(date("%y%m%d%H")) >= 11101200 then
		if GetTask(2437) <= 68 then
			tTask = {2667}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,69)
		end
	end
	
	---- Reset task nhËn th­ëng BHTA6 tuÇn 2, reset ®Òn bï Qu©n c«ng 30-9-2011
	if tonumber(date("%y%m%d%H")) >= 11101900 then
		if GetTask(2437) <= 69 then
			tTask = {2667, 2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,70)
		end
	end	
	
	---- Reset task ®Òn bï Qu©n c«ng 30-9-2011 lÇn 2
	if tonumber(date("%y%m%d%H")) >= 11102000 then
		if GetTask(2437) <= 70 then
			tTask = {2701}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,71)
		end
	end	
	
	---- Reset nhËn th­ëng BHTA6 tuÇn 2,, ®¨ng kı thi ®Êu
	if tonumber(date("%y%m%d%H")) >= 11102700 then
		if GetTask(2437) <= 71 then
			tTask = {2667, 2668, 2702, 2703}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,72)
		end
	end
	
	---- Reset task quay sè may m¾n
	if tonumber(date("%y%m%d%H")) >= 11103000 then
		if GetTask(2437) <= 72 then
			tTask = {2705, 2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,73)
		end
	end
	
	---- Reset task trång hoa nhËn bonus tæ ®éi
	if tonumber(date("%y%m%d%H")) >= 11110900 then
		if GetTask(2437) <= 73 then
			tTask = {2704, 2677, 2678}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,74)
		end
	end
	
	---- Reset task ®Òn bï c«ng tr¹ng
	if tonumber(date("%y%m%d%H")) >= 11111900 then
		if GetTask(2437) <= 74 then
			tTask = {2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,75)
		end
	end
	
	---- Reset task update
	if tonumber(date("%y%m%d%H")) >= 11120200 then
		if GetTask(2437) <= 75 then
			tTask = {2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,76)
		end
	end
	-- Reset ngµy , Sè lÇn ®i Th¸i H­
	if tonumber(date("%y%m%d%H")) >= 11120200 then
		if GetTask(2437) <= 76 then
			tTask = {2706}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,77)
		end
	end
	
	-- Reset task sö dông cho TruyÒn C«ng & D­ìng Sinh §Æc BiÖt
	if tonumber(date("%y%m%d%H")) >= 11122900 then
		if GetTask(2437) <= 77 then
			tTask = {2679, 2680, 2681, 2682, 2683, 2684}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,78)
		end
	end
	
	--- Reset ®iÓm tİch lòy  B¸t Nh· Chøng Th­
	if tonumber(date("%y%m%d%H")) >= 12010600 then
		if GetTask(2437) <= 78 then
			tTask = {2255,2275}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,79)
		end
	end
	
	-- Reset Task nhËn th­ëng server Thµnh Long
	
	if tonumber(date("%y%m%d%H")) >= 12020200 then
		if GetTask(2437) <= 79 then
			tTask = {2276}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,80)
		end
	end
	-- Reset Quay sè Ingame
	if tonumber(date("%y%m%d%H")) >= 12020600 then
		if GetTask(2437) <= 80 then
			tTask = {2705}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,81)
		end
	end
	-- Reset Sè lÇn nhËn mËt tŞch trong ngµy
	if tonumber(date("%y%m%d%H")) >= 12021600 then
		if GetTask(2437) <= 82 then
			tTask = {2707}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,83)
		end
	end
	-- Reset Sè lÇn nhËn mËt tŞch tù chän trong ngµy
	if tonumber(date("%y%m%d%H")) >= 12022000 then
		if GetTask(2437) <= 83 then
			tTask = {2708,2709}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,84)
		end
	end
	-- Reset task ®Òn bï qu©n c«ng ngµy 01/03/2012
	if tonumber(date("%y%m%d%H")) >= 12030100 then
		if GetTask(2437) <= 84 then
			tTask = {2701}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,85)
		end
	end
	-- Reset task ®æi mËt tŞch
	if tonumber(date("%y%m%d%H")) >= 12030100 then
		if GetTask(2437) <= 85 then
			tTask = {2710}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,86)
		end
	end
		-- Reset nhËn thuèc trong tµi nguyªn chiÕn
	if tonumber(date("%y%m%d%H")) >= 12030400 then
		if GetTask(2437) <= 86 then
			tTask = {2662, 2663}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,87)
		end
	end
		-- Reset nhËn thuèc trong tµi nguyªn chiÕn
	if tonumber(date("%y%m%d%H")) >= 12030800 then
		if GetTask(2437) <= 87 then
			tTask = {2711,2712}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,88)
		end
	end	
	-- Reset task cho tham gia chien truong
	if tonumber(date("%y%m%d%H")) >= 12030800 then
		if GetTask(2437) <= 88 then
			tTask = {2711,2712}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,89)
		end
	end	
	-- Reset task B¹ch Kim lÖnh
	if tonumber(date("%y%m%d%H")) >= 12032100 then
		if GetTask(2437) <= 89 then
			tTask = {2714, 2715, 2716, 2717, 2718, 2719, 2720, 2721, 2722, 2723, 2724, 2665, 2666, 2667, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,90)
		end
	end
	-- Reset task trao gi¶i CS1 cña server Thµnh Long
	if tonumber(date("%y%m%d%H")) >= 12040400 then
		if GetTask(2437) <= 90 then
			tTask = {2701}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,91)
		end
	end
	-- Reset task BONUS B¹ch kim lÖnh
	if tonumber(date("%y%m%d%H")) >= 12040700 then
		if GetTask(2437) <= 91 then
			tTask = {2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,92)
		end
	end
	-- Reset task nhËn Thanh Phong Bao
	if tonumber(date("%y%m%d%H")) >= 12040900 then
		if GetTask(2437) <= 92 then
			tTask = {2703, 2702, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,93)
		end
	end
	-- Reset task ®æi ®iÓm ch©n khİ h»ng ngµy
	if tonumber(date("%y%m%d%H")) >= 12041600 then
		if GetTask(2437) <= 93 then
			tTask = {2726}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,94)
		end
	end
	-- Reset task ®æi ®iÓm ch©n khİ h»ng ngµy
	if tonumber(date("%y%m%d%H")) >= 12060500 then
		if GetTask(2437) <= 94 then
			tTask = {2741, 2742}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,95)
		end
	end	
	-- Reset task kick hoat VIP Thá n­íng, Ph¸o hoa
	if tonumber(date("%y%m%d%H")) >= 12060600 then
		if GetTask(2437) <= 95 then
			tTask = {2738, 2739, 2740}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,96)
		end
	end	
	
	-- Reset task Trai cay 3 mien
	if tonumber(date("%y%m%d%H")) >= 12061500 then
		if GetTask(2437) <= 96 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,97)
		end
	end	
	
	-- Reset task VLBH ver 3 + më réng event
	if tonumber(date("%y%m%d%H")) >= 12061900 then
		if GetTask(2437) <= 97 then
			tTask = {2674, 2672, 2673, 2729, 2730, 2732, 2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,98)
		end
	end	
	-- Reset task®æi ®iÓm ch©n khİ ë B¾c ®Èu l·o nh©n
	if tonumber(date("%y%m%d%H")) >= 12062700 then
		if GetTask(2437) <= 98 then
			tTask = {2728}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,99)
		end
	end	
	-- Thay ®æi task VLBH míi
	if tonumber(date("%y%m%d%H")) >= 12070500 then
		if GetTask(2437) <= 99 then
			tTask = {2744, 2745}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,100)
		end
	end		
	-- Reset task nhan th­ëng ch©n khİ VLBH
	if tonumber(date("%y%m%d%H")) >= 12071700 then
		if GetTask(2437) <= 100 then
			tTask = {2729}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,101)
		end
	end			
	-- Reset task nhËn th­ëng ch©n khİ, Exp, VLBH
	if tonumber(date("%y%m%d%H")) >= 12072500 then
		if GetTask(2437) <= 101 then
			tTask = {2744, 2745, 2729}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,102)
		end
	end	
	-- Reset task më réng event th¸ng 7 vµ trao gi¶i
	if tonumber(date("%y%m%d%H")) >= 12072700 then
		if GetTask(2437) <= 102 then
			tTask = {2743, 2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,103)
		end
	end	
	-- Reset task nhËn th­ëng mçi ngµy ? bao nhiªu c¸i / lÇn
	if tonumber(date("%y%m%d%H")) >= 12073100 then
		if GetTask(2437) <= 103 then
			tTask = {2746}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,104)
		end
	end	
	-- Reset task dïng ®¨ng kı thi ®Êu Long Hæ Tranh Hïng
	if tonumber(date("%y%m%d%H")) >= 12081000 then
		if GetTask(2437) <= 104 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,105)
		end
	end	
	-- Reset task ®Òn bï 800k c«ng tr¹ng
	if tonumber(date("%y%m%d%H")) >= 12081000 then
		if GetTask(2437) <= 105 then
			tTask = {2700}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,106)
		end
	end	
		-- Reset task quay sè may m¾n
	if tonumber(date("%y%m%d%H")) >= 12082300 then
		if GetTask(2437) <= 106 then
			tTask = {2705}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,107)
		end
	end	
	-- Reset task nhËn th­ëng LHTH
	if tonumber(date("%y%m%d%H")) >= 12091900 then
		if GetTask(2437) <= 107 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,108)
		end
	end	
	-- Reset task chuçi nhiÖm vô ChuyÓn sinh ®¬n
	if tonumber(date("%y%m%d%H")) >= 12092000 then
		if GetTask(2437) <= 108 then
			tTask = {2753, 2749, 2750, 2751, 2752}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,109)
		end
	end	
	-- Reset task ®æi th­ëng LHTH
	if tonumber(date("%y%m%d%H")) >= 12091900 then
		if GetTask(2437) <= 109 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,110)
		end
	end	
	-- Reset task chuçi nhiÖm vô M¶nh Thiªn Th¹ch
	if tonumber(date("%y%m%d%H")) >= 12100900 then
		if GetTask(2437) <= 110 then
			tTask = {2754, 2755}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,111)
		end
	end	
	-- Reset task Event thang 10
	if tonumber(date("%y%m%d%H")) >= 12101800 then
		if GetTask(2437) <= 111 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,112)
		end
	end	
	-- Reset Task BHTA8 ®ît 1
	if tonumber(date("%y%m%d%H")) >= 12102600 then
		if GetTask(2437) <= 112 then
			tTask = {2703, 2702, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,113)
		end
	end
	-- Reset Task BHTA8 ®ît 2
	if tonumber(date("%y%m%d%H")) >= 12102900 then
		if GetTask(2437) <= 113 then
			tTask = {2703, 2702, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,114)
		end
	end
	-- Reset Task Chuyen sinh 6
	if tonumber(date("%y%m%d%H")) >= 12110900 then
		if GetTask(2437) <= 114 then
			tTask = {2757, 2758, 2759, 2685, 2687}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,115)
		end
	end
		-- Reset Task Chuyen sinh 6 lan 2
	if tonumber(date("%y%m%d%H")) >= 12111600 then
		if GetTask(2437) <= 115 then
			tTask = {2688, 2690, 2691, 2692}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,116)
		end
	end
		-- Reset Task nhËn th­ëng max event mèc 10k th¸ng 11
	if tonumber(date("%y%m%d%H")) >= 12112800 then
		if GetTask(2437) <= 116 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,117)
		end
	end		
		-- Reset Task B¹ch Kim LÖnh version 2
	if tonumber(date("%y%m%d%H")) >= 12113000 then
		if GetTask(2437) <= 117 then
			tTask = {2714, 2715, 2716, 2717, 2718, 2719, 2720, 2721}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,118)
		end
	end
	-- Reset Task VBonus version 2
	if tonumber(date("%y%m%d%H")) >= 12120500 then
		if GetTask(2437) <= 118 then
			tTask = {2255, 2275, 2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,119)
		end
	end
	-- Reset TaskVËn may ®¹o h÷u
	if tonumber(date("%y%m%d%H")) >= 12120600 then
		if GetTask(2437) <= 119 then
			tTask = {2698}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,120)
		end
	end	
	-- Reset Task ®æi th­ëng VLTB
	if tonumber(date("%y%m%d%H")) >= 12121300 then
		if GetTask(2437) <= 120 then
			tTask = {2718}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,121)
		end
	end	
		-- Reset Task nhËn th­ëng max event mèc 5k th¸ng 12
	if tonumber(date("%y%m%d%H")) >= 12123100 then
		if GetTask(2437) <= 121 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,122)
		end
	end		
	-- Reset Task nhËn th­ëng max event mèc 6k, 10k th¸ng 1
	if tonumber(date("%y%m%d%H")) >= 13013100 then
		if GetTask(2437) <= 122 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,123)
		end
	end	
	-- Reset Task nhËn th­ëng max event mèc 4k, 6k, 10k th¸ng 3
	if tonumber(date("%y%m%d%H")) >= 13031500 then
		if GetTask(2437) <= 123 then
			tTask = {2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,124)
		end
	end		
	-- Reset Task nhËn chuyÓn sinh miÔn phİ sang phông tö, ­ng tö
	if tonumber(date("%y%m%d%H")) >= 13031500 then
		if GetTask(2437) <= 124 then
			tTask = {2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,125)
		end
	end		
	-- Reset Task nhËn chuyÓn sinh miÔn phİ sang phông tö, ­ng tö lÇn 2
	if tonumber(date("%y%m%d%H")) >= 13031900 then
		if GetTask(2437) <= 125 then
			tTask = {2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,126)
		end
	end			
	-- Reset Task nhËn chuyÓn sinh miÔn phİ sang phông tö, ­ng tö lÇn 3
	if tonumber(date("%y%m%d%H")) >= 13040200 then
		if GetTask(2437) <= 126 then
			tTask = {2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,127)
		end
	end		
	-- Reset Task nhËn nhiÖm vô thang 4
	if tonumber(date("%y%m%d%H")) >= 13040900 then
		if GetTask(2437) <= 127 then
			tTask = {2740, 2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,128)
		end
	end		
	-- Reset Task di hoa tiep ngoc
	if tonumber(date("%y%m%d%H")) >= 13041000 then
		if GetTask(2437) <= 128 then
			tTask = {2164, 2165}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,129)
		end
	end	
	-- Reset Task ®¨ng kı BHTA9
	if tonumber(date("%y%m%d%H")) >= 13041100 then
		if GetTask(2437) <= 129 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,130)
		end
	end		
	-- Reset Task ®æi nguyªn liÖu th¸ng 4
	if tonumber(date("%y%m%d%H")) >= 13041600 then
		if GetTask(2437) <= 130 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,131)
		end
	end						
-- Reset Task nhËn th­ëng max event th¸ng 4 n¨m 2013
	if tonumber(date("%y%m%d%H")) >= 13041800 then
		if GetTask(2437) <= 131 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,132)
		end
	end			
-- Reset Task cho BHTA9
	if tonumber(date("%y%m%d%H")) >= 13042600 then
		if GetTask(2437) <= 132 then
			tTask = {2702, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,133)
		end
	end
-- Reset Task event ñng hé biÓn ®¶o, task nhËn Thanh Phong Bao BHTA lÇn 9
	if tonumber(date("%y%m%d%H")) >= 13042700 then
		if GetTask(2437) <= 133 then
			tTask = {2698, 2703}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,134)
		end
	end
-- Reset Task ®æi nguyªn liÖu th¸ng 5
	if tonumber(date("%y%m%d%H")) >= 13051200 then
		if GetTask(2437) <= 134 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,135)
		end
	end	
-- Reset Task thay ®æi h­íng chuyÓn sinh miÔn phİ
	if tonumber(date("%y%m%d%H")) >= 13051200 then
		if GetTask(2437) <= 135 then
			tTask = {2188}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,136)
		end
	end		
-- Reset Task thu mua qu©n dông, më réng event th¸ng 5
	if tonumber(date("%y%m%d%H")) >= 13052800 then
		if GetTask(2437) <= 136 then
			tTask = {2187}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,137)
		end
	end		
-- Reset Task VBonus
	if tonumber(date("%y%m%d%H")) >= 13052800 then
		if GetTask(2437) <= 137 then
			tTask = {2282}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,138)
		end
	end		
-- Reset Task më réng event th¸ng 5
	if tonumber(date("%y%m%d%H")) >= 13062700 then
		if GetTask(2437) <= 138 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,139)
		end
	end	
-- Reset Task Long Tranh Hæ §Êu
	if tonumber(date("%y%m%d%H")) >= 13070300 then
		if GetTask(2437) <= 139 then
			tTask = {2283}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,140)
		end
	end	
-- Reset Task nhËn hç trî qu©n c«ng, update x2,x3 khi thu thËp tµi nguyªn chiÕn
	if tonumber(date("%y%m%d%H")) >= 13070400 then
		if GetTask(2437) <= 140 then
			tTask = {2284,2285}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,141)
		end
	end		
-- Reset Task nhiÖm vô §ång Hµnh
	if tonumber(date("%y%m%d%H")) >= 13071800 then
		if GetTask(2437) <= 141 then
			tTask = {2283,2189}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,142)
		end
	end	
-- Reset Task sö dông thªm n÷ oa b¶o h¹p
	if tonumber(date("%y%m%d%H")) >= 13072600 then
		if GetTask(2437) <= 142 then
			tTask = {2156}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,143)
		end
	end		
-- Reset Task sö dông c¸c lo¹i c©y trång
	if tonumber(date("%y%m%d%H")) >= 13072700 then
		if GetTask(2437) <= 143 then
			tTask = {2651, 429, 2059}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,144)
		end
	end	
-- Reset Task më réng event
	if tonumber(date("%y%m%d%H")) >= 13080100 then
		if GetTask(2437) <= 144 then
			tTask = {2731, 2713}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,145)
		end
	end
-- Reset task Sinh tö v« ng·
	if tonumber(date("%y%m%d%H")) >= 13080800 then
		if GetTask(2437) <= 145 then
			tTask = {2700, 2701}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,146)
		end
	end
	-- Reset task Phôc Sinh PET
	if tonumber(date("%y%m%d%H")) >= 13090200 then
		if GetTask(2437) <= 146 then
			tTask = {2538, 2539}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,147)
		end
	end
	-- Reset task më réng event th¸ng 8
	if tonumber(date("%y%m%d%H")) >= 13091000 then
		if GetTask(2437) <= 147 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,148)
		end
	end	
	-- Reset task 2731 (th­êng dïng më réng event) dïng cho nhËn thá miÕn phİ tõ 18/9 - 20/9
	if tonumber(date("%y%m%d%H")) >= 13091700 then
		if GetTask(2437) <= 148 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,149)
		end
	end	
	-- Reset task event ®ua top Kim Xµ, task 2668 BHTA
	if tonumber(date("%y%m%d%H")) >= 13092400 then
		if GetTask(2437) <= 149 then
			tTask = {2540, 2545, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,150)
		end
	end		
	-- Reset task 2731 ®Ó sö dông më réng event
	if tonumber(date("%y%m%d%H")) >= 13092400 then
		if GetTask(2437) <= 150 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,151)
		end
	end
	-- Reset task ®ua top kim xµ liªn server
	if tonumber(date("%y%m%d%H")) >= 13101000 then
		if GetTask(2437) <= 151 then
			tTask = {2660,2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,152)
		end
	end
-- Reset task Chİ T«n V­¬ng LÖnh, Phuc Sinh 2
	if tonumber(date("%y%m%d%H")) >= 13101800 then
		if GetTask(2437) <= 152 then
			tTask = {2664,2665, 2666, 2667,2668,2669,2175,2176}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,153)
		end
	end	
-- Reset task NhËn th­ëng ®ua top kim xµ liªn server
	if tonumber(date("%y%m%d%H")) >= 13101800 then
		if GetTask(2437) <= 153 then
			tTask = {2660}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,154)
		end
	end
-- Reset task NhËn th­ëng ®ua top kim xµ liªn server
	if tonumber(date("%y%m%d%H")) >= 13103000 then
		if GetTask(2437) <= 154 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,155)
		end
	end	
-- Reset task më réng event th¸ng 10
	if tonumber(date("%y%m%d%H")) >= 13103000 then
		if GetTask(2437) <= 155 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,156)
		end
	end	
	-- Reset Task L«i Hæ LÖnh 
	if tonumber(date("%y%m%d%H")) >= 13112200 then
		if GetTask(2437) <= 156 then
			tTask = {2714, 2715, 2716, 2717, 2718, 2719, 2720, 2721}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,157)
		end
	end	
	-- Reset Task Noel ®æi diÖu d­¬ng
	if tonumber(date("%y%m%d%H")) >= 14010200 then
		if GetTask(2437) <= 157 then
			tTask = {2725}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,158)
		end
	end	
	-- Reset Task Noel ®æi diÖu d­¬ng
	if tonumber(date("%y%m%d%H")) >= 14011000 then
		if GetTask(2437) <= 158 then
			tTask = {2188}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,159)
		end
	end	
	-- Reset Task ®µo r­¬ng gi¸p ngä
	if tonumber(date("%y%m%d%H")) >= 14012000 then
		if GetTask(2437) <= 159 then
			tTask = {2725, 2666}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,160)
		end
	end	
	-- Reset Task xãa KhuÊt Nguyªn Béi
	if tonumber(date("%y%m%d%H")) >= 14021300 then
		if GetTask(2437) <= 159 then
			tTask = {2188}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,160)
		end
	end	
	-- Reset Task T¸i xuÊt giang hå
	if tonumber(date("%y%m%d%H")) >= 14022100 then
		if GetTask(2437) <= 160 then
			tTask = {2162,2163,2666}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,161)
		end
	end
	-- Reset Task 123Pay
	if tonumber(date("%y%m%d%H")) >= 14030100 then
		if GetTask(2437) <= 161 then
			tTask = {2664, 2675}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,162)
		end
	end
		-- Reset Task BHTA 11
	if tonumber(date("%y%m%d%H")) >= 14030100 then
		if GetTask(2437) <= 162 then
			tTask = {2702, 2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,163)
		end
	end
	-- Reset Task event thang 3
	if tonumber(date("%y%m%d%H")) >= 14042100 then
		if GetTask(2437) <= 163 then
			tTask = {3059 }
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,164)
		end
	end
	------------------
	-- Reset Task Sinh Tu Vo Nga
	if tonumber(date("%y%m%d%H")) >= 14051900 then
		if GetTask(2437) <= 164 then
			tTask = {2700, 2701, 2713}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,165)
		end
	end
	-- Reset Task nhiÖm vô ®æi trang bŞ Thiªn Chi - B¹ch Kim viªm ®Õ
	if tonumber(date("%y%m%d%H")) >= 14061700 then
		if GetTask(2437) <= 165 then
			tTask = {2707}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,166)
		end
	end	
	-- Reset Task nhiÖm vô VBonus 7/2014
	if tonumber(date("%y%m%d%H")) >= 14071000 then
		if GetTask(2437) <= 166 then
			tTask = {2430}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,167)
		end
	end	
	-- Reset Task nhiÖm vô Th¨ng TiÕn Phôc Sinh
	if tonumber(date("%y%m%d%H")) >= 14090900 then
		if GetTask(2437) <= 167 then
			tTask = {2725}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,168)
		end
	end		
	-- Reset Task cuéc chiÕn hoa hång
	if tonumber(date("%y%m%d%H")) >= 14100700 then
		if GetTask(2437) <= 168 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,169)
		end
	end		
	-- Reset Task BHTA 12
	if tonumber(date("%y%m%d%H")) >= 14102000 then
		if GetTask(2437) <= 169 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,170)
		end
	end		
	-- Reset Task §ua Top bang héi liªn server
	if tonumber(date("%y%m%d%H")) >= 14102100 then
		if GetTask(2437) <= 170 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,171)
		end
	end			
	-- Reset Task NhËn th­ëng nhiÖm vô PVP CDKEY
	if tonumber(date("%y%m%d%H")) >= 14102700 then
		if GetTask(2437) <= 171 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,172)
		end
	end
	-- Reset Task §ua Top bang héi liªn server 21/01/2015
	if tonumber(date("%y%m%d%H")) >= 15012100 then
		if GetTask(2437) <= 172 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,173)
		end
	end	
		-- Reset Task Tinh Anh Kú Héi
	if tonumber(date("%y%m%d%H")) >= 15013000 then
		if GetTask(2437) <= 173 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,174)
		end
	end		
		-- Reset Task Më réng event th¸ng
	if tonumber(date("%y%m%d%H")) >= 15021200 then
		if GetTask(2437) <= 174 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,175)
		end
	end		
		-- Reset Task nhËn th­ëng 8/3, chØ dïng 1 lÇn
	if tonumber(date("%y%m%d%H")) >= 15030800 then
		if GetTask(2437) <= 175 then
			tTask = {2731}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,176)
		end
	end	
	-- Reset Task NhiÖm Vô trång c©y
	if tonumber(date("%y%m%d%H")) >= 15042500 then
		if GetTask(2437) <= 176 then
			tTask = {2540, 2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,177)
		end
	end
		-- Reset Task Bang Héi Tinh Anh 13
	if tonumber(date("%y%m%d%H")) >= 15051000 then
		if GetTask(2437) <= 177 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,178)
		end
	end						
	-- Reset Task cho nhËn c«ng trang
	if tonumber(date("%y%m%d%H")) >= 15051300 then
		if GetTask(2437) <= 178 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,179)
		end
	end		
	-- Reset Task nhËn trang bŞ PS3
	if tonumber(date("%y%m%d%H")) >= 15070800 then
		if GetTask(2437) <= 179 then
			tTask = {2715}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,180)
		end
	end		
	-- Reset Task event th¸ng 8/2015
	if tonumber(date("%y%m%d%H")) >= 15081200 then
		if GetTask(2437) <= 180 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,181)
		end
	end		
	-- Reset Task event ngµy  2/9/2015
	if tonumber(date("%y%m%d%H")) >= 15082600 then
		if GetTask(2437) <= 181 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,182)
		end
	end			
	-- Reset Task xãa trang bŞ ¢m Hån
	if tonumber(date("%y%m%d%H")) >= 15090400 then
		if GetTask(2437) <= 182 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,183)
		end
	end			
	-- Reset Task Sinh Tö V« Ng· lÇn 3
	if tonumber(date("%y%m%d%H")) >= 15091000 then
		if GetTask(2437) <= 183 then
			tTask = {2700, 2701, 2713}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,184)
		end
	end			
	-- Reset Task update task Sinh Tö V« Ng· lÇn 3
	if tonumber(date("%y%m%d%H")) >= 15091200 then
		if GetTask(2437) <= 184 then
			tTask = {2172, 2282, 2430}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,185)
		end
	end		
	-- Reset Task tiÖp kim hæ phï-thiªn tÇm th¸p
	if tonumber(date("%y%m%d%H")) >= 15091600 then
		if GetTask(2437) <= 185 then
			tTask = {3058, 3059, 3060, 3061,3062,3063,3064,3065,3066,3067,2762,2763,2764,2765,2766,2767,2768,2769,2770,2771}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,186)
		end
	end	
	-- Reset Task Event Kinh M¹ch th¸ng 9
	if tonumber(date("%y%m%d%H")) >= 15092200 then
		if GetTask(2437) <= 186 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,187)
		end
	end			
	-- Reset Task Event ®æi trang bŞ kim xµ th¸ng 9
	if tonumber(date("%y%m%d%H")) >= 15092900 then
		if GetTask(2437) <= 187 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,188)
		end
	end		
	-- Reset Task Event niÒm vui ®Çu th¸ng 10/2015
	if tonumber(date("%y%m%d%H")) >= 15100500 then
		if GetTask(2437) <= 188 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,189)
		end
	end		
	-- Reset Task Event niÒm vui ®Çu th¸ng 10/2015
	if tonumber(date("%y%m%d%H")) >= 15100900 then
		if GetTask(2437) <= 189 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,190)
		end
	end	
	-- Reset Task Bang Héi Tinh Anh 14
	if tonumber(date("%y%m%d%H")) >= 15101100 then
		if GetTask(2437) <= 190 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,191)
		end
	end			
	-- Reset Task event phô
	if tonumber(date("%y%m%d%H")) >= 15102700 then
		if GetTask(2437) <= 191 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,192)
		end
	end			
	-- Reset Task event ®æi c­êng hãa phï
	if tonumber(date("%y%m%d%H")) >= 15103000 then
		if GetTask(2437) <= 192 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,193)
		end
	end
	-- Reset Task më réng event chİnh
	if tonumber(date("%y%m%d%H")) >= 15111200 then
		if GetTask(2437) <= 193 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,194)
		end
	end		
	-- Reset Task event phô th¸ng 11 (®æi ch©n khİ, ®æi linh ngäc)
	if tonumber(date("%y%m%d%H")) >= 15112500 then
		if GetTask(2437) <= 194 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,195)
		end
	end	
		-- Reset Task event phô th¸ng 12 (®æi vËt b¸u)
	if tonumber(date("%y%m%d%H")) >= 15120100 then
		if GetTask(2437) <= 195 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,196)
		end
	end	
	-- Reset Task më réng event chİnh
	if tonumber(date("%y%m%d%H")) >= 16011500 then
		if GetTask(2437) <= 196 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,197)
		end
	end		
	-- Reset Task event phô th¸ng 1 (®æi vËt b¸u)
	if tonumber(date("%y%m%d%H")) >= 15120100 then
		if GetTask(2437) <= 197 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,198)
		end
	end	
	-- Reset Task më réng event chİnh
	if tonumber(date("%y%m%d%H")) >= 16021500 then
		if GetTask(2437) <= 198 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,199)
		end
	end		
	-- Reset Task nhËn th­ëng VDTH 
	if tonumber(date("%y%m%d%H")) >= 16030400 then
		if GetTask(2437) <= 199 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,200)
		end
	end		
	-- Reset Task ®iÓm tİch lòy ®æi vËt b¸u
	if tonumber(date("%y%m%d%H")) >= 16042800 then
		if GetTask(2437) <= 200 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,201)
		end
	end		
	-- Reset Task Bang Héi Tinh Anh 15
	if tonumber(date("%y%m%d%H")) >= 16050500 then
		if GetTask(2437) <= 201 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,202)
		end
	end	
	-- Reset Task ®iÓm tİch lòy ®æi vËt b¸u
	if tonumber(date("%y%m%d%H")) >= 16053100 then
		if GetTask(2437) <= 202 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,203)
		end
	end		
	-- Reset Task ®iÓm tİch lòy ®æi vËt b¸u
	if tonumber(date("%y%m%d%H")) >= 16060900 then
		if GetTask(2437) <= 203 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,204)
		end
	end	
	-- Reset Task më réng event chİnh
	if tonumber(date("%y%m%d%H")) >= 16062000 then
		if GetTask(2437) <= 204 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,205)
		end
	end		
	-- Reset Task ®Ó trao th­ëng BHTA15
	if tonumber(date("%y%m%d%H")) >= 16062200 then
		if GetTask(2437) <= 205 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,206)
		end
	end	
	-- Reset Task ®Ó trao th­ëng BHTA15
	if tonumber(date("%y%m%d%H")) >= 16070700 then
		if GetTask(2437) <= 206 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,207)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 9
	if tonumber(date("%y%m%d%H")) >= 16090800 then
		if GetTask(2437) <= 207 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,208)
		end
	end	
	-- Reset Task ®iÓm tİch lòy ®æi vËt b¸u
	if tonumber(date("%y%m%d%H")) >= 16091900 then
		if GetTask(2437) <= 208 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,209)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 10
	if tonumber(date("%y%m%d%H")) >= 16100700 then
		if GetTask(2437) <= 209 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,210)
		end
	end	
	-- Reset Task ®Ó b×nh chän BHTA16 A0001
	if tonumber(date("%y%m%d%H")) >= 16102600 then
		if GetTask(2437) <= 210 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,211)
		end
	end	
	-- Reset Task Bang Héi Tinh Anh 16
	if tonumber(date("%y%m%d%H")) >= 16110300 then
		if GetTask(2437) <= 211 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,212)
		end
	end
	-- Reset Task ®Ó b×nh chän BHTA16 A0002
	if tonumber(date("%y%m%d%H")) >= 16102800 then
		if GetTask(2437) <= 212 then
			tTask = {2733}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,213)
		end
	end	
	-- Reset Task ®Ó nhËn th­ëng cuèi BHTA16 A0003
	if tonumber(date("%y%m%d%H")) >= 16102600 then
		if GetTask(2437) <= 213 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,214)
		end
	end
	-- Reset Task më réng event chİnh th¸ng 12
	if tonumber(date("%y%m%d%H")) >= 16120600 then
		if GetTask(2437) <= 214 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,215)
		end
	end	
	-- Reset Task event ®æi vËt b¸u A0004
	if tonumber(date("%y%m%d%H")) >= 17012000 then
		if GetTask(2437) <= 215 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,216)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 12
	if tonumber(date("%y%m%d%H")) >= 17020900 then
		if GetTask(2437) <= 216 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,217)
		end
	end	
	-- Reset Task event ®æi vËt b¸u A0004
	if tonumber(date("%y%m%d%H")) >= 17021000 then
		if GetTask(2437) <= 217 then
			tTask = {2704}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,218)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 4
	if tonumber(date("%y%m%d%H")) >= 17041300 then
		if GetTask(2437) <= 218 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,219)
		end
	end	
	-- Reset Task ®Ó nhËn danh hiÖu A0005
	if tonumber(date("%y%m%d%H")) >= 17042100 then
		if GetTask(2437) <= 219 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,220)
		end
	end
	-- Reset Task ®Ó b×nh chän BHTA17 A0001
	if tonumber(date("%y%m%d%H")) >= 17051000 then
		if GetTask(2437) <= 220 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,221)
		end
	end	
	-- Reset Task Bang Héi Tinh Anh 16
	if tonumber(date("%y%m%d%H")) >= 17051600 then
		if GetTask(2437) <= 221 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,222)
		end
	end
	-- Reset Task më réng event chİnh th¸ng 6
	if tonumber(date("%y%m%d%H")) >= 17061400 then
		if GetTask(2437) <= 222 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,223)
		end
	end	
	-- Reset Task ®Ó nhËn hç trî all server ngµy 01/08/2017 A0005
	if tonumber(date("%y%m%d%H")) >= 17073100 then
		if GetTask(2437) <= 223 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,224)
		end
	end	
	-- Reset Task ®Ó nhËn hç trî all server ngµy 22/08/2017 A0005
	if tonumber(date("%y%m%d%H")) >= 17082100 then
		if GetTask(2437) <= 224 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,225)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 9
	if tonumber(date("%y%m%d%H")) >= 17091800 then
		if GetTask(2437) <= 225 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,226)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 10
	if tonumber(date("%y%m%d%H")) >= 17100400 then
		if GetTask(2437) <= 226 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,227)
		end
	end	
	-- Reset Task ®Ó b×nh chän BHTA18 A0001
	if tonumber(date("%y%m%d%H")) >= 17111500 then
		if GetTask(2437) <= 227 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,228)
		end
	end	
	-- Reset Task Bang Héi Tinh Anh 18, Task më réng event chİnh th¸ng 11 
	if tonumber(date("%y%m%d%H")) >= 17112200 then
		if GetTask(2437) <= 228 then
			tTask = {2668, 2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,229)
		end
	end
	-- Reset Task më réng event chİnh th¸ng 1
	if tonumber(date("%y%m%d%H")) >= 18010800 then
		if GetTask(2437) <= 229 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,230)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 2, Task event online nhËn th­ëng th¸ng 2
	if tonumber(date("%y%m%d%H")) >= 18020800 then
		if GetTask(2437) <= 230 then
			tTask = {2540, 2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,231)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 3
	if tonumber(date("%y%m%d%H")) >= 18030500 then
		if GetTask(2437) <= 231 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,232)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 4
	if tonumber(date("%y%m%d%H")) >= 18040500 then
		if GetTask(2437) <= 232 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,233)
		end
	end	
	-- Reset Task ®Ó b×nh chän BHTA19 A0001
	if tonumber(date("%y%m%d%H")) >= 18050900 then
		if GetTask(2437) <= 233 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,234)
		end
	end	
	-- Reset Task Bang Héi Tinh Anh 19 nép TALK, Reset Task më réng event chİnh th¸ng 5
	if tonumber(date("%y%m%d%H")) >= 18051000 then
		if GetTask(2437) <= 234 then
			tTask = {2668, 2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,235)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 6
	if tonumber(date("%y%m%d%H")) >= 18060600 then
		if GetTask(2437) <= 235 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,236)
		end
	end	
	-- Reset Task nhËn nguyªn liÖu khi gia nhËp c«n l«n kiÕm
	if tonumber(date("%y%m%d%H")) >= 18071200 then
		if GetTask(2437) <= 236 then
			tTask = {2660}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,237)
		end
	end	
	-- Reset Task nhËn yÕu quyÕt TSK_XOA_YEUQUYET = 2188		--ch¹y ®Õn 26/7/2018
	if tonumber(date("%y%m%d%H")) >= 18071200 then
		if GetTask(2437) <= 237 then
			tTask = {2188}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,238)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 7
	if tonumber(date("%y%m%d%H")) >= 18072400 then
		if GetTask(2437) <= 238 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,239)
		end
	end	
	-- Reset Task nhËn trang bŞ c­êng hãa V¨n Søc TSK_CUONGHOA_VANSUC = 2188	--Ch¹y ®Õn 31/08/2018
	if tonumber(date("%y%m%d%H")) >= 18080100 then
		if GetTask(2437) <= 239 then
			tTask = {2188}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,240)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 8
	if tonumber(date("%y%m%d%H")) >= 18081700 then
		if GetTask(2437) <= 240 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,241)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 9
	if tonumber(date("%y%m%d%H")) >= 18090500 then
		if GetTask(2437) <= 241 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,242)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 10
	if tonumber(date("%y%m%d%H")) >= 18101200 then
		if GetTask(2437) <= 242 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,243)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 11
	if tonumber(date("%y%m%d%H")) >= 18110500 then
		if GetTask(2437) <= 243 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,244)
		end
	end	
	-- Reset Task ®Ó b×nh chän BHTA20 A0001
	if tonumber(date("%y%m%d%H")) >= 18111900 then
		if GetTask(2437) <= 244 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,245)
		end
	end	
	-- Reset Task Bang Héi Tinh Anh 20 nép TALK
	if tonumber(date("%y%m%d%H")) >= 18112100 then
		if GetTask(2437) <= 245 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,246)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 12
	if tonumber(date("%y%m%d%H")) >= 18120700 then
		if GetTask(2437) <= 246 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,247)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 1/2019
	if tonumber(date("%y%m%d%H")) >= 18120700 then
		if GetTask(2437) <= 247 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,248)
		end
	end	
	-- Reset Task online nhËn th­ëng th¸ng 2/2019
	if tonumber(date("%y%m%d%H")) >= 19012900 then
		if GetTask(2437) <= 248 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,249)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 2/2019
	if tonumber(date("%y%m%d%H")) >= 19021100 then
		if GetTask(2437) <= 249 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,250)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 3/2019, 2739 ®¨ng kı chuyÓn server 15/03/2019
	if tonumber(date("%y%m%d%H")) >= 19031100 then
		if GetTask(2437) <= 250 then
			tTask = {2540,2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,251)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 4/2019
	if tonumber(date("%y%m%d%H")) >= 19040400 then
		if GetTask(2437) <= 251 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,252)
		end
	end	
	-- Reset Task ®Ó b×nh chän BHTA21 A0001
	if tonumber(date("%y%m%d%H")) >= 19050900 then
		if GetTask(2437) <= 252 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,253)
		end
	end	
	-- Reset Task 2739 ®¨ng kı chuyÓn server 15/05/2019
	if tonumber(date("%y%m%d%H")) >= 19051400 then
		if GetTask(2437) <= 253 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,254)
		end
	end	
	-- Reset Task Bang Héi Tinh Anh 21 nép TALK
	if tonumber(date("%y%m%d%H")) >= 19051400 then
		if GetTask(2437) <= 254 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,255)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 5/2019
	if tonumber(date("%y%m%d%H")) >= 19051500 then
		if GetTask(2437) <= 255 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,256)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 6/2019
	if tonumber(date("%y%m%d%H")) >= 19060400 then
		if GetTask(2437) <= 256 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,257)
		end
	end	
	-- Reset Task ®¸nh dÊu dßng chän ®· chän
	if tonumber(date("%y%m%d%H")) >= 19070700 then
		if GetTask(2437) <= 257 then
			tTask = {2664}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,258)
		end
	end	
	-- Reset Task hç trî qu©n c«ng all server
	if tonumber(date("%y%m%d%H")) >= 19071200 then
		if GetTask(2437) <= 258 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,259)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 7/2019
	if tonumber(date("%y%m%d%H")) >= 19071400 then
		if GetTask(2437) <= 259 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,260)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 8/2019
	if tonumber(date("%y%m%d%H")) >= 19080700 then
		if GetTask(2437) <= 260 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,261)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 9/2019
	if tonumber(date("%y%m%d%H")) >= 19091200 then
		if GetTask(2437) <= 261 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,262)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 10/2019
	if tonumber(date("%y%m%d%H")) >= 19100700 then
		if GetTask(2437) <= 262 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,263)
		end
	end	
	-- Reset Task phôc sinh b¹n ®ång hµnh lÇn 2
	if tonumber(date("%y%m%d%H")) >= 19100700 then
		if GetTask(2437) <= 263 then
			tTask = {2175, 2176}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,264)
		end
	end
-- Reset Task më réng event chİnh th¸ng 11/2019
	if tonumber(date("%y%m%d%H")) >= 19110700 then
		if GetTask(2437) <= 264 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,265)
		end
	end		
	-- Reset Task ®Ó b×nh chän BHTA22 A0001
	if tonumber(date("%y%m%d%H")) >= 19111800 then
		if GetTask(2437) <= 265 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,266)
		end
	end	
	-- Reset Task Bang Héi Tinh Anh 22 nép TALK
	if tonumber(date("%y%m%d%H")) >= 19112000 then
		if GetTask(2437) <= 266 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,267)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 12/2019
	if tonumber(date("%y%m%d%H")) >= 19110700 then
		if GetTask(2437) <= 267 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,268)
		end
	end	
	-- Reset Task xãa item tuyÕt cÇu
	if tonumber(date("%y%m%d%H")) >= 19121600 then
		if GetTask(2437) <= 268 then
			tTask = {2668}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,269)
		end
	end	
	-- Reset Task online nhËn th­ëng noel 2019
	if tonumber(date("%y%m%d%H")) >= 19121800 then
		if GetTask(2437) <= 269 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,270)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 1/2020
	if tonumber(date("%y%m%d%H")) >= 20010600 then
		if GetTask(2437) <= 270 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,271)
		end
	end	
	-- Reset Task online nhËn th­ëng tÕt 2020
	if tonumber(date("%y%m%d%H")) >= 20011600 then
		if GetTask(2437) <= 271 then
			tTask = {2739, 2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,272)
		end
	end	
	-- Reset Task ®µo r­¬ng canh tı
	if tonumber(date("%y%m%d%H")) >= 20020100 then
		if GetTask(2437) <= 272 then
			tTask = {2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,273)
		end
	end
	-- Reset Task chän lo¹i trang søc cÇn n©ng cÊp tõ HHVH lªn Èm huyÕt
	if tonumber(date("%y%m%d%H")) >= 20021200 then
		if GetTask(2437) <= 273 then
			tTask = {2693}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,274)
		end
	end
	-- Reset Task më réng event chİnh th¸ng 2/2020
	if tonumber(date("%y%m%d%H")) >= 20021700 then
		if GetTask(2437) <= 274 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,275)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 3/2020
	if tonumber(date("%y%m%d%H")) >= 20031600 then
		if GetTask(2437) <= 275 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,276)
		end
	end	
	-- Reset Task më réng event chİnh th¸ng 4/2020
	if tonumber(date("%y%m%d%H")) >= 20031600 then
		if GetTask(2437) <= 276 then
			tTask = {2540}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,277)
		end
	end	
	-- Reset Task hç trî qu©n c«ng all server
	if tonumber(date("%y%m%d%H")) >= 20041400 then
		if GetTask(2437) <= 277 then
			tTask = {2739}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,278)
		end
	end
	-- Fix chuyen task HHVH 2693 -> 4607 , reset task fix loi lam giau + luyen mt bang nhan san van nam + mua banh dac che
	if tonumber(date("%y%m%d%H")) >= 20061800 then
		if GetTask(2437) <= 278 then
			SetTask(4607,GetTask(2693))
			tTask = {2693,4608}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,279)
		end
	end
	-- Reset Task mua b¸nh ®Æc chÕ 
	if tonumber(date("%y%m%d%H")) >= 20061700 then
		if GetTask(2437) <= 279 then
			tTask = {2743}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,280)
		end
	end
	-- Reset Task më réng event chİnh th¸ng 6/2020 + nhiÖm vô book15
	if tonumber(date("%y%m%d%H")) >= 20062200 then
		if GetTask(2437) <= 280 then
			tTask = {2540, 2172, 2282, 2430, 2701}
			for k,v in tTask do
				SetTask(v,0)
			end
			SetTask(2437,281)
		end
	end	
	------------------
end

-----------------------------
function DelEventItem()
	local nDate = tonumber(date("%y%m%d%H"))
	if GetTask(2436) == 0 then
		BigDelItem(2,1,30039,BigGetItemCount(2,1,30039))
		SetTask(2436,1)
	end
	if nDate >= 10102500 then
		if GetTask(2436) <= 1 then
			BigDelItem(2,1,30219,BigGetItemCount(2,1,30219))
			SetTask(2436,2)
		end
	end
	if nDate >= 10102500 then
		if GetTask(2436) <= 2 then
			BigDelItem(2,1,2639,BigGetItemCount(2,1,2639))
			SetTask(2436,3)
		end
	end
	if nDate >= 10102900 then
		if GetTask(2436) <= 3 then
			BigDelItem(2,1,30221,BigGetItemCount(2,1,30221))
			SetTask(2436,4)
		end
	end
	if nDate >= 10102900 then
		if GetTask(2436) <= 4 then
			BigDelItem(0,108,514 + GetBody() - 1,BigGetItemCount(0,108,514 + GetBody() - 1))
			BigDelItem(0,109,514 + GetBody() - 1,BigGetItemCount(0,109,514 + GetBody() - 1))
			BigDelItem(0,110,514 + GetBody() - 1,BigGetItemCount(0,110,514 + GetBody() - 1))
			SetTask(2436,5)
		end
	end
	if nDate >= 11021400 then
		if GetTask(2436) <= 5 then
			BigDelItem(2,0,361,BigGetItemCount(2,0,361))
			SetTask(2436,6)
		end
	end
end

--------------------------------------------
--Date : 09/11/2011
-- Add By : PhucBDB
------------------------------------------------------

function GetBitExt(nTask,nBitStart,nBitEnd)
	if (nBitStart > nBitEnd ) or ( nBitStart <1 ) or (nBitEnd > 32) then
		return 0;
	end;

	local Value = 0;
	local iBit = 1 ;
	local iTask = GetTask(nTask);

	for i = nBitStart,nBitEnd do
		Value = SetBit(Value, iBit,GetBit(iTask,i));
		iBit = iBit + 1;
	end;
	return Value;
end;

function SetBitExt(nTask,Value,nBitStart,nBitEnd)
	if (nBitStart > nBitEnd) or (nBitStart < 1 ) or (nBitEnd > 32)then
		return 0;
	end;

	local iBit =1 ;
	for i = nBitStart,nBitEnd do
		SetTask(nTask,SetBit(GetTask(nTask),i,GetBit(Value,iBit)));
		iBit = iBit +1;
	end;

end;

function GetByteExt( nTask,nByteStart,nByteEnd)
	if (nByteStart > nByteEnd)  or ( nByteStart < 1 ) or (nByteEnd > 4) then
		return 0;
	end;
	local iByte =1;
	local iTask_Value = GetTask(nTask);
	local Value = 0;

	for i=nByteStart,nByteEnd do	
		Value = SetByte(Value,iByte,GetByte(iTask_Value,i));
		iByte = iByte + 1;
	end;	
	return Value;
end;

function SetByteExt(nTask,Value,nByteStart,nByteEnd)	
	if (nByteStart > nByteEnd) or ( nByteStart <1) or (nByteEnd > 4) then
		return 0;
	end;
	
	local iByte = 1 ;
	for i = nByteStart,nByteEnd do
		SetTask(nTask,SetByte(GetTask(nTask),i,GetByte(Value,iByte)));
		iByte = iByte + 1 ;
	end;	
end;

-- Khoang thoi gian Event
function VietCheckEventDate()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 120113 and nDate <=120205   then
		return 1
	end
	return 0
end

--RESET mçi ngµy
function VietResetDate()
	local nDate = tonumber(date("%y%m%d"))
	local nCurdate = GetTask(TSK_EVERY_DATE)
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	if nDate ~= nCurdate then
		SetTask(TSK_EVERY_DATE, nDate)
--		SetTask(TSK_ACTIVE_VIP_THONUONG, 0)
--		SetTask(TSK_ACTIVE_VIP_PHAOHOA, 0)
--		SetTask(TSK_COUNT_EVERYDAY,0)
--		gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_BOX, 1)
		--SetTask(TSK_LUCKY_DAOHUU,0)	
--		SetTask(TSK_LUCKY_DAOHUU_NEW_THANG4,0)
		SetTask(TSK_LAMGIAU,0)
-- NhiÖm vô daily book15
		SetTask(2430,0)
		SetTask(2701,0)
-----------		
		SetTask(TSK_THAIHU_DOITHUONG,0)
		SetTask(TSK_THUQUANDUNG, floor(GetTask(TSK_THUQUANDUNG)/1000) * 1000)
--		KF_Daily_Reset() --reset tham gia chiÕn tr­êng liªn server
		gf_SetTaskByte(TSK_DONGHANH, 3, 0)
		gf_SetTaskBit(TSK_DONGHANH, 25, 0, 0)
		gf_SetTaskBit(TSK_DONGHANH, 26, 0, 0)
		gf_SetTaskByte(TSK_DONGHANH_COUNT, 1, 0)
		SetTask(TSK_THAIHU_DAY,0)
		--=======
		SetTask(TSK_LUCKY_STAR_201011, nDate * 1000)
		SetTask(2160, 0)	--task N÷ oa b¶o h¹p--VET_201003_01_TASK_GET_BAOHE_COUNT = 2160;
		SetTask(2156, 0)	--task N÷ oa b¶o h¹p--VET_201003_01_TASK_USE_BAOHE_COUNT = 2156;
		
		--==========Reset Task nhËn trang bŞ c­êng hãa V¨n Søc TSK_CUONGHOA_VANSUC = 2188	--Ch¹y ®Õn 31/10/2019 =======
--		if nDate <= 191031 then
--			SetTask(TSK_CUONGHOA_VANSUC, 0)	
--		end
		--==========Reset nhËn th­ëng online 022019- Reset nhËn th­ëng online 022018 =======
--		if nDate <= 200203 then
--			SetTask(2739, 0)		--set date online nhËn th­ëng 2020	TSK_Award_2018 = 2739 
--		end
		-----Dua Top Bang Hoi New Server
		if nServerID == 104 and (nDate >= 160315 and nDate <= 160523) then	-- Dua top cong hien bang NewServer NguyÖt ¦ng
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)
--			gf_SetTaskBit(2669, 8, 0,0)
		elseif nServerID == 105 and (nDate >= 160501 and nDate <= 160630) then	-- Dua top cong hien bang NewServer Duy Hæ
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)
		elseif nServerID == 106 and (nDate >= 160715 and nDate <= 160919) then	-- Dua top cong hien bang NewServer Quang Minh §Ønh
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)	
		elseif nServerID == 107 and (nDate >= 160805 and nDate <= 161015) then	-- Dua top cong hien bang NewServer Duy Long
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)		
		elseif nServerID == 108 and (nDate >= 161111 and nDate <= 170115) then	-- Dua top cong hien bang NewServer Th¸nh Háa
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)		
		elseif nServerID == 109 and (nDate >= 170101 and nDate <= 170305) then	-- Dua top cong hien bang NewServer ThiÕt ¦ng
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)			
		elseif nServerID == 110 and (nDate >= 170310 and nDate <= 170512) then	-- Dua top cong hien bang NewServer Thanh Long
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)	
		elseif nServerID == 111 and (nDate >= 170512 and nDate <= 170715) then	-- Dua top cong hien bang NewServer H¾c Hæ
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)	
		elseif nServerID == 112 and (nDate >= 170712 and nDate <= 170915) then	-- Dua top cong hien bang NewServer Háa ¦ng
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)		
		elseif nServerID == 113 and (nDate >= 170915 and nDate <= 171117) then	-- Dua top cong hien bang NewServer ThÇn Hæ
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)		
		elseif nServerID == 114 and (nDate >= 171115 and nDate <= 180117) then	-- Dua top cong hien bang NewServer Kim ¦ng
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)	
		elseif nServerID == 115 and (nDate >= 180101 and nDate <= 180301) then	-- Dua top cong hien bang NewServer Hoµng Hæ
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)	
		elseif nServerID == 116 and (nDate >= 180309 and nDate <= 180511) then	-- Dua top cong hien bang NewServer ChiÕn Long
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)	
		elseif nServerID == 117 and (nDate >= 180504 and nDate <= 180704) then	-- Dua top cong hien bang NewServer B¹ch ¦ng
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)	
		elseif nServerID == 118 and (nDate >= 180713 and nDate <= 180915) then	-- Dua top cong hien bang NewServer ChiÕn Hæ
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)	
		elseif nServerID == 119 and (nDate >= 180907 and nDate <= 181109) then	-- Dua top cong hien bang NewServer Ngäa Hæ
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)			
		elseif nServerID == 120 and (nDate >= 181115 and nDate <= 190115) then	-- Dua top cong hien bang NewServer Th¸nh Hæ
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)	
		elseif nServerID == 121 and (nDate >= 190101 and nDate <= 190302) then	-- Dua top cong hien bang NewServer Cuång Long
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)		
		elseif nServerID == 122 and (nDate >= 190307 and nDate <= 190507) then	-- Dua top cong hien bang NewServer Uy Hæ
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)
		elseif nServerID == 123 and (nDate >= 190501 and nDate <= 190701) then	-- Dua top cong hien bang NewServer Phi Hæ
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)		
		elseif nServerID == 124 and (nDate >= 190711 and nDate <= 190911) then	-- Dua top cong hien bang NewServer Hµng Long
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)
		elseif nServerID == 125 and (nDate >= 190905 and nDate <= 191105) then	-- Dua top cong hien bang NewServer HuyÕt Hæ
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)
		elseif nServerID == 126 and (nDate >= 191107 and nDate <= 200107) then	-- Dua top cong hien bang NewServer H¾c Long
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)	
		elseif nServerID == 127 and (nDate >= 200101 and nDate <= 200301) then	-- Dua top cong hien bang NewServer Kim Hæ
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)	
		elseif nServerID == 128 and (nDate >= 200318 and nDate <= 200518) then	-- Dua top cong hien bang NewServer S¸t Hæ
			VNG_SetTaskPos(TSK_CONGHIENBANG, 0, 4, 1)	
		end 
		-------------------------------
		--reset 2 vŞ trİ ®Çu mçi ngµy ®Ó mua b¸nh ®Æc chÕ (ko thêi gian kÕt thóc)
		VNG_SetTaskPos(TSK_BUY_BANHDACCHE, 0, 2, 1)	
		-----------------------------------------
--		SetTask(TSK_PHUCSINH2_COUNT,0)
--		SetTask(TSK_CTVL_COUNT,0)	--task nhiÖm vô mçi ngµy cña Chİ T«n V­¬ng LÖnh
--		VNG_SetTaskPos(TSK_CTVL_ALL, 0, 4, 4) --CTVL 4: nhËn th­ëng tæ ®éi trong ngµy
--		VNG_SetTaskPos(TSK_NOEL_DIEUDUONG, 0, 6, 6)	--event noel nhËn diÖu d­¬ng 3/1/2014 - 16/1/2014
--		VNG_SetTaskPos(TSK_NOEL_DIEUDUONG, 0, 4, 4)	
--		VNG_SetTaskPos(TSK_NOEL_DIEUDUONG, 0, 5, 5)	
--		if nDate <= 151218 then
--			gf_SetTaskBit(TSK_HOATDONGNEWSERVER_NHANTHUONG, 1, 0,0) -- DuaTop NewServer Server Thien Ho
--		end
		-- ========== Sinh tu vo nga 2 =============
--		VNG_SetTaskPos(TSK_SINHTUVONGA3, 0, 6, 2) -- Reset nhiem vu hang ngay
--		VNG_SetTaskPos(TSK_SINHTUVONGA1, 1, 9, 9)
		-- ========== Th¨ng TiÕn Phôc Sinh =============
--		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 0, 8, 4) -- Reset ®iÓm hµng ngµy
		
		-- =====================================
--		SetTask(TSK_123PAY1,0)
--		SetTask(TSK_123PAY2,0)
		
		--==========Reset Cuoc Chien Hoa Hong =======
--		if nDate <= 150426 then
--			SetTask(TSK_CUOCCHIENHOAHONG,0)
--		end
		
--		if nDate <= 150228 then
--			gf_SetTaskByte(TSK_DUATOPSERVERCANHAN,1,0)
--		end
		
		--Reset §Òn bï server Háa Phông
--		if nDate <= 141128 then
--			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,0)
--			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,0)
--		end
		
		--Reset NhËn th­ëng nhiÖm vô PVP CDKEY
--		gf_SetTaskByte(TSK_NHIEMVUCDKEY,1,0)
		
--		if nDate <= 150104 then
--			SetTask(TSK_QUAYSOMAYMAN,0)
--		end
--		if nDate <= 150114 then
--			gf_SetTaskByte(TSK_BAORUONG_TAINGUYEN,2,0)
--		end
		--Reset NhiÖm vu trång c©y 4/20150104
--		if nDate <= 150501 then
--			SetTask(TSK_NHIEMVUTRONGCAY,0)
--		end
		--Reset event th¸ng 9/2015
--		if nDate <= 150930 then
--			SetTask(TSK_EVENTTHANG9,0)
--			SetTask(TSK_KINHMACH_THANG9,SetByte(GetTask(TSK_KINHMACH_THANG9),1,0)); --Byte 1
--			SetTask(TSK_KINHMACH_THANG9,SetByte(GetTask(TSK_KINHMACH_THANG9),2,0)); --Byte 2
--		end
--		if nDate >= 151006 and nDate <= 151008 then
--			SetTask(TSK_EVENT_NIEMVUI,0)
--		end		
--		if nDate >= 151010 and nDate <= 151030 then
--			VNG_SetTaskPos(TSK_MATTICH_TIEUDAO, 0, 1, 1)	
--			VNG_SetTaskPos(TSK_MATTICH_TIEUDAO, 0, 2, 2)	
--		end
--		if nDate >= 151027 and nDate <= 151130 then
--			VNG_SetTaskPos(TSK_MATTICH_TIEUDAO, 0, 5, 3)				
--		end
--		if nDate == 151124 then
--			VNG_SetTaskPos(TSK_MATTICH_TIEUDAO, 0, 7, 7)				
--		end
--		if nDate >= 151125 and nDate <= 151130 then
--			VNG_SetTaskPos(TSK_EVENT_112015, 0, 2, 1)				
--		end
	end	
	
	local nWeek = tonumber(date("%W"))
	local nCurWeek = mod(GetTask(TSK_EVERY_WEEK),100)
	local nRemain = floor(GetTask(TSK_EVERY_WEEK)/100)
	if nCurWeek ~= nWeek then
		nRemain = nRemain * 100
		SetTask(TSK_EVERY_WEEK,nRemain + nWeek)
		SetTask(TSK_MTT_COUNT,0)
--		VNG_SetTaskPos(TSK_CTVL_ALL, 00, 3, 2) --CTVL 2: ®· x©y dùng bang trong tuÇn	3: ®· nhËn th­ëng BHCT trong tuÇn
--		VNG_SetTaskPos(TSK_CTVL_ALL, 0, 8, 8)	--CTVL 8: kich ho¹t Bang héi Chİ T«n
	end
end