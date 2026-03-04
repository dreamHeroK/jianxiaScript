Include("\\script\\battles\\battlehead.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\shinynight_head.lua")
Include("\\script\\online\\zgc_temp_fun.lua")
Include("\\settings\\static_script\\global\\tonginfo_task.lua")
Include("\\script\\system_switch_config.lua")
IncludeLib("SETTING");
MISSIONID = 20
FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟

SL_AWARDITEM = {
	{2,1,196,1},	--宋方战旗
	{2,1,197,1},	--金方战旗
}

SL_NEEDITEM = {
	{2, 95, 5461, "大宋英雄令"},
	{2, 95, 5462, "大辽英雄令"},
}

TIMER_1 = 20 * FRAME2TIME; --20秒公布一下战况
TIMER_2 = 45 * 60  * FRAME2TIME; -- 战场时间为45分钟，其中报名15分钟，开战时间30分钟
RUNGAME_TIME = 15 * 60 * FRAME2TIME / TIMER_1; --报名15分钟之后，自动进入战斗阶段
CLOSE_SIGNUP_TIME = 25 * 60 * FRAME2TIME / TIMER_1	--开战后10分钟关闭报名
CREATE_BOSS_TIME = 30 * 60 * FRAME2TIME / TIMER_1	--开战后15分钟刷BOSS
MAX_MEMBERCOUNT = 100--100
TIME_PLAYER_REV = 10--10 ; -- 玩家死亡或退出游戏再进入时，必须3分钟之后才能离开后营到大营
TIME_PLAYER_STAY = 120	--GetGameTime() 以秒为单位
--以下是某些值记录在MissionValue中的索引位置，通过GetMissionV(MS_XXX)来获得实际的值
MS_butcher = 2;--记录当前产生的是宋军元帅：1；还是辽军元帅：2；还是都产生了：3；

MS_CENTER_X1 = 4;   --区域1：当报名阶段时，禁止玩家离开大营时，将玩家扔回大营的坐标
MS_CENTER_Y1 = 5;
MS_CENTER_X2 = 6;		--区域2
MS_CENTER_Y2 = 7;

MS_HOMEIN_X1 = 8;    --区域1：后营内坐标
MS_HOMEIN_Y1 = 9;
MS_HOMEOUT_X1 = 10;  --后营外坐标
MS_HOMEOUT_Y1 = 11;
MS_HOMEIN_X2 = 12;		--区域2
MS_HOMEIN_Y2 = 13;
MS_HOMEOUT_X2 = 14;
MS_HOMEOUT_Y2 = 15;
MS_TIMER1 = 17; --记录Timer1执行的次数

MS_MOSTDEATH = 18	--如果一方大将死亡，则为：1（宋）获2（辽）；否则为：0

MS_TOTALPOINT_S = 19		--本次战役结束时请零，记录本次战役宋方总战功
MS_TOTALPOINT_J = 20		--本次战役结束时请零，记录本次战役辽方总战功


FILE_HOMETRAP1 = "\\script\\battles\\butcher\\hometrap1.lua";
FILE_HOMETRAP2 = "\\script\\battles\\butcher\\hometrap2.lua";
FILE_CENTERTRAP = "\\script\\battles\\butcher\\centertrap.lua";
FILE_CENTERTOHOMETRAP1 = "\\script\\battles\\butcher\\homeouttrap1.lua"
FILE_CENTERTOHOMETRAP2 = "\\script\\battles\\butcher\\homeouttrap2.lua"
--后营到前营的trap脚本
FILE_HOME2CENTERTRAP1 = "\\script\\battles\\butcher\\home2fronttrap1.lua"
FILE_HOME2CENTERTRAP2 = "\\script\\battles\\butcher\\home2fronttrap2.lua"

tabFILE_NPCDEATH = 
	{
	"\\script\\battles\\butcher\\npcdeath_1.lua",
	"\\script\\battles\\butcher\\npcdeath_2.lua",
	"\\script\\battles\\butcher\\npcdeath_3.lua",
	"\\script\\battles\\butcher\\npcdeath_4.lua",
	"\\script\\battles\\butcher\\npcdeath_5.lua",
	"\\script\\battles\\butcher\\npcdeath_6.lua"
	}

FILE_DOCTOR1 = 	"\\script\\battles\\butcher\\doctor.lua";
FILE_DOCTOR2 = 	"\\script\\battles\\butcher\\doctor.lua";
FILE_SYMBOLNPC = ""
FILE_DEPOSIT = 	"\\script\\battles\\openbox.lua"
FILE_DEATH = "\\script\\battles\\butcher\\npcdeath.lua"

--Npc的模板号ID

MAX_S_COUNT = 100;
MAX_J_COUNT = 100;

--最小允许的某一阵营的玩家数量，如果在战斗中阵营的玩家数量少于该数目则该阵营判输，无论战功情况如何
MIN_PLAYER_COUNT_LIMIT = 10  --10
MIN_PLAYER_COUNT_ING = 5   --5
AVERAGE_PLAYERCOUNT = 20  --20

MS_STATE = 1; --任务中记录任务状态的变量ID
--该变量指向的状态值0表示战役为打开，1表示战役报名中，2表示战役战斗进行中，3表示战役刚刚结束了

MS_KEY = 7;		--记录当前地图下任务的一个key，即一个随机生成的数定

--MS_NEWSVALUE = 10; --任务中存放新闻变量的地方

function sf_onplayerleave()
	RestoreOwnFeature()
	BT_SetData(PL_PARAM1 ,0)
	BT_SetData(PL_PARAM2, 0)
	ST_SyncMiniMapObj(-1, -1);
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end

---------------------------------------------------------------------
function but_getminplayerlimit()
	return MIN_PLAYER_COUNT_LIMIT
end

function sf_winbouns( wincamp )
	oldPlayerIndex = PlayerIndex
	
	local idx = 0;
	local pidx = 0;
	local tbPlayer = {}
	local tbFailPlayer = {}
	local nCount = 1;
	
	if wincamp == 3 then	--平局
		for i = 1, 500 do
			idx, pidx = GetNextPlayer(MISSIONID, idx, 0);
			if pidx > 0 then
				PlayerIndex = pidx;
				bt_addtotalpoint(550);
				local point = multiple_reward(SYS_BATTLE, 550)
				Say("宋辽战斗已结束，双方打成平局，你获得了<color=yellow>"..point.."<color>点积分。", 0)
			end;
			
			if idx == 0 then
				break;
			end;
		end;
		PlayerIndex = oldPlayerIndex;
		return
	end;
	
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID, idx, wincamp);
		if( pidx > 0 ) then
			tbPlayer[nCount] = pidx
			nCount = nCount + 1;
		end
		
	 	if (idx == 0) then 
			break
		end;
	end
	--如果结束对方阵营没有玩家，则胜方不给奖励
	local failcamp = 0
	if (wincamp == 1) then
		failcamp = 2
	else
		failcamp = 1
	end
	if (GetMSPlayerCount(MISSIONID, failcamp) == 0) then
		WriteLog("由于败方没有玩家，所以胜利方不送奖励")
		return
	end
	
	nCount = 1;
	for i = 1, 500 do
		idx, pidx = GetNextPlayer(MISSIONID, idx, failcamp);
		if pidx > 0 then
			tbFailPlayer[nCount] = pidx
			nCount = nCount + 1;
		end
		
		if idx == 0 then
			break
		end;
	end;
	
	--结束后，所给得战功奖励根据两方玩家的比例送给胜方
--	local wincamp_count = GetMSPlayerCount(MISSIONID, wincamp)
--	local failcamp_count = GetMSPlayerCount(MISSIONID, failcamp)
--	local AVRCUN = (wincamp_count + failcamp_count) / 2
--	local bonuscff1 = 0
--	if (AVRCUN == 0) then
--		bonuscff1 = 1
--		bonuscff2 = 1
--	else
--		bonuscff1 = 1 - ( ( wincamp_count - AVRCUN ) / AVRCUN )
--		bonuscff2 = 1 - ( ( failcamp_count - AVRCUN ) / AVRCUN )
--	end
--	bonuscff1 = floor(1000 * bonuscff1)	--最终所给的奖励几分
--	if( bonuscff1 < 500 ) then
--		bonuscff1 = 500
--	end
--	WriteLog("胜利方送给的奖励战功为\t"..bonuscff1,"宋辽日志")

	local wincamp_count = GetMSPlayerCount(MISSIONID, wincamp)
	local failcamp_count = GetMSPlayerCount(MISSIONID, failcamp)
	local bonus_s = GetMissionV(MS_TOTALPOINT_S);
	local bonus_j = GetMissionV(MS_TOTALPOINT_J);
	local nMax = 0;
	local nMin = 0;
	
	if bonus_s > bonus_j then
		nMax = bonus_s
		nMin = bonus_j
	else
		nMax = bonus_j
		nMin = bonus_s
	end
	
	local nWinBouns = floor(1000 + nMax / wincamp_count)
	local nFailBouns = floor(650 + nMin / failcamp_count)
	local nLevel = 0;
	local nGoldenExp = 0;
	local nExp = 0;
	local nDate = tonumber(date("%y%m%d"));
	for i = 1, getn(tbPlayer) do
		PlayerIndex = tbPlayer[i]
		if nDate > BT_GetData(PL_AWARDDATE) then
			BT_SetData(PL_AWARDTIME, 0)
		end;
		bt_addtotalpoint(nWinBouns)
		BT_SetData(PL_AWARDTIME, BT_GetData(PL_AWARDTIME) + 1)	--次数＋１
		BT_SetData(PL_AWARDDATE, nDate)
		nLevel = GetLevel();
		nGoldenExp = GetGoldenExp();
		if nGoldenExp >= 2000000 then
			nGoldenExp = 2000000
		end;
		if IsPlayerDeath() == 0 then	--不是死亡状态
			ModifyExp(nGoldenExp);
		end;
		local sExpString = "";
		if BT_GetData(PL_AWARDTIME) <= 2 then
			if nLevel >= 40 and nLevel < 60 then
				nExp = floor(1500000*0.3);
			elseif nLevel >= 60 and nLevel < 70 then
				nExp = floor(1500000*0.6);
			elseif nLevel >= 70 and nLevel < 80 then
				nExp = floor(1500000*0.8);
			else
				nExp = 1500000;
			end;
			if IsPlayerDeath() == 0 then	--不是死亡状态
				ModifyExp(nExp);
				sExpString = "你获得了"..nExp.."点经验，每人每日最多能获得2次经验。";
			end;
		end;
		if IsPlayerDeath() == 0 then	--不是死亡状态
			Msg2Player("你方赢得战场得胜利，"..sExpString);
		end;
		local point = multiple_reward(SYS_BATTLE, nWinBouns)
		Say("宋辽战斗已结束，你方赢得战场得胜利，你获得了<color=yellow>"..point.."<color>点战场积分，"..sExpString, 0)
	end
	sExpString = "";
	for i = 1, getn(tbFailPlayer) do
		PlayerIndex = tbFailPlayer[i]
		if nDate > BT_GetData(PL_AWARDDATE) then
			BT_SetData(PL_AWARDTIME, 0)
		end;
		bt_addtotalpoint(nFailBouns)
		BT_SetData(PL_AWARDTIME, BT_GetData(PL_AWARDTIME) + 1)	--次数＋１
		BT_SetData(PL_AWARDDATE, nDate)
		nLevel = GetLevel();
		nGoldenExp = GetGoldenExp();
		if nGoldenExp >= 1000000 then
			nGoldenExp = 1000000
		end;
		if IsPlayerDeath() == 0 then	--不是死亡状态
			ModifyExp(nGoldenExp);
		end;
		local sExpString = "";
		if BT_GetData(PL_AWARDTIME) <= 2 then
			if nLevel >= 40 and nLevel < 60 then
				nExp = floor(1200000*0.3);
			elseif nLevel >= 60 and nLevel < 70 then
				nExp = floor(1200000*0.6);
			elseif nLevel >= 70 and nLevel < 80 then
				nExp = floor(1200000*0.8);
			else
				nExp = 1200000;
			end;
			if IsPlayerDeath() == 0 then	--不是死亡状态
				ModifyExp(nExp);
				sExpString = "你获得了"..nExp.."点经验，每人每日最多能获得2次经验。";
			end;
		end;
		if IsPlayerDeath() == 0 then	--不是死亡状态
			Msg2Player("你方输掉了本场战役，"..sExpString);
		end;
		local point = multiple_reward(SYS_BATTLE, nFailBouns)
		Say("宋辽战斗已结束，你方输掉了本场战役，你获得了<color=yellow>"..point.."<color>点战场积分，"..sExpString, 0)
	end;
	
	PlayerIndex = oldPlayerIndex
end

function but_addmissionpoint(totalpoint)
--	print( "but_addmissionpoint=="..totalpoint )
	if (totalpoint == 0) then
		return
	end
	if (GetCurCamp() == 1) then
		SetMissionV(MS_TOTALPOINT_S, GetMissionV(MS_TOTALPOINT_S)+totalpoint)
--		print("GetMissionV(MS_TOTALPOINT_S)=="..GetMissionV(MS_TOTALPOINT_S))
	else
		SetMissionV(MS_TOTALPOINT_J, GetMissionV(MS_TOTALPOINT_J)+totalpoint)
--		print("GetMissionV(MS_TOTALPOINT_J)=="..GetMissionV(MS_TOTALPOINT_J))
	end
end

function GameOver()
	local bonus_s = GetMissionV(MS_TOTALPOINT_S)
	local bonus_j = GetMissionV(MS_TOTALPOINT_J)
	local resultstr = "";
	local lsf_level = BT_GetGameData(GAME_LEVEL)
	WriteLog(szGAME_GAMELEVEL[ lsf_level ].."battle is ending\tsongmemcount\t"..GetMSPlayerCount(MISSIONID, 1).."\tliaomemcount\t"..GetMSPlayerCount(MISSIONID, 2).."\tsongpoint\t"..bonus_s.."\tliaopoint\t"..bonus_j,"宋辽战役")
	
	if (lsf_level == 1) then
		resultstr = "初级帮会战场"
	elseif (lsf_level == 2) then
		resultstr = "高级帮会战场"
	end
	
	if (GetMissionV(MS_MOSTDEATH) == 0) then
		if (bonus_s > bonus_j ) then
			resultstr = resultstr.."宋辽战斗已结束，最终宋辽双方获得的总积分为"..bonus_s.."："..bonus_j.."，宋方赢得了胜利！";
			Msg2MSAll(MISSIONID, resultstr)
			WriteLog(resultstr,"宋辽战役")
			RecordBTCount_Win(1)		--在每个人任务变量里记录它此次宋辽战场胜负状况
			sf_winbouns(1)
			sf_winnotes(1, bonus_s, bonus_j)
		elseif (bonus_s < bonus_j) then
			resultstr = resultstr.."宋辽战斗已结束，最终宋辽双方获得的总积分为"..bonus_s.."："..bonus_j.."，辽方赢得了胜利！"
			Msg2MSAll(MISSIONID, resultstr)
			WriteLog(resultstr,"宋辽战役")
			RecordBTCount_Win(2)	--在每个人任务变量里记录它此次宋辽战场胜负状况
			sf_winbouns(2)
			sf_winnotes(2, bonus_s, bonus_j)
		else
			resultstr = resultstr.."宋辽战斗已结束，最终宋辽双方获得的总积分为"..bonus_s.."："..bonus_j
			Msg2MSAll(MISSIONID, resultstr)
			sf_winbouns(3);	--平局
			sf_winnotes(3, bonus_s, bonus_j)
			WriteLog(resultstr,"宋辽战役")
		end;

		AddLocalCountNews(resultstr, 1);

	elseif (GetMissionV(MS_MOSTDEATH) == 1) then
		resultstr = resultstr.."宋辽双方人数不足，本次宋辽帮会战场未启动"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr,"宋辽战役")
		AddLocalCountNews(resultstr, 1);
	elseif( GetMissionV(MS_MOSTDEATH) == 2 ) then
		resultstr = resultstr.."辽方人数不足，本次宋辽帮会战场未能启动，宋方获得胜利！"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr,"宋辽战役")
		AddLocalCountNews(resultstr, 1);
		RecordBTCount_Win(1)	--在每个人任务变量里记录它此次宋辽战场胜负状况
		sf_winbouns(1)
		sf_winnotes(1, 0, 0)
	elseif( GetMissionV(MS_MOSTDEATH) == 3 ) then
		resultstr = resultstr.."宋方人数不足，本次宋辽帮会战场未能启动，辽方获得胜利！"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr,"宋辽战役")
		AddLocalCountNews(resultstr, 1);
		RecordBTCount_Win(2)	--在每个人任务变量里记录它此次宋辽战场胜负状况
		sf_winbouns(2)
		sf_winnotes(2, 0, 0)
	end
	Msg2Global(resultstr)
	local tbPlayer = {};
	local idx = 0;
	local pidx = 0;
	for i = 1 , 500 do
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if( pidx > 0 ) then
			tbPlayer[getn(tbPlayer)+1] = pidx
		end
		if (idx <= 0) then
	 		break
	 	end
	end 	

 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
	 	Xmas_prize_get(1)	--圣诞奖励
	 	l_curcamp = GetCurCamp();
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0);
		SetCreateTeam(0);
		SetDeathScript("");
		SetFightState(0)		-- 打完仗后改为非战斗状态（by Dan_Deng）
		SetPunish(1)
		ForbidChangePK(0);
		SetPKFlag(0, 0)
		level = BT_GetGameData(GAME_LEVEL);
		-- 打完仗清除战场称号状态
		for i = 1, 6 do
			RemoveTitle(32, i)
		end
		SetTask(TK_APPLY_CAMP_TASK, 0);
		SetTask(TK_BIT_APPLY_TASK, SetBit(GetTask(TK_BIT_APPLY_TASK), 1, 0));
		SetTask(TK_BIT_APPLY_TASK, SetBit(GetTask(TK_BIT_APPLY_TASK), 2, 0));
		SetTask(TK_BIT_APPLY_TASK, SetBit(GetTask(TK_BIT_APPLY_TASK), 3, 0));
		UseScrollEnable(1);
		local temp_mapid,temp_posx, temp_posy = bt_getsignpos(l_curcamp)
		local campname = ""	
		if (l_curcamp == 1) then
			SetRevPos(tbGAME_SIGNMAP[lsf_level], tbGAME_SIGNMAP[lsf_level])
			NewWorld(bt_getsignpos(1))
			campname = "宋\t"
		else	
			SetRevPos(tbGAME_SIGNMAP[lsf_level], (tbGAME_SIGNMAP[lsf_level] + 1))
			NewWorld(bt_getsignpos(2))
			campname = "辽\t"
		end;
		WriteLog( campname..GetName().."\t等级\t"..GetLevel().."\t门派\t"..GetPlayerRoute().."\t本轮积分\t"..BT_GetData( PL_KILLPLAYER ),"宋辽战役" )
		SetTempRevPos( temp_mapid, temp_posx * 32, temp_posy * 32 )
		SetLogoutRV(0);
	end;
end;

function sf_winnotes(camp, sbonus, jbonus)
	local nCounting = 0;
	local nLine = 0;
	TxtData:Init("tong", "tong_battle.txt")
	TxtData:LoadMultiColumn()
	local nDateTime = date("%Y%m%d");
	local nHourTime = date("%H");
	for i = 1, getn(TxtData.tbTextData) do
		if tonumber(nDateTime) == tonumber(TxtData.tbTextData[i][1]) and tonumber(level) == tonumber(TxtData.tbTextData[i][2]) then
			nLine = i
			nCounting = 1
			break
		end
	end
	if nCounting == 1 then
		TxtData.tbTextData[nLine][5] = GetMSPlayerCount(MISSIONID, 1)
		TxtData.tbTextData[nLine][6] = GetMSPlayerCount(MISSIONID, 2)
		TxtData.tbTextData[nLine][7] = GetMSPlayerCount(MISSIONID, 1) + GetMSPlayerCount(MISSIONID, 2)
		TxtData.tbTextData[nLine][8] = camp
		TxtData.tbTextData[nLine][9] = sbonus
		TxtData.tbTextData[nLine][10] = jbonus
		TxtData:SaveMultiColumn()
	end
end;

-------------------------------------------------------------------------
function sf_join(camp)
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID, camp) >= MAX_MEMBERCOUNT ) then
		if (camp==1) then
			Msg2Player("以我军现在的兵力已足以全灭辽兵，今后大展宏图的机会还很多，等下一次吧！")
		elseif (camp==2) then
			Msg2Player("以我军现在的兵力已足以全灭宋兵，今后大展宏图的机会还很多，等下一次吧！")
			return
		end
	end
	
	local ownmscount = GetMSPlayerCount(MISSIONID, camp)
	local countstr = ""
	if( camp == 1 ) then
		emymscount = GetMSPlayerCount(MISSIONID, 2)
		countstr = "根据前线战报，已报名宋辽双方人数差异"..AVERAGE_PLAYERCOUNT.."人，请选择辽方阵营！"
	else
		emymscount = GetMSPlayerCount(MISSIONID, 1)
		countstr = "根据前线战报，已报名宋辽双方人数差异"..AVERAGE_PLAYERCOUNT.."人，请选择宋方阵营！"
	end
	
	if( (ownmscount - emymscount) >= AVERAGE_PLAYERCOUNT ) then
		Talk(1, "", countstr)
		return
	end
	
	local timer1 = BT_GetTimer1()
	if (timer1 >= CLOSE_SIGNUP_TIME and BT_GetData(PL_KEYNUMBER) ~= BT_GetGameData(GAME_KEY)) then
		Talk(1, "", "根据战报，前线正处于胶着状态，通往双方战场的道路被封锁。只有等待下次战役了！")
		Msg2Player("战场报名结束10分钟后，通往宋辽战场的道路被封锁。")
		return
	end
	result = bt_checklastbattle(camp)
	
	if (result == 2) then
		if (camp==1) then
			Talk(1,"","你们这些辽人，侵我河山，杀我同胞，着实可恨，我们誓与你们抗战到底！")
		else
			Talk(1,"","想我辽国将士，个个晓勇善战，岂是你们宋国的腐朽之师能与之匹敌的！")
			return
		end
	end

	if (result == 0) then
--		if (DelItem(SL_NEEDITEM[camp][1],SL_NEEDITEM[camp][2],SL_NEEDITEM[camp][3], 1) == 1) then
--			Msg2Player("战场提示：战场中可以按键盘左上角的～键切换显示当前战斗的情况");
			BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
--		else
--			Talk(1,"","对不起，参加本次宋辽大战，需要你携带1个"..SL_NEEDITEM[camp][4].."")
--			return 
--		end
		if( camp == 1 ) then
			Msg2Player("你们这些辽人，侵我河山，杀我同胞，着实可恨，我们誓与你们抗战到底！")
		else
			Msg2Player("想我辽国将士，个个晓勇善战，岂是你们宋国的腐朽之师能与之匹敌的！")
		end
	end

	if( result == 1 and GetMissionV(MS_STATE) == 1 ) then
		if( camp == 1 ) then
			Msg2Player("你们这些辽人，侵我河山，杀我同胞，着实可恨，我们誓与你们抗战到底！")
		else
			Msg2Player("想我辽国将士，个个晓勇善战，岂是你们宋国的腐朽之师能与之匹敌的！")
		end
	end

	gametime = floor(GetMSRestTime(MISSIONID, 40) / 18);
	AddMSPlayer(MISSIONID,camp);
	BT_UpdateMemberCount();
	SetCurCamp(camp);

	SetTaskTemp(200,1)
	SetFightState(0);
	SetLogoutRV(1);

	SetPunish(0);

	level = BT_GetGameData(GAME_LEVEL)
	if (BT_GetData(PL_CURRANK) > 0) then
		AddTitle(32, BT_GetData(PL_CURRANK));
		SetCurTitle(32, BT_GetData(PL_CURRANK));
	end

	if (camp == 1) then
		posx = GetMissionV(MS_HOMEIN_X1)
		posy = GetMissionV(MS_HOMEIN_Y1)
		str = GetName().."加入了宋方阵营"
		EnterChannel(PlayerIndex, "宋方"..szGAME_GAMELEVEL[level].."杀戮模式")
	else
		posx = GetMissionV(MS_HOMEIN_X2)
		posy = GetMissionV(MS_HOMEIN_Y2)
		str = GetName().."加入了辽方阵营"
		EnterChannel(PlayerIndex, "辽方"..szGAME_GAMELEVEL[level].."杀戮模式")
	end

	BT_SetData(PL_PARAM1,0)
	BT_SetData(PL_PARAM2,0)
	sf_mapid = SubWorldIdx2ID(SubWorld)

	if (camp == 1) then
		SetRevPos(tbGAME_SIGNMAP[level], tbGAME_SIGNMAP[level] )
	else
		SetRevPos(tbGAME_SIGNMAP[level], tbGAME_SIGNMAP[level] + 1)
	end

	NewWorld(sf_mapid, posx, posy);
	UseScrollEnable(0);	--禁止使用回城符
	SetLogoutRV(1);
	SetTempRevPos(sf_mapid, posx * 32, posy * 32);
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())

	SetCreateTeam(1);
	BT_SetData(PL_KEYNUMBER, BT_GetGameData(GAME_KEY))
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_RULEID, BT_GetGameData(GAME_RULEID))
	BT_SetData( PL_MAXSERIESKILL, 0 )
--	BT_SetData( PL_SERIESKILL, 0 )  --不要清0,加入新战场的时候才清
--	BT_SetData( PL_KILLPLAYER, 0 )  --同上
	BT_SetData( PL_TOTALPOINT, 0 )
	BT_SetData( PL_LEAVETIME, 0 )

	SetFightState(0)
	Msg2MSAll(MISSIONID,str);
	SetPKFlag(1, camp)
	ForbidChangePK(1);
	SetDeathScript("\\script\\battles\\butcher\\playerdeath.lua");

	Say( "前线规则：<enter>每次击败一个对手，您都会获得一定的积分点。根据双方的总积分来确定胜利或失败。如果积分相同，则参与人数少的（包括后营）的一方为失败。<enter>当前宋方人数:"..GetMSPlayerCount(MISSIONID, 1).."人; 辽方人数:"..GetMSPlayerCount(MISSIONID, 2).."人", 0 )
end;
------------------------------------------------------------------

-----将秒传换成分与秒，比如62s = 1m2s
function GetMinAndSec(nSec)
	nRestMin = floor(nSec / 60);
	nRestSec = mod(nSec,60)
	return nRestMin, nRestSec;
end;

------------------------------------------------------

function RecordBTCount_Win(camp)		--在每个人任务变量里记录它此次宋辽战场胜负状况
	if (camp ~= 1 and camp ~= 2) then
		print("ERROR: 宋金结束，记录胜负次数阵营出错！！！")
		return
	end
	idx = 0
	pidx = 0
	if (camp == 1) then
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1);
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1072, nt_getTask(1072) + 1)
		 	end
		end
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2);
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1073, nt_getTask(1073) + 1)
		 	end
		end
	else
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2)
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1072, nt_getTask(1072) + 1)
		 	end
		end
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1)
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1073, nt_getTask(1073) + 1)
		 	end
		end
	end
end

-- 设置任务状态
function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
end

-- 获取任务状态
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

function but_pop2home( camp )
	oldPlayerIndex = PlayerIndex
	tbPlayer = { }
	tbRMPlayer = {}
	count = 0
	count_remain = 0
	idx = 0;
	pidx = 0
	for i = 1 , 500 do
		idx, pidx = GetNextPlayer( MISSIONID,idx, camp );
		if( pidx > 0 ) then
			PlayerIndex = pidx
			if ( GetFightState( ) == 0 and ( ( GetGameTime() - BT_GetData( PL_LASTDEATHTIME ) ) >= TIME_PLAYER_STAY ) ) then
		 		count = count + 1
		 		tbPlayer[ count ] = pidx
			elseif ( GetFightState( ) == 0 ) then
		 		count_remain = count_remain + 1
		 		tbRMPlayer[ count_remain ] = pidx
			end
		end
		if (idx == 0) then 
	 		break
	 	end;
	end 

	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	local temprevposx = 0
	local temprevposy = 0
	if ( count > 0 ) then
		if ( camp == 1 ) then
			area = BT_GetGameData(GAME_CAMP1AREA);
			temprevposx = GetMissionV(MS_HOMEIN_X1) * 32
			temprevposy = GetMissionV(MS_HOMEIN_Y1) * 32
		else
			area = BT_GetGameData(GAME_CAMP2AREA);
			temprevposx = GetMissionV(MS_HOMEIN_X2) * 32
			temprevposy = GetMissionV(MS_HOMEIN_Y2) * 32
		end
		npcfile = GetIniFileData(mapfile, "Area_"..area, tbNPCPOS[random(2)]);
		for i = 1, count do
			PlayerIndex = tbPlayer[ i ]
			x,y = bt_getadata(npcfile)
--			print("but_pop2home  but_pop2home  but_pop2home  but_pop2home")
			SetPos(floor(x/32), floor(y/32))
			SetTempRevPos(SubWorldIdx2ID(SubWorld) , temprevposx, temprevposy);
			SetFightState(1)
			Msg2Player("你不能继续停留在后营")
		end
	end

	if ( count_remain > 0 ) then
		for i = 1, count_remain do
			PlayerIndex = tbRMPlayer[ i ]
			remain_time = TIME_PLAYER_STAY - ( GetGameTime() - BT_GetData( PL_LASTDEATHTIME ) )
			if( remain_time > 0) then
				Msg2Player("你还能在后营停留"..remain_time.."秒")
			end
		end
	end
	PlayerIndex = oldPlayerIndex
end

--显示排名（向战场里面的玩家显示）
function sj_ShowBattleRank(nPlayerCount)
	local tbPlayer = mf_SortMSPlayerByTaskValue(MISSIONID, 855 + PL_KILLPLAYER,0);
	local nOldPlayerIdx = PlayerIndex;
	Msg2MSAll(MISSIONID,"帮会战场PK排名: 前"..nPlayerCount.."名");
	for i=1,min(getn(tbPlayer),nPlayerCount) do
		PlayerIndex = tbPlayer[i];
		Msg2MSAll(MISSIONID,"第"..i.."名: "..GetName().." "..BT_GetData(PL_KILLPLAYER).."人");
	end;
	PlayerIndex = nOldPlayerIdx;
end;

--开战后15分钟刷BOSS
function sj_phasefightingCallBoss()
end;

function sj_getfrontpos( camp )
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	local area = 0
	if( camp == 1 ) then
		area = BT_GetGameData( GAME_CAMP1AREA )
	else
		area = BT_GetGameData( GAME_CAMP2AREA )
	end
	local area_section = "Area_"..area;
-------------------------------------------------------------------------
--读取两个区域的大营内点坐标
	--从大营到后营时的坐标点
    frontpos = GetIniFileData(mapfile, area_section , "frontpos")
    x,y =bt_str2xydata(frontpos)
    return x, y
end

--战役进行中，如果一方人数不满足最小人数限制，则判输
function wl_search_memcount()
	local group1count = GetMSPlayerCount(MISSIONID, 1)
	local group2count = GetMSPlayerCount(MISSIONID, 2)
	
	if( group1count >= MIN_PLAYER_COUNT_ING and group2count >= MIN_PLAYER_COUNT_ING ) then
		return
	end
	
	if( group1count > group2count ) then
		SetMissionV(MS_MOSTDEATH, 2)
	elseif( group1count < group2count ) then
		SetMissionV(MS_MOSTDEATH, 3)
	end
	return 1
end

function sl_clearbattledata()	--本次战斗结束后，清除战场信息
	for i = 1, 14 do
		BT_SetGameData( i, 0 )
	end
end

function sf_IsTongBattleOpen()
	if IsTongBattleSystemOpen() ~= 1 then
		Talk(1,"",g_szInfoHeader.."当前尚未开启帮战宋辽战役!");
		return 0;
	end
	return 1;	
end
