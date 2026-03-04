Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\tmp_task_id_def.lua")

--退出游戏后的重生点ID,也就是报名的那个地方吧
CS_RevId = 1842;
CS_RevData = 3571;

--会场外的位置
CS_OuterPos = {};
CS_OuterPos[1] = {801, 1600, 3238};

--加入双方阵营时的位置
CS_CampPos0 = {};
CS_CampPos1 = {};
CS_CampPos2 = {};
CS_CampPos0[1] = {801, 1600, 3238};   --白色
CS_CampPos1[1] = {801, 1600, 3238};   --紫色
CS_CampPos2[1] = {801, 1600, 3238};   --绿色
CS_CampPos0[2] = {805, 1637, 3166};   --白色
CS_CampPos1[2] = {805, 1637, 3166};   --紫色
CS_CampPos2[2] = {805, 1637, 3166};   --绿色
CS_CampPos0[3] = {803, 1598, 3186};   --白色
CS_CampPos1[3] = {803, 1598, 3186};   --紫色
CS_CampPos2[3] = {803, 1598, 3186};   --绿色
CS_CampPos0[4] = {810, 1607, 3227};   --白色
CS_CampPos1[4] = {810, 1607, 3227};   --紫色
CS_CampPos2[4] = {810, 1607, 3227};   --绿色
CS_CampPos0[5] = {811, 1598, 3237};   --白色
CS_CampPos1[5] = {811, 1598, 3237};   --紫色
CS_CampPos2[5] = {811, 1598, 3237};   --绿色
CS_CampPos0[6] = {802, 1600, 3238};   --白色
CS_CampPos1[6] = {802, 1600, 3238};   --紫色
CS_CampPos2[6] = {802, 1600, 3238};   --绿色
CS_CampPos0[7] = {835, 1600, 3238};   --白色
CS_CampPos1[7] = {835, 1600, 3238};   --紫色
CS_CampPos2[7] = {835, 1600, 3238};   --绿色
CS_CampPos0[8] = {836, 1600, 3238};   --白色
CS_CampPos1[8] = {836, 1600, 3238};   --紫色
CS_CampPos2[8] = {836, 1600, 3238};   --绿色
CS_CampPos0[9] = {837, 1600, 3238};   --白色
CS_CampPos1[9] = {837, 1600, 3238};   --紫色
CS_CampPos2[9] = {837, 1600, 3238};   --绿色
CS_CampPos0[10] = {838, 1600, 3238};   --白色
CS_CampPos1[10] = {838, 1600, 3238};   --紫色
CS_CampPos2[10] = {838, 1600, 3238};   --绿色

--通天大擂 801 成都
--溪流瀑布 810 泉州
--天外飞仙 811 泉州
--脚店客栈 803 成都
--山间索桥 805 成都
--擂震八方 802 泉州
--武林大擂 835 襄阳
--无双大擂 836 襄阳
--英雄大擂 837 扬州
--神兵大擂 838 扬州

MapTab = {};
MapTab[1]= {801, 300, "通天大擂"};
MapTab[2]= {805, 300, "山间索桥"};
MapTab[3]= {803, 300, "脚店客栈"};
MapTab[4]= {810, 100, "溪流瀑布"};
MapTab[5]= {811, 100, "天外飞仙"};
MapTab[6]= {802, 100, "擂震八方"};			
MapTab[7]= {835, 350, "武林大擂"};
MapTab[8]= {836, 350, "无双大擂"};
MapTab[9]= {837, 150, "英雄大擂"};
MapTab[10]= {838, 150, "神兵大擂"};

---------------------------一般常量
FRAME2TIME = 18;
--游戏的最大人数
MAX_MEMBER_COUNT = 100;

MAX_ROOM_COUNT = 6;	 --每个城市能拥有的最大擂台数量

TIME_NO1 = 10; --定时触发器
TIME_NO2 = 11;

TIMER_1 = 20 * FRAME2TIME; -- 20秒公布一下战况
TIMER_2 = 33 * TIMER_1 ; -- 20 * 33 = 60 * 11 交战总时间为11分钟
GO_TIME = 3 ; -- 180 报名时间为1分钟

---------------------------场地常量
MS_STATE = 1;
BW_SIGN_MONEY = 2; --报名费存放
BW_MONEY1 = 3; --双方赌注总合
BW_MONEY2 = 4;
BW_TEMPMONEY = 5; --赌注临时存放
CITYID = 6; --城市ID

BW_KEY = 7; -- 1-100000001的随机数

MS_NEWSVALUE = 9; --任务中存放新闻变量的地方

MS_PLAYER1ID = 10;-- 双方ID
MS_PLAYER2ID = 11;

MS_ROOMINDEX = 12;

GLOBAL_NEWS_SHOW = 20;   --游戏公告是否显示

--押金擂台添加-------------------missionv---------
MS_YAJING_NUM = 99;  --押金数目记录
MS_WIN_CAMP = 98; --记录胜利的一方

MISSIONID = 4;

---------------------------任务常量
MS_POS = 1900;--3个

DUZHU = 1903;	--3个任务变量，存放赌注选择，注额，KEY
SKILLENABLE = 1906;		--是否能够使用武功

---------------------------临时任务常量
JOINSTATE = 242;
JOINROOMINDEX = 243; --选择的场地编号

----------------------------------------------多人擂台-------------------------------------------
--多人地图信息
--地图ID，所在城市地图ID，地图名称，传送坐标，传送Npc坐标
MultiMapTab = {
	[1]= {821, 300, "多人擂台",1604,3244,1600,3238,"群雄大战","成都"},--多人通天大擂
	[2]= {826, 300, "多人擂台",1637,3166,1630,3174,"群雄大战","成都"},--多人山间索桥
	[3]= {823, 300, "多人擂台",1602,3192,1598,3186,"群雄大战","成都"},--多人脚店客栈
	[4]= {822, 100, "多人擂台",1604,3244,1600,3238,"群雄大战","泉州"},--多人擂震八方
	[5]= {825, 100, "多人擂台",1598,3237,1591,3229,"群雄大战","泉州"},--多人天外飞仙
	[6]= {824, 100, "多人擂台",1607,3227,1602,3222,"群雄大战","泉州"},--多人溪流瀑布
	}

--常量信息
MAX_MULTIMAP_NUM 						= 1;	  --城市所开放多人擂台的数量(数量保证大于等于MultiMapTab中同一地图场地数量，否则出错)
MAX_MULTIMAP_FIGTHER_NUM 		= 100;	--参加比赛的角色数量上限
MAX_MULTIMAP_AUDIENCE_NUM 	= 50;	 --参加观赛的角色人数上限
HUNDRED_MONEY 							= 20000;  --入场费为2j
MULIT_MISSION_ID 						= 23;	 --多人擂台MissionID号
MULIT_AUDIENCE_CAMP 				= 2;	  --观众阵型代号
MULIT_FIGTHER_CAMP 					= 1;	  --参赛者阵型代号
READY_TIME 									= 9;	  --一般多人擂台准备时间为3分钟 20(MULTI_TIMER_1)*3*3=180
GAME_TIME  									= 54;	 --一般多人擂台比赛时间为15分钟 20(MULTI_TIMER_1)*3*(15+3)=1080
HUNDRED_READY_TIME 					= 30;	 --百人大擂报名准备时间为10分钟 20(MULTI_TIMER_1)*3*10=600
HUNDRED_GAME_TIME  					= 75;	 --百人大擂比赛时间为15分钟 20(MULTI_TIMER_1)*3*(15+10)=1500
BONUS_RATE 									= 0.4;	--供百人英雄大擂的胜方分配奖金的比例

--场地变量
MULTIMAP_STATE 							= 1; 			--场地预定状况 1为已经被别的玩家预定 2为已经开赛
MULTIMAP_NEWS_STATE   			= 2; 			--场地信息发布进程控制
TOP_KILLER_INDEX	  			= 3; 			--记录当前场地玩家杀人最多的索引
MULTIMAP_NPC_INDEX				= 4; 			--记录擂台Npc的索引
MULTIMAP_BONUS   						= 5; 			--场地奖金总额
GAME_TYPE										= 6; 			--场地类型标识 0：一般多人擂台 1：百人大擂
START_TIME									= 7;			--记录百人英雄大擂开放场地的时间
OVER_TIME										= 8;			--记录百人英雄大擂关闭场地的时间
DECEDEND_NUM								= 9;			--记录比赛中角色死亡人数	

--临时变量
TOTAL_KILL_NUM 							= 150;		--储存杀死对手数量的变量
PLAYER_CAMP 								= 151;		--储存玩家当前阵营

--定时触发器ID
MULTI_TIME_ID1 							= 46;			--一般多人擂台计时器
MULTI_TIME_ID2 							= 47;			--百人英雄大擂计时器 

--定时触发器触发时间
MULTI_TIMER_1 							= 20 * FRAME2TIME; -- 一般多人擂台20秒公布一下战况
MULTI_TIMER_2 							= 20 * FRAME2TIME; -- 百人英雄大擂20秒公布一下战况  
							  
--玩家变量
MULTIMAP_PLAYER_STATE 			= 1151;		--记录玩家是否进入多人擂台标志，用于玩家登录游戏时清除状态
AWARD_DATE_HUNDRED					= 1153;		--记录玩家上一次获取百人擂台常规奖励的日期
AWARD_DATE_TEAM							= 1154;		--记录玩家上一次获取团队擂台常规奖励的日期

----------------------------------------------多人组队擂台-------------------------------------

--多人地图信息
--地图ID，所在城市地图ID，地图名称，传送坐标，传送Npc坐标
SingleTeamMapTab = {
	[1]= {829, 300, "通天大擂",1604,3244,1600,3238,"多人组队通天大擂","成都"},--多人组队通天大擂
	[2]= {834, 300, "山间索桥",1637,3166,1630,3174,"多人组队山间索桥","成都"},--多人组队山间索桥
	[3]= {831, 300, "脚店客栈",1602,3192,1598,3186,"多人组队脚店客栈","成都"},--多人组队脚店客栈
	[4]= {830, 100, "擂震八方",1604,3244,1600,3238,"多人组队擂震八方","泉州"},--多人组队擂震八方
	[5]= {833, 100, "天外飞仙",1598,3237,1591,3229,"多人组队天外飞仙","泉州"},--多人组队天外飞仙
	[6]= {832, 100, "溪流瀑布",1607,3227,1602,3222,"多人组队溪流瀑布","泉州"},--多人组队溪流瀑布
	}

TeamMapTab = {
	[1]= {827, 300, "混战擂台",1604,3244,1600,3238,"战斗队","成都"},--多人组队通天大擂
	[2]= {828, 100, "混战擂台",1604,3244,1600,3238,"战斗队","泉州"},--多人组队擂震八方
	}

--常量信息
TEAM_MISSION_ID 						= 29;	 --组队多人擂台MissionID号
SINGLE_TEAM_MISSION_ID	  = 30;			--组队单挑擂台MissionID号 
MAX_TEAM_NUM 								= 10;		--参加比赛的队伍数量上限
MIN_TEAMER_NUM							= 2;			--参加比赛的队伍队员数量下限
TEAM_GAME_MONEY 						= 100000; --入场费为10j
TEAM_READY_TIME 						= 9;	  --一般多人组队擂台准备时间为3分钟 20(MULTI_TIMER_1)*3*3=180
TEAM_GAME_TIME  						= 54;	 --一般多人组队擂台比赛时间为15分钟 20(MULTI_TIMER_1)*3*(15+3)=1080
TEAM_READY_TIME_AWARD 			= 30;	 --奖励多人组队擂台报名准备时间为10分钟 20(MULTI_TIMER_1)*3*10=600
TEAM_GAME_TIME_AWARD  			= 75;	 --奖励多人组队擂台比赛时间为15分钟 20(MULTI_TIMER_1)*3*(15+10)=1500
TEAM_BONUS_RATE 						= 0.9;	--供团队英雄大擂的胜方分配奖金的比例

--场地变量
TEAM_GAME_STATE 						= 1; 			--场地预定状况 1为已经被别的玩家预定 2为已经开赛 3为比赛结束
TEAM_NEWS_STATE   					= 2; 			--场地信息发布进程控制
TOP_TEAM_INDEX	  				= 3; 			--记录当前场地玩家杀人最多的索引
NPC_INDEX									= 4; 			--记录擂台Npc的索引
TEAM_GAME_BONUS   					= 5; 			--场地奖金总额
TEAM_GAME_TYPE							= 6; 			--场地类型标识 0：一般多人组队擂台 1：奖励多人组队大擂 3:组队单挑擂台
CAPTAIN_STATE								= 7;			--标识订下赛场队伍是否在场地内
DECEDEND_NUM								= 9;			--记录比赛中角色死亡人数
CAPTAIN_ID									= 10;			--使用10个变量分别记录10个队长的PlayerIndex
DELAY_STATE 								= 21;			--准备时段延时退出标志
READY_STATE 								= 22;			--开战时段延时退出标志

--字符串变量
CAPTAIN_NAME								= 1;			--使用10个字符串分别记录10个队长姓名

--定时触发器ID
TEAM_TIME_ID1 							= 54;			--一般多人组队擂台计时器
TEAM_TIME_ID2 							= 55;			--奖励多人组队擂台计时器
SINGLE_TEAM_TIME_ID 				= 56;			--组队单挑擂台计时器

--定时触发器触发时间
TEAM_TIMER_1 								= 20 * FRAME2TIME; -- 一般多人组队擂台20秒公布一下战况
TEAM_TIMER_2 								= 20 * FRAME2TIME; -- 奖励多人组队擂台20秒公布一下战况
SINGLE_TEAM_TIMER						= 20 * FRAME2TIME; -- 组队单挑擂台20秒公布一下战况					

---------------------------------------五一节活动1v1擂台变量----------------------------------------------------------
PLAYERAWARD_DATE		= 1204;	  --作为选手领取奖励日期
PLAYERAWARD_TIMES	   = 1205;	  --作为选手领取奖励次数
AUDIENCEAWARD_DATE	  = 1206;	  --作为观众领取奖励日期
AUDIENCEAWARD_TIMES	 = 1207;	  --作为观众领取奖励次数

function GetLeavePos()
--	if GetTask(MS_POS) == 300 then--成都
--		return 300,1825,3588;
--	elseif GetTask(MS_POS) == 350 then--襄阳
--		return 350,1582,2979;
--	elseif GetTask(MS_POS) == 150 then--扬州
--		return 150,1753,3120;
--	elseif GetTask(MS_POS) == 100 then--泉州
		return 100,1324,2968;
--	else
--		return GetTask(MS_POS), GetTask(MS_POS+1), GetTask(MS_POS+2);
--	end;	
end;

function BW_SetRev()
	if (GetTask(MS_POS) == 300) then--成都
		SetPlayerRevivalPos(CS_RevId, CS_RevData)
	--elseif (GetTask(MS_POS) == 78) then 
	--	SetPlayerRevivalPos(29);--xy
	--else
	--	SetPlayerRevivalPos(6);--cd
	end;
end;

-------------------------------------------------------------------------
--玩家要求离开游戏
function LeaveGame(leavetype)
--leavetype = 0表示，将位置设在地图的场外区域（非战斗区域）
--leavetype = 1表示，将位置设在另一个地图，即彻底离开战场
	--camp = GetCamp();--恢复原始阵营
--	SetRevPos(CS_RevId, CS_RevData)
	--BW_SetRev()
	
	RestorePKCamp();
	
	if (leavetype == 0) then 
		--SetCurCamp(camp)
		SetPKFlag(1,camp);
		SetPos(CS_OuterPos[GetTaskTemp(JOINROOMINDEX)][2], CS_OuterPos[GetTaskTemp(JOINROOMINDEX)][3]);
	else
		--SetCurCamp(camp);
		--SetLogoutRV(0);--设置重生点
		NewWorld(GetLeavePos());
	end;
end;

function GameOver()
	PTab = {};
	idx = 0
	for i = 1, 500 do 
		idx , pidx = GetNextPlayer(MISSIONID, idx, 0);
		if (idx == 0 ) then 
			break
		end
		PTab[i] = pidx;
	end
	
	PCount = getn(PTab);
	OldPlayer = PlayerIndex;
	if (PCount>0) then
		for i  = 1, PCount do 
			PlayerIndex = PTab[i]
			LeaveGame(1)
		end;
	end;
	PlayerIndex = OldPlayer;
	--Msg2Fighters("GameOver "..GetName());
end;
-------------------------------------------------------------------------
function SetPKCamp()
	LeaveTeam();
	SetTaskTemp(200,1);	-- 设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetLogoutRV(1);		-- 玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	SetDeathPunish(0);		-- 无死亡惩罚
	SetCreateTeam(1);		--关闭组队功能
	ForbitTrade(1);
	SetTaskTemp(JOINSTATE, 1);
	SetFightState(0);
	InteractiveEnable(0);	--交互开关，0关闭，1打开
	UseDummy(0,1);	--清除替身符效果
	ForbitLevelUp(1);	--禁止升级
	StallEnable(0);			--摆摊开关
	KillFollower();			--删除跟班
	SetMomentumBoundSwitch(1);	--不可增加杀气值
	gf_ForbidFactionSkill(1);	--屏蔽镇派
	gf_ForbidBlameSkill(1);	--屏蔽诛邪
	ClearColdDown();	--清除所有药CD
	RemvoeTempEffect();	--清除所有临时状态
	ClearStolenSkill();	--清除已偷取的技能，针对棍子
	CastState("imme_clear_skill_interval",-1,0);	--消除所有技能的冷却时间
	--复仇开关
	if (GetName() == GetMissionS(1)) then
		ExercisePK(1,GetMissionV(MS_PLAYER1ID+1));
	end;
	if (GetName() == GetMissionS(2)) then
		ExercisePK(1,GetMissionV(MS_PLAYER1ID));
	end;
end;

function RestorePKCamp()
	SetLogoutRV(0);
	SetFightState(0);
	SetDeathPunish(1);--设置PK惩罚
	ForbidChangePK(0);
	ForbitTrade(0);
	SetCreateTeam(0);
	SetDeathScript("");--设置死亡脚本为空
	SetTaskTemp(JOINROOMINDEX,0);
	SetTaskTemp(JOINSTATE, 0);
	SetPKFlag(0,0)--关闭PK开关
	DesaltPlayer(0);
	if GetTask(SKILLENABLE) == 0 then
		UseSkillEnable(1);--  (1可以使用武功，0禁止使用武功)
	elseif GetTask(SKILLENABLE) == 1 then
		UseSkillEnable(0);--  (1可以使用武功，0禁止使用武功)
		SetTask(SKILLENABLE, 0);
	end;
	InteractiveEnable(1);	--交互开关，0关闭，1打开
	ForbitLevelUp(0);
	StallEnable(1);			--摆摊开关
	KillFollower();			--删除跟班
	ClearColdDown();	--清除所有药CD
	CastState("imme_clear_skill_interval",-1,0);	--消除所有技能的冷却时间
	SetMomentumBoundSwitch(0);
	gf_ForbidFactionSkill(0);
	gf_ForbidBlameSkill(0);
	RestoreAll();
	ForbidRiding(0); --(1禁止骑马，0可以骑马)
	SetPlayerRestrictions(0,0);	--解除限制物品使用
	--复仇开关
	ExercisePK(0,0);
end;

function JoinCamp(Camp)
	--判断角色本身是否能够使用武功
	if GetUseSkillEnable() == -1 then		--player index 不存在
		print("bwhead.lua 247 line GetUseSkillEnable() get player index nil");
		return
	elseif GetUseSkillEnable() == 0 then	--不能够使用武功
		SetTask(SKILLENABLE, 1);
	elseif GetUseSkillEnable() == 1 then	--能够使用武功
		SetTask(SKILLENABLE, 0);
	end;
	AddMSPlayer(MISSIONID, Camp);
	SetPKCamp();
	--打开PK开关 不准交易
	if (Camp == 3) then
		SetPlayerRestrictions(0,1);	--限制物品使用
		SetPKFlag(0,0)
		DesaltPlayer(1);
		UseSkillEnable(0);--  (1可以使用武功，0禁止使用武功)
		--解除座寄上的装备
		UnEquipAtPosition(10)
		--ChangeOwnFeature(0, 0, -1, -1, -1, -1, -1)
		--Msg2Player("系统消息：你暂时变为隐身状态。");
	else
		SetDeathScript("\\script\\missions\\bw\\bwdeath.lua");
		SetPKFlag(1,Camp)
		DesaltPlayer(0);
	end;
	ForbidChangePK(1);
	if GetPlayerFaction() ~= 6 then --不是杨门不能骑马
		ForbidRiding(1);
	end
	
	CleanInteractive();
	if (Camp == 1) then
		NewWorld(CS_CampPos1[GetTaskTemp(JOINROOMINDEX)][1], CS_CampPos1[GetTaskTemp(JOINROOMINDEX)][2], CS_CampPos1[GetTaskTemp(JOINROOMINDEX)][3])
	elseif (Camp == 2) then
		NewWorld(CS_CampPos2[GetTaskTemp(JOINROOMINDEX)][1], CS_CampPos2[GetTaskTemp(JOINROOMINDEX)][2], CS_CampPos2[GetTaskTemp(JOINROOMINDEX)][3])
	else 
		NewWorld(CS_CampPos0[GetTaskTemp(JOINROOMINDEX)][1], CS_CampPos0[GetTaskTemp(JOINROOMINDEX)][2], CS_CampPos0[GetTaskTemp(JOINROOMINDEX)][3])
		CreateTrigger(2,2,556);--设置离开地图触发器
		CastState("state_dispear",1,18*60*15);--为观众加上忽略任何技能效果的状态
	end;

--	str = GetName().."已经进入了比赛赛场。现在外围玩家的赌注是"..GetMissionV(BW_MONEY1)..":"..GetMissionV(BW_MONEY2);
	str = GetName().."已经进入了比赛赛场"
	Msg2MSAll(MISSIONID, str);
end;

---------------------------------------------------------------------------
--
function WinBonus(camp)
	PTab = {};
	idx = 0
	for i = 1, 500 do 
		idx , pidx = GetNextPlayer(MISSIONID, idx, 0);
		if (idx == 0 ) then 
			break
		end
		PTab[i] = pidx;
	end
	
	PCount = getn(PTab);
	OldPlayer = PlayerIndex;
	for i  = 1, PCount do 
		PlayerIndex = PTab[i]
		if (camp == 1) then
			if (GetName() == GetMissionS(1)) then
				V = floor(GetMissionV(BW_SIGN_MONEY) * 9 / 5)
				Earn(V)
			elseif (GetName() ~= GetMissionS(2)) then
				if (GetTask(DUZHU) == camp) then
					V = floor(GetMissionV(BW_MONEY2) * GetTask(DUZHU + 1) * 4 / (GetMissionV(BW_MONEY1) * 5)) + GetTask(DUZHU + 1)
					Earn(V)
				end
			end
		elseif (camp == 2) then
			if (GetName() == GetMissionS(2)) then
				V = floor(GetMissionV(BW_SIGN_MONEY) * 9 / 5)
				Earn(V)
			elseif (GetName() ~= GetMissionS(1)) then
				if (GetTask(DUZHU) == camp) then
					V = floor(GetMissionV(BW_MONEY1) * GetTask(DUZHU + 1) * 4 / (GetMissionV(BW_MONEY2) * 5)) + GetTask(DUZHU + 1)
					Earn(V)
				end
			end
		else
			if (GetName() == GetMissionS(1)) or (GetName() == GetMissionS(2)) then
				V = floor(GetMissionV(BW_SIGN_MONEY) * 9 / 10)
				Earn(V)
			else
				V = GetTask(DUZHU + 1)
				Earn(V)
			end;
		end;
		SetTask(DUZHU + 2, 0);
	end;
	PlayerIndex = OldPlayer;
end;

function RecordBWCount_Win(winidx, failidx)
	orgindex = PlayerIndex
	PlayerIndex = winidx
	AddSucess();
	--nt_setTask(1070, nt_getTask(1070) + 1)
	--Ladder_NewLadder(10117, GetName(), nt_getTask(1070), 1)
	PlayerIndex = failidx
	--nt_setTask(1071, nt_getTask(1071) + 1)
	AddFail();
	PlayerIndex = orgindex
end

-- 设置任务状态
function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	--SyncTaskValue(nTaskID) -- 同步到客户端
end

-- 获取任务状态
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

function Msg2Fighters(str)
	OldPlayer = PlayerIndex;
	for i = 1, 2 do 
		 local index = GetMissionV(MS_PLAYER1ID + i -1);
		 if (index > 0) then
			PlayerIndex = index;
		Msg2Player(str);
		end
	end;
	PlayerIndex = OldPlayer;
end

function Talk2Fighters(str)
	OldPlayer = PlayerIndex;
	for i = 1, 2 do 
		 local index = GetMissionV(MS_PLAYER1ID + i -1);
		 if (index > 0) then
			PlayerIndex = index;
		Talk(1,"",str);
	end
	end;
	PlayerIndex = OldPlayer;
end

function Tip2Fighters(str)
	OldPlayer = PlayerIndex;
	for i = 1, 2 do 
		local index = GetMissionV(MS_PLAYER1ID + i -1);
		 if (index > 0) then
			PlayerIndex = index;
			if (GetName() == GetMissionS(i)) then
		TaskTip(str);
		end
	end
	end;
	PlayerIndex = OldPlayer;
end

function GetPlayerInfo(player_index)
	playerinfo = "";
	
	if (player_index == 0) then
	playerinfo = "信息不明"
	return playerinfo
	end
	
	OldPlayer = PlayerIndex;
	PlayerIndex = player_index;
	playerinfo = playerinfo..GetLevel().."级";
	local route = GetPlayerRoute();
	if (route == 0) then
		playerinfo = playerinfo.."无派系";
	elseif (route == 1) then
		playerinfo = playerinfo.."少林";
	elseif (route == 2) then
		playerinfo = playerinfo.."少林俗家";
	elseif (route == 3) then
		playerinfo = playerinfo.."少林禅僧";
	elseif (route == 4) then
		playerinfo = playerinfo.."少林武僧";
	elseif (route == 5) then
		playerinfo = playerinfo.."唐门";
	elseif (route == 6) then
		playerinfo = playerinfo.."唐门";
	elseif (route == 7) then
		playerinfo = playerinfo.."峨嵋";
	elseif (route == 8) then
		playerinfo = playerinfo.."峨嵋佛家";
	elseif (route == 9) then
		playerinfo = playerinfo.."峨嵋俗家";
	elseif (route == 10) then
		playerinfo = playerinfo.."丐帮";
	elseif (route == 11) then
		playerinfo = playerinfo.."丐帮净衣";
	elseif (route == 12) then
		playerinfo = playerinfo.."丐帮污尧";
	elseif (route == 13) then
		playerinfo = playerinfo.."武当";
	elseif (route == 14) then
		playerinfo = playerinfo.."武当道家";
	elseif (route == 15) then
		playerinfo = playerinfo.."武当俗家";
	elseif route == 16 then
		playerinfo = playerinfo.."杨门";
	elseif route == 17 then
		playerinfo = playerinfo.."杨门枪骑";
	elseif route == 18 then
		playerinfo = playerinfo.."杨门弓骑";
	elseif route == 19 then
		playerinfo = playerinfo.."五毒"
	elseif route == 20  then
		playerinfo = playerinfo.."五毒邪侠"
	elseif route == 21 then
		playerinfo = playerinfo.."五毒蛊师"
	elseif route == 22 then
		playerinfo = playerinfo.."昆仑"
	elseif route == 23 then
		playerinfo = playerinfo.."昆仑天师"
	elseif route == 24 then
		playerinfo = playerinfo.."明教"
	elseif route == 25 then
		playerinfo = playerinfo.."明教圣战"
	elseif route == 26 then
		playerinfo = playerinfo.."明教阵兵"
	elseif route == 27 then
		playerinfo = playerinfo.."明教血人"
	elseif route == 28 then
		playerinfo = playerinfo.."翠烟"
	elseif route == 29 then
		playerinfo = playerinfo.."翠烟舞仙"
	elseif route == 30 then
		playerinfo = playerinfo.."翠烟灵女"
	end
	PlayerIndex = OldPlayer;
	return playerinfo
end

-----------------------------------------多人擂台部分-------------------------------------

--设置玩家不同条件下的状态
--参数 nType  1:准备阶段  2：开战阶段  3：结束阶段
--参数 nCamp  2：观众	 1：选手
--参数 nTeam  不为nil则为组队战斗 2为战斗阵营1 3为战斗阵型2
function SetPlayerState(nType,nCamp,nTeam)
	local i=0;
	local news_str = "";
	
	--准备阶段角色状态处理
	if nType == 1 then
		if nTeam == nil then
			LeaveTeam();
		end
		--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
		SetLogoutRV(1);
		--无死亡惩罚
		SetDeathPunish(0);
		--关闭组队功能
		SetCreateTeam(1);
		ForbitTrade(1);
		SetFightState(0);
		--交互开关，0关闭，1打开
  		InteractiveEnable(0);
  		CleanInteractive();
  		--摆摊开关
  		StallEnable(0);
  		--RemvoeTempEffect();
  		--观众阵型处理		
  		if nCamp == 2 then
  			SetPKFlag(0,0)
			DesaltPlayer(1);
			UseSkillEnable(0);--(1可以使用武功，0禁止使用武功)
			CreateTrigger(2,2,556);--设置离开地图触发器
			CastState("state_dispear",1,18*60*15);--为观众加上忽略任何技能效果的状态
		--选手阵型处理	 			  
		elseif nCamp == 1 then
			UseScrollEnable(0);--回程符开关			
			if nTeam == nil then
				SetPKFlag(2,0);
				SetDeathScript("\\script\\missions\\bw\\multi_death.lua");
			else
				if nTeam == 2 or nTeam == 3 then
					nTeam = nTeam - 2;
					SetPKFlag(1,nTeam);
					SetDeathScript("\\script\\missions\\bw\\single_team_death.lua");
				else
					SetPKFlag(2,0);
					SetDeathScript("\\script\\missions\\bw\\team_death.lua");
				end			
			end
		end
		ForbidChangePK(1);
	end
			
	--战斗阶段角色状态处理
	if nType == 2 then
		if nCamp == 1 then
			SetFightState(1);
		end
	end
	
	--比赛结束阶段角色状态处理	
	if nType == 3 then
		SetLogoutRV(0);	
		SetFightState(0);			
		SetDeathPunish(1);
		ForbidChangePK(0);			
		ForbitTrade(0);			
		SetCreateTeam(0);			
		SetDeathScript("");
		SetPKFlag(0,0)--关闭PK开关
		DesaltPlayer(0);
  		InteractiveEnable(1);
  		StallEnable(1);
  		UseScrollEnable(1);--回程符开关
  		UseSkillEnable(1);
		for i=1,10 do
			RemoveTitle(21,i);
		end
	end
end

--观战
function View_Game(nMapIndex)
	local nTotalAudicnceNum = 0;
	OldSubworld = SubWorld;
	SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
	
	if SubWorld <= 0 then
		WriteLog("[擂台比武]地图场地错误 SubWorld 错误 nMapIndex 为"..nMapIndex..", SubWorld 为"..SubWorld..".");
		SubWorld = OldSubworld;
		return 0
	end 
	
	nTotalAudicnceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP)
	
	if nTotalAudicnceNum < MAX_MULTIMAP_AUDIENCE_NUM then
		NewWorld(MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][4],MultiMapTab[nMapIndex][5]);
		SetPlayerState(1,2);--设置观战状态
		AddMSPlayer(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);--加入阵型
		SetTaskTemp(PLAYER_CAMP,MULIT_AUDIENCE_CAMP);--记录玩家阵型
	else
		Say("<color=green>擂台老板<color>：抱歉，此场比赛观众已满员，少侠还是稍后再来！",0)
	end
	SubWorld = OldSubworld
end

--获取目前杀人数最多的前N名的角色的PlayerIndex
--返回值：tab{Player[1],Player[2]……Player[N]}
function GetMurderIndexTab(nNum)
	local nMurderNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
	local PlayerMSIndex = 0;
	local i,j,k,n = 0,0,0,0;
	local MurderTab = {}
	local PlayerIndexTab = {}
	local MaxTab = {}
	local nMaxPlace = {}
	local nPlayerIndex = 0;
	
	--把所有玩家的index放进PlayerIndexTab
	OldPlayer = PlayerIndex
	for i=1,nMurderNum do
		PlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,PlayerMSIndex,MULIT_FIGTHER_CAMP);
		if nPlayerIndex > 0 then
			tinsert(PlayerIndexTab,nPlayerIndex)
		end
	end
	
	PlayerIndex = OldPlayer
	for k=1,nNum do
		MaxTab = {}
		nMaxPlace = {}
		for i=1,getn(PlayerIndexTab) do			
			if i==1 then
				tinsert(MaxTab,PlayerIndexTab[i])  
	  		tinsert(nMaxPlace,i)
			else
				OldPlayer = PlayerIndex
				PlayerIndex = MaxTab[1]
				nKillNum_1 = GetTaskTemp(TOTAL_KILL_NUM)
				PlayerIndex = PlayerIndexTab[i]
				nKillNum_2 = GetTaskTemp(TOTAL_KILL_NUM)
				PlayerIndex = OldPlayer
				 
			 	if nKillNum_1 < nKillNum_2 then
					MaxTab = {}
					nMaxPlace = {}
					tinsert(MaxTab,PlayerIndexTab[i])
					tinsert(nMaxPlace,i)
				elseif nKillNum_1 == nKillNum_2 then
					tinsert(MaxTab,PlayerIndexTab[i])
					tinsert(nMaxPlace,i)
				end
			end
		end
		n = getn(nMaxPlace)
		if n>1 then
			for i=1,n do
				tremove(PlayerIndexTab,nMaxPlace[i]-i+1)
			end
		end		
		tinsert(MurderTab,MaxTab)
		if getn(PlayerIndexTab) == 0 then
			break
		end
	end
	return MurderTab
end


--显示杀人最多的玩家(以PK阵营1显示)
function ShowTopKillNumPlayer()
	local PlayerIndexTab = GetMurderIndexTab(1)
	local news_str = "";	
	if GetMissionV(TOP_KILLER_INDEX) ~= PlayerIndexTab[1][1] then
		if GetMissionV(TOP_KILLER_INDEX) == 0 and PlayerIndexTab[1][1] > 0 then
			OldPlayer = PlayerIndex
			PlayerIndex = PlayerIndexTab[1][1]
			ForbidChangePK(0);
			SetPKFlag(1,0);
			ForbidChangePK(1);
			SetMissionV(TOP_KILLER_INDEX,PlayerIndexTab[1][1])
			PlayerIndex = OldPlayer
		else
			OldPlayer = PlayerIndex
			PlayerIndex = GetMissionV(TOP_KILLER_INDEX);
			ForbidChangePK(0);
			SetPKFlag(2,0);
			ForbidChangePK(1);
			PlayerIndex = PlayerIndexTab[1][1]
			ForbidChangePK(0);
			SetPKFlag(1,0);
			ForbidChangePK(1);
			SetMissionV(TOP_KILLER_INDEX,PlayerIndexTab[1][1])
			PlayerIndex = OldPlayer
		end
	end
end

--返回当前小时和分钟
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--判断是否为百人大擂状态
function IsHundredBattleState()
	do return 0 end
--	local nHour,nMin = GetLocalTime();
--	
--	if nHour == 11 or nHour == 17 or nHour == 21 then
--			return 1
--	end
--		
--	if nHour == 10 and nMin >= 30 and nMin <= 59 or nHour == 16 and nMin >= 30 and nMin <= 59 or nHour == 20 and nMin >= 30 and nMin <= 59 then	
--		return 1
--	end
--	
--	return 0
end

--转换金钱格式
--参数：以铜钱为单位的数字
--返回值：字符串 XX金XX银XX铜
function TurnMoneyFormat(nMoney)
	local nGold,nSilver,nCuprum = 0,0,0;
	local nBonus = ""
	nCuprum 	= mod(nMoney,100);
	nSilver = mod(((nMoney - nCuprum)/100),100);
	nGold = (nMoney - nCuprum - nSilver*100)/10000;
	if nGold ~= 0 then
		nBonus = "<color=yellow>"..nGold.."<color>金";
	end
	if nSilver ~= 0 then
		nBonus = nBonus.."<color=yellow>"..nSilver.."<color>银";
	end
	if nCuprum ~= 0 then
		nBonus = nBonus.."<color=yellow>"..nCuprum.."<color>铜";
	end
	return nBonus
end

------------------多人组队擂台部分函数--------------------------
function GetGameTeamNum()
	local nNum = 0;
	for i=1,10 do
		if GetMissionS(i) ~= "" then
			nNum = nNum + 1;
		end
	end
	return nNum	
end

function GetGameTeamNumByLife()

	local i = 0;
	local nNum = 0;
	local OldPlayerIndex = 0;

	for i=1,10 do
		if GetMissionS(i) ~= "" then
			OldPlayer = PlayerIndex;
			PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
			if PlayerIndex > 0 then
				for i=1,gf_GetTeamSize() do
					OldPlayerIndex = PlayerIndex;
					PlayerIndex = gf_GetTeamMember(i);
					if PlayerIndex > 0 then
						if IsPlayerDeath() == 0 then 
							nNum = nNum + 1;
							break;
						end
					end
					PlayerIndex = OldPlayerIndex;
				end
			end
			PlayerIndex = OldPlayer;
		end
	end
	return nNum
end

--判断指定阵营的队伍状态
--参数 nCamp:阵营ID
function GetTeamState(nCamp)
	local i = 0;
	local nPlayerMSIndex = 0;
	if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,nCamp) <= 0 then
		return 0
	end
	OldPlayer = PlayerIndex;
	for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,nCamp) do
		nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,nCamp);
		if PlayerIndex > 0 then
			if IsPlayerDeath() == 0 then	
				return 1
			end
		end
	end
	PlayerIndex = OldPlayer;
	return 0
end

--判断是否符合组队单挑比赛资格
function HaveSingleTemaGameTitle()
	local nMapID, nX, nY = GetWorldPos();
	if gf_GetTeamSize() < MIN_TEAMER_NUM then
		TalkEx("",{"<color=green>擂台老板<color>：队伍人数不足("..MIN_TEAMER_NUM.."人或更多)，不能参加比赛。."});
		return 0
	elseif gf_GetCaptainName() ~= GetName() then
		TalkEx("",{"<color=green>擂台老板<color>：你不是队长，不能参加比赛!"});
		return 0
	else
		OldPlayer = PlayerIndex;
		for i=1,gf_GetTeamSize() do
			PlayerIndex = gf_GetTeamMember(i);
			if PlayerIndex > 0 then
				if GetPlayerRoute() == 0 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"<color=green>擂台老板<color>：你的队伍有一个新手，无法参加比赛!"});
					return 0
				end
				if IsStalling() == 1 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"<color=green>擂台老板<color>：您的队伍有成员正在摆摊，不能参加比赛!"});
					return 0
				end
				local nTempMaoID,nTempX, nTempY = GetWorldPos();
				if nTempMaoID ~= nMapID then
					PlayerIndex = OldPlayer;
					TalkEx("",{"<color=green>擂台老板<color>：您的队伍的成员不在当前区域，无法参加比赛!"});
					return 0
				end
			end	
		end
		PlayerIndex = OldPlayer;
	end
	return 1
end

--押金擂台条件判断
function HaveSingleTemaGameTitleYJ()
	local nMapID = GetWorldPos();
	if gf_GetCaptainName() ~= GetName() then
		TalkEx("",{"<color=green>擂台老板<color>：只有队长才能报名。"});
		return 0
	end
	local OldPlayer = PlayerIndex;
	for i=1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		if PlayerIndex > 0 then
			if GetPlayerRoute() == 0 then
				PlayerIndex = OldPlayer;
				TalkEx("",{"<color=green>擂台老板<color>：你的队伍有一个新手，无法参加比赛!"});
				return 0
			end
			if IsStalling() == 1 then
				PlayerIndex = OldPlayer;
				TalkEx("",{"<color=green>擂台老板<color>：您的队伍有成员正在摆摊，不能参加比赛!"});
				return 0
			end
			local nTempMaoID, nTempX, nTempY = GetWorldPos();
			if nTempMaoID ~= nMapID then
				PlayerIndex = OldPlayer;
				TalkEx("",{"<color=green>擂台老板<color>：您的队伍的成员不在当前区域，无法参加比赛!"});
				return 0
			end
		end	
	end	
	PlayerIndex = OldPlayer;
	return 1;
end

--判断是否符合组队比赛资格
function HaveTemaGameTitle(nType)
	local nMapID = GetWorldPos();
	if gf_GetTeamSize() < MIN_TEAMER_NUM then
		TalkEx("",{"<color=green>擂台老板<color>：队伍人数不足("..MIN_TEAMER_NUM.."人或更多)，不能参加比赛。."});
		return 0
	elseif gf_GetCaptainName() ~= GetName() then
		TalkEx("",{"<color=green>擂台老板<color>：你不是队长，不能参加比赛!"});
		return 0
	end
	
	if IsTeamAwardTime() == 1 then
		for i=1,gf_GetTeamSize() do
			OldPlayer = PlayerIndex;
			PlayerIndex = gf_GetTeamMember(i);
			if PlayerIndex > 0 then
				if GetLevel() <60 or GetPlayerRoute() == 0 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"<color=green>擂台老板<color>：你的队伍有一个新手，无法参加比赛!"});
					return 0 
				end
				if IsStalling() == 1 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"<color=green>擂台老板<color>：您的队伍有成员正在摆摊，不能参加比赛!"});
					return 0
				end
				if GetWorldPos() ~= nMapID then
					PlayerIndex = OldPlayer;
					TalkEx("",{"<color=green>擂台老板<color>：您的队伍的成员不在当前区域，无法参加比赛!"});
					return 0
				end
			end
			PlayerIndex = OldPlayer;
		end
		
		if nType == 4 then
			if Pay(TEAM_GAME_MONEY) ~= 1 then
				TalkEx("",{"<color=green>擂台老板<color>：第二次参加比赛需要支付"..TurnMoneyFormat(TEAM_GAME_MONEY).."金，好像携带的金钱不足！"});
				return 0
			else
				SetMissionV(TEAM_GAME_BONUS,GetMissionV(TEAM_GAME_BONUS)+TEAM_GAME_MONEY);
			end
		end
	else
		for i=1,gf_GetTeamSize() do
			OldPlayer = PlayerIndex;
			PlayerIndex = gf_GetTeamMember(i);
			if PlayerIndex > 0 then
				if GetLevel() <10 or GetPlayerRoute() == 0 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"<color=green>擂台老板<color>：你的队伍有一个新手，无法参加比赛!"});
					return 0
				end
				if IsStalling() == 1 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"<color=green>擂台老板<color>：您的队伍有成员正在摆摊，不能参加比赛!"});
					return 0
				end
				if GetWorldPos() ~= nMapID then
					PlayerIndex = OldPlayer;
					TalkEx("",{"<color=green>擂台老板<color>：您的队伍的成员不在当前区域，无法参加比赛!"});
					return 0
				end
			end
			PlayerIndex = OldPlayer;		
		end
	end
	return 1
end

--判断是否为带奖励组队比赛时间
function IsTeamAwardTime()
	do return 0 end
--	local nHour,nMin = GetLocalTime();
--	if nHour == 12 or nHour == 18 or nHour == 23 then
--			return 1
--	end
--	
--	if nHour == 11 and nMin >= 30 and nMin <= 59 or nHour == 17 and nMin >= 30 and nMin <= 59 or nHour == 22 and nMin >= 30 and nMin <= 59 then	
--		return 1
--	end
--	
--	return 0
end

--获取目前杀人数最多的前N个队伍的队长的PlayerIndex
--返回值：tab{Captain[1],Captain[2]……Captain[N]}
function GetMurderCaptainIDTab(nNum)
	local nTeamNum = GetGameTeamNumByLife();
	local i,j,k,m,n = 0,0,0,0,0;
	local nKillNum_1 = 0;
	local nKillNum_2 = 0;
	local CaptainTab = {}
	local CaptainIndexTab = {}
	local MaxTab = {}
	local nMaxPlace = {}
	local nPlayerIndex = 0;
	
	--把所有队长的index放进CaptainIndexTab
	OldPlayer = PlayerIndex
	for i=1,10 do
		nPlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
		if nPlayerIndex > 0 then
			tinsert(CaptainIndexTab,nPlayerIndex)
		end
	end
	PlayerIndex = OldPlayer
	for k=1,nNum do
		MaxTab = {}
		nMaxPlace = {}
		for i=1,getn(CaptainIndexTab) do			
			if i==1 then
				tinsert(MaxTab,CaptainIndexTab[i])  
	  			tinsert(nMaxPlace,i)
			else
				OldPlayer = PlayerIndex;
				PlayerIndex = MaxTab[1];
				nKillNum_1 = 0;
				for m=1,gf_GetTeamSize() do
					if gf_GetTeamMember(m) > 0 then
						PlayerIndex = gf_GetTeamMember(m);
						nKillNum_1 = GetTaskTemp(TOTAL_KILL_NUM) + nKillNum_1;
					end
				end
				PlayerIndex = CaptainIndexTab[i];
				nKillNum_2 = 0;
				for m=1,gf_GetTeamSize() do
					if gf_GetTeamMember(m) > 0 then
						PlayerIndex = gf_GetTeamMember(m);
						nKillNum_2 = GetTaskTemp(TOTAL_KILL_NUM) + nKillNum_2;
					end
				end
				PlayerIndex = OldPlayer
			 	if nKillNum_1 < nKillNum_2 then
					MaxTab = {}
					nMaxPlace = {}
					tinsert(MaxTab,CaptainIndexTab[i])
					tinsert(nMaxPlace,i)
				elseif nKillNum_1 == nKillNum_2 then
					tinsert(MaxTab,CaptainIndexTab[i])
					tinsert(nMaxPlace,i)
				end
			end
		end
		n = getn(nMaxPlace)
		if n>1 then
			for i=1,n do
				tremove(CaptainIndexTab,nMaxPlace[i]-i+1)
			end
		end	
		tinsert(CaptainTab,MaxTab)
		if getn(CaptainIndexTab) == 0 then
			break
		end
	end
	return CaptainTab
end


--显示杀人最多的队伍的角色(以PK阵营1显示)
function ShowTopKillTeamPlayer()
	local CaptainIndexTab = GetMurderCaptainIDTab(1)
	local news_str = "";	
	if GetMissionV(TOP_KILLER_INDEX) ~= CaptainIndexTab[1][1] then
		if GetMissionV(TOP_KILLER_INDEX) == 0 and CaptainIndexTab[1][1] > 0 then
			OldPlayer = PlayerIndex;
			PlayerIndex = CaptainIndexTab[1][1];
			SetMissionV(TOP_KILLER_INDEX,PlayerIndex);
			for i=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(i);
				if PlayerIndex > 0 then
					ForbidChangePK(0);
					SetPKFlag(1,0);
					ForbidChangePK(1);
				end
			end
			PlayerIndex = OldPlayer
		else
			OldPlayer = PlayerIndex	
			PlayerIndex = GetMissionV(TOP_KILLER_INDEX);
			for i=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(i);
				if PlayerIndex > 0 then
					ForbidChangePK(0);
					SetPKFlag(2,0);
					ForbidChangePK(1);
				end
			end
			PlayerIndex = CaptainIndexTab[1][1];
			SetMissionV(TOP_KILLER_INDEX,CaptainIndexTab[1][1]);
			for i=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(i);
				if PlayerIndex > 0 then
					ForbidChangePK(0);
					SetPKFlag(1,0);
					ForbidChangePK(1);
				end
			end
			
			PlayerIndex = OldPlayer
		end
	end
end

function LeaveGameMap()
	local i=0;
	if GetTrigger(556) ~= 0 then
		RemvoeTempEffect();
		for i=1,10 do
			RemoveTitle(21,i);
		end
		RemoveTrigger(GetTrigger(556));
	end
end

--发奖参数：1单人混战失败者常规奖励；2单人混战胜利者常规奖励；3组队混战失败者常规奖励；4组队混战胜利者常规奖励。
function PayAward(nType)
	local	nDate = date("%y")..date("%m")..date("%d");
	if nType == 1 or nType == 2 then
		if nDate ~= GetTask(AWARD_DATE_HUNDRED) then
			ModifyReputation(10,0);
			Earn(50000);
			if nType == 1 then	
				ModifyExp(25000);
				Msg2Player("您获得了25000经验");
				if random(1,100) <= 5 then
					AddItem(2,0,504,1,1);
					Msg2Player("您获得了[小般若树种]×1");
				end
			elseif nType == 2 then	
				if random(1,100) <= 20 then
					ModifyExp(150000);
					Msg2Player("您获得了150000经验");
				else
					ModifyExp(50000);
					Msg2Player("您获得了50000经验");
				end 
				if random(1,100) <= 20 then
					AddItem(2,0,504,1,1);
					Msg2Player("您获得了[小般若树种]×1");
				end 
			end
			SetTask(AWARD_DATE_HUNDRED,nDate);
		else
			Msg2Player("您已获得了奖励，本次没有任何奖励！");
		end
		return
	end
	
	if nType == 3 then
		if nDate ~= GetTask(AWARD_DATE_TEAM) then
			ModifyExp(40000);
			Msg2Player("您获得了40000经验");
			ModifyReputation(10,0);
			if random(1,100) <= 10 then
				AddItem(2,0,398,1,1);
				Msg2Player("您获得了[般若树种]×1");
			end
			SetTask(AWARD_DATE_TEAM,nDate);
		else
			Msg2Player("您已获得了奖励，本次没有任何奖励！");	
		end
		return
	end
			
	if nType == 4 then
		if nDate ~= GetTask(AWARD_DATE_TEAM) then
			ModifyExp(80000);
			Msg2Player("您获得了80000经验");
			ModifyReputation(10,0);
			if random(1,100) <= 30 then
				ModifyExp(300000);
				Msg2Player("您获得了300000经验");
			end
			if random(1,100) <= 20 then
				AddItem(2,2,8,3,1);
				Msg2Player("您获得了[陨铁]×3");
			end
			if random(1,100) <= 20 then
				AddItem(2,0,398,1,1);
				Msg2Player("您获得了[般若树种]×1");
			end
			if random(1,100) <= 10 then
				ModifyExp(500000);
				Msg2Player("您获得了500000经验");
			end
			SetTask(AWARD_DATE_TEAM,nDate);
		else
			Msg2Player("您已获得了奖励，本次没有任何奖励！");	
		end
	end
end

-------------------------------------------五一活动增加部分-----------------------------

--判断1v1擂台比武双方是否在75级以上，并且等级差在5级之内
--返回值：1为符合条件；0为不符合条件
function Is2PlayerLevelOK()
	local PlayerIndex_1 = GetMissionV(MS_PLAYER1ID);
	local PlayerIndex_2 = GetMissionV(MS_PLAYER2ID);
	local Player_1_Level = 0;
	local Player_2_Level = 0;

	OldPlayer = PlayerIndex;
	PlayerIndex = PlayerIndex_1;
	if PlayerIndex_1 > 0 then
		Player_1_Level = GetLevel();
		if Player_1_Level < 75 then
			PlayerIndex = OldPlayer;
			return 0
		else
			PlayerIndex = PlayerIndex_2;
			if PlayerIndex_2 > 0 then
				Player_2_Level = GetLevel();
				--判断双方等级差是否在5级之内
				if (Player_2_Level - Player_1_Level <= 5) and (Player_2_Level - Player_1_Level >= -5) and Player_2_Level >= 75 then 
					PlayerIndex = OldPlayer;
					return 1
				else
					PlayerIndex = OldPlayer;
					return 0
				end
			else
				--player2的index不合法或不存在
			end
		end
	else
		--player1的index不合法或不存在
	end
end

--判断角色是否有资格领取奖励
--参数nType 1为选手；2为观众
function IsGetAward(nType)
	if nType == 1 then
		if GetTask(PLAYERAWARD_DATE) == GetDateNum() then
			if GetTask(PLAYERAWARD_TIMES) < 2 then
				return 1
			else
				Msg2Player("您已经获得了今天所有奖励，无法再次获得。");
				return 0
			end
		else
			SetTask(PLAYERAWARD_TIMES,0);
			return 1
		end
	elseif nType == 2 then
		if GetLevel() <= 10 then
			return 0
		end
		if GetTask(AUDIENCEAWARD_DATE) == GetDateNum() then
			if GetTask(AUDIENCEAWARD_TIMES) < 4 then
				return 1
			else
				Msg2Player("您已经获得了今天所有奖励，无法再次获得。");
				return 0
			end
		else
			SetTask(AUDIENCEAWARD_TIMES,0);
			return 1
		end
	end
end

--判断角色本周是否有资格获得奖励
--参数nType 1为选手；2为观众
function IsGetAwardWeek(nType)
	local nThisWeekTimes = Zgc_pub_week_seq();
	if nType == 1 then
		if GetTask(PLAYERAWARD_DATE) == nThisWeekTimes then
			if GetTask(PLAYERAWARD_TIMES) < 20 then
				return 1
			else
				Msg2Player("您已经获得了本周所有奖励，无法再次获得。");
				return 0
			end
		else
			SetTask(PLAYERAWARD_TIMES,0);
			return 1
		end
	elseif nType == 2 then
		if GetLevel() <= 10 then
			return 0
		end
		if GetTask(AUDIENCEAWARD_DATE) == nThisWeekTimes then
			if GetTask(AUDIENCEAWARD_TIMES) < 40 then
				return 1
			else
				Msg2Player("您已经获得了本周所有奖励，无法再次获得。");
				return 0
			end
		else
			SetTask(AUDIENCEAWARD_TIMES,0);
			return 1
		end
	end
	
end

-- 师徒任务
function process_master_task()
	local PlayerIndex_1 = GetMissionV(MS_PLAYER1ID);
	local PlayerIndex_2 = GetMissionV(MS_PLAYER2ID);

	local nOldPlayer
	if PlayerIndex_1 > 0 then
		nOldPlayer = PlayerIndex
		PlayerIndex = PlayerIndex_1
		local nChance, nMaxChance = CustomDataRead("mp_leitai")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_leitai", "dd", nChance, nMaxChance)
				Msg2Player("师徒任务完成情况："..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
		PlayerIndex = nOldPlayer
	end
	
	if PlayerIndex_2 > 0 then
		nOldPlayer = PlayerIndex
		PlayerIndex = PlayerIndex_2
		local nChance, nMaxChance = CustomDataRead("mp_leitai")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_leitai", "dd", nChance, nMaxChance)
				Msg2Player("师徒任务完成情况："..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
		PlayerIndex = nOldPlayer
	end
end

--给与1v1擂台奖励
function Award2Player()

	local PlayerMSIndex = 0;
	local nPlayerIndex = 0;
	local PlayerIndexTab = {};
	local PlayerIndex_1 = GetMissionV(MS_PLAYER1ID);
	local PlayerIndex_2 = GetMissionV(MS_PLAYER2ID);
	--开放比武大会后，擂台选手就不奖励实战心得了
	--观众部分发奖
	--观众也不给观战心得了
end

--51活动有效日期判断
--返回值1为活动期间，0为非活动期间
--目前改为常规状态，一直打开
function Is51PartyTime()
--	if GetDateNum() >= 20070426 and GetDateNum() <= 20070507 then
		return 0
--	else
--		return 0
--	end

end

--获取年月日数字
function GetDateNum()
	local nYear = date("%Y");
	local nMonth = date("%m");
	local nDay = date("%d");
	local nDate = tonumber(nYear..nMonth..nDay);
	return nDate
end

------------------------------计算本周周次----------------------------
--函数名称：轮次返回函数
--函数功能：返回当前的轮次
function zgc_pub_day_turn(day_num)
	local time_return = floor((GetTime()-57600)/(86400 * day_num))
	return time_return
end

--函数名称：周序数计算函数
--函数功能：返回周的序数
function Zgc_pub_week_seq()
	return floor((zgc_pub_day_turn(1) - 2)/7)
end

--押金擂台给玩家支付押金
function yajin_leitai_pay(nNum)
	if nNum < 100 or nNum > 10000 then
		return 
	end
	--获得金钱
	Earn(nNum * 10000);
	gf_WriteLogEx("不好的赌注","支付黄金赌注",nNum,"金","",GetTongName(),"","","","");
end