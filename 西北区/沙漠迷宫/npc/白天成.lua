-- -- ====================== 文件信息 ======================

-- -- 剑侠情缘onlineII 沙漠迷宫NPC白天成Script
-- -- By StarryNight
-- -- 2007/08/07 PM 7:45

-- -- 生病真难受，尤其加上加班~~~~

-- -- ======================================================

-- -- 引用剧情任务头文件
-- Include("\\script\\task\\world\\xibei\\task_head.lua");
-- Include("\\script\\task\\world\\xibei\\task_main.lua");
-- Include("\\script\\task\\world\\task_head.lua");
-- Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")
-- Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

-- function main()
-- 	if g_akct_GetTaskStep(bTag) then
-- 		return
-- 	end
	
-- 	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 2 then
-- 		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 3);
-- 		Say("B秓 ki誱 l﹗ l緈 kh玭g s� d鬾g, h穣 gi髉 ta m礽 ki誱, cho n khi n祇 V祅g trong Ki誱 t醓 竛h h祇 quang ng�.\n<color=gold> ti猽 di謙 333 Sa M筩 H祅h Nh﹏ \n ti猽 di謙 555 T莔 B秓 Nh﹏ <color>", 0);
-- 		TaskTip("Ti猽 di謙 333 Sa M筩 H祅h Nh﹏ ");
-- 		TaskTip("Ti猽 di謙 555 T莔 B秓 Nh﹏");
-- 		return 
-- 	end

-- 	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

-- 	---------------------------------- 西北区23分支1_14黄沙落幕----------------------------------
	
-- 	--已经领取任务但还未取得封妖塔与白天成对话
-- 	if nStep_XBTask_01 == 62 then
-- 		task_023_02_1();
-- 		return
-- 	end
	
-- 	--刷出幻象
-- 	if nStep_XBTask_01 == 64 then
-- 		task_023_02_0();
-- 		return
-- 	end
	
-- 	--将法器送给白天成
-- 	if nStep_XBTask_01 == 65 then
-- 		task_023_03_0();
-- 		return
-- 	end
	
-- 	--已经杀死幻象，关卡接口开启
-- 	if nStep_XBTask_01 == 66 then
-- 		task_023_02_2();
-- 		return
-- 	end
	
-- 	--一般情况下的对话
-- 	local strTalk = {
-- 		"Ngi l�...ng鋘 l鯽 trong sa m筩 �!",
-- 		}
	
-- 	TalkEx("",strTalk);
-- 	return

-- end;
