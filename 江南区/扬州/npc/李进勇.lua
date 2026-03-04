--李进勇
--created by lizhi
--2005-9-1 16:19
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>李进勇<color>：这位女侠，印堂发亮，似乎是有喜事临门，要不要我来帮你占一卦呢？"
	};
	TalkEx("", szTalk);
	return
end