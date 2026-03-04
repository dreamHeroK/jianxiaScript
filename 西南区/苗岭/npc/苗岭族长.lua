-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 大理任务NPC苗岭族长Script
-- By StarryNight
-- 2006/01/06 PM 17:29
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");


function main()
	local szTalk = {
		"<color=green>苗岭族长<color>：<sex>要不要信奉蚩火真神啊?"
	};
	TalkEx("", szTalk);
	return
end

function OnDeath()
end;
