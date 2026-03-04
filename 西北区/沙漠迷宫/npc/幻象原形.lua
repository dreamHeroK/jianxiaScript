-- -- ====================== 文件信息 ======================

-- -- 剑侠情缘onlineII 沙漠迷宫NPC独行老陀Script
-- -- By StarryNight
-- -- 2007/08/07 AM 11:58

-- -- 不要欺负人驼背啊！

-- -- ======================================================

-- -- 引用剧情任务头文件
-- Include("\\script\\task\\world\\xibei\\task_head.lua");
-- Include("\\script\\task\\world\\xibei\\task_main.lua");
-- Include("\\script\\task\\world\\task_head.lua");

-- function OnDeath(index)

-- local nPreservedPlayerIndex = PlayerIndex;
-- local nMemCount = GetTeamSize();
-- local nMapId, nX, nY = GetWorldPos();
-- local nNpcIndex = 0;
-- local t=0;
-- local strSay = {
-- 	"Khi nh b筰 nguy猲 h譶h c馻 Hoan Tng , theo l阨 c馻 Di謕 T� Thu, l骳 n祔 ph秈 d飊g th莕 ch� phong 蕁 n�. Xin ch鋘 c﹗ th莕 ch� phong 蕁: ",
-- 	HUANXIANG_CURSE[1].."/#Confirm_Curse(1)",
-- 	HUANXIANG_CURSE[2].."/#Confirm_Curse(2)",
-- 	HUANXIANG_CURSE[3].."/#Confirm_Curse(3)",
-- 	}

-- 	SetNpcLifeTime(index,15);--使得尸体消失
	
-- 	if nMemCount == 0 then -- 玩家未组队
-- 		if GetTask(TASK_XB_ID_01) == 64 then
-- 			SelectSay(strSay);
-- 		end;
-- 	else	
-- 		for i=1,nMemCount do
--       PlayerIndex = GetTeamMember(i);
--       local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
--       local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
-- 			if GetTask(TASK_XB_ID_01) == 64 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
-- 				SetPlayerScript("\\script\\西北区\\沙漠迷宫\\npc\\幻象原形.lua");
-- 				SelectSay(strSay);
-- 			end;
-- 		end;
-- 	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
--   end;
-- end

-- --确认咒语
-- function Confirm_Curse(index)

-- local strTalk = {};

-- 	--封印成功
-- 	if GetTask(HUANGXIANG_CURSE_ID) == index then
-- 		SetTask(TASK_XB_ID_01,65);
-- 		strTalk = {
-- 			"Ngi ch琲: Nguy猲 h譶h Hoan Tng  b� phong 蕁 th祅h c玭g, sau khi t苙g ph竝 kh� cho B筩h Thi猲 Th祅h li襫 tr� th竝 phong y猽 cho Di謕 T� Thu. "
-- 			}
-- 		Msg2Player("Sau khi t苙g ph竝 kh� phong 蕁 cho B筩h Thi猲 Th祅h, th� mang tr� th竝 phong 蕁 cho Di謕 T� Thu. ");
-- 		TaskTip("Sau khi t苙g ph竝 kh� phong 蕁 cho B筩h Thi猲 Th祅h, th� mang tr� th竝 phong 蕁 cho Di謕 T� Thu. ");

-- 	--封印失败
-- 	else
-- 		strTalk = {
-- 			"Th莕 ch� kh玭g hi謚 l鵦, nguy猲 h譶h Hoan Tng  ch箉 tho竧!"
-- 			}
-- 	end
	
-- 	TalkEx("",strTalk);

-- end
