-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北剧情关卡门票 烈阳精华 Script
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
".{物品信息}: 烈阳根, {烈阳精华} 取三类积阳炼制而成。是药仁草的克星,能治药仁. 使用方法 {炼丹洞}.\n.{使用地点}: 药七守卫,药仁怕这个东西,小组有3-5个不同流派的人,携带这个东西就可以进去.\n.{使用条件}: 队员要完成西北任务——黄沙落幕\n.{限制使用}: 这周你已经探索过西域{"..nFinishNum.."} 一次, 你还可以探索{"..nPlayNum.."} 1次.",
	}
	
	TalkEx("",strTalk);
	
end