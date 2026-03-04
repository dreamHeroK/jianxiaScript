-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理NPC郑贯之Script
-- By StarryNight
-- 2005/12/29 PM 16:05
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>郑贯之<color>：哎呀，这年头的生意啊真不好做。不然我也无需大老远地从中原跑到这鬼地方来。",
		"<color=green>郑贯之<color>：什么尸气障毒的，一想起来都叫人直打哆嗦。你说要是不小心被什么毒蛇蛊虫咬到，把我这花容月貌给搭上了，那我就亏了大本了。"
	};
	TalkEx("", szTalk);
	return
end
