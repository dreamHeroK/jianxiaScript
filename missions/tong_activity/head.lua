-- if _DEF_TONG_ACTIVITY_HEAD then
-- 	return
-- else
-- 	_DEF_TONG_ACTIVITY_HEAD = 1
-- end

Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Import("\\script\\lib\\define.lua")
-- Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Import("\\script\\lib\\globalfunctions.lua")

--g_nBossMaxBlood = 2*10^9;
tbTongActivity={
	name="Ho箃 ng bang",
	missionID = 87, --与配置文件：服务端配置文件/GameSvr/settings/task/missions.txt对应
	realMapID = 8900,
	dynamicMap = 1, -- 动态地图
	mv1 = 1, --BOSS IDX
	mv2 = 2, --BOSS无敌的时间
	mv3 = 3, --BOSS的五行属性
	mv4 = 4, --记录是否成功击杀BOSS
	mv5 = 5, --随机箱子是否已经掉落过的标记
	mv6 = 6, --帮会活动的地图ID
	
	ms1 = 1, --记录帮会名
	}

DUTY_ID_NONE		= 0;
DUTY_ID_KING		= 1;
DUTY_ID_QUEEN		= 2;
DUTY_ID_GENERAL		= 3;
DUTY_ID_CAPTAIN		= 4;
DUTY_ID_SERGEANT	= 5;
DUTY_ID_MEMBER		= 6;

enumTongValue_Shop1Opend 			= 1--20; --帮会甲字商店是否开启
enumTongValue_HorseRentPlayerID 	= 2--21; --记录帮会唯一坐骑道具被哪个玩家租用了
enumTongValue_ActivityOpenTime		= 3--22; --帮会活动开启的时间(dHHMM,例如310820表示31号08:20开启)
enumTongValue_ActivityMapId			= 4--23; --帮会活动地图ID
enumTongValue_ActivityOpenWeek		= 5 -- 帮会开启的周数 用于夸周清空
TASKID_TONG_GET_ACTIVITY_AWARD = 3475;
TASKID_TONG_JOIN_ACTIVITY_TIME = 3476;
TASKID_TONG_LUCKDRAW_COUNT	   = 3477;
TASKID_TONG_ACTIVITY_MAP	   = 3486;

TASKID_TONG_ACTIVITY_ENTER = 3478;  -- 在进入时记录一下，给十转任务使用

tbTongActivity = gf_CopyInherit(missionHead, tbTongActivity);
tbTongActivity = gf_CopyInherit(missionBase, tbTongActivity);

firePhases = {
	timerID = 121, --计时器 唯一ID,与配置表: 服务端配置文件/GameSvr/settings/timer_task.txt匹配
	maxsecond = 60*60 + 5,
};
firePhases = gf_CopyInherit(phaseBase,firePhases);

g_isDebug = 0; --Debug状态，可以有特殊的NPC对话选项

thisFile = "\\script\\missions\\tong_activity\\mission.lua";

