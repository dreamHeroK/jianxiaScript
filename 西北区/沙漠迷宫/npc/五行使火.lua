-- -- ====================== 文件信息 ======================

-- -- 剑侠情缘onlineII 沙漠迷宫NPC五行使火Script
-- -- By StarryNight
-- -- 2007/08/07 PM 04:48

-- -- ======================================================

-- -- 引用剧情任务头文件
-- Include("\\script\\task\\world\\xibei\\task_head.lua");
-- Include("\\script\\task\\world\\xibei\\task_main.lua");
-- Include("\\script\\task\\world\\task_head.lua");

-- function OnDeath(index)

-- local nPreservedPlayerIndex = PlayerIndex;
-- local nMemCount = GetTeamSize();
-- local nMapId, nX, nY = GetWorldPos();
-- local nBossState = {0,0,0,0,0}
-- local nBossName = {" Kim ","M閏","Th駓","H醓","Th�"}
-- local strTalk = {
-- 	"B筺  nh b筰 Ng� H祅h S�, v� th玭g b竜 cho Th竎 B箃 Ho籲g."
-- 	}

-- 	SetNpcLifeTime(index,15);--使得尸体消失
	
-- 	if nMemCount == 0 then -- 玩家未组队
-- 		if GetTask(TASK_XB_ID_01) == 58 then
-- 			if GetBit(GetTask(WUXINGSHI_STATE),4) == 0 then --尚未杀死五行使火
-- 				SetTask(WUXINGSHI_STATE,SetBit(GetTask(WUXINGSHI_STATE),4,1));
-- 				 --5个五行使均打倒
-- 				 if CheckBossStata() == 1 then
-- 					 SetTask(TASK_XB_ID_01,59);
-- 					 SetTask(WUXINGSHI_STATE,0);--清空记录五行使情况的变量
-- 					 Msg2Player("Khi nh b筰 頲 Ng� H祅h S�, v� h錳 b竜 Th竎 B箃 Ho籲g. ");
-- 					 TaskTip("Khi nh b筰 頲 Ng� H祅h S�, v� h錳 b竜 Th竎 B箃 Ho籲g. ");
-- 					 TalkEx("",strTalk);
-- 				 --提示尚未杀死5个五行使，给与提示
-- 				 elseif  CheckBossStata() == 0 then
-- 					 TipBossMsg();
-- 				 end
-- 			--提示已经杀死1个五行使，还有未杀死的	 					
-- 			elseif CheckBossStata() == 0 then
-- 				TipBossMsg();
-- 			end
-- 		end;
-- 	else	
-- 		for i=1,nMemCount do
--       PlayerIndex = GetTeamMember(i);
--       local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
--       local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
--       if GetTask(TASK_XB_ID_01) == 58 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
-- 				if GetBit(GetTask(WUXINGSHI_STATE),4) == 0 then --尚未杀死五行使火
-- 					SetTask(WUXINGSHI_STATE,SetBit(GetTask(WUXINGSHI_STATE),4,1));
-- 					 --5个五行使均打倒
-- 					 if CheckBossStata() == 1 then
-- 						SetTask(TASK_XB_ID_01,59);
-- 						SetTask(WUXINGSHI_STATE,0);--清空记录五行使情况的变量
-- 					 Msg2Player("Khi nh b筰 頲 Ng� H祅h S�, v� h錳 b竜 Th竎 B箃 Ho籲g. ");
-- 					 TaskTip("Khi nh b筰 頲 Ng� H祅h S�, v� h錳 b竜 Th竎 B箃 Ho籲g. ");
-- 						TalkEx("",strTalk);
-- 					 --提示尚未杀死5个五行使，给与提示
-- 					 elseif  CheckBossStata() == 0 then
-- 						 TipBossMsg();	 	
-- 					 end
-- 				--提示已经杀死1个五行使，还有未杀死的	 					
-- 				elseif CheckBossStata() == 0 then
-- 					TipBossMsg();
-- 				end
-- 			end
-- 		end;
-- 	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
--   end;
-- end

-- --检查5个五行使
-- function CheckBossStata()
	
-- local i=0;
-- local nBossState = {0,0,0,0,0};	
	
-- 	for i=1,5 do
-- 		if GetBit(GetTask(WUXINGSHI_STATE),i) == 1 then
-- 			nBossState[i] = 1;
-- 		end
-- 	end
-- 	--均杀死
-- 	if nBossState[1] == nBossState[2] == nBossState[3] == nBossState[4] == nBossState[5] == 1 then
-- 		return 1
-- 	--均未杀
-- 	elseif nBossState[1] == nBossState[2] == nBossState[3] == nBossState[4] == nBossState[5] == 0 then
-- 		return 2
-- 	else
-- 		return 0
-- 	end
	
-- end

-- --检查5个五行使
-- function CheckBossStataEx()
	
-- local i=0;
-- local nBossState = {0,0,0,0,0};	
	
-- 	for i=1,5 do
-- 		if GetBit(GetTask(WUXINGSHI_STATE),i) == 1 then
-- 			nBossState[i] = 1;
-- 		end
-- 	end
	
-- 	return nBossState
	
-- end

-- --提示5个五行使情况
-- function TipBossMsg()

-- local strMsg = "";
-- local strTalk = {};
-- local nNum = 0;
-- local nBossState = CheckBossStataEx();
-- local nBossName = {" Kim ","M閏","Th駓","H醓","Th�"}

-- 	for i=1,5 do
-- 		if nBossState[i] == 0 then
-- 			strMsg = strMsg..nBossName[i]
-- 			nNum = nNum + 1
-- 		end
-- 	end
	
-- 	strTalk = {
-- 		"B筺  h� th�"..(5 - nNum).." Ng� H祅h S�, c遪 "..strMsg.." v� "..nNum.." Ng� H祅h S� ch璦 gi誸 頲."
-- 		}
		
-- 	TalkEx("",strTalk);
	
-- end
