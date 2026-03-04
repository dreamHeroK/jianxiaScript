Include("\\script\\battles\\butcher\\head.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--计数器，统计当前定时器触发了多少次了
	SetMissionV(MS_TIMER1, t)
	
	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "初级帮会战场"
		lvllimit = 40
	elseif (lsf_level == 2) then
		resultstr = "高级帮会战场"
		lvllimit = 70
	end
	
	local group1count = GetMSPlayerCount(MISSIONID, 1)
	local group2count = GetMSPlayerCount(MISSIONID, 2)

	if (t == RUNGAME_TIME) then --如果到了正式开战时刻，则停止报名，正式进入战斗阶段
		if ( group1count < but_getminplayerlimit() or group2count < but_getminplayerlimit() ) then
			SetMissionV(MS_MOSTDEATH, 1) 
			CloseMission(MISSIONID)
			return
		end
		RunMission(MISSIONID)
		AddLocalCountNews(resultstr.."宋辽战役之杀戮模式报名时间已结束，战斗正式开始！", 1);
		Msg2Global(resultstr.."宋辽战役正式进入战斗阶段！将士们，冲呀")
		Msg2MSAll(MISSIONID, "帮会宋辽战役正式进入战斗阶段！将士们，冲呀");
		WriteLog("butcher battle is entering fight state\tsong member count\t"..GetMSPlayerCount(MISSIONID, 1).."\tliao member count\t"..GetMSPlayerCount(MISSIONID, 2), "宋辽战役")
	end

	if (t == CLOSE_SIGNUP_TIME) then
		sj_phasefightingCallBoss();	--开战后15分钟刷BOSS
	end

	if (t == CREATE_BOSS_TIME) then
		AddLocalCountNews(resultstr.."帮会战场越来越激烈。通往战场的道路已被封锁！双方的军事增援部队请等待下一场战斗！", 1);
		Msg2Global("帮会战场越来越激烈。通往战场的道路已被封锁！双方的军事增援部队请等待下一场战斗！")
	end

	if (t < RUNGAME_TIME and mod(t, 3) == 0 ) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."宋辽战役之杀戮模式一触即发，目前正进入报名阶段，欲参战者请尽快从本帮战旗到达报名点报名。开战时间还剩："..RestMin.."分。参战条件：等级不小于"..lvllimit.."级";
			str2 = "开战时间还剩："..RestMin.."分"
		else
			str1 = resultstr.."宋辽战役之杀戮模式一触即发，目前正进入报名阶段，欲参战者请尽快从本帮战旗到达报名点报名。开战时间还剩："..RestMin.."分"..RestSec.."秒。参战条件：等级不小于"..lvllimit.."级。";
			str2 = "开战时间还剩："..RestMin.."分"..RestSec.."秒"
		end
		if( mod(t, 18) == 0 ) then
			AddLocalCountNews(str1, 1);
			Msg2Global(str1)
		end
		Msg2MSAll(MISSIONID,str2);		--通知场内玩家开战剩余时间
	end
	
	if (t >= RUNGAME_TIME) then

		--如果场上某一阵营人数低于最小数量，则比赛结束，人多的阵营直接获胜
		if( t > RUNGAME_TIME and wl_search_memcount() == 1 ) then
			CloseMission(MISSIONID)
			return
		end

		--每一分钟通告当前双方战功，和npc
		if (mod(t, 3) == 0 ) then
			msstr = "当前宋辽双方总积分为"..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
			Msg2MSAll(MISSIONID, msstr)

			if mod(t,15) == 0 then	--5分钟刷一次pk排名
				sj_ShowBattleRank(10);	--显示个人pk排行榜前10名
			end;
			
			local gametime = floor(GetMSRestTime(MISSIONID, 40) / 18);
			local gamerestmin, gamerestsec = GetMinAndSec(gametime);
			if( gamerestmin ~= 0 ) then
				Msg2MSAll( MISSIONID, "战斗结束时间："..gamerestmin.."分钟" )
				if ( mod(t,30) == 0 and t > RUNGAME_TIME and t < CLOSE_SIGNUP_TIME) then
					AddLocalCountNews("帮会宋辽战役之杀戮模式正在激烈的战斗中，战斗结束时间还有"..gamerestmin.."分钟，参战者请尽快从本帮战旗前往战场！", 1);
					Msg2Global("帮会宋辽战役之杀戮模式正在激烈的战斗中，战斗结束时间还有"..gamerestmin.."分钟，参战者请尽快从本帮战旗前往战场！")
				end
			end
			resttime_to_close = (CLOSE_SIGNUP_TIME - t) * TIMER_1 / FRAME2TIME
			m, s = GetMinAndSec(resttime_to_close);
			if (m > 0 and mod(t, 15) == 0) then
				Msg2Global(""..m.."分钟后帮会宋辽战役之杀戮模式报名即将结束，参战将士请尽快进入战场！")
			end
		end
		
		but_pop2home( 1 )
		but_pop2home( 2 )
	end
end
