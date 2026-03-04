--在扬州任务夏侯莲
--created by lizhi
--2005-8-24 10:34
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {};
	if GetSex() == 1 then
		szTalk = {"<color=green>向丝青<color>：离我远点，不想活了是不是！",};
	elseif GetSex() == 2 then
		szTalk = {"<color=green>向丝青<color>：小妹妹有几份姿色啊，及得我前几年的七八分俊俏了。",};
	end;
	TalkEx("", szTalk);
end;
