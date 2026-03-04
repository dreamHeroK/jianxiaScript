Include("\\script\\function\\cj_boss\\cj_define.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\online_activites\\award.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\zgc_public_virable.lua")
Include("\\script\\server_allaward.lua")

function wb_RelayCallCreateCJBoss(nRandSeed)
	--是否关闭
	if not WB_SWITCH or WB_SWITCH ~= 1 then
		return
	end
--判断时间刷新哪个傻逼boss
--------------------boos1---------------	
    local nTime = tonumber(date("%H%M"));

     nIndex = getn(WB_WORLD_BOSS1);
	if SubWorldID2Idx(WB_WORLD_BOSS_POS1[nIndex][1][1]) == -1 then
		return
	end
	local nPosIndex = random(getn(WB_WORLD_BOSS_POS1[nIndex]));
	local tPos = WB_WORLD_BOSS_POS1[nIndex][nPosIndex];
	if not tPos or getn(tPos) ~= 3 then return end
	local npcIndex = CreateNpc(WB_WORLD_BOSS1[nIndex][1], WB_WORLD_BOSS1[nIndex][2], tPos[1], tPos[2], tPos[3]);
	if npcIndex > 0 then
		SetNpcDeathScript(npcIndex, "\\script\\function\\cj_boss\\cj_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\cj_boss\\cj_boss_remove.lua");
		SetNpcLifeTime(npcIndex, 120 * 60);
	end
	local vt = format("%d,%d",((tPos[2] + 2)/ 8), ((tPos[3] + 2)/ 16))
	local name = tPos[1]
	local map_name = name
    local map_name = Zgc_pub_mapID_name_change(tPos[1],1)
    local msg = format("%s出现在"..map_name.."("..vt.."),请侠士们尽快前往！", WB_WORLD_BOSS1[nIndex][2]);
	Msg2Global(msg);
	AddLocalNews(msg);			 




	
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
   tAllAward[3]:giveClause();--给与随机奖励
end



