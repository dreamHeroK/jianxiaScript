-- -- ====================== 文件信息 ======================

-- -- 剑侠情缘onlineII 皇陵墓室一层NPC镇墓兽Script
-- -- By StarryNight
-- -- 2007/08/03 PM 04:16

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
-- local strTalk = {
-- 	"M閠 ﹎ thanh l韓 vang l猲, l鑙 v祇 t莕g 2  m�, mau ch鉵g v祇 l蕐 b秓 rng d鵤 theo ch� d蒼 c馻 m藅 h祄 T﹜ H� Ph竝 vng."
-- 	}

-- 	SetNpcLifeTime(index,15);--使得尸体消失
	
-- 	if nMemCount == 0 then -- 玩家未组队
-- 		if GetTask(TASK_XB_ID_01) == 25 then
-- 			TalkEx("",strTalk);
-- 			SetTask(TASK_XB_ID_01,26);
-- 			SetTask(CREAT_ZHENMUSHOU_TIME,0);--清除镇墓兽刷新时间变量
-- 			TaskTip("Mau v祇 l蕐 b秓 rng d鵤 theo ch� d蒼 c馻 m藅 h祄 T﹜ H� Ph竝 vng.");
-- 			Msg2Player("Mau v祇 l蕐 b秓 rng d鵤 theo ch� d蒼 c馻 m藅 h祄 T﹜ H� Ph竝 vng.");
-- 			GivePlayerAward("Award_XB_32","Easy");
-- 		end;
-- 	else	
-- 		for i=1,nMemCount do
--       PlayerIndex = GetTeamMember(i);
--       local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
--       local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
-- 			if GetTask(TASK_XB_ID_01) == 25 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
-- 				TalkEx("",strTalk); 
-- 				SetTask(TASK_XB_ID_01,26);
-- 				SetTask(CREAT_ZHENMUSHOU_TIME,0);--清除镇墓兽刷新时间变量
-- 				TaskTip("Mau v祇 l蕐 b秓 rng d鵤 theo ch� d蒼 c馻 m藅 h祄 T﹜ H� Ph竝 vng.");
-- 				Msg2Player("Mau v祇 l蕐 b秓 rng d鵤 theo ch� d蒼 c馻 m藅 h祄 T﹜ H� Ph竝 vng.");
-- 				GivePlayerAward("Award_XB_32","Easy");
-- 			end;
-- 		end;
-- 	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
--   end;
-- end
