-- -- ====================== 文件信息 ======================

-- -- 剑侠情缘onlineII 古阳洞二层NPC古阳兽Script
-- -- By StarryNight
-- -- 2007/08/08 AM 0:46

-- -- 爱一个人就不要伤害她

-- -- ======================================================

-- -- 引用剧情任务头文件
-- Include("\\script\\task\\world\\xibei\\task_head.lua");
-- Include("\\script\\task\\world\\xibei\\task_main.lua");
-- Include("\\script\\task\\world\\task_head.lua");

-- function OnDeath(index)

-- local nPreservedPlayerIndex = PlayerIndex;
-- local nMemCount = GetTeamSize();
-- local nMapId, nX, nY = GetWorldPos();
-- local strTalk = {
-- 	"(1 竛h h錸g quang l鉫 l猲 c飊g v韎 ti課g r輙 ch鉯 tai)",
-- 	"Ngi ch琲: ??!? (竛h h祇 quang v� ti課g r輙 l骳 n穣 l� sao? Hay n猲 甶 h醝 Di謕 T� Thu.)",
-- 	}

-- 	SetNpcLifeTime(index,15);--使得尸体消失
	
-- 	if nMemCount == 0 then -- 玩家未组队
-- 		if GetTask(TASK_XB_ID_02) == 17 then
-- 			DelItem(2,0,704,1);--锁妖符
-- 			AddItem(2,0,705,1,1);--血魂晶魄
-- 			TalkEx("",strTalk);
-- 			SetTask(TASK_XB_ID_02,18);
-- 			SetTask(CREAT_GUYANGSHOU_TIME,0);--古阳兽刷新时间清零
-- 			TaskTip("Х nh b筰 C� Dng Th� , tr� v� C玭 L玭 g苝 Di謕 T� Thu. ");
-- 			Msg2Player("Х nh b筰 C� Dng Th� , tr� v� C玭 L玭 g苝 Di謕 T� Thu. ");
-- 		end;
-- 	else	
-- 		for i=1,nMemCount do
--       PlayerIndex = GetTeamMember(i);
--       local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
--       local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
-- 			if GetTask(TASK_XB_ID_02) == 17 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
-- 				DelItem(2,0,704,1);--锁妖符
-- 				AddItem(2,0,705,1,1);--血魂晶魄
-- 				TalkEx("",strTalk);
-- 				SetTask(TASK_XB_ID_02,18);
-- 				SetTask(CREAT_GUYANGSHOU_TIME,0);--古阳兽刷新时间清零
-- 				TaskTip("Х nh b筰 C� Dng Th� , tr� v� C玭 L玭 g苝 Di謕 T� Thu. ");
-- 				Msg2Player("Х nh b筰 C� Dng Th� , tr� v� C玭 L玭 g苝 Di謕 T� Thu. ");
-- 			end;
-- 		end;
-- 	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
--   end;
-- end
