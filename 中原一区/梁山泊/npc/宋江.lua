--宋江
--append by lizhi
--2005-9-10 10:17

Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>宋江<color>：兄弟同心，登五台而发愿。全忠秉义，护国保民。"
	};
	TalkEx("", szTalk);
end;