-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理NPC刘典Script
-- By StarryNight
-- 2006/01/13 PM 10:09
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>刘典<color>：这下麻烦了，该怎么回去向赵大人交代呢？",
	};
	TalkEx("", szTalk);
	return
end
