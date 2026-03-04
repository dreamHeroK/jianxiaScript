-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北剧情关卡门票 五行旗幡 Script
-- By StarryNight
-- 2007/12/19 PM 04:18

-- 幸福，其实就是那些不经意间被遗忘的片段。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")

function OnUse()

local nFinishNum = 0;
	if GetTask(Mission_week_seq_TaskID) ==Zgc_pub_week_seq() then
		nFinishNum = GetTask(Mission_login_times_TaskID)
	end
local nPlayNum = 10-nFinishNum;
local strTalk = {
".{物品信息}: 五行旗幡是一品堂的神秘物品, 杀手的追捕 {五行旗幡}, 用来挑战五指节{五行阵之物}.\n.{使用地点}:五行阵使,小组3-5个不同派别,派五指节出来挑战五指战.\n.{使用条件}: 队员要完成西北任务——黄沙落幕\n.{限制使用}:这周你已探索了西域{"..nFinishNum.."} 1次,还可以探索 {"..nPlayNum.."} 1次.",
	}
	
	TalkEx("",strTalk);
	
end