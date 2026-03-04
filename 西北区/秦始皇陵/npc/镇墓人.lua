-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 凤翔府NPC镇墓人Script
-- By StarryNight
-- 2007/06/12 AM 11:25
-- ======================================================

Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(727) == 1 then
		if GetTask(3348) == 0 or GetTime() >= GetTask(3348) then
			local szTalk = {
				"<color=green>玩家<color>：这位兄台，不知可听说过附近有鬼将军？",
				"<color=green>镇墓人<color>：你想见见鬼将军？！哈哈，这个容易。",
			};
			TalkEx("get_talk_set_npc", szTalk);
		else
			Talk(1,"","对不起，鬼将军不是你说见就见的，再耐心等等，亲。");
		end
	end;
end;

function get_talk_set_npc()
	local nNpcIdx = CreateNpc("西北鬼将军", "鬼将军", GetWorldPos());
	SetNpcScript(nNpcIdx, "\\script\\task\\global_task\\gtask_npc.lua");
	ChangeNpcToFight(nNpcIdx);
	SetNpcLifeTime(nNpcIdx, 15*60);		--十五分钟
	SetTask(3348, GetTime()+900)	-- 5分钟后可以再次刷新
end
