-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 凤翔府NPC袁飞云Script
-- By StarryNight
-- 2007/06/12 AM 11:25
-- ======================================================

Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(622) == 1 and GetItemCount(2,0,693) == 1 and GetTask(3419) == 0 then
		local szTalk = {
			"<color=green>袁飞云<color>：来者何人？报上名来！竟敢公然劫囚，与官府作对，欺我六扇门无人么？看招！",
			"<color=green>玩家<color>：废话少说，快给老子放人！",
		};
		TalkEx("get_talk_set_kill", szTalk);
	end;
end;

function get_talk_set_kill()
	local nIndexNpc = GetTargetNpc();
	ChangeNpcToFight(nIndexNpc);
end

--袁飞云死亡脚本
function OnDeath(nIndexNpc)
	if tGtTask:check_cur_task(622) == 1 and GetItemCount(2,0,693) == 1 and GetTask(3419) == 0 then
		SummonNpc("娃娃杀手","娃娃杀手");
		SetTask(3419,1);
		SetTask(2033, 0)
		SetTask(3346, 0)
	end;
end