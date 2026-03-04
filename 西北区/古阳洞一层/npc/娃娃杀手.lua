-- 剑侠情缘onlineII 娃娃杀手Script
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>娃娃杀手<color>：原来是你，我远远嗅得{糖葫芦}的香味，循路来看，果然是唐葫芦所卖的{冰糖葫芦}。？许久不见，已是堂内{羽卫}了，好家伙。你来此地是与我一同助非常道人收服异兽的吧？好好好，这长生不老丹定是手到拿来了。",
		"<color=green>玩家<color>：车轮霸王使我来与你一同助{非常道人}收服{古阳兽}的。但是我在洞里并没有寻得你的踪影，后来想起你曾经说过最喜{糖葫芦}，便去买了些来，心想我寻不着你，但若携糖葫芦而来，你或许就会现身了。",
		"<color=green>娃娃杀手<color>：呵呵，好家伙，知我者莫若你也。这唐葫芦所卖的乃是大宋最好之品，小子心思不错。我只是一时寻不着{非常道人}藏身之所，是以才慢了些，车轮小儿又和来多管闲事？好在是你这小子来了，倒可以帮上些忙。来，糖葫芦先给我，吃了好有力气干活。",
		"<color=green>玩家<color>：你还未寻着非常道人藏身之所么？他一心想要收服{古阳兽}，只怕收服}古阳兽}之后未必会真诚与一品堂合作啊。",
		"<color=green>娃娃杀手<color>：其实这是相互利用而已。我们亦不惧区区{古阳兽}，纵使非常道人翻脸，我们亦不会留情。对了，你似乎曾经来过{古阳洞}，可曾知道他的{藏身之所}？哈哈，这糖葫芦果然美味，小子真知我心意，带了这么多前来。",
		"<color=green>玩家<color>：非常道人乃是藏身于一个密室之中，确实难以一时之间寻得，待你吃完糖葫芦我们就一同前往吧。",
		"<color=green>娃娃杀手<color>：呵呵，好，车轮小儿派你来果然有点用处。这……嗯？……怎地又是此种征兆？你……说，{袁飞云}与你是何关系？…….嗯……原来如此，原来你从袁飞云手中救人乃是假的…你究竟是什么人？为何要混入一品堂?",
		"<color=green>玩家<color>：这许多的问题你还是别问了罢，按照你们一品堂的规矩，不应该知道的就别间为好。你们阴险毒辣，一品堂迟早要被连根拔起，我大宋江湖怎会任你们鱼肉？看招！",
		"<color=green>娃娃杀手<color>：原来你是……",
	};

	if tGtTask:check_cur_task(745) == 1 then
		TalkEx("get_talk_set_kill", szTalk);
	end;
end;

function get_talk_set_kill()
	local nIndexNpc = GetTargetNpc();
	ChangeNpcToFight(nIndexNpc);
    	TaskTip("你已成功引出娃娃杀手，得尽快消灭他。");
end