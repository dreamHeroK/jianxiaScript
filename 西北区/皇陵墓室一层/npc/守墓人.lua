-- -- ====================== 文件信息 ======================

-- -- 剑侠情缘onlineII 皇陵墓一层NPC守墓人Script
-- -- By StarryNight
-- -- 2007/08/03 PM 2:54

-- -- 守着一阕古墓，壮澜悲歌。

-- -- ======================================================

-- -- 引用剧情任务头文件
-- Include("\\script\\task\\world\\xibei\\task_head.lua");
-- Include("\\script\\task\\world\\xibei\\task_main.lua");
-- Include("\\script\\task\\world\\task_head.lua");

-- function main()

-- local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
	
-- 	---------------------------------- 西北区15分支1_6古墓风云----------------------------------
-- 	--领取任务但尚未破坏风水穴前提示
-- 	if nStep_XBTask_01 >= 21 and nStep_XBTask_01 <= 24 then
-- 		task_015_02_1();
-- 		return
-- 	end
	
-- 	--已经破坏风水穴但未打倒镇墓兽
-- 	if nStep_XBTask_01 == 25 then
-- 		task_015_02_0();
-- 		return
-- 	end
	
-- 	--已经完成任务 关卡开启接口
-- 	if nStep_XBTask_01 == 26 then
-- 		task_015_02_2();
-- 		return
-- 	end
	
-- 	--一般情况下的对话
-- 	local strTalk = {
-- 		"Th� M� Nh﹏:? ( thanh qu竔 d�) ...%##@!#!? ()!*&)@#",
-- 		"Con ngi kh� hi觰�"
-- 		}
	
-- 	TalkEx("",strTalk);
-- 	return
	
-- end;
