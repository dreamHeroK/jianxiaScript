-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北剧情关卡门票 龙门宴请柬 Script
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
"{.物品信息}: 李元庆亲自来到龙门镇,招待与一品堂有仇的人. 如果铁周令追击, 甧m {龙门邀请函}可以参加李元庆在{龙门宴会}.\n{.使用地点}: 店小二,每周五、星期六从到龙门镇客栈拿请柬就可以参加.\n{.使用条件}:完成西北任务-黄沙落幕任务.\n",
	}
	
	TalkEx("",strTalk);
	
end