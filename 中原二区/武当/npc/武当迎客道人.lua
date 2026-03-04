-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 武当派NPC莫秋风Script
-- By StarryNight
-- 2006/02/09 PM 17:17
-- 直面自己的内心吧！
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\task\\faction\\faction_head.lua")

function main()
	if tGtTask:check_cur_task(834) == 1 and GetTask(3432) == 0 then
		task_Talk_01();
		return
	end;
	transport_main(2)
end

function task_Talk_01()
	local szTalk = {
		"<color=green>玩家<color>：真人，莫三让我给你带几句话。",
		"<color=green>莫秋风<color>：什么话？",
		"<color=green>玩家<color>：：他想让我告诉你，他很怀念和你一起跟师父学武功的日子，他很懊悔他没能坚持下去，希望你能原谅他的不孝。",
		"<color=green>莫秋风<color>：莫三是个有慧根的人，但是却太在意快意恩仇，到现在我还记得当年他来的时候的毛躁样子。你帮我转告他，茫茫人海，相遇即是缘分，希望他能放下心中的恩怨，我很以有他这个师弟为荣。",
	};
	TalkEx("task_set_01", szTalk);
end;

function task_set_01()
	SetTask(3432, 1);
end;