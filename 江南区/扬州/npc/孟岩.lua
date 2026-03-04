--在扬州任务孟岩
--created by lizhi
--2005-8-24 10:34
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>孟岩：<color>：这年头，连个打铁的材料都买不到！"
	};
	TalkEx("", szTalk);
	return
end