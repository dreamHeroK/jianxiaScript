-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 武师脚本
-- Edited by peres
-- 2005/02/22 PM 18:03
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","大侠已经玩了5个小时了，不能学习武术了，休息一下，以保持健康！")
	 	return
	 end
	if tGtTask:check_cur_task(274) == 1 and GetTask(3378) == 0 then
	  SetTask(3378,1); 
	end
	
	
	
	
	
	local tbSay = {}
	if GetSkillLevel(20) ==0 then
	tinsert(tbSay, "我要学习轻功/yes_skill");
	end
	tinsert(tbSay, "我要了解枢密院声望/pop_shumiyuan_info");
	tinsert(tbSay,"退出/no");
	Say("<color=green>武师<color>：最近朝廷嘉奖初入江湖者，拜师学艺的人越来越多，往后江湖的日子就热闹喽！完成我这里派发的任务，朝廷必定重重有赏！（按<color=yellow>快捷键F4<color>可了解战力/武魂/魅力/势力声望）", getn(tbSay),tbSay)
end

function pop_shumiyuan_info()
	local tbSay = {}
	tinsert(tbSay, "如何获得枢密院声望？/pop_shumiyuan_info_huode");
	tinsert(tbSay, "如何查看自己的枢密院声望？/pop_shumiyuan_info_chakan");
	tinsert(tbSay, "如何兑换枢密院声望奖励？/pop_shumiyuan_info_duihuan");
	tinsert(tbSay,"返回/main");
	tinsert(tbSay,"退出/no");
	Say("<color=green>武师<color>：大丈夫在世，不求建功立业，也需保家卫国。如今外忧内患之际，众人更需好好提高武艺，时刻做好战斗的准备。朝廷为了鼓励百姓习武之风，委派枢密院嘉奖江湖新人。枢密院囤积了大量国宝，凡是在抠密院声望达到一定程度者，均可前来领赏。", getn(tbSay),tbSay)
end

function pop_shumiyuan_info_huode()
	local tbSay = {}
	tinsert(tbSay,"返回/pop_shumiyuan_info");
	tinsert(tbSay,"退出/no");
	Say("<color=green>武师<color>：你有以下两种途径获得枢密院声望：完成主线任务；完成主城<color=green>武师<color>处派发的枢密院日常任务。", getn(tbSay),tbSay)
end

function pop_shumiyuan_info_chakan()
	local tbSay = {}
	tinsert(tbSay,"返回/pop_shumiyuan_info");
	tinsert(tbSay,"退出/no");
	Say("<color=green>武师<color>：点击<color=yellow>快捷键F4<color>或打开背包可了解势力声望情况，在声望详情你可以查看到自己当前的所有声望", getn(tbSay),tbSay)
end

function pop_shumiyuan_info_duihuan()
	local tbSay = {}
	tinsert(tbSay,"返回/pop_shumiyuan_info");
	tinsert(tbSay,"退出/no");
	Say("<color=green>武师<color>：点击<color=yellow>快捷键F4<color>或打开背包可了解势力声望情况，在声望详情你可以看到声望兑换列表。选择枢密院声望列表就会弹出兑换界面，选中您想兑换的物品，点击我要兑换按钮即可。", getn(tbSay),tbSay)
end


function yes_skill()
	if GetCash() < 10 then 
		Talk(1,"","<color=green>武师<color>：您没有足够的铜板！学习轻功需要10个铜板！");
		return
	else
		Pay(10);
		Talk(1,"","<color=green>武师<color>：有了铜板事情就好办多了，你看仔细了——旱地拔葱，嘿！起！");
		LearnSkill(20);
		TaskTip("你已经学会了轻功");
		return
	end;
	
end;

function no()
end;
