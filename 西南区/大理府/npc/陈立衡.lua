-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 大理NPC陈立衡Script
-- By StarryNight
-- 2005/01/09 PM 15:38
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>陈立衡<color>：据说中原来了个什么教士，嘴里念的话没人听得懂，改天我去会他一下才行。",
		"<color=green>陈立衡<color>：×※……￥＃◎！◎＃！——（大理古语）"
	};
	TalkEx("", szTalk);
	return
end
