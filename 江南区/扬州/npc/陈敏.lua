--npc陈敏
--created by lizhi
--2005-9-1 11:07
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
 	if tGtTask:check_cur_task(695) == 1 and GetTask(3431) == 0 and GetItemCount(2,0,302) == 1 then
		task_next_01();
		return
	else
		Talk(1,"","<color=green>陈敏<color>：凡用针者，虚则实之，满则泄之，宛陈则除之，邪胜则虚之。")
	end
end;

function task_next_01()
	local szTalk = {
		"<color=green>玩家<color>：一个奇奇怪怪的女子给了我这个什么<color=yellow>天蟾化毒膏<color>，说是夏侯莲还没有完全治愈。我不太放心，你看一眼吧。",
		"<color=green>陈敏<color>：其实夏侯莲那个病，我一直很担心。你走了以后，最近莲儿肚痛又复发了，看来我的药只是治标不治本。这个药我从未见过，不过以药的气味和质感来看，用药上面应该没有问题。不过，我还是先喂一下我们家的老母鸡试一下吧。",
		"<color=green>玩家<color>：……",
		"<color=green>陈敏<color>：看来没有问题，不过你还是去问一下<color=yellow>夏侯琴<color>吧。",
	};
	TalkEx("task_set_01", szTalk);
end;

function task_set_01()
	SetTask(3431, 1);
end;