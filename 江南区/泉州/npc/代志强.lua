--  文件说明
--  对应NPC名称：戴志强
--  created by lizhi
--  2005-8-4 15:14
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>代志强<color>：我看管的那么严密的宝库怎么就被偷了呢？",
	};
	TalkEx("", szTalk);
end;
