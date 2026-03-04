
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 丐帮门派任务尤知味脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03
-- 村长：2011-4-2将师门售卖NPC功能整理
-- ======================================================
Include("\\script\\task\\faction\\faction_head.lua")
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

-- 为节省任务变量而将单个变量拆分为 8 BIT，只用了前五个
GB_MANTALK = 1010;
GB_MANTALK_001 = 1;
GB_MANTALK_002 = 2;
GB_MANTALK_003 = 3;
GB_MANTALK_004 = 4;
GB_MANTALK_005 = 5;


function main()
	if tGtTask:check_cur_task(336) == 1 and GetTask(3378) == 0 and GetItemCount(2,1,12) >= 1 then
		task_Talk_01();
		return
	else
		sale_main(4)
	end
end

function task_Talk_01()
	local strMain = {
		"<color=green>尤知味<color>：我已经收到您的烧酒了！进入丐帮后我们一起干杯。"
	}
	TalkEx("task_set_01", strMain);
end

function task_set_01()
	local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_002)
	if (n==0) then
		DelItem(2,1,12,1);
	end
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_002, 1));
end