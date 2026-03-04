
-- ====================== 文件信息 ======================
-- 对应NPC名称：王业伟
-- Edited by lizhi
-- 2005/02/22 PM 18:03
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>王业伟：<color>我的货物全都丢失了，我可怎么回扬州啊，回了扬州又怎么见我我的娘子啊，哎。",
	};
	TalkEx("", szTalk);
end;
