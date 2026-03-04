
GBL_SERVER_COUNT = 0
TASK_STATUS_FINISH=255
tTasks = {
	[1] = {
        {"TuyÕt Ph¸ch", {2,1,45,50}, "B¨ng Qu¸i", "B¨ng T©m ®éng_2" },
        {"Ngäc Nh­ ý", {2,1,87,50}, "B¨ng T©m N÷", "B¨ng T©m ®éng_2" },
        {"DÞ Téc Qu¶i Liªn", {2,1,164,50}, "Xi Háa §ao Kh¸ch", "V©n Méng Tr¹ch" },
        {"MÉu §¬n", {2,1,76,50}, "H¾c Phong KiÕm Kh¸ch", "H¾c Phong ®éng" },
        {"da Th­¬ng Viªn", {2,1,166,50}, "Th­¬ng Viªn", "Vò Di s¬n" },
        {"Töu B«i", {2,1,44,50}, "§ao V­¬ng", "D­¬ng Trung ®éng-3" },
	},
	[2] = {
        {"TuyÕt Tinh", {2,1,22,3}, "TuyÕt Qu¸i", "B¨ng T©m ®éng_1" },
        {"D¹ Minh Ch©u", {2,1,39,3}, "N÷ HiÖp Kh¸ch", "Tróc Ty ®éng_1" },
        {"Hæ Ph¸ch", {2,1,84,3}, "Trïng Qu¸i", "Thiªn S­ ®éng-1" },
        {"HuyÔn Quang", {2,1,99,3}, "Trïng Qu¸i V­¬ng", "Thiªn S­ ®éng-2" },
        {"DÞ Téc Qu¶i Liªn", {2,1,164,50}, "Xi Háa §ao Kh¸ch", "V©n Méng Tr¹ch" },
        {"Töu B«i", {2,1,44,50}, "§ao V­¬ng", "D­¬ng Trung ®éng-3" },
	},
	[3] = {
        {"TuyÕt Tinh", {2,1,22,3}, "TuyÕt Qu¸i", "B¨ng T©m ®éng_1" },
        {"D¹ Minh Ch©u", {2,1,39,3}, "N÷ HiÖp Kh¸ch", "Tróc Ty ®éng_1" },
        {"Hæ Ph¸ch", {2,1,84,3}, "Trïng Qu¸i", "Thiªn S­ ®éng-1" },
        {"HuyÔn Quang", {2,1,99,3}, "Trïng Qu¸i V­¬ng", "Thiªn S­ ®éng-2" },
        {"MÉu §¬n", {2,1,76,50}, "H¾c Phong KiÕm Kh¸ch", "H¾c Phong ®éng" },
        {"Ch©n thá", {2,1,112,1}, "Thá rõng", "B¶n ®å chu vi thµnh chÝnh" },
	},
	[4] = {
        {"D¹ Minh Ch©u", {2,1,39,3}, "N÷ HiÖp Kh¸ch", "Tróc Ty ®éng_1" },
        {"Hæ Ph¸ch", {2,1,84,3}, "Trïng Qu¸i", "Thiªn S­ ®éng-1" },
        {"TuyÕt Ph¸ch", {2,1,45,50}, "B¨ng Qu¸i", "B¨ng T©m ®éng_2" },
        {"Ngäc Nh­ ý", {2,1,87,50}, "B¨ng T©m N÷", "B¨ng T©m ®éng_2" },
        {"da Th­¬ng Viªn", {2,1,166,50}, "Th­¬ng Viªn", "Vò Di s¬n" },
        {"Töu B«i", {2,1,44,50}, "§ao V­¬ng", "D­¬ng Trung ®éng-3" },
	},
}

tTaskRand = {
	[1] = {
		1,1,1,1,1,
		2,2,2,2,
		3,
	},
	[2] = {
		1,1,1,1,1,
		4,4,4,4,4,
	},
}

tTaskAward = {
	[1] = {
		--¾­Ñé£¬»ý·Ö£¬°ü°ü
		{{30000,  0, 0},  {35000,  0, 0}},
		{{60000,  1, 0},  {68000,  2, 0}},
		{{80000,  2, 0},  {90000,  3, 0}},
		{{100000, 3, 0},  {120000, 4, 0}},
		{{150000, 4, 1},  {180000, 5, 2}},
		{{300000, 5, 0},  {340000, 6, 0}},
		{{400000, 6, 0},  {450000, 7, 0}},
		{{500000, 7, 0},  {560000, 8, 0}},
		{{600000, 8, 0},  {670000, 9, 0}},
		{{700000, 14, 2}, {780000, 15, 3}},
		{{900000, 0, 5},  {990000, 0, 7}},
	},
	[2] = {
		{{30000,  0, 0},  {35000,  0, 0}},
		{{60000,  2, 0},  {68000,  3, 0}},
		{{80000,  3, 0},  {90000,  4, 0}},
		{{100000, 4, 1},  {120000, 5, 1}},
		{{150000, 5, 1},  {180000, 6, 2}},
		{{300000, 6, 1},  {340000, 7, 2}},
		{{400000, 7, 2},  {450000, 8, 2}},
		{{500000, 8, 2},  {560000, 9, 3}},
		{{600000, 9, 2},  {670000, 10, 3}},
		{{700000, 16, 3}, {780000, 17, 4}},
		{{900000, 0, 8},  {990000, 0, 10}},
	},
}
tItemBox = {
	{"Quµ Song §¸n-Th­êng",2,1,30971},
	{"Quµ Song §¸n-Hµo Hoa",2,1,30972},
}

tFinalAward = {
	{500, {2,2,8,2,4}
	},
	{1000, {2,1,30493,3,4}
	},
	{2000, {2,1,30913,2,4}
	},
}
OPEN_IB_TREE_GOLD=80

function get_cur_task(nType, bGen)
	local szTask = format("id_task_%d", nType)
	local nCurTask = get_task_byte(szTask, "byte_task")
	if 0 == nCurTask and bGen then
		local nStep = get_task_byte(szTask, "byte_step") + 1
		if nType == 2 and nStep == 1 then
			if bGen == 1 then
				local szTitle = format("<color=green>%s:<color> Më C©y Noel-Hµo Hoa cÇn tiªu hao %d Vµng, ®ång ý?", GetTargetNpcName(), OPEN_IB_TREE_GOLD)
            	local tSay = {}
            	tinsert(tSay, format("%s/#get_cur_task(%d,2)", "X¸c ®Þnh më", nType))
            	tinsert(tSay, format("%s/nothing", "Rêi khái"))
            	Say(szTitle, getn(tSay), tSay)
            	return 0
			else
				if Pay(OPEN_IB_TREE_GOLD*10000) ~= 1 then
					Talk(1, "", format("Trªn ng­êi hiÖp sÜ kh«ng ®ñ %d Vµng", OPEN_IB_TREE_GOLD))
					return 0
				end
			end
		end
		nCurTask = _get_rand_task(nType, nStep)
		set_task_byte(szTask, "byte_task", nCurTask)
	end
	return nCurTask
end

function get_step(nType)
	local szTask = format("id_task_%d", nType)
	local nStep = get_task_byte(szTask, "byte_step")
	return nStep
end

function finish_task(nType)
	local szTask = format("id_task_%d", nType)
	local nCurTask = get_task_byte(szTask, "byte_task")
	local nStep = get_task_byte(szTask, "byte_step") + 1
	if gf_JudgeRoomWeight(1, 100) ~= 1 then
		return 0
	end
	if nCurTask > 0 then
--		if nCurTask == TASK_STATUS_FINISH then
--			return
--		end
		local t = _get_task_cfg_(nCurTask)
		local tt = t[2]
		if DelItem(tt[1],tt[2],tt[3],tt[4]) == 1 then
			--set_task_byte(szTask, "byte_task", TASK_STATUS_FINISH)
			get_task_award(nType, nStep)
			Talk(1, "", format("Sau khi trang trÝ %s lªn trªn c©y, qu¶ nhiªn ®Ñp h¬n rÊt nhiÒu.", t[1]))
			return 1
		else
			Talk(1, "", format("H×nh nh­ kh«ng cã %d %s, mau ®Õn %s t×m trªn ng­êi cña %s nµo!", tt[4], t[1], t[4], t[3]))
		end
	end
	return 0
end

function _get_rand_task(nType, nStep)
	local nGroup = tTaskRand[nType][nStep]
	local nRet = 0
	if nGroup then
		local r = random(1,getn(tTasks[nGroup]))
		nRet = nGroup*10 + r
	end
	return nRet
end
function _get_task_cfg_(nTask)
	if nTask == TASK_STATUS_FINISH then return nil end
	local nGroup = floor(nTask / 10)
	local nIdx = mod(nTask,10)
	return tTasks[nGroup][nIdx]
end

function get_task_award(nType, nStep)
	local szTask = format("id_task_%d", nType)
	local nCurTask = get_task_byte(szTask, "byte_task")
	if nStep > getn(tTaskAward[nType]) then
		--Talk(1, "", "±¾ÂÖ×°ÊÎÒÑ´ïµ½×î¸ß½×¶Î£¬ÎÞ·¨ÔÙ½øÐÐ×°ÊÎ¡£")
		return
	end 
--	if nCurTask ~= TASK_STATUS_FINISH then
--		return 0
--	end
	local t = tTaskAward[nType][nStep]
	local tAward = t[1]
	if IsActivatedVipCard() == 1 then
		tAward = t[2]
	end
	local nLevel = GetLevel()
	local nExp = floor(tAward[1] * (nLevel^3)/(80^3))
	ModifyExp(nExp)
	Msg2Player(format("NhËn ®­îc %d Exp", nExp))
	if tAward[2] > 0 then
		add_task("id_score", tAward[2])
		Msg2Player(format("Chóc mõng b¹n ®· nhËn ®­îc %d ®iÓm trang trÝ", tAward[2]))
	end
	if tAward[3] > 0 then
		local tItem = tItemBox[nType]
		AddItem(tItem[2],tItem[3],tItem[4],tAward[3])
		Msg2Player(format("NhËn ®­îc %d %s", tAward[3], tItem[1]))
	end
	add_task_byte(szTask, "byte_step", 1)
	set_task_byte(szTask, "byte_task", 0)
	return 1
end

function get_server_award(nIdx)
	if get_task_bit("id_server_award", nIdx) == 1 then
		Talk(1, "", "§· nhËn phÇn th­ëng nµy råi")
		return
	end
	if gf_JudgeRoomWeight(1, 100) ~= 1 then
		return 0
	end
	if get_step(1) ~= getn(tTaskAward[1]) or get_step(2) ~= getn(tTaskAward[2]) then
		Talk(1, "", "H«m nay ch­a hoµn thµnh l­ît 2 nhiÖm vô trang trÝ C©y Noel")
		return
	end
	local t = tFinalAward[nIdx]
	if get_server_count() < t[1] then
		Talk(1, "", format("L­ît tÝch lòy cña server ch­a ®¹t ®Õn %d", t[1]))
		return
	end
	local tt = t[2]
	AddItem(tt[1],tt[2],tt[3],tt[4],tt[5])
	set_task_bit("id_server_award", nIdx, 1)
	Talk(1, "", "NhËn th­ëng thµnh c«ng")
end

function get_server_count()
end

function add_server_count()
end
