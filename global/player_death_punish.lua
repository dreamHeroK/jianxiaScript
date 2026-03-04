
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_func.lua")
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\zgc_public_virable.lua")
function handle_event(data, para)
	local nMapId, HitMeNpcIndex, DeathPunish, Enmity = unpack(data)
	return OnDeath(HitMeNpcIndex, DeathPunish, Enmity)
end
function OnDeath(HitMeNpcIndex, DeathPunish, Enmity)
	if Enmity > 0 then
		DoEnmityDeath(HitMeNpcIndex, DeathPunish)
		OnDeath2(HitMeNpcIndex, DeathPunish, Enmity)
	else
		DoNormalDeath(HitMeNpcIndex, DeathPunish)
		OnDeath2(HitMeNpcIndex, DeathPunish, Enmity)
	end
end

function OnDeath2(HitMeNpcIndex, DeathPunish, Enmity)
    local map_ID, att_X, att_Y = GetWorldPos()
    if map_ID >= 65535 then
        return
    end
    local map_name = Zgc_pub_mapID_name_change(map_ID, 1)
    local nKillerIndex = NpcIdx2PIdx(HitMeNpcIndex)
    local nDeathIndex = PlayerIndex
    local nDeathName = GetName()
    local nKillerName = ""

    if nKillerIndex > 0 and nKillerIndex ~= nDeathIndex then
        PlayerIndex = nKillerIndex  -- 设置击杀者 ID
        nKillerName = GetName()
--        SetCurrentNpcSFX(PIdx2NpcIdx(nKillerIndex), 1004, 2, 0, 18 * 5)		
        PlaySound("\\sound\\特殊事件\\击杀音效2.wav")
        PlayerIndex = nDeathIndex
        Msg2SubWorld("◇" .. nKillerName .. "◇在" .. map_name .. "击败了◇" .. nDeathName .. "◇")
    end
end

















function DoEnmityDeath(HitMeNpcIndex, DeathPunish)
	
	--获取胜方败方route
	local nOldPIdx = PlayerIndex;
	local nLoseRoute = GetPlayerRoute()--负方流派
	PlayerIndex = NpcIdx2PIdx(HitMeNpcIndex)--使用PlayerIndex
	local nWinRoute = GetPlayerRoute() --胜方流派
	PlayerIndex = nOldPIdx
	
	--PK胜率统计
	local nPKStatWinKey = nWinRoute*100+nLoseRoute
	local nPKStatLoseKey = nLoseRoute * 100 + nWinRoute
	AddRuntimeStat(15,3,nPKStatWinKey,1)
	AddRuntimeStat(15,4,nPKStatWinKey,1)
	AddRuntimeStat(15,4,nPKStatLoseKey,1)
end

function DoNormalDeath(HitMeNpcIndex, DeathPunish)
	if DeathPunish > 0 then		-- 有死亡惩罚
		first_tong_event();
		DoHonorPunish();
		HitMePlayerIndex = NpcIdx2PIdx(HitMeNpcIndex)
		if HitMePlayerIndex > 0 then
			if Zgc_pub_week_day() == 0 then --周日		
				local nlv = GetLevel();
				if nlv < 60 then  --60级以下不统计
					return
				end 			
				local nWeek = GetWeekSequence(7,0);
				local nOldIndex = PlayerIndex;
				local nFactionOne = GetPlayerFaction();
				PlayerIndex = HitMePlayerIndex;
				local nFactionTwo = GetPlayerFaction();
				PlayerIndex = nOldIndex;
				if nFactionOne ~= nFactionTwo then
					if GetTask(921) ~= nWeek then --新的一轮争霸战开始，初始化双方变量
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);
						PlayerIndex = HitMePlayerIndex;
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);	
						PlayerIndex = nOldIndex;				
					end
					SetTask(918,GetTask(918)+1);
					PlayerIndex = HitMePlayerIndex;
					SetTask(917,GetTask(917)+1);	
					PlayerIndex = nOldIndex;
				end
			end
		end		
	else
		HitMePlayerIndex = NpcIdx2PIdx(HitMeNpcIndex)
		if HitMePlayerIndex > 0 then
			if Zgc_pub_week_day() == 0 then	--周日
				local nlv = GetLevel();
				if nlv < 60 then  --60级以下不统计
					return
				end 				
				local nWeek = GetWeekSequence(7,0);
				local nOldIndex = PlayerIndex;
				local nFactionOne = GetPlayerFaction();
				PlayerIndex = HitMePlayerIndex;
				local nFactionTwo = GetPlayerFaction();
				PlayerIndex = nOldIndex;
				if nFactionOne ~= nFactionTwo then				
					if GetTask(921) ~= nWeek then --新的一轮争霸战开始，初始化双方变量
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);
						PlayerIndex = HitMePlayerIndex;
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);	
						PlayerIndex = nOldIndex;				
					end
					SetTask(918,GetTask(918)+1);
					PlayerIndex = HitMePlayerIndex;
					SetTask(917,GetTask(917)+1);	
					PlayerIndex = nOldIndex;
				end
			end
		end
	end
end

function first_tong_event()
	if is_first_tong_jpz_open() == 0 then
		return
	end
	if check_time() == 1 and check_place() == 1 then
		SetDeathPunish(0);
	end;
end


tPunishCfg = {--各军衔死亡扣除军功值
		--{once,max}
		{10, 1000},
		{25, 2500},
		{50, 5000},
		{100, 10000},
		{250, 25000},
		{400, 40000},
	}
function DoHonorPunish()
	SetRankPoint(5, 701, 1)	-- 衰减操作在SetRankPoint的时候才进行,所以要先衰减,再扣
	CalcBattleRank()
	
	local nEverRank = 0
	if GetTask(765) >= 15 then
		nEverRank = 6
	elseif GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 5
	elseif GetTask(767) + GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 4
	end
	local nCurRank = abs(GetTask(704))
	if nCurRank < nEverRank then
		nCurRank = nEverRank
	end

--	if nCurRank <= 3 then
--		return
--	end
	
	local song_or_liao = 1
	local nHonor = GetTask(701)
	if nHonor < 0 then
		nHonor = -nHonor
		song_or_liao = -1
	end
	
	local t = tPunishCfg[nCurRank]
	if t then
		local nOnce, nMax = unpack(t)
		local nTodayPunish = GetTask(771)
		if nTodayPunish >= nMax then
		--	Msg2Player(format("T? vong tr? 甶觤 c玭g tr筺g trong ng祔 t t鑙 產 %d", nMax))
			return
		end
		local nDel = min(nOnce, nHonor)
		nHonor = nHonor - nDel
		nHonor = nHonor * song_or_liao
		nTodayPunish = nTodayPunish + nDel
		SetTask(701, nHonor)
		SetTask(771, nTodayPunish)
	--	Msg2Player(format("B筺 t? vong  t鎛 th蕋 %d 甶觤 c玭g tr筺g", nDel))
	end
end

--函数名称：周几计算函数
--功        能：返回今天是星期几
function Zgc_pub_week_day()
	local num_return = 0
	num_return = floor((GetTime() - 57600)/86400)
	num_return = num_return - (floor(num_return/7) * 7)
	if num_return >= 2 then
		num_return = num_return - 2
	else
		num_return = num_return + 5
	end
	return num_return
end

function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--计算周的序数
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--处理时差
	nCurTime = nCurTime - 4*24*3600;	--对齐到1970年1月1日（星期四）后的第一个周一凌晨。
	local nWeekSecond = 7*24*3600;	--一周多少秒
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--计算偏移时间
	local nTotalTime = nCurTime - nOffset;	--计算后的总时间
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--计算周的序数
	return nWeekSeq;
end;
