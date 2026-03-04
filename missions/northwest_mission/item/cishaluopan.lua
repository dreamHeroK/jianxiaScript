-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北剧情关卡门票 磁沙罗盘 Script
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
".{物品信息}: {罗盘} 用来在沙漠里探路, 可惜到了沙漠的尽头就会失去磁性. 用于进入{沙漠尽头}.\n.{使用地点}: 白天城在沙漠的尽头,小组有3-5个不同的流派,把指南针给他就可以进去了.\n.{使用条件}: 队员要完成西北任务——西沙洛莫\n.{限制使用}: 这周你已经探索了西域{"..nFinishNum.."} 一次, 你还可以探索 {"..nPlayNum.."} 一次.",
	}
	
	TalkEx("",strTalk);
	
end