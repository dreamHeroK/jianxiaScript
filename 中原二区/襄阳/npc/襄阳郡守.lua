--talk to 襄阳郡守
--created by lizhi
--2005-8-30 10:35
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");


function main()
	local szTalk = {
		"<color=green>襄阳郡守<color>：在下军机繁忙，若非有重大事务，恕不招待。"
	};
	TalkEx("", szTalk);
	return
end