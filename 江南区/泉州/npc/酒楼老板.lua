-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 酒楼老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(886) == 1 and GetItemCount(2,0,376) < 1 then
		task_Talk_01();
		return
	else
		local szTalk = {
			"<color=green>酒楼老板<color>：这位客官，要不要在小店打个尖？保你满意！",
		};
		TalkEx("", szTalk);
	end;
end;

function task_Talk_01()
	local szSay = {
	"<color=green>酒楼老板<color>：这是这位<sex>要的{鹅黄豆生}，每份价格是5银，是要买么？",
	"玩家：买一份/do_task_buy",
	"玩家：不买/nothing",
	};
	SelectSay(szSay);
end;

function do_task_buy()
	if GetCash() < 500 then
		TalkEx("", "<color=green>酒楼老板<color>：<sex>这也太穷了，还是努力一下再来吧！");
		return
	end
	PrePay(500)
	if GetItemCount(2,0,376) < 1 then
		gf_AddItemEx({2,0,376,1}, "鹅黄豆生", 1)
	end
	local szTalk = {
		"<color=green>酒楼老板<color>：多谢惠顾，请慢走。",
	};
	TalkEx("", szTalk);
end;

function nothing()
end;

