
-- ====================== 文件信息 ======================
-- 对应NPC名称：夏杰
-- Edited by lizhi
-- 2005/02/22 PM 18:03
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>夏杰：<color>你有什么事吗？"
	};
	TalkEx("", szTalk);
end;