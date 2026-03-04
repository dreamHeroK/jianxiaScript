-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 丐帮NPC陈钟鹤Script
-- By StarryNight
-- 2006/02/09 PM 15:19
-- ===================================================
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
		local t_dia_sel = {
			"<color=green>陈钟鹤<color>：虽是一样要饭的苦命人，但聚首一堂倒也乐得道遥自在。",
		}
		Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
	end
end;

function task_Talk_01()
	local strMain = {
		"<color=green>陈钟鹤<color>：我已经收到您的烧酒了！进入丐帮后必须遵守规则，我们不能容忍违法乱纪之徒。"
	}
	TalkEx("task_set_01", strMain);
end

function task_set_01()
	local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_005)
	if (n==0) then
		DelItem(2,1,12,1);
	end
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_005, 1));
end