Include("\\script\\lib\\missionfunctions.lua");
Include("\\script\\lib\\globalfunctions.lua")
MISSION_ID = 46;									--Mission的ID
TIMER_ID = 75;										--计时器的ID
LOG_ID = 3001;										--登陆触发器ID
LOG_CUSTOM_ID = 2501;								--登陆触发器自定义编号
HUASHAN_MAP_ID = 969								--华山地图的ID
--=========================================================================================
FRAME_PER_SECOND = 18;								--游戏运行速度：每秒１８帧
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--每分钟游戏帧数
--定义各个阶段的持续时间，只能填非0正整数==================================================
READY_TIME = 5;									    --准备时间，5分钟
STARTED_TIME = 15;									--进行时间时间，15分钟
ENDING_TIME = 2;									--等待结束时间，2分钟
--定义各个阶段计时器的触发间隔=============================================================
READY_TIMER_INTERVAL = 1;							--计时器触发的时间间隔，单位分钟
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 3;					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 1;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS变量=============================================================================

--MissionV变量=============================================================================
MV_MISSION_STATE = 1;								--记录Mission状态
MV_TIMER_LOOP = 2;									--记录计时器的计数
MV_MISSION_UID = 3;									--记录Mission的唯一ID
MV_TEAM_NUM = 4;									--记录进入Mission的队伍总数
MV_BOX_NPC_INDEX = 5;								--记录华山宝箱的索引
MV_HUASHAN_NPC_INDEX = 6;							--记录华山npc的索引
MV_OPENBOX_FLAG = 7;								--记录华山宝箱已被夺取
--Mission状态集============================================================================
MS_STATE_IDEL = 0;									--场地空闲
MS_STATE_READY = 1;									--准备阶段
MS_STATE_STARTED = 2;								--开战阶段
MS_STATE_ENDING = 3;								--等待结束阶段
--临时变量
TOTAL_KILL_NUM 							= 150;		--储存杀死对手数量的变量
TOP_KILLER_INDEX	  			= 3; 			--记录当前场地玩家杀人最多的索引
--=========================================================================================
--TaskValue	3579		--第一名变量
--TaskValue	3580	    --生命次数
--TaskValue	3581	    --参加次数
--TaskValue	3582	    --积分奖励
--TaskValue	3583	    --击杀人数

--Mission函数==============================================================================
--初始化Mission
function MS_InitMission()
	mf_ClearMissionData();

	SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--设置Mission的状态为准备状态
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--设置计时器总计时次数
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个计时器
	local nMSUID = MS_CreateMSUID();	--创建一个Mission唯一ID
	SetMissionV(MV_MISSION_UID,nMSUID);	
end;
--Mission开始
function MS_StartMission()
--	SetNpcLifeTime(GetMissionV(MV_HUASHAN_NPC_INDEX),0)--删去退出Npc
	Msg2MSAll(MISSION_ID,"华山之巅活动已经开始,诸位尽情厮杀");
--	mf_Talk2Camp(MISSION_ID,0,"州务行动开始了,那些州派去把箱子拿走.");
	SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--设置Mission的状态为开始状态
	SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--设置开始状态的持续时间
	StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
	StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个新的计时器
	mf_OperateAllPlayer(MISSION_ID,MS_SetPlayerStatechange,ALL_CAMP);

end;
function MS_SetPlayerStatechange()
MS_SetPlayerState(2);
end;
--Mission结束
function MS_EndMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	StopMissionTimer(MISSION_ID,TIMER_ID);
	local nMSUID = GetMissionV(MV_MISSION_UID);
--	mf_DelAllMSPlayer(MISSION_ID,0);	--从Mission里面删除所有的玩家
	mf_ClearMissionData();
	SetGlbValue(1001,0)
--	MS_LeaveMission()
	mf_OperateAllPlayer(MISSION_ID,MS_LeaveMission,ALL_CAMP);
	
end;
--离开Mission
function MS_LeaveMission()
--	local i = 0;
--	local nOldPlayer = 0;
--	local nDeaNum = 0;
--	local nCamptainState = 0;
--	local TeamMemberTab = {};
	
--	if GetMissionV(MV_MISSION_STATE) < 3 and GetMissionV(MV_MISSION_STATE) > 0 then
--		nDeaNum = 0;
--		nCamptainState = 0;
--		if PlayerIndex == GetTeamMember(0) then
--			nOldPlayer = PlayerIndex;
--			for i=1,GetTeamSize() do
--				PlayerIndex = GetTeamMember(i)
--				if PlayerIndex > 0 then
--					if IsPlayerDeath() ~= 0 then
--						nDeaNum = nDeaNum + 1;
--					end
--					tinsert(TeamMemberTab,GetTeamMember(i))
--				end
--			end
--			
--			if nDeaNum == GetTeamSize() then
--				nCamptainState = 1;
--			end

--			for i=1,getn(TeamMemberTab) do
--				PlayerIndex = TeamMemberTab[i];
--				if PlayerIndex > 0 then
--					if PlayerIndex ~= nOldPlayer then						
--						if nCamptainState ~= 1 then
--							Msg2Player("由于队长离开现场,所有的队员将被调离竞技场!");
--						else
--							Msg2Player("因为全队的人都死了,你的团队就会搬到该地区去.");
--						end
--						DelMSPlayer(MISSION_ID,0);
--					end
--				end
--			end
--			PlayerIndex = nOldPlayer;
--			if nCamptainState ~= 1 then
--				Msg2Player("由于队长离开现场,所有的队员将被调离竞技场。");
--			else
--				Msg2Player("因为全队的人都死了,你的团队就会搬到该地区去。.");
--			end
--		end
--	end
	
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0); 
	end
    DelMSPlayer(MISSION_ID,0);
	MS_SetPlayerState(3);
	NewWorld(100,1420,2989);

end;
--加入Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	MS_SetPlayerState(1);
end;
--处理准备阶段的计时器函数
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID, format("%d分钟后活动开启", (nLoop*READY_TIMER_INTERVAL)));
		Createautobuffhuashan()     --jianli开场的buff妹妹每次只存在1分钟
		Createautobuffhuashan() --刷两只
	end;
end;
tAutoBuffTable =--佛妹刷新点位
{
	[1] = {969,1627,3175},
	[2] = {969,1549,3043},
	[3] = {969,1628,3052},
	[4] = {969,1570,2914},
}
function Createautobuffhuashan()
local nRandom = random(1, getn(tAutoBuffTable))
 local nNpcIdx = CreateNpc("素仙秋若水对话","峨眉大师姐",tAutoBuffTable[nRandom][1],tAutoBuffTable[nRandom][2],tAutoBuffTable[nRandom][3]);--华山随机坐标
 SetNpcScript(nNpcIdx,"\\script\\global\\gm\\createautobuff.lua");
 SetNpcLifeTime(nNpcIdx,1*60);	--1分钟生存时间
 local nMapID,nX,nY = GetNpcWorldPos(nNpcIdx);--取妹妹坐标	
-- local  = format("%d,%d",((tPos[2] + 2)/ 8), ((tPos[3] + 2)/ 16))
local vt = format("%d,%d",((nX + 2)/ 8), ((nY + 2)/ 16))
 Msg2MSAll(MISSION_ID,"峨眉大师姐出现在"..vt.."");
end;
--处理Mission开始后的计时器函数
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
		
--		SetNpcLifeTime(GetMissionV(MV_BOX_NPC_INDEX),0)--删去华山宝箱
		Msg2MSAll(MISSION_ID,"活动结束了");
		mf_Talk2Camp(MISSION_ID,0,"活动结束了");
		
		
	elseif nLoop == 1 then	
	SetMissionV(MV_TIMER_LOOP,nLoop-1);
	nNpcIndex = CreateNpc("箱子钱","华山宝箱",969,1571,2908,-1,1,1,100)			--宝箱
	SetNpcScript(nNpcIndex,"\\script\\online\\jpz_event\\first_tong\\huashan_box_npc.lua")--建立华山宝箱
	
	else
		if GetMissionV(MV_OPENBOX_FLAG) == 1 then		--夺取宝箱后延时退出
			CloseMission(MISSION_ID);
		end
		
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID, format("%d分钟后活动结束", (nLoop*STARTED_TIMER_INTERVAL)));
	    mf_OperateAllPlayer(MISSION_ID,chengfajizhi,ALL_CAMP);--惩罚机制
		Msg2MSAll(MISSION_ID,"当前计时器"..nLoop.."");
		if mod(nLoop,3) == 0 then	--
		Createautobuffhuashan()     --jianli开场的buff妹妹每次只存在1分钟
		Createautobuffhuashan() --刷两只
		end;
		
	--	huashan_paihang()  --显示排行榜
	end;
end;
function chengfajizhi()
i = random(1,10)
SetPos(1573-i,2912+i)	


end;
--处理等待结束的计时器函数
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
		MS_LeaveMission();
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"活动结束了，等待传送地图");
	end;
end;
--登陆触发器函数
function OnLogin()
	MS_SetPlayerState(3);
end;
--=====================================================================================
--创建一个MSUID（当前Mission唯一标识）
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;

--设置玩家不同条件下的状态
function MS_SetPlayerState(nMissionState)
	if nMissionState == 1 then					--准备阶段角色状态处理
		CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
		SetLogoutRV(1);							--设置登陆点为城市重生点
		SetDeathPunish(0);						--无死亡惩罚
		SetCreateTeam(1);						--关闭组队功能
		ForbitTrade(1);							--禁止交易
		SetFightState(0);						--战斗状态
  		InteractiveEnable(0);					--交互开关，0关闭，1打开
  		CleanInteractive();						--解散牵手状态
  		StallEnable(0); 						--摆摊开关		  
		UseScrollEnable(0);						--回程符开关			
		SetPKFlag(2,0);							--屠杀模式
		ForbidChangePK(1);						--禁止转换PK状态
--		SetTempRevPos(100,1420,2989);			--死亡重生点
	    RemvoeTempEffect();	--清除所有临时状态
	    ClearStolenSkill();	--清除已偷取的技能，针对棍子
		SetDeathScript("");
        SetDeathScript("\\script\\online\\jpz_event\\first_tong\\playerdeath.lua");
	elseif nMissionState == 2 then				--战斗阶段角色状态处理
		SetFightState(1);
        SetDeathScript("\\script\\online\\jpz_event\\first_tong\\playerdeath.lua");
	elseif nMissionState == 3 then				--比赛结束阶段角色状态处理
		RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
		SetLogoutRV(0);
		SetFightState(0);
		SetDeathPunish(1);
		ForbidChangePK(0);
		ForbitTrade(0);
		SetCreateTeam(0);
		SetPKFlag(0,0)							--关闭PK开关
  		InteractiveEnable(1);
  		StallEnable(1);
  		UseScrollEnable(1);
  		UseSkillEnable(1);
--		SetTempRevPos(0,0,0);					--删除临时重生点
		RemvoeTempEffect();
  		SetDeathScript("");
	end
end

tMS_NAME = { 1,2,3,4,5 }  --排名相关名字用到的MISSION S 的ID
tMV_JIFEN = { 5,6,7,8,9 } --排名相关积分用到的MISSION V 的ID


function huashan_paihang()  --显示排行榜
	local tab_jifen = {};
	local tab_name = {};
	local tab_level = {};
	for i = 1,5 do  --取出MISSION中的排名信息
		tab_jifen[i] = GetMissionV(tMV_JIFEN[i])
		tab_name[i] = GetMissionS(tMS_NAME[i])
		
	end
--	Say("<color=green>兔小丫<color>：依照我今天登记的名册来看，这次考试排名前五的考生是："..
--			"<enter>第一名："..tab_name[1].."，积分："..tab_jifen[1].."，
--			"<enter>第二名："..tab_name[2].."，积分："..tab_jifen[2].."，
--			"<enter>第三名："..tab_name[3].."，积分："..tab_jifen[3].."，
--			"<enter>第四名："..tab_name[4].."，积分："..tab_jifen[4].."，
--			"<enter>第五名："..tab_name[5].."，积分："..tab_jifen[5]..",
--			0)

Msg2MSAll(MISSION_ID,"当前第一名：\n"..tab_name[1].."，击败："..tab_jifen[1].." ");
end



























function get_pos_idx()
	local nPosIdx = 0;
	if random(1,100) <= 30 then	--%30概率传到门口
		nPosIdx = random(1,3);
	else
		nPosIdx = random(4,getn(tEnterPosTable));	--70%概率传到房间里面
	end;
	return nPosIdx;
end;
tEnterPosTable =--复活点进入点
{
	[1] = {969,1632,3274},
	[2] = {969,1678,3111},
	[3] = {969,1652,3124},
	[4] = {969,1632,3108},
	[5] = {969,1615,3137},
	[6] = {969,1573,3097},
	[7] = {969,1536,3034},
	[8] = {969,1609,3055},
	[9] = {969,1598,2990},
	[10] = {969,1561,2942},
	[11] = {969,1600,3004},
	[12] = {969,1604,3054},
	
}