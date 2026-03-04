-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC高升泉Script
-- By StarryNight
-- 2005/12/30 PM 15:26
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>高升泉<color>：身为大理国公，实在是任重而道远啊……",
	};
	TalkEx("", szTalk);
	return
end
