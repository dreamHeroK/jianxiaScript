-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北剧情关卡门票 回龙索 Script
-- By StarryNight
-- 2::7/12/19 PM :4:18

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
".{物品信息}: {回龙索} 是盗墓者的工具,用来打开墓穴内部. 是进入 {黄陵秘道}.\n.{使用地点}: 守墓人守墓的地方,小组3-5个不同流派,用回龙索打开密道.\n.{使用条件}: 队员都要完成西北任务——黄沙落幕.\n.{H限制使用}: 这周你你已经探索过西域{"..nFinishNum.."} 1次, 你还可以探索 {"..nPlayNum.."} 1次.",
	}
	
	TalkEx("",strTalk);
	
end