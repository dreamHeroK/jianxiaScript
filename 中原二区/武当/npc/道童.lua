-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 武当派NPC明月Script
-- By StarryNight
-- 2006/02/09 PM 15:19
-- ===================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(306) == 1 then
		task_Talk_01();
		return
	else
		local t_dia_sel = {
			"<color=green>明月<color>：虽然明月我只是小道童，但也是武当派弟子，你怎可小觑于我？",
			"<color=green>明月<color>：明月几时有，把酒问青天。哼，师傅当天一定是喝醉了酒，想着御剑飞仙，才给我取了这么个名字。",
			"<color=green>明月<color>：问路五两、带路十两、传话二十两，明码实价，童叟无欺。有事就掏银子，没事不要扰我清修。"
		}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
	end;
end;

function task_Talk_01()
	local szSay = {
	"<color=green>明月<color>：这是这位<sex>要的{侠少剑}一柄、{烧酒}一壶，共计5银纹银，是要买么？",
	"玩家：买/do_task_buy",
	"玩家：不买/nothing",
	};
	SelectSay(szSay);
end;

function do_task_buy()
	if GetCash() < 500 then
		Talk(1,"","<color=green>明月<color>：<sex>这也太穷了，还是努力一下再来吧！")
		return
	end
	PrePay(500)
	if GetItemCount(0,2,14) < 1 then
		gf_AddItemEx({0,2,14,1}, "侠少剑", 1)
	end
	if GetItemCount(2,1,12) < 1 then
		gf_AddItemEx({2,1,12,1}, "烧酒", 1)
	end
	local szTalk = {
		"<color=green>明月<color>：多谢惠顾，请慢走。",
	};
	TalkEx("", szTalk);
end;


function nothing()
end;