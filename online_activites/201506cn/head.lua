Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\activity_head.lua")

g_debug = 0
g_t201506cn = {
	nStartDate=20150615,
	nEndDate=20150630,
	TASK_GROUP = TaskManager:Create(2, 21),
	tBossPos = {
    	[401] = {
    		"§iÓm Th­¬ng s¬n",
    		{401,1695,2985},
            {401,1507,2947},
            {401,1599,2862},
            {401,1586,2950},
            {401,1596,3068},
            {401,1610,3182},
    	},
    	[302] = {
    		"Thanh Thµnh s¬n",
    		{302,1532,3045},
            {302,1562,2893},
            {302,1457,2850},
            {302,1372,2989},
            {302,1335,3119},
            {302,1440,3132},
    	},
    	[505] = {
    		"D­îc V­¬ng cèc",
            {505,1360,3102},
            {505,1437,3024},
            {505,1542,3017},
            {505,1525,2869},
            {505,1402,2873},
            {505,1402,2805},
    	},
    },
    tKillNpc = {
		[401] = {--µã²ÔÉ½
			["Xi Háa §ao Kh¸ch"] = 1,
			["Xi Háa sø gi¶"] = 1,
		},
		[302] = {--Çà³ÇÉ½
			["KiÕm Tµ"] = 1,
		},
		[505] = {--Ò©Íõ¹È
			["T©y H¹ Vâ SÜ"] = 1,
			["T©y H¹ Dòng SÜ"] = 1,
		},
	},
	tMainAward = {
		[1] = {
			tAll = {
    			{1,"MËt Th­ T©y Vùc",{2,1,30870,1},0},
    			{1,"Cèng PhÈm T©y Vùc",{2,1,30871,50},0},
			},
			tRand = {
                { 1, 800, "H­¬ng LiÖu T©y Vùc", {2,1,30874, 2}, 0, },
                { 1, 800, "HuyÕt TrÝch Th¹ch CÊp 1", {2,22,101, 3}, 0, },
                { 1, 800, "NguyÖt B¹ch Th¹ch CÊp 1", {2,22,201, 3}, 0, },
                { 1, 800, "Hæ Ph¸ch Th¹ch CÊp 1", {2,22,301, 3}, 0, },
                { 1, 800, "H¾c DiÖu Th¹ch CÊp 1", {2,22,401, 3}, 0, },
                { 1, 250, "HuyÕt TrÝch Th¹ch CÊp 2", {2,22,102, 1}, 0, },
                { 1, 250, "NguyÖt B¹ch Th¹ch CÊp 2", {2,22,202, 1}, 0, },
                { 1, 250, "Hæ Ph¸ch Th¹ch CÊp 2", {2,22,302, 1}, 0, },
                { 1, 250, "H¾c DiÖu Th¹ch CÊp 2", {2,22,402, 1}, 0, },
                { 1, 50, "HuyÕt TrÝch Th¹ch CÊp 3", {2,22, 103, 1}, 0, },
                { 1, 50, "NguyÖt B¹ch Th¹ch CÊp 3", {2,22,203, 1}, 0, },
                { 1, 50, "Hæ Ph¸ch Th¹ch CÊp 3", {2,22,303, 1}, 0, },
                { 1, 50, "H¾c DiÖu Th¹ch CÊp 3", {2,22,403, 1}, 0, },
                { 1, 450, "Cöu ChuyÓn Hoµn Hån §an", {1,0,32, 1}, 0, },
                { 1, 50, "Thiªn Kiªu LÖnh", {2,97,236, 1}, 0, },
                { 1, 100, "Tu Ch©n YÕu QuyÕt", {2,0,554, 1}, 3600*24*7, },
                { 1, 400, "TiÓu Nh©n s©m qu¶", {2,0,552, 1}, 0, },
                { 1, 900, "ThiÕt Tinh cÊp 1", {2,1,30533, 2}, 0, },
                { 1, 500, "ThiÕt Tinh cÊp 2", {2,1,30534, 1}, 0, },
                { 1, 600, "H¾c Ngäc §o¹n Tôc Cao", {1,0,6, 3}, 0, },
                { 1, 600, "Sinh Sinh Hãa T¸n", {1,0,16, 3}, 0, },
                { 1, 600, "V¹n VËt Quy Nguyªn §¬n", {1,0,11, 3}, 0, },
                { 1, 600, "Tiªu KiÕp t¸n", {2,0,141, 1}, 3600*24*7, },
        	},
		},
		[2] = {
			nMaxCnt = 100,
			tAll = {
				--{2,100000},--exp
			},
			tRand = {
                { 1, 1500, "H¾c Ngäc §o¹n Tôc Cao", {1,0,6, 1, 4}, 0, },
                {2, 1500, 500000},--exp
                {2, 1100, 1000000},--exp
                {2, 800, 1500000},--exp
                {2, 600, 2000000},--exp
                {2, 400, 4000000},--exp
                { 1, 300, "VÐ TiÕu Y §ång", {2,1,30493, 1, 4}, 0, },
                { 1, 100, "VÐ TiÕu Y B¹c", {2,1,30492, 1, 4}, 0, },
                { 1, 100, "ThiÕt Tinh cÊp 1", {2,1,30533, 1, 4}, 0, },
                { 1, 80, "ThiÕt Tinh cÊp 2", {2,1,30534, 1, 4}, 0, },
                { 1, 20, "ThiÕt Tinh cÊp 3", {2,1,30535, 1, 4}, 0, },
                { 1, 109, "Cöu ChuyÓn Hoµn Hån §an", {1,0,32, 1, 4}, 0, },
                { 1, 1, "H­¬ng LiÖu T©y Vùc", {2,1,30874, 1}, 0, },
                { 1, 20, "Hu©n ch­¬ng anh hïng", {2,1,30499, 1, 4}, 0, },
                { 1, 20, "M¶nh Thiªn Cang", {2,1,30390, 1, 4}, 0, },
                { 1, 20, "M¶nh Thiªn M«n", {2,1,30410, 1, 4}, 0, },
                { 1, 29, "C©y B¸t Nh·", {2, 0,398, 1, 4}, 0, },
                { 1, 50, "TiÓu Nh©n s©m qu¶", {2,0,552, 1, 4}, 0, },
                { 1, 10, "§Êu hån", {2,1,1157, 1, 4}, 3600*24*7, },
                { 1, 10, "HuyÕt TrÝch Th¹ch CÊp 1", {2,22,101, 1}, 0, },
                { 1, 10, "NguyÖt B¹ch Th¹ch CÊp 1", {2,22,201, 1}, 0, },
                { 1, 10, "Hæ Ph¸ch Th¹ch CÊp 1", {2,22,301, 1}, 0, },
                { 1, 10, "H¾c DiÖu Th¹ch CÊp 1", {2,22,401, 1}, 0, },
                { 1, 1500, "Sinh Sinh Hãa T¸n", {1,0,16, 1, 4}, 0, },
                { 1, 1500, "V¹n VËt Quy Nguyªn §¬n", {1,0,11, 1, 4}, 0, },
                { 1, 100, "B¨ng th¹ch", {2,1,149, 1, 4}, 0, },
                { 1, 1, "Thiªn Kiªu LÖnh", {2,97,236, 1, 4}, 0, },
                { 1, 100, "Tiªu KiÕp t¸n", {2,0,141, 1, 4}, 3600*24*7, },
			},
		},
		[3] = {
			nMaxCnt = 1000,
			tAll = {
				--{2,100000},--exp
				{1,"M¶nh Thiªn Cang",{2,1,30390,5},0},
			},
			tRand = {
			 	{ 1, 400, "H¾c Ngäc §o¹n Tôc Cao", {1,0,6, 3}, 0, },
                { 1, 400, "Sinh Sinh Hãa T¸n", {1,0,16, 3}, 0, },
                { 1, 400, "V¹n VËt Quy Nguyªn §¬n", {1,0,11, 3}, 0, },
                { 1, 5, "Háa Phông Linh", {2,1,30769, 1}, 0, 0, 0,  1 },
                { 1, 150, "M¶nh Thiªn Cang", {2,1,30390, 5}, 0, },
                { 1, 50, "Thiªn M«n Kim LÖnh", {2,1,30370, 1}, 0, },
                { 1, 140, "M¶nh Thiªn M«n", {2,1,30410, 5}, 0, },
                { 1, 200, "Th¸i NhÊt LÖnh", {2,1,30687, 1}, 0, },
                { 1, 550, "HuyÕt TrÝch Th¹ch CÊp 1", {2,22,101, 1}, 0, },
                { 1, 550, "NguyÖt B¹ch Th¹ch CÊp 1", {2,22,201, 1}, 0, },
                { 1, 550, "Hæ Ph¸ch Th¹ch CÊp 1", {2,22,301, 1}, 0, },
                { 1, 550, "H¾c DiÖu Th¹ch CÊp 1", {2,22,401, 1}, 0, },
                { 1, 400, "HuyÕt TrÝch Th¹ch CÊp 2", {2,22,102, 1}, 0, },
                { 1, 400, "NguyÖt B¹ch Th¹ch CÊp 2", {2,22,202, 1}, 0, },
                { 1, 400, "Hæ Ph¸ch Th¹ch CÊp 2", {2,22,302, 1}, 0, },
                { 1, 400, "H¾c DiÖu Th¹ch CÊp 2", {2,22,402, 1}, 0, },
                { 1, 100, "HuyÕt TrÝch Th¹ch CÊp 3", {2,22, 103, 1}, 0, },
                { 1, 100, "NguyÖt B¹ch Th¹ch CÊp 3", {2,22,203, 1}, 0, },
                { 1, 100, "Hæ Ph¸ch Th¹ch CÊp 3", {2,22,303, 1}, 0, },
                { 1, 100, "H¾c DiÖu Th¹ch CÊp 3", {2,22,403, 1}, 0, },
                { 1, 50, "HuyÕt TrÝch Th¹ch CÊp 4", {2,22,104, 1}, 0, },
                { 1, 50, "NguyÖt B¹ch Th¹ch CÊp 4", {2,22,204, 1}, 0, },
                { 1, 50, "Hæ Ph¸ch Th¹ch CÊp 4", {2,22,304, 1}, 0, },
                { 1, 50, "H¾c DiÖu Th¹ch CÊp 4", {2,22,404, 1}, 0, },
                { 1, 350, "LuyÖn L« ThiÕt CÊp 3", {2,1,30529, 1}, 0, },
                { 1, 350, "TÈy T©m Th¹ch CÊp 3", {2,1,30523, 1}, 0, },
                { 1, 190, "LuyÖn L« ThiÕt CÊp 4", {2,1,30530, 1}, 0, },
                { 1, 190, "TÈy T©m Th¹ch CÊp 4", {2,1,30524, 1}, 0, },
                { 1, 600, "ThiÕt Tinh cÊp 1", {2,1,30533, 1}, 0, },
                { 1, 400, "ThiÕt Tinh cÊp 2", {2,1,30534, 1}, 0, },
                { 1, 225, "ThiÕt Tinh cÊp 3", {2,1,30535, 1}, 0, },
                { 1, 200, "Tiªu KiÕp t¸n", {2,0,141, 1}, 3600*24*7, },
                { 1, 500, "B¨ng th¹ch", {2,1,149, 1}, 0, },
                { 1, 50, "Tu Ch©n YÕu QuyÕt", {2,0,554, 1}, 3600*24*7, },
                { 1, 800, "Cöu ChuyÓn Hoµn Hån §an", {1,0,32, 1}, 0, },
			},
		},
	},
}

function is_in_activity_date()
	if g_debug==1 then
		return 1
	end
	local today = tonumber(date("%Y%m%d"));
	if today >= g_t201506cn.nStartDate and today <= g_t201506cn.nEndDate then
		return 1
	end
	return 0
end

function check_player_condition()
	if is_in_activity_date() ~= 1 then
		return 0
	end
	if get_trans_level() < 90 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",format("CÊp %d trë lªn, ®· häc 1 bé kü n¨ng cÊp 55 míi ®­îc tham gia ho¹t ®éng.", 90))
		return 0;
	end
	return 1
end

function get_trans_level()
	return gf_GetPlayerRebornCount()*100+GetLevel()
end

function get_task(nIndex)
	local TASK_GROUP = g_t201506cn.TASK_GROUP
	return TASK_GROUP:GetTask(nIndex)
end

function set_task(nIndex,nValue)
	local TASK_GROUP = g_t201506cn.TASK_GROUP
	return TASK_GROUP:SetTask(nIndex,nValue)
end

function add_task(nIndex)
	set_task(nIndex, get_task(nIndex)+1)
end

function pack_item_id(g,d,p)
	return p+d*100000+g*10*100000
end