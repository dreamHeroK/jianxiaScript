-- -- ====================== 文件信息 ======================

-- -- 剑侠情缘onlineII 沙漠迷宫NPC五行阵使Script
-- -- By StarryNight
-- -- 2007/08/07 PM 4:30

-- -- 生病真难受，尤其加上加班~~~~

-- -- ======================================================

-- -- 引用剧情任务头文件
-- Include("\\script\\task\\world\\xibei\\task_head.lua");
-- Include("\\script\\task\\world\\xibei\\task_main.lua");
-- Include("\\script\\task\\world\\task_head.lua");

-- function main()

-- local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);


-- ---------------------------------- 西北区21分支1_12剑拔弩张----------------------------------
	
-- 	--已经领取任务但还未取得拓拔令对话
-- 	if nStep_XBTask_01 == 57 then
-- 		task_021_03_1();
-- 		return
-- 	end
	
-- 	--已经取得拓拔令，刷出五行使
-- 	if nStep_XBTask_01 == 58 then
-- 		task_021_03_0();
-- 		return
-- 	end
	
-- 	--已经杀死五行使，关卡接口开启
-- 	if nStep_XBTask_01 == 59 then
-- 		task_021_03_2();
-- 		return
-- 	end
	
-- 	--一般情况下的对话
-- 	local strTalk = {
-- 		"L� Ng� H祅h Tr薾 do Nh蕋 Ph萴 阯g l藀 ra, ngi kh竎 kh玭g th� v祇.",
-- 		"N鉯 chuy謓 sao kh� nghe th�."
-- 		}
	
-- 	TalkEx("",strTalk);
-- 	return

-- end;
