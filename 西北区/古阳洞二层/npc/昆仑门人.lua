-- -- ====================== 文件信息 ======================

-- -- 剑侠情缘onlineII 药王洞NPC药室看守人Script
-- -- By StarryNight
-- -- 2007/08/06 PM 9:00

-- -- 生病真难受，尤其加上加班~~~~

-- -- ======================================================

-- -- 引用剧情任务头文件
-- Include("\\script\\task\\world\\xibei\\task_head.lua");
-- Include("\\script\\task\\world\\xibei\\task_main.lua");
-- Include("\\script\\task\\world\\task_head.lua");

-- function main()

-- local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);


-- 	--------------------------------- 西北区27分支2_4古阳异兽----------------------------------
	
-- 	--已经领取任务但还未取得桃木剑与看守人对话
-- 	if nStep_XBTask_02 == 16 then
-- 		task_027_03_1();
-- 		return
-- 	end
	
-- 	--刷出古阳兽
-- 	if nStep_XBTask_02 == 17 then
-- 		task_027_03_0();
-- 		return
-- 	end
	
-- 	--已经杀死古阳兽，关卡接口开启
-- 	if nStep_XBTask_02 == 18 then
-- 		task_027_03_2();
-- 		return
-- 	end
	
-- 	--一般情况下的对话
-- 	local strTalk = {
-- 		"C� Dng ng n祔 th藅 nguy hi觤.",
-- 		}
	
-- 	TalkEx("",strTalk);
-- 	return

-- end;
