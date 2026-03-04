--落魄的山贼默认对话
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");


function main()
	local szTalk = {
		"<color=green>落魄的山贼<color>：我的命好苦啊……"
	};
	TalkEx("", szTalk);
	return
end

function OnDeath()
end;
