-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 光明顶NPC殷铭Script
-- By StarryNight
-- 2007/06/26 PM 5:51
-- ======================================================

Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>殷铭<color>：在凤翔的黄土里，中原的美酒若遇上波斯来的葡萄酒，那可要逊色了。",
	};
	TalkEx("", szTalk);
end;
