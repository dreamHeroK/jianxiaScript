Include("\\script\\function\\yp_boss\\yp_define.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\online_activites\\award.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\zgc_public_virable.lua")

function wb_RelayCallCreateypBoss(nRandSeed)
	--是否关闭
	if not WB_SWITCH or WB_SWITCH ~= 1 then
		return
	end

    local msg = "怪物头目们正聚集在云中，准备攻打云中一统江湖，各位大侠赶紧组织人手去击败他们吧"
	Msg2Global(msg);
    AddLocalNews(msg);
	local tPoes = {	
		{"云中邪仙人","云中邪仙人",5077,1757,3479},
        {"云中阿修罗","云中阿修罗",5077,1808,3474},
        {"云中迦楼罗","云中迦楼罗",5077,1853,3483}, 		
        {"云中狱火狂人","云中狱火狂人",5077,1890,3468},		
        {"云中段承恩","云中段承恩",5077,1871,3531}, 		
        {"云中春十三娘","云中春十三娘",5077,1917,3554},		
        {"云中非常道人","云中非常道人",5077,18676,3571},
        {"云中西北鬼将军","云中西北鬼将军",5077,1844,3590},
        {"云中吴越老祖","云中吴越老祖",5077,1790,3572},
        {"云中终极版太虚高富帅","云中终极版太虚高富帅",5077,1738,3579},
        {"云中终极版太虚凤凰","云中终极版太虚凤凰",5077,1676,3269},
        {"云中终极版太虚火麒麟","云中终极版太虚火麒麟",5077,1665,3177},
        {"云中终极版太虚牦牛","云中终极版太虚牦牛",5077,1638,3127},
        {"云中黑云寨三当家陈伙","云中黑云寨三当家陈伙",5077,1715,3198},
        {"云中黑云寨二当家大杰","云中黑云寨二当家大杰",5077,1736,3230},
        {"云中黑云寨大当家詹翩义","云中黑云寨大当家詹翩义",5077,1747,3285},
        {"云中秦始皇亡魂","云中秦始皇亡魂",5077,1784,3292},
        {"云中西山剑魔","云中西山剑魔",5077,1838,3246},
        {"云中藏剑阁总管英雄","云中藏剑阁总管英雄",5077,1907,3296},
        {"云中大庄主英雄","云中大庄主英雄",5077,1888,3402},

	}	

	for _, tPos in tPoes do
	local npcIndex = CreateNpc(tPos[1],tPos[2],tPos[3],tPos[4],tPos[5]);
	if npcIndex > 0 then
		SetNpcDeathScript(npcIndex, "\\script\\function\\yp_boss\\yp_boss_death.lua");
		SetNpcLifeTime(npcIndex, 20 * 60);
	end
    end







end

function wb_MatchNpc(szName)
	for k, v in WB_WORLD_BOSS do
		if getn(v) == 2 and v[2] == szName then
			return k;
		end
	end
	return -1;
end

function wb_GetBossName()
	for k, v in WB_WORLD_BOSS do
		if type(v) == "table" and getn(v) == 2 then
			if GetToNpcDamageByName(v[2]) > 0 then
				return v[2];
			end
		end		
	end	
	return nil
end

function wb_GetBossMapId()
	for i = 1, getn(WB_WORLD_BOSS) do
		if type(WB_WORLD_BOSS[i]) == "table" and getn(WB_WORLD_BOSS[i]) == 2 then
			if GetToNpcDamageByName(WB_WORLD_BOSS[i][2]) > 0 then
				return WB_WORLD_BOSS_POS[i][1][1];
			end
		end		
	end	
	return 0;
end

function wb_GetSmallBoxFlag()
	return gf_GetTaskBit(TASKID_WORLD_BOSS_USE, 1);
end

function wb_SetSmallBoxFlag()
	gf_SetTaskBit(TASKID_WORLD_BOSS_USE, 1, 1, TASK_ACCESS_CODE_WORLD_BOSS);
end

function wb_GetSmallBoxFlag1()
	return gf_GetTaskBit(TASKID_WORLD_BOSS_USE, 2);
end

function wb_SetSmallBoxFlag1()
	gf_SetTaskBit(TASKID_WORLD_BOSS_USE, 2, 1, TASK_ACCESS_CODE_WORLD_BOSS);
end



--击杀boss奖励
function wb_KillAward()
    tAllAward[2]:giveClause();--给与随机奖励
end

tAllAward = {

	[2] = {--世界BOSS最后一击随机奖励
		maxRand = 10000,
		subclauses = {
       {{"江湖经验丹", {2,95,1885,1}, }, 4500},
       {{"经验造化丹", {2,95,2017,1}, }, 200},
       {{"天命丹", {2,95,18393,1}, }, 200},	   
	   {{"新神器", {2,95,18379,1,1},}, 500},	   
	   {{"神器", {2,95,55,2,1},}, 4600},	   
	   
		},
		giveClause = ClauseRandom.giveClause,
	},
};



