--  文件说明
--  对应NPC名称：周斌举
--  created by lizhi
--  2005-8-4 15:14
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>周斌举<color>：玉阶空伫立，宿鸟归飞急。何处世归程？长亭连短亭。",
	};
	TalkEx("", szTalk);
end;
