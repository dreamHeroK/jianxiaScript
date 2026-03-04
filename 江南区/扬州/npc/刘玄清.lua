--刘玄清
--created by lizhi
--2005-9-1 16:19
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>刘玄清<color>：什么市道啊！光天化日的，说不让进洞就不让进洞了，没王法了！"
	};
	TalkEx("", szTalk);
	return
end