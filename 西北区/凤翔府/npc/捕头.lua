-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 凤翔府NPC捕头Script
-- By StarryNight
-- 2007/06/20 AM 10:54
-- ======================================================

Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>捕头<color>：做捕头最重要是什么？",
		"<color=green>玩家<color>：是什么？",
		"<color=green>捕头<color>：当然是忠义二字！我一直都以袁飞云袁大捕头为榜样的！",
	};
	TalkEx("", szTalk);
end;