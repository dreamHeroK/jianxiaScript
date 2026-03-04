-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 丐帮NPC洪七Script
-- By StarryNight
-- 2006/02/09 PM 17:17
-- 直面自己的内心吧！
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
		transport_main(4)
	end
end;

function task_Talk_01()
	local strMain = {
		"<color=green>洪七<color>：我已经收到您的烧酒了！谢谢！"
	}
	TalkEx("task_set_01", strMain);
end

function task_set_01()
	local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_001)
	if (n==0) then
		DelItem(2,1,12,1);
	end
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_001, 1));
end