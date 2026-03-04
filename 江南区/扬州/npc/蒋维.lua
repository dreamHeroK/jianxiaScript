--蒋维
--created by lizhi
--2005-9-1 16:19
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>蒋维<color>：女人只好活得快乐健康，又有什么胭脂能够媲美那自然健康的红润呢。"
	};
	TalkEx("", szTalk);
	return
end