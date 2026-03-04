-- -- ====================== 文件信息 ======================

-- -- 剑侠情缘onlineII 皇陵墓室一层NPC爪王Script
-- -- By StarryNight
-- -- 2007/06/29 PM 16:55

-- -- 心平气和一点 (*^__^*) 嘻嘻……

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
-- 	"L蕐 頲 Ph� Phong Ch飝, ch� c莕 d飊g La Canh t譵 ra huy謙 phong th駓 th� c� th� d飊g ch飝  m� c竛h c鯽 t莕g 2."
-- 	}

-- 	--SetNpcLifeTime(index,15);--使得尸体消失
	
-- 	if nMemCount == 0 then -- 玩家未组队
-- 		if GetTask(TASK_XB_ID_01) == 23 then
-- 			AddItem(2,0,715,1,1);--打倒爪王得到破风槌
-- 			AddItem(2,0,716,1,1);--打倒爪王得到西夏法王密函
-- 			AddItem(2,0,717,1,1);--打倒爪王得到非常道符
-- 			TalkEx("",strTalk);
-- 			SetTask(TASK_XB_ID_01,24);
-- 			TaskTip("H譶h nh� c� tin t鴆 trong m藅 h祄 n祔 mau m� ra xem.");
-- 			Msg2Player("H譶h nh� c� tin t鴆 trong m藅 h祄 n祔 mau m� ra xem.");
-- 			GivePlayerAward("Award_XB_31","Easy");
-- 		end;
-- 		if GetTask(TASK_XB_ID_01) == 24 and GetItemCount(2,0,715) < 1 then
-- 			AddItem(2,0,715,1,1);--打倒爪王得到破风槌
-- 		end
-- 	else	
-- 		for i=1,nMemCount do
--       PlayerIndex = GetTeamMember(i);
--       local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
--       local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
-- 			if GetTask(TASK_XB_ID_01) == 23 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
-- 				AddItem(2,0,715,1,1);--打倒爪王得到破风槌
-- 				AddItem(2,0,716,1,1);--打倒爪王得到西夏法王密函
-- 				AddItem(2,0,717,1,1);--打倒爪王得到非常道符
-- 				TalkEx("",strTalk); 
-- 				SetTask(TASK_XB_ID_01,24);
-- 				TaskTip("H譶h nh� c� tin t鴆 trong m藅 h祄 n祔 mau m� ra xem.");
-- 				Msg2Player("H譶h nh� c� tin t鴆 trong m藅 h祄 n祔 mau m� ra xem.");
-- 				GivePlayerAward("Award_XB_31","Easy");
-- 			end;
-- 			if GetTask(TASK_XB_ID_01) == 24 and GetItemCount(2,0,715) < 1 then
-- 				AddItem(2,0,715,1,1);--打倒爪王得到破风槌
-- 			end
-- 		end;
-- 	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
--   end;
-- end
