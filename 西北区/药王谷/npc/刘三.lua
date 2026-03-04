-- -- ====================== 文件信息 ======================

-- -- 剑侠情缘onlineII 药王谷NPC刘三Script
-- -- By StarryNight
-- -- 2007/08/04 AM 10:52

-- -- 我只是一个砍柴人

-- -- ======================================================

-- -- 引用剧情任务头文件
-- Include("\\script\\task\\world\\xibei\\task_head.lua");
-- Include("\\script\\task\\world\\xibei\\task_main.lua");
-- Include("\\script\\task\\world\\task_head.lua");
-- Include("\\script\\online_activites\\2014_03\\task_yinxin.lua")

-- function main()
-- 	--活动
-- 	if gf_CheckEventDateEx(WN_201403_ACTIVITY_ID) == 1 then
-- 		local nRet = WN_201403_Talk2()
-- 		if nRet == 1 then
-- 			return
-- 		end
-- 	end	
	
-- 	--------------


-- 	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);


-- 	---------------------------------- 西北区17分支1_8奇异之草----------------------------------
	
	
-- 	--向刘三询问关于药王洞的事情
-- 	if nStep_XBTask_01 == 34 then
-- 		task_017_01_0();
-- 		return
-- 	end
	
-- 	--带回或未带回20千年乌木物品
-- 	if nStep_XBTask_01 == 35 then
-- 		task_017_02_0();
-- 		return
-- 	end
	
-- 	--还未消灭一株药人草
-- 	if nStep_XBTask_01 == 36 then
-- 		task_017_02_1();
-- 		return
-- 	end
	
-- 	---------------------------------- 西北区19分支1_10付诸东流----------------------------------
-- 	--成功消灭五株药人草，回去与欧阳对话
-- 	if nStep_XBTask_01 == 43 then
-- 		task_019_02_0();
-- 		return
-- 	end
	
-- 	--未回报欧阳画药王的容貌
-- 	if nStep_XBTask_01 == 44 then
-- 		task_019_02_1();
-- 		return
-- 	end
	
-- 	--一般情况下的对话
-- 	strTalk = {
-- 		{"Xung quanh Ph鬾g Tng ph� gi� c竧 r蕋 m筺h th鎖 n g� u 骯 v祅g l祄 sao b竛 頲? m 甶 t c� l� h琻."},
-- 		{"Xung quanh Dc Vng ng c� m閠 s� g� qu� nh璶g b� ta ch苩 h誸 r錳."},
-- 		{"Tin ta 甶 Dc Vng ng r蕋 nguy hi觤 kh玭g n猲 n ."},
-- 		}
-- 	local i = random(1,getn(strTalk));

-- 	TalkEx("",strTalk[i]);
-- 	return
	
-- end;
