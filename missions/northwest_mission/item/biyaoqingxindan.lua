-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北剧情关卡门票 碧瑶清心丹 Script
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
"{.物品信息}: {碧瑶清心丹} 由梅不容用天地的灵气炼成,用来除除古阳兽的魔性。用于进入的物品{古阳洞}.\n{.使用条件}: 昆仑弟子看守古阳兽的地方,有3-5个不同流派的小组,把灵单交给他,就可以进去.\n{.使用条件}: 队员要完成西北任务——黄沙落幕\n{.限制使用}: 这周你探索了西域{"..nFinishNum.."} 一次,还可以去探索 {"..nPlayNum.."} 一次.",
	}
	
	TalkEx("",strTalk);
	
end