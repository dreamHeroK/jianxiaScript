--talk to 符沂
--created by lizhi
--2005-8-30 10:35
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");


function main()
	local szTalk = {
		"<color=green>符沂<color>：唉……人们都常说书中自有黄金屋，可我这么多年饱读诗书还是到头来两手空空！"
	};
	TalkEx("", szTalk);
	return
end