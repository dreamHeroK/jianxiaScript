-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 五毒教NPC方猿Script
-- By StarryNight
-- 2006/02/09 PM 14:19
-- ==================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(845) == 1 and GetItemCount(2,96,88) < 1 then
		task_Talk_01();
		return
	end;
	local t_dia_sel = {
		"<color=green>方猿<color>：尤榕这小子又不知在动什么脑筋，可别闯出大祸来……",
		"<color=green>方猿<color>：尤榕这小子又不知在动什么脑筋，可别闯出大祸来……"
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end;

function task_Talk_01()
	local szTalk = {
		"<color=green>方猿<color>：你是王业伟找来要断魂丸的吧，我等你很久了。",
	};
	TalkEx("task_set_01", szTalk);
end;

function task_set_01()
	if GetItemCount(2,96,88) < 1 then
		gf_AddItemEx({2,96,88,1}, "断魄丸", 1)
	end
end;