Import("\\settings\\static_script\\lib\\globalfunction\\gf_task.lua")
Include("\\script\\missions\\yp\\yp_head.lua")
tCfg = {
	TASK_ID_PERSONAL_SCORE= 3382,
	WORD_IDX_SCORE = 1,
	BIT_IDX_PERSONAL_AWARD=17,
	BIT_IDX_SHILI_AWARD=18,
	KILL_NPC_RAND = 1,
	KILL_SLY_BOSS_NPC_RAND = 1000,
	KILL_NPC_RAND_MAX = 10000,
	PERSONAL_AWARD_SCORE = 10,
	SHILI_AWARD_THRESHHOLD = 1,
	SLY_BOSS_NPC_MAX_DROP = 1000,
	
	tNpcPos = {
        {6300,1191,3391},
        {6300,1207,3361},
        {6300,1239,3394},
        {6300,1275,3405},
        {6300,1308,3393},
        {6300,1290,3365},
        {6300,1286,3324},
        {6300,1261,3305},
        {6300,1258,3274},
        {6300,1259,3232},
        {6300,1235,3215},
        {6300,1236,3181},
        {6300,1249,3293},
        {6300,1228,3325},
        {6300,1189,3354},
        {6300,1162,3307},
        {6300,1196,3303},
        {6300,1200,3263},
        {6300,1231,3195},
        {6300,1192,3176},
        {6300,1148,3210},
        {6300,1138,3172},
        {6300,1181,3161},
        {6300,1167,3121},
        {6300,1206,3143},
        {6300,1267,3150},
        {6300,1226,3094},
        {6300,1191,3058},
        {6300,1248,3068},
        {6300,1229,3030},
        {6300,1264,2959},
        {6300,1303,2989},
        {6300,1295,2944},
        {6300,1291,2894},
        {6300,1320,2927},
        {6300,1317,2994},
        {6300,1329,3030},
        {6300,1360,3002},
        {6300,1342,2951},
        {6300,1371,2903},
        {6300,1397,3011},
        {6300,1409,3069},
        {6300,1442,3023},
        {6300,1421,2989},
        {6300,1473,3102},
        {6300,1349,3167},
        {6300,1434,3202},
        {6300,1474,3110},
        {6300,1489,3054},
        {6300,1488,3190},
        {6300,1505,3264},
        {6300,1433,2947},
        {6300,1476,2978},
        {6300,1494,3111},
        {6300,1530,3172},
        {6300,1421,3311},
        {6300,1481,3318},
        {6300,1408,3351},
        {6300,1349,3361},
        {6300,1378,3405},
        {6300,1421,3388},
        {6300,1464,3383},
        {6300,1503,3374},
        {6300,1501,3336},
        {6300,1454,3338},
        {6300,1409,3451},
        {6300,1440,3482},
        {6300,1403,3510},
        {6300,1362,3474},
        {6300,1331,3470},
        {6300,1308,3516},
        {6300,1357,3554},
        {6300,1397,3556},
        {6300,1448,3554},
        {6300,1467,3465},
        {6300,1501,3461},
        {6300,1504,3418},
        {6300,1541,3394},
        {6300,1542,3351},
        {6300,1571,3382},
        {6300,1572,3274},
        {8300,1543,3281},
        {6300,1578,3216},
        {6300,1561,3196},
        {6300,1521,3233},
        {6300,1539,3171},
        {6300,1520,3134},
        {6300,1325,3354},
        {6300,1297,3397},
        {6300,1287,3445},
	},
	tBossPos = {
        {6300,1424,3566},
        {6300,1281,3373},
        {6300,1180,3224},
        {6300,1288,3114},
        {6300,1370,2914},
        {6300,1442,3059},
        {6300,1537,3215},
        {6300,1497,3361},
	},
	tNpcDeathAward = {
		--szCustomAward, nScore
		["Thiªn ¢m §µo Vong Gi¶"] = {"adventureboss_sly", 1},
		["S¸t thñ Thiªn ¢m Gi¸o"] = {"worldboss_sly", 1, 1},
		["Tiªn phong Thiªn D­¬ng Giao"] = {"worldboss_sly1", 1,  10},
		["Tinh hoa Thiªn D­¬ng Giao"] = {"worldboss_sly2", 1,  20},
		["Ngôy HÇu V­¬ng"] = {"worldboss_sly3",  1, 50},
	},
}
function tCfg:kill_npc_rand()
	if random(self.KILL_NPC_RAND_MAX) <= self.KILL_NPC_RAND then--1/10000¸ÅÂÊË¢³öÌìÒõ·Ö¶æÌÓÍöÕß
		return 1
	end
	return 0
end
function tCfg:sly_boss_kill_npc_rand()
	if random(self.KILL_NPC_RAND_MAX) <= self.KILL_SLY_BOSS_NPC_RAND then--1/10¸ÅÂÊË¢³öÌìÒõ½ÌÉ±ÊÖ
		return 1
	end
	return 0
end
function tCfg:get_rand_npc_pos()
	local nRand = random(1,getn(self.tNpcPos))
	local t = self.tNpcPos[nRand]
	return unpack(t)
end
function tCfg:get_rand_boss_pos()
	local nRand = random(1,getn(self.tBossPos))
	local t = self.tBossPos[nRand]
	return unpack(t)
end


t_data = {
	t_shiluoya_boss = {
		enable=nil,
		enable_award = nil,
		boss_killer = nil,
		shashou_boss_create_cnt = 0,
	},
	t_npc_list = {},
	t_shili_score = {
		--{nCamp, Score,Rank}
		{1, 0, 0},
		{2, 0, 0},
		{3, 0, 0},
	},--ÊÆÁ¦»ý·Ö
	t_shili_rank = nil,
}

function t_data:clear()
	self.t_shili_score = {
		{1, 0, 0},
		{2, 0, 0},
		{3, 0, 0},
	}
	self.t_shili_rank = nil
	self.t_shiluoya_boss.enable = nil
	self.t_shiluoya_boss.enable_award = nil
	self.t_shiluoya_boss.boss_killer = nil
	self.shashou_boss_create_cnt = 0
end

function t_data:rank()
	local t = self.t_shili_score
	local nMax = 3
	for i = 1, nMax do --Ã°ÅÝÅÅÐò
		for j = i + 1, nMax do
			if t[j][2] > t[i][2] then
				t[i], t[j] = t[j], t[i]
			end
		end
	end
	
	local nRank = 1
	local tRank = {}
	for i = 1, nMax do--Éú³ÉÅÅÃû
		if t[i][2] > tCfg.SHILI_AWARD_THRESHHOLD then--ÓÐ»ý·ÖµÄ²ÅÅÅÃû
			t[i][3] = nRank
		end
		if i < nMax and t[i+1][2] < t[i][2] then
			nRank = nRank + 1
		end
		tRank[t[i][1]] = t[i] --°´ÊÆÁ¦ÅÅÐò
	end
	self.t_shili_rank = self.t_shili_score--°´Ãû´Î
	self.t_shili_score = tRank--°´ÊÆÁ¦ÐòºÅ
end

function t_data:create_npc(szTemplate, szName, nMap, nX, nY, nLifeTime)
	local npc = CreateNpc(szTemplate, szName, nMap, nX, nY )
	if npc > 0 then
		SetNpcDeathScript(npc, isolate_main_script())
    	if nLifeTime and nLifeTime > 0 then
    		SetNpcLifeTime(npc, nLifeTime) --Éú´æÊ±¼ä
    	end
    	self.t_npc_list[npc] = szName--´´½¨¹ýµÄnpc¼ÇÂ¼ÏÂÀ´
	end
	return npc
end
function t_data:clear_npc(nNpcIndex, bRemove)
	if nNpcIndex <= 0 then
		for k,v in self.t_npc_list do
			if type(k) == "number" and k > 0 then
				self:clear_npc(k, bRemove)
			end
		end
		return
	end
	
	if self.t_npc_list[nNpcIndex] then
		if bRemove and bRemove == 1 then
			local szNpcName = GetNpcName(nNpcIndex)
			if szNpcName == self.t_npc_list[nNpcIndex] then
				SetNpcRemoveScript(nNpcIndex, "");
				SetNpcLifeTime(nNpcIndex, 0)
			end
		end
		self.t_npc_list[nNpcIndex] = nil
	end
end
function t_data:award_score(nScore)
	if not t_shiluoya_boss.enable or t_shiluoya_boss.enable_award then assert(error); return 0; end
	
	local nCamp = _get_yp_camp()
	if nCamp > 0 and nScore > 0 then
		gf_SafeAddTaskWord(tCfg.TASK_ID_PERSONAL_SCORE, tCfg.WORD_IDX_SCORE, nScore)
		local tShiliScore = self.t_shili_score[nCamp]
		tShiliScore[2] = tShiliScore[2] + nScore
		self.t_shili_score[nCamp] = tShiliScore
		local szMsg = format("Chóc mõng ®¹t ®­îc %d tÝch ®iÓm c¸ nh©n, %d tÝch ®iÓm thÕ lùc. HiÖn nay c¸ nh©n tÝch ®iÓm lµ %d", nScore, nScore, self.get_score())
		Msg2Player(szMsg)
		return 1
	end
	return 0
end
function t_data.get_score()
	return gf_SafeGetTaskWord(tCfg.TASK_ID_PERSONAL_SCORE, tCfg.WORD_IDX_SCORE)
end
function t_data:get_shili_score(nCamp)
	if not nCamp then
		nCamp = _get_yp_camp()
	end
	local tShiliScore = self.t_shili_score[nCamp]
	if nCamp > 0 and tShiliScore then
		return tShiliScore[2]
	end
	return 0
end
function t_data:get_shili_rank(nCamp)
	if not nCamp then
		nCamp = _get_yp_camp()
	end
	local tShiliScore = self.t_shili_score[nCamp]
	if nCamp > 0 and tShiliScore then
		return tShiliScore[3]
	end
	return 0
end

function _get_yp_camp()
	local nCamp = yp_get_camp() --extern
	if nCamp >= 1 and nCamp <= 3 then
		return nCamp
	end
	return 0
end

function global_msg(szMsg)
	Msg2Global(szMsg)
	AddGlobalNews(szMsg, 1)
end
