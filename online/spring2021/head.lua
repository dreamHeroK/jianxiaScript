Include("\\script\\online\\spring2021\\define.lua")
Include("\\script\\online\\spring2021\\award.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\lib\\textdata.lua") 


function sp_IsOpen()
	return gf_CheckDuration(SP_START, SP_END);
end

function sp_OnlinePlayer()
	local nSvrPlayerCount = 0
	local PlayerTab = {}
	local player = FirstPlayer()
	local c = 1
	while (player > 0) do
		PlayerTab[c] = player	
		player = NextPlayer(player)
		c = c + 1
	end

	if GetTime() - g_nLastCheckTime > g_CHECKINTERVAL then
		nSvrPlayerCount = getn(PlayerTab);
	end;

	local nOldPlayer = PlayerIndex;
	for i = 1, nSvrPlayerCount do
		PlayerIndex = PlayerTab[i];
		if PlayerIndex > 0 then
			if IsOfflineLive() == 0 then
				nRet, nItemIdx = gf_AddItemEx({2,95,6000, 1, 4}, "受赠的新春红包");
				gf_SetItemExpireTime(nItemIdx, gf_UnPack(SP_END));
			end	
		end;
	end
	PlayerIndex = nOldPlayer;
end

--Relay call
function sp_RelayCallBoss(nRandSeed)
	if sp_IsOpen() ~= 1 then
		return 0;
	end
--	if sp_checktime() ~= 1 then
--		return 0;
--	end
	sp_OnlinePlayer()
	randomseed(nRandSeed);
	local nIndex = random(getn(SP_NIANSHOU_POS));
	--这个地图不在这个服务器就不刷
	if SubWorldID2Idx(SP_NIANSHOU_POS[nIndex][1]) == -1 then
		return 0;
	end
	--刷NPC
	local npcIdx = CreateNpc("11年大年兽", "大年兽", SP_NIANSHOU_POS[nIndex][1], SP_NIANSHOU_AI_POS[SP_NIANSHOU_POS[nIndex][1]][1][1],SP_NIANSHOU_AI_POS[SP_NIANSHOU_POS[nIndex][1]][1][2]);
	if npcIdx > 0 then
		SetNpcLifeTime(npcIdx, 60*60);
		g_NpcAI:setAI(npcIdx, AT_SM_PATROL, 1)
		g_NpcAI:setWayPoint(npcIdx, SP_NIANSHOU_AI_POS[SP_NIANSHOU_POS[nIndex][1]], 1);
		npcIdx = CreateNpc("四灵树4", " ", SP_NIANSHOU_POS[nIndex][1], SP_NIANSHOU_POS[nIndex][2],SP_NIANSHOU_POS[nIndex][3]);
		SetNpcLifeTime(npcIdx, 60*60);
		local nNum, tNpcIndex = CreateNpc("玫瑰花黄", " ", SP_NIANSHOU_POS[nIndex][1], SP_NIANSHOU_POS[nIndex][2],SP_NIANSHOU_POS[nIndex][3], 6,8,2,10);
		for k, v in tNpcIndex do
			SetNpcLifeTime(v, 60*60);
		end
		nNum, tNpcIndex = CreateNpc("玫瑰花粉", " ", SP_NIANSHOU_POS[nIndex][1], SP_NIANSHOU_POS[nIndex][2],SP_NIANSHOU_POS[nIndex][3], 6,16,2,30);
		for k, v in tNpcIndex do
			SetNpcLifeTime(v, 60*60);
		end
		nNum, tNpcIndex = CreateNpc("玫瑰花红", " ", SP_NIANSHOU_POS[nIndex][1], SP_NIANSHOU_POS[nIndex][2],SP_NIANSHOU_POS[nIndex][3], 6,32,2,50);
		for k, v in tNpcIndex do
			SetNpcLifeTime(v, 60*60);
		end
	end
	--开工
	local tbPos = SP_NIANSHOU_FIGHT_POS[nIndex];
	local nNpcIndex = CreateNpc("11年大年兽", "大年兽", tbPos[1],tbPos[2],tbPos[3]);
	--标记
	if nNpcIndex > 0 then
		SetNpcLifeTime(nNpcIndex,60*60);
		SetNpcDeathScript(nNpcIndex, "\\script\\online\\spring2021\\boss_death.lua");
		SetNpcLifeTime(nNpcIndex, 30 * 60);
		mf_OpenMission(SP_MISSION_ID, tbPos[1]);
		mf_SetMissionV(SP_MISSION_ID, SP_MISION_V1, nNpcIndex, tbPos[1]);
		--通告
		local strMsg = format("年兽已经出现在%s(%s,%s)，诸位英雄前去驱赶！", tbPos[6], tbPos[4], tbPos[5])
		AddLocalCountNews(strMsg, 2);
		Msg2Global(strMsg);
	end

end

function sp_checktime()
	local nTime = tonumber(date("%H%M"));
	if (not ((1201 <= nTime  and nTime < 1230) or (2201 <= nTime and nTime < 2210))) then	--只在12点和22点内开放
		return 0;
	else
		return 1;
	end;
end;

-- 小年兽奖励
function sp_BoxAward()
	--奖励
	SetTask(TASK_YEARS_BIT, SetBit(GetTask(TASK_YEARS_BIT), OpenBoxFlag, 0));
	sp_aw_giveAward_1()
	return 1;
end

function sp_CreateTalkTrigger()
	if sp_IsOpen() == 1 then
		if GetTrigger(3111*2) <= 0 then
			CreateTrigger(4, 3111, 3111*2);
		end
	else
		if GetTrigger(3111*2) > 0 then
			RemoveTrigger(GetTrigger(3111*2))
		end
	end
end

function sp_daily_reset()
	SetTask(TASK_YEARS_DAILYDEVOTE,0) 		-- 记录新春活动每日贡献点
end

function sp_CreateDecorate()
	if sp_IsOpen() ~= 1 then
		return 0;
	end
	if SubWorldID2Idx(200) ~= -1 then
		local tPos = {
			{200,1380,2815},{200,1339,2887},
			{200,1399,2831},{200,1326,2868},
			{200,1418,2849},{200,1346,2849},
			{200,1432,2866},{200,1362,2830},
			{200,1420,2879},{200,1224,2687},
			{200,1408,2892},{200,1212,2699},
			{200,1392,2908},{200,1550,3024},
			{200,1375,2923},{200,1540,3036},
			{200,1355,2904},{200,1221,3019},
			{200,1229,3028},           
		}
		for k, v in tPos do
			CreateNpc("红灯笼", " ", v[1], v[2], v[3]);
		end
	end
	if SubWorldID2Idx(150) ~= -1 then
		local tPos = {
			{150,1689,3112},{150,1783,3211},
			{150,1645,3155},{150,1774,3220},
			{150,1686,3194},{150,1758,3035},
			{150,1728,3152},{150,1767,3046},
			{150,1606,3004},{150,1602,3222},
			{150,1595,3015},{150,1596,3212},
		}
		for k, v in tPos do
			CreateNpc("红灯笼", " ", v[1], v[2], v[3]);
		end
	end
	if SubWorldID2Idx(500) ~= -1 then
		local tPos = {
			{500,1757,3088},{500,1826,3264},
			{500,1814,3131},{500,1833,3254},
			{500,1757,3195},{500,1627,3060},
			{500,1703,3139},{500,1640,3046},
			{500,1635,3258},{500,1870,3002},
			{500,1643,3266},{500,1877,3010},
		}
		for k, v in tPos do
			CreateNpc("红灯笼", " ", v[1], v[2], v[3]);
		end
	end
	--襄阳
	if SubWorldID2Idx(350) ~= -1 then
		--12
		for i = 0, 20 do
			local npcIndex = CreateNpc("桃花树"," ", 350, 1427-i*4, 2770+i*4);
		end
		--34
		for i = 0, 3 do
			local npcIndex = CreateNpc("桃花树"," ", 350, 1432-i*4, 2780+i*4);
		end
		--56
		for i = 0, 2 do
			local npcIndex = CreateNpc("桃花树"," ", 350, 1404-i*4, 2815+i*4);
		end
		--78
		for i = 0, 5 do
			local npcIndex = CreateNpc("桃花树"," ", 350, 1379-i*4, 2841+i*4);
		end
		--49
		for i = 1, 2 do
			local npcIndex = CreateNpc("桃花树"," ", 350, 1416+i*4, 2796+i*4);
		end
		--10 11
		for i = 0, 4 do
			local npcIndex = CreateNpc("桃花树"," ", 350, 1436+i*4, 2822+i*4);
		end
		--12 13
		for i = 0, 5 do
			local npcIndex = CreateNpc("桃花树"," ", 350, 1463+i*4, 2849+i*4);
		end
		--5 14
		for i = 1, 19 do
			local npcIndex = CreateNpc("桃花树"," ", 350, 1404+i*4, 2815+i*4);
		end
		local tPos = {
			{350,1437,3022},	{350,1402,2995},
			{350,1490,2971},	{350,1422,3015},
			{350,1478,2957},	{350,1548,2871},
			{350,1455,2933},	{350,1540,2864},
			{350,1444,2926},	{350,1346,3094},
			{350,1423,2938},	{350,1337,3084},
			{350,1403,2960},	{350,1325,2868},
			{350,1390,2978},	{350,1336,2857},
			{350,1545,3083},  {350,1536,3090},        
		}
		for k, v in tPos do
			CreateNpc("红灯笼", " ", v[1], v[2], v[3]);
		end
	end
	if SubWorldID2Idx(300) ~= -1 then
		local tPos = {
			{300,1736,3489},{300,1656,3711},	
			{300,1698,3532},{300,1641,3696},	
			{300,1809,3559},{300,1668,3464},	
			{300,1792,3544},{300,1681,3451},	
			{300,1919,3443},{300,1915,3692},	
			{300,1909,3431},{300,1926,3680},	
		}
		for k, v in tPos do
			CreateNpc("红灯笼", " ", v[1], v[2], v[3]);
		end
		local npcIndex = CreateNpc("年夜饭5","美味的年夜饭", 300, 1735, 3559);
		SetNpcScript(npcIndex, "\\script\\online\\spring2021\\npc_ths.lua");

	end
	if SubWorldID2Idx(100) ~= -1 then
		local tPos = {
			{100,1384,2978},{100,1427,3023},	
			{100,1400,2960},{100,1412,3012},	
			{100,1416,2943},{100,1395,2995},	
			{100,1427,2934},{100,1545,2880},	
			{100,1443,2949},{100,1530,2866},	
			{100,1460,2964},{100,1331,2887},	
			{100,1473,2979},{100,1345,2873},	
			{100,1463,2990},{100,1585,3126},	
			{100,1446,3005},{100,1576,3135},	
		}
		for k, v in tPos do
			CreateNpc("红灯笼", " ", v[1], v[2], v[3]);
		end
	end
end


