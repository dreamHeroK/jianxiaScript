-- -- ====================== 文件信息 ======================

-- -- 剑侠情缘onlineII 皇陵墓室二层NPC镇墓将军东Script
-- -- By StarryNight
-- -- 2007/08/03 PM 04:24

-- -- 千百年守在这里，只为保护里面的人和物……

-- -- ======================================================

-- -- 引用剧情任务头文件
-- Include("\\script\\task\\world\\xibei\\task_head.lua");
-- Include("\\script\\task\\world\\xibei\\task_main.lua");
-- Include("\\script\\task\\world\\task_head.lua");

-- function OnDeath(index)

-- local nPreservedPlayerIndex = PlayerIndex;
-- local nMemCount = GetTeamSize();
-- local nMapId, nX, nY = GetWorldPos();
-- local nBossState = {0,0,0,0};
-- local nBossName = {"Йng ","Nam ","T﹜ ","B綾 "}
-- local strTalk = {
-- 	"B筺 h穣 nh b筰 4 Tr蕁 M� Tng Qu﹏ tr蕁 gi� t莕g 2 v� ch� c莕 t譵 頲 Th� M� Tng Qu﹏ s� nh th鴆 Qu� Tng Qu﹏ 產ng gi� b秓 rng."
-- 	}

-- 	--SetNpcLifeTime(index,15);--使得尸体消失
	
-- 	if nMemCount == 0 then -- 玩家未组队
-- 		if GetTask(TASK_XB_ID_01) == 26 then
-- 			if GetBit(GetTask(ZHENMUJIANGJUN_STATE),4) == 0 then --尚未杀死镇墓将军北
-- 				SetTask(ZHENMUJIANGJUN_STATE,SetBit(GetTask(ZHENMUJIANGJUN_STATE),4,1));
-- 				 --4个将军均打倒
-- 				 if CheckBossStata() == 1 then
-- 					 SetTask(TASK_XB_ID_01,27);
-- 					 SetTask(ZHENMUJIANGJUN_STATE,0);--清空记录镇墓将军情况的变量
-- 					 Msg2Player("T譵 頲 Th� M� Tng Qu﹏ � t莕g 2 c� th� nh th鴆 Qu� Tng Qu﹏ 產ng gi� b秓 rng.");
-- 					 TaskTip("T譵 頲 Th� M� Tng Qu﹏ � t莕g 2 c� th� nh th鴆 Qu� Tng Qu﹏ 產ng gi� b秓 rng.");
-- 					 GivePlayerAward("Award_XB_33","Easy");
-- 					 TalkEx("",strTalk);
-- 				 --提示尚未杀死4个镇墓将军，给与提示
-- 				 elseif  CheckBossStata() == 0 then
-- 					 TipBossMsg();
-- 				 end
-- 			--提示已经杀死1个镇墓将军，还有未杀死的	 					
-- 			elseif CheckBossStata() == 0 then
-- 				TipBossMsg();
-- 			end
-- 		end;
-- 	else	
-- 		for i=1,nMemCount do
--       PlayerIndex = GetTeamMember(i);
--       local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
--       local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
--       if GetTask(TASK_XB_ID_01) == 26 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
-- 				if GetBit(GetTask(ZHENMUJIANGJUN_STATE),4) == 0 then --尚未杀死镇墓将军南
-- 					SetTask(ZHENMUJIANGJUN_STATE,SetBit(GetTask(ZHENMUJIANGJUN_STATE),4,1));
-- 					 --4个将军均打倒
-- 					 if CheckBossStata() == 1 then
-- 						SetTask(TASK_XB_ID_01,27);
-- 						SetTask(ZHENMUJIANGJUN_STATE,0);--清空记录镇墓将军情况的变量
-- 						Msg2Player("T譵 頲 Th� M� Tng Qu﹏ � t莕g 2 c� th� nh th鴆 Qu� Tng Qu﹏ 產ng gi� b秓 rng.");
-- 					 	TaskTip("T譵 頲 Th� M� Tng Qu﹏ � t莕g 2 c� th� nh th鴆 Qu� Tng Qu﹏ 產ng gi� b秓 rng.");
-- 					 	GivePlayerAward("Award_XB_33","Easy");
-- 						TalkEx("",strTalk);
-- 					 --提示尚未杀死4个镇墓将军，给与提示
-- 					 elseif  CheckBossStata() == 0 then
-- 						 TipBossMsg();	 	
-- 					 end
-- 				--提示已经杀死1个镇墓将军，还有未杀死的	 					
-- 				elseif CheckBossStata() == 0 then
-- 					TipBossMsg();
-- 				end
-- 			end
-- 		end;
-- 	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
--   end;
-- end


-- --检查4个镇墓将军
-- function CheckBossStata()
	
-- local i=0;
-- local nBossState = {0,0,0,0};	
	
-- 	for i=1,4 do
-- 		if GetBit(GetTask(ZHENMUJIANGJUN_STATE),i) == 1 then
-- 			nBossState[i] = 1;
-- 		end
-- 	end
-- 	--均杀死
-- 	if nBossState[1] == 1 and nBossState[2] == 1 and nBossState[3] == 1 and nBossState[4] == 1 then
-- 		return 1
-- 	--均未杀
-- 	elseif nBossState[1] == nBossState[2] == nBossState[3] == nBossState[4] == 0 then
-- 		return 2
-- 	else
-- 		return 0
-- 	end
	
-- end

-- --检查4个镇墓将军
-- function CheckBossStataEx()
	
-- local i=0;
-- local nBossState = {0,0,0,0};	
	
-- 	for i=1,4 do
-- 		if GetBit(GetTask(ZHENMUJIANGJUN_STATE),i) == 1 then
-- 			nBossState[i] = 1;
-- 		end
-- 	end
	
-- 	return nBossState
	
-- end

-- --提示4个镇墓将军情况
-- function TipBossMsg()

-- local strMsg = "";
-- local strTalk = {};
-- local nNum = 0;
-- local nBossState = CheckBossStataEx();
-- local nBossName = {"Йng ","Nam ","T﹜ ","B綾 "};

-- 	for i=1,4 do
-- 		if nBossState[i] == 0 then
-- 			strMsg = strMsg..nBossName[i]
-- 			nNum = nNum + 1
-- 		end
-- 	end
	
-- 	strTalk = {
-- 		"B筺  h� th�"..(4 - nNum).." Tr蕁 M� Tng Qu﹏, c遪 "..strMsg.." v� "..nNum.." Tr蕁 M� Tng Qu﹏ ch璦 nh b筰."
-- 		}
		
-- 	TalkEx("",strTalk);
	
-- end
