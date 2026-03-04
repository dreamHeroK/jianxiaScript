-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC董迦罗Script
-- By StarryNight
-- 2006/01/04 PM 16:26
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>董迦罗<color>：请<sex>歇息一段时间。",
	};
	TalkEx("", szTalk);
	return
end
