--npc九头金凤脚本
--created by lizhi
--2005-8-24 15:25
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(685) == 1 and GetItemCount(2,96,65) < 1 then
		Talk(5,"get_talk_set_item","<color=green>九头金凤<color>：跑什么跑，一点规矩都没有，这是能让你乱跑的地方么！还不快点退出去！","<color=green>玩家<color>：我是奉命来洗软凤甲的下人。","<color=green>九头金凤<color>：你就是我那家丁找来的？那你说说，我们的暗号的是什么？","<color=green>玩家<color>：<color=yellow>暮<color>霭沉沉，<color=yellow>雪<color>夜昏昏，<color=yellow>山<color>麓重重，<color=yellow>庄<color>舍深探。","<color=green>九头金凤<color>：看来就是你了这是软风甲，你可要小心拿好了，要是出了什么差错，你可担当不起！");
		return
	elseif tGtTask:check_cur_task(686) == 1 and GetItemCount(2,96,65) == 1 then
		Talk(2,"get_talk_set_kill","<color=green>九头金凤<color>：你怎么穿着我给伤的软凤甲？不想活了吗！","<color=green>玩家<color>：哼，我是替玲家兄妹报仇的！");
		return
	else
		Talk(1,"","<color=green>九头金凤<color>：跑什么跑，一点规矩都没有，这是能让你乱跑的地方么！还不快点退出去！");
	end;
end;

function get_talk_set_item()
	if GetItemCount(2,96,65) < 1 then
		gf_AddItemEx({2,96,65,1}, "软凤甲", 1)
	end
end

function get_talk_set_kill()
	local nIndexNpc = GetTargetNpc();
	ChangeNpcToFight(nIndexNpc);
end

function OnDeath()
end;
