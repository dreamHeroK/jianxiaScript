-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 辽国高手Script
-- By StarryNight
-- 2007/06/12 AM 11:25
-- ======================================================

Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(385) == 1 and GetTask(3419) == 0 then
		local szTalk = {
			"<color=green>萧寒<color>：你是谁？来这里做什么？",
			"<color=green>玩家<color>：大胆的强盗，我是来救百草翁的！",
			"<color=green>萧寒<color>：哈！哈！哈！那我也就不客气了，我要让你尝尝我的手段了！",
		};
		TalkEx("get_talk_set_kill", szTalk);
	else
		Talk(1,"","你我无冤无仇，就不要干涉我了！");
	end;
end;

function get_talk_set_kill()
	local nIndexNpc = GetTargetNpc();
	ChangeNpcToFight(nIndexNpc);
end

--萧寒死亡脚本
function OnDeath(nIndexNpc)
	if tGtTask:check_cur_task(385) == 1 and GetTask(3419) == 0 then
		SetTask(3419,1);
		SetTask(2033, 0)
		SetTask(3346, 0)	
		SetTask(3378,1);
		local nNpcIdx = CreateNpc("谪臣", "百草翁 ", GetNpcWorldPos(nIndexNpc));
		SetNpcDeathScript(nNpcIdx,"\\script\\中原一区\\杏花村\\npc\\百草翁.lua");
	end;
end