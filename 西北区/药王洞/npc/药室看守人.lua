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
-- Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")

-- function main()
-- 	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 4 then
-- 		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 5);
-- 		Say("B鋘 ngi c﹜ l祄 ta ng鴄 m総, h穣 ti猽 di謙 ch髇g, ta c秏 th蕐 vui ta s� truy襫 b� thu藅. \n<color=gold>ti猽 di謙 99 ngi c﹜<color>", 0);
-- 		TaskTip("Ti猽 di謙 99 ngi c﹜");
-- 		return 
-- 	end

-- 	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);


-- 	---------------------------------- 西北区19分支1_10付诸东流----------------------------------
	
-- 	----已经领取任务但还未取得易容装与看守人对话
-- 	if nStep_XBTask_01 == 46 then
-- 		task_019_06_1();
-- 		return
-- 	end
	
-- 	--已经取得易容装，刷出药王
-- 	if nStep_XBTask_01 == 47 then
-- 		task_019_06_0();
-- 		return
-- 	end
	
-- 	--已经杀死药王，关卡接口开启
-- 	if nStep_XBTask_01 == 48 then
-- 		task_019_06_2();
-- 		return
-- 	end
	
-- 	--一般情况下的对话
-- 	local strTalk = {
-- 		"Dc th蕋 th� v�:? ( thanh qu竔 d�) ...%##@!#!? ()!*&)@#",
-- 		"Con ngi kh� hi觰�"
-- 		}
	
-- 	TalkEx("",strTalk);
-- 	return

-- end;
