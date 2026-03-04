Include("\\script\\online_activites\\reborn\\tongban\\head.lua");
Include("\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua");


t_pet_type = {
	[2] = {
				[1] = {"§éc Gi¸p Trïng",4750,3},
				[2] = {"D¬i",4750,4},
				[3] = {"Hå Ly",500,5},				
			},
			
	[3]= 	{
				[1] = {"Sãi rõng",3000,1},
				[2] = {"Qu¹ §en",3000,2},
				[3] = {"C¸ sÊu",2950,3},
				[4] = {"Cãc",400,4},	
				[5] = {"D¬i löa",300,5},	
				[6] = {"Bß c¹p",100,6},	
				[7] = {"Ng©n Hå",100,7},	
				[8] = {"Th­¬ng Viªn",50,8},	
				[9] = {"Thô Qu¸i",50,9},	
				[10] = {"GÊu x¸m",40,10},	
				[11] = {"Ong ®éc",9,11},	
				[12] = {"Kim Gi¸p",1,12},	
		 	},
	[4]= 	{
				[1] = {"Hång Bµo Sø Gi¶",3500,13,2},
				[2] = {"T©y B¾c Tr¸ng H¸n",3000,14,1},
				[3] = {"NhÊt PhÈm §­êng MËt Sø",3000,15,1},
				[4] = {"Xi Háa Tr­ëng L·o",400,16,1},	
				[5] = {"Oa KhÊu",90,17,1},	
				[6] = {"Tiªn N÷",4,18,2},	
				[7] = {"N÷ Tiªu Tiªn",4,19,2},	
				[8] = {"Tr× M©u Hé VÖ",2,20,1},	
		 	},
}

t_pet_step =
{
	[2] = 0,
	[3] = 0,
	[4] = 12,
}

function OnUse(nItemIdx)
	Say("Më Trøng ngÉu nhiªn ®Ó cã ®­îc c¸c lo¹i B¹n §ång Hµnh kh¸c. B¹n cã muèn më  trøng kh«ng?", 5, format("§ång ý (cÇn 1 Bµn cæ phñ)/#open_egg(%d)",nItemIdx), "LuyÖn ThuÇn Thó ThuËt cÊp 1/learn_subskill_1_active", format("Ta muèn ®Ëp trøng nhËn 10 ®iÓm Linh Lùc/#receive_pet_god_point(%d)", nItemIdx), format("Ta muèn ®Ëp trøng nhËn 30 ®iÓm N©ng CÊp/#receive_pet_upgrade_point(%d)", nItemIdx), "T¹m thêi cÊt ®i/gf_DoNothing")
end

function open_egg(nItemIdx)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurLevel < 2 then
		Talk(1,"","B¹n §ång Hµnh ®¼ng cÊp 2 trë lªn míi cã thÓ sö dông vËt phÈm nµy!")
		return
	end
	if GetItemCount(0,200,26) < 1 then
		Talk(1,"","CÇn ph¶i cã 1 Bµn cæ phñ ®Ó khai më trøng nµy!")
		return
	end
	if DelItem(0,200,26,1) == 1 then
		if DelItemByIndex(nItemIdx,-1) == 1 then
			local nRand = gf_GetRandItemByTable(t_pet_type[nCurLevel],10000,1)
			local szPetType = t_pet_type[nCurLevel][nRand][1]
			Say("Chóc mõng b¹n ®· nhËn ®­îc 1 <color=yellow>"..szPetType.."<color>. B¹n cã muèn nhËn lµm B¹n §ång Hµnh?",2,format("Ta ®ång ý!/#confirm_open_egg(%d)",nRand),"Kh«ng muèn nhËn/gf_DoNothing")		
		end	
	end
end

function confirm_open_egg(nRand)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE, t_pet_type[nCurLevel][nRand][3])
	-- Set giíi tÝnh cho pet cÊp 4 trë lªn
	if nCurLevel >= 4 then
		gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_SEX, t_pet_type[nCurLevel][nRand][4])
	end
	Say("Chóc mõng b¹n ®· nhËn ®­îc 1 <color=yellow>"..t_pet_type[nCurLevel][nRand][1].."<color>!",0)
	WriteLogEx("Ban Dong Hanh","nhËn ®­îc B¹n §ång Hµnh",1,t_pet_type[nCurLevel][nRand][1])
end

function receive_pet_god_point(nItemIdx)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurLevel < 2 then
		Talk(1,"","B¹n §ång Hµnh ®¼ng cÊp 2 trë lªn míi cã thÓ sö dông tÝnh n¨ng nµy!")
		return
	end
	
	local nDate = tonumber(date("%y%m%d"))
--	local nLastDate = floor(GetTask(TSK_RANDOMIZE_EGG) / 100)
--	if nLastDate ~= nDate then
--		SetTask(TSK_RANDOMIZE_EGG, nDate * 100)
--	end
	
--	local nIsUsed = mod(GetTask(TSK_RANDOMIZE_EGG), 10)
--	if nIsUsed >= 2 then
--		Talk(1,"","H«m nay b¹n ®· sö dông tÝnh n¨ng nµy ®ñ 2 lÇn!")
--		return
--	end
	
	if DelItemByIndex(nItemIdx, 1) == 1 then
--		SetTask(TSK_RANDOMIZE_EGG, GetTask(TSK_RANDOMIZE_EGG) + 1)
		Pet_AddGP(10)
		Msg2Player("B¹n nhËn ®­îc 10 ®iÓm linh lùc!")
		gf_WriteLogEx("Trung Ngau Nhien", "sö dông ®­îc 10 ®iÓm Linh Lùc")
	end
end

function receive_pet_upgrade_point(nItemIdx)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurLevel < 1 then
		Talk(1,"","Ph¶i cã B¹n §ång Hµnh  1 míi cã thÓ sö dông tÝnh n¨ng nµy!")
		return
	end
	
	local nDate = tonumber(date("%y%m%d"))
--	local nLastDate = floor(GetTask(TSK_RANDOMIZE_EGG) / 100)
--	if nLastDate ~= nDate then
--		SetTask(TSK_RANDOMIZE_EGG, nDate * 100)
--	end
	
--	local nIsUsed = floor(mod(GetTask(TSK_RANDOMIZE_EGG), 100) / 10)
--	if nIsUsed >= 3 then
--		Talk(1,"","H«m nay b¹n ®· sö dông tÝnh n¨ng nµy ®ñ 3 lÇn!")
--		return
--	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
--		SetTask(TSK_RANDOMIZE_EGG, GetTask(TSK_RANDOMIZE_EGG) + 10)
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (3000))
		Msg2Player("B¹n nhËn ®­îc 30 ®iÓm n©ng cÊp B¹n §ång Hµnh!")
		gf_WriteLogEx("Trung Ngau Nhien", "sö dông ®­îc 30 ®iÓm N©ng CÊp BDH")
	end
end