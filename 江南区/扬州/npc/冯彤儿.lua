--冯彤儿
--created by lizhi
--2005-9-1 16:19
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>冯彤儿<color>：你在城外看见一队人马了吗？那个领队的叫“雷胜”，你看到了吗？"
	};
	TalkEx("", szTalk);
	return
end