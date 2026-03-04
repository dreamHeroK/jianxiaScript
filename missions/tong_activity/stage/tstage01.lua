Include("\\script\\missions\\tong_activity\\head.lua")
Include("\\script\\missions\\tong_activity\\cfg\\pos_cfg.lua")
Include("\\script\\missions\\tong_activity\\cfg\\npc_cfg.lua")
-- Include("\\script\\misc\\observer\\observer_head.lua")

tStage01 = {
	name = "§¸nh BOSS",
	nStageId = 1,
	maxsecond = 15 * 60,
	actionsType = "second",
	guage = {
		msg = "Giai ®o¹n tiªu diÖt",
		time = 15 * 60,
		cyc = 0,
		id = 2,
	},	
};

tSeriesRelations = {
	-- 1½ð2Ä¾3ÍÁ4Ë®5»ð
	[1] = {2, 5}, --¿ËÖÆµÄÎåÐÐ¡¢±»¿ËÖÆµÄÎåÐÐ
	[2] = {3, 1},
	[3] = {4, 2},
	[4] = {5, 3},
	[5] = {1, 4},
}

tEffectsOfSeries = {1009, 1010, 1011, 1012, 1013};
g_BossSleepEffect = 985
g_nBoxExistTime = 30; --Ïä×Ó´æÔÚÊ±¼ä
g_nDispearTime = 30; --bossÎÞµÐÊ±¼ä

----Íæ¼ÒÂúÑª ÂúÀº
function reviveAll(nCamp)
	nCamp = nCamp or 1;
	this.msCamp:turnPlayer(nCamp,function ()
		if IsPlayerDeath() ~= 0 or GetLife() <= 1 then
			RevivePlayer(0);
		end
	end)
end

function change_boss_series()	
	local nSeries = random(1, 5);
	SetMissionV(this.mv3, nSeries);
	if GetTime() - GetMissionV(this.mv2) > g_nDispearTime then
		SetCurrentNpcSFX(GetMissionV(this.mv1), tEffectsOfSeries[nSeries], 1, 1);
	end
end

function set_boss_effect(bEnable, nNpcIdx)
	if not nNpcIdx then
		nNpcIdx = GetMissionV(this.mv1);
	end
	
	if bEnable == 1 then
		SetCurrentNpcSFX(nNpcIdx, tEffectsOfSeries[GetMissionV(this.mv3)], 1, 1);
	else
		SetCurrentNpcSFX(nNpcIdx, 0, 1, 1);
	end
end

--¸Ä±äBOSSÑªÁ¿
function change_boss_blood()
	local nFixedDamage = 20000;
	local szTip1 = "%s xuÊt chiªu, t¨ng thªm %d ®iÓm sinh lùc cho B¹ch Thó.";
	
	local nIdx = GetMissionV(this.mv1);
	if nIdx <= 0 then
		return
	end	
	local nMaxLife,nCurLife = GetUnitCurStates(nIdx,1);
	if nMaxLife == 0 then
		return
	end
	local nBossSeries = GetMissionV(this.mv3);
	local nPlayerSeries = GetTask(TASKID_TONG_ACTIVITY_SERIES_KIND);
	local nNewLife = nCurLife;
	if nBossSeries < 1 or nBossSeries >5 then
		return
	end
	local nActualDamage = 0;
	if tSeriesRelations[nBossSeries][1] == nPlayerSeries then
		--Íæ¼Ò±»BOSS¿ËÖÆ£¬ÔòBOSS¼ÓÑª
		nNewLife = nCurLife + nFixedDamage;
		nActualDamage = nFixedDamage;
		local nLastTime = GetTaskTemp(TEMP_TASKID_SEND_TONG_MSG_TIME);
		local nNow = GetTime();
		if (nLastTime == 0) or ((nNow - nLastTime) > g_nDispearTime) then
			SetTaskTemp(TEMP_TASKID_SEND_TONG_MSG_TIME, nNow);
			SendTongMessage(format(szTip1, GetName(), nFixedDamage));
		end			
	elseif tSeriesRelations[nBossSeries][2] == nPlayerSeries then
		--BOSS±»Íæ¼Ò¿ËÖÆ£¬ÔòBOSSµôÑª
		nActualDamage = -nFixedDamage;
		nNewLife = nCurLife - nFixedDamage;
	end
	
	if nNewLife < 0 then
		nNewLife = 0;
	elseif nNewLife > nMaxLife then
		nNewLife = nMaxLife;
	end

--²âÊÔNPCËÀÍö	
--	if nCurLife < nMaxLife then
--		nNewLife = 0;
--	end
	
	if nNewLife == 0 then
		--BOSSËÀÍö
		onNpcDeath(nIdx, 0, 0);
		--Death(GetNpcName(nIdx), nIdx);
		return
	end
	
	if nNewLife ~= nCurLife then
		ModifyNpcData(nIdx,0,nNewLife,0);
	end
		
	-- NotifyClientBubbleBlood(nIdx, nActualDamage, 1);
end

function check_boss_blood()
	local nIdx = GetMissionV(this.mv1);
	local nMaxLife,nCurLife = GetUnitCurStates(nIdx,1);	
	if (nCurLife == 0) or (nMaxLife == 0) then
		return
	end
	
	local n10PercentMod = mod(floor(nCurLife / nMaxLife * 100), 10); --°Ù·Ö±ÈÎª10%µÄÕûÊý±¶
	local n10Flag = 0; --¼ÆËãµ±Ç°ÑªÁ¿ÎªMax*10%µÄ¶àÉÙ±¶£¬Ö»ÓÐ1µ½9±¶²ÅÓÐÐ§
	if n10PercentMod == 0 then
		n10Flag = floor(floor(nCurLife / nMaxLife * 100) / 10);
	end
	local bHasFlag = 0; --ÊÇ·ñÒÑ¾­´¦Àí¹ý´ËÎ»
	if 1 <= n10Flag and 9 >= n10Flag then
		if 1 == GetBit(GetMissionV(this.mv5), n10Flag) then
			bHasFlag = 1;
		end
	end
	local nDispearTime = GetMissionV(this.mv2); --ÉÏÒ»´ÎBOSSÎÞµÐµÄÊ±¼ä
	if (nCurLife > 0) and (nCurLife < nMaxLife) and (n10PercentMod == 0) and ((n10Flag >=1) and (n10Flag <=9)) and (bHasFlag ~= 1) and (nDispearTime == 0) then
		--BOSS½øÈëÎÞµÐ×´Ì¬
		CastState2Npc(nIdx, "state_dispear", 100, g_nDispearTime*18);
		SetMissionV(this.mv2, GetTime());		
		NpcAnimation(nIdx, 9, 1, 1);	--²¥·ÅËÀÍö¶¯»­£¬²¢ÇÒÍ£Ö¹AI		
		set_boss_effect(0, nIdx);
		SetCurrentNpcSFX(nIdx, 985, 1, 1);
		local nNewVal = SetBit(GetMissionV(this.mv5), n10Flag, 1);
		SetMissionV(this.mv5, nNewVal);
		drop_prizebox();		
		this.msCamp:turnPlayer(1,function ()
			gf_SetTaskByte(TASKID_TONG_GET_ACTIVITY_AWARD, 2, 0); --ÖØÖÃ±¾´Î½±ÀøÁìÈ¡±ê¼Ç
		end)
	elseif nDispearTime ~= 0 then
		local nInterval = GetTime() - nDispearTime;
		if nInterval > g_nDispearTime then			
			--ÍË³öÎÞµÐ×´Ì¬
			SetMissionV(this.mv2, 0);
			SendTongMessage("B¹ch Thó ®· ®o¹t l¹i B¶o R­¬ng, mau diÖt nã!");
			--NpcStopAnimation(nIdx);	--Í£Ö¹²¥·ÅËÀÍö¶¯»­£¬»Ö¸´AI
			NpcAnimation(nIdx, 2, -1, 0);	--Í£Ö¹²¥·Å¶¯»­£¬»Ö¸´AI
			set_boss_effect(1, nIdx);
		end
	end
end

function drop_prizebox()
	local nMapId = this.msPosition:getMapID();
	local nRandIdx = random(1, getn(g_tNpc_RandomBox.tMapXY));
	local tMapXY = g_tNpc_RandomBox.tMapXY[nRandIdx];
	local nNpcIdx = CreateNpc(g_tNpc_RandomBox.templateNpc, g_tNpc_RandomBox.name,nMapId, tMapXY[1], tMapXY[2]);
	SetNpcScript(nNpcIdx,g_tNpc_RandomBox.scriptFile);
	SetNpcLifeTime(nNpcIdx, g_nBoxExistTime);
	-- AddMapTraceNpc(nNpcIdx,1);
	-- SetNpcSpotImage(nNpcIdx,102);
	SendTongMessage("B¹ch Thó gi¶ vê träng th­¬ng, nÐm ra 1 B¶o R­¬ng, M¶nh CÇu T­ëng nhÊt ®Þnh ë trong ®ã!");
end

function update_player_info01()
	check_give_player_exp_buff();
end

function tStage01:CreateNpcs()
	local nMapId = this.msPosition:getMapID();
	local nNpcIdx = CreateNpc(g_tBossInfo.templateNpc,g_tBossInfo.name,nMapId,g_tBossInfo.tMapXY[1],g_tBossInfo.tMapXY[2]);
	SetNpcScript(nNpcIdx,g_tBossInfo.scriptFile);
	SetMissionV(this.mv1,nNpcIdx);
	change_boss_series();
	SendTongMessage("Trêi bçng tèi l¹i, 1 B¹ch Thó xuÊt hiÖn ë trung t©m b¶n ®å!");
end

function tStage01:onTimeout()
	SendTongMessage("B¹ch Thó ¨n no nª vui vÎ rêi ®i, ®Ó l¹i mét c¸i r­¬ng trªn mÆt ®Êt!");	
	SetNpcLifeTime(GetMissionV(this.mv1), 0);
	SetMissionV(this.mv4, 0);
	--local m = this.msPosition:getMapID();
	--ClearMapNpc(m);
	tStage01:onFinish();
end

function tStage01:OnPlayerDeath()	
	RevivePlayer(0);
	RemoveState(1);
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tPos_PlayerRevive[1][1], tPos_PlayerRevive[1][2]);
	NewWorld(nMapId, tPos_PlayerRevive[1][1], tPos_PlayerRevive[1][2]);
	Msg2Player("Ng­¬i ®· bÞ th­¬ng nÆng, h·y t×m Sø Gi¶ Bang ®Ó håi phôc nguyªn khÝ!");
end

function tStage01.Init()
	tStage01:CreateNpcs();
end

function tStage01.suc_pass_msg()
	Msg2MSAll(this.missionID,"§éng VËt G©y Rèi ®· bÞ diÖt.");
end

function update_boss_pos()
	local nBossIdx = GetMissionV(this.mv1);
	if nBossIdx == 0 then
		return 0;
	end
	if GetNpcName(nBossIdx) ~= g_tBossInfo.name then return 0; end
	local nBossMapId,nX,nY = GetNpcWorldPos(nBossIdx);
	local nMapId = this.msPosition:getMapID();
	local nLenth = sqrt((nX - g_tBossInfo.tMapXY[1])^2  + (nY - g_tBossInfo.tMapXY[2])^2);
	if nBossMapId ~= nMapId or nLenth > g_tBossInfo.nDistance then
		SetNpcPos(nBossIdx,g_tBossInfo.tMapXY[1],g_tBossInfo.tMapXY[2]);
	end
end



function onNpcDeath(npcIdx, f,x)
	--¼ÇÂ¼BOSSÏûÊ§Ö®Ç°µÄÎ»ÖÃ
	local m, x, y = GetNpcWorldPos(npcIdx);
	if x and y then
		g_tBossInfo.tMapXY[1], g_tBossInfo.tMapXY[2] = x, y;
	end

	SetMissionV(this.mv4, 1);
	SetNpcLifeTime(npcIdx, 0);
	SetMissionV(this.mv1,0);	
	SendTongMessage("TÊt c¶ bang chóng cïng nhau ®¸nh lui B¹ch Thó. B¹ch Thó bá ch¹y vµ ®Ó l¹i 1 b¶o r­¬ng to.");		

	
	-- ObserverToneEvent();
	-- local tCurPhase = this.msPhases[1]:getCurPhase();
	-- tCurPhase:onFinish();
	tStage01:onFinish();
end

tStage01 = inherit(cycPhase, tStage01);
tStage01.actions = {
	[1] = tStage01.Init,
};
tStage01.cycActions = {
		[1] = {
			[0] = check_boss_blood,
		},
--		[2] = {
--			[1] = update_boss_pos,
--			start = 2,		-- ´ÓÊ²Ã´Ê±ºò¿ªÊ¼
--		},	
		[30] = {
			[0] = change_boss_series,
		},
		[59] = {
			[0] = update_player_info01,
			start = 1,		-- ´ÓÊ²Ã´Ê±ºò¿ªÊ¼
		},		
};

tStage01.triggers = {
--	Talk = {
--		{action = tStage01.NpcMain},
--	},
	PlayerDeath = {
		{action = tStage01.OnPlayerDeath},
	},
	NpcDeath = {
		{action = onNpcDeath},
	},	
};
