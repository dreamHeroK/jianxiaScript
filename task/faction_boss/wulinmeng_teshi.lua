-- =============================================================
-- FileName : wulinmeng_teshi.lua
-- Desc     : 武林盟特使的脚本,门派boss的功能
-- Date     : Dec 14 2006
-- Creator  : Tony(Jizheng)
-- =============================================================
Include("\\script\\lib\\globalfunctions.lua")

TASK_ID_LAST_GET_DATE = 88			-- 上次领取任务的时间,任务变量ID
TASK_ID_HAVE_GOT_TODAY = 89			-- 今天是否已经领取了任务,任务变量ID

-- 默认对话入口
function main()
	Say("<color=green>武林盟特使<color>：如今江湖纷乱，各大门派抛开门户之见，选出本门高手在一起切磋武学，以期挑出资质上佳的武林弟子传授本门绝学和神兵利器，现在委托我推举各大门派的后起之秀，传以绝学，少侠要不要了解看看。",
	5,
		"我要报名申请试练/get_boss_task_now",
		"不知道是哪些武林前辈/get_boss_info",
		"这些武林前辈出现在何处/get_bossweizhi_info",		
		"如何才能获得绝学和神兵/get_prize_info",
		"有空再来看看/cancel_dialog")
	return
end;

-- 退出对话的函数
function cancel_dialog()
end;

-- 获得武林前辈的介绍
function get_boss_info()
	Talk(3, "", 
		 "<color=green>武林盟特使<color>：江湖日益纷乱，自步非烟突然在江湖上重新出现抢夺生辰纲以后，又有传言在江湖中绝迹了数十年的魔教独尊教有死灰复燃的迹象。", 
		 "在此局面下，各大门派抛开门户之见，从本门中选出一位高手名宿和其他门派交流武学精要。同时在<color=yellow>各大门派外<color>，由这些高手挑选武林中年轻俊杰，以其资质,传以各大门派的绝世武学和神兵利器。",
		 "这几位高手是<color=yellow>少林派的玄真<color>长老，<color=yellow>武当派的青书<color>大侠，<color=yellow>峨嵋的慧明<color>师太，<color=yellow>丐帮的黄正一<color>舵主，<color=yellow>唐门的唐喜<color>执事，<color=yellow>天波杨府的杨延德<color>将军，以及<color=yellow>五毒的邪侠古墨<color>。")
end;

-- 获得神兵和绝学的取得途径介绍
function get_prize_info()
	Talk(3, "", 
		 "<color=green>武林盟特使<color>：这就要看你的机缘了，这些高手会在每周五，周六和周日晚上的<color=yellow>21:00<color>在各大门派外出现，要与其过招，最好先在我这里报名，由我先查看你的能力是否足够。", 
		 "如果能力不足，他们所准备赠送给<color=yellow>武林中人的心得和物品<color>少侠就无法拿到了。若是能将其打败，证明了自己的实力，便更有可能获得他们<color=yellow>随身包裹<color>中的武学秘籍和师门秘传物品。",
		 "他们除了本门的秘籍和秘传物品外，有一定的概率给予长老与其它高手交流而来的心得和物品，只要在我这里报名了的人，都起码有机会领取他们送给武林中人的心得和物品。")
end;

-- 报名申请试练
function get_boss_task_now()
	-- 玩家等级要求超过75级
	local nPlayerLevel = GetLevel()
	if (nPlayerLevel < 75) then
		Say("<color=green>武林盟特使<color>：恩，看你还有些潜质，不过江湖经验仍有所不足，待到 <color=yellow>75级<color>以后再来找我吧！", 0)
		return
	end
	
	-- 55级技能需要学满
	local bHaveLearnFullSkill = gf_Check55FullSkill()
	if (bHaveLearnFullSkill == 0) then
		Say("<color=yellow>武林盟特使<color>你的门派55级技能还没学满，待到学满后再来找我吧！", 0)
		return	
	end
	
	local nLastGetTaskDate = GetTask(TASK_ID_LAST_GET_DATE)		-- 上次接任务是什么时候
	local nCurrTime = {date("%y"), date("%m"), date("%d"), date("%H"), date("%w")}
	local nCurDay = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])
	local nCurHour = tonumber(nCurrTime[4])
	local nCurWeekDay = tonumber(nCurrTime[5])
	
	if ((nCurWeekDay == 0 or nCurWeekDay == 5 or nCurWeekDay == 6) and (nCurHour >= 0 and nCurHour < 20)) then
		if (nLastGetTaskDate < nCurDay) then
			nLastGetTaskDate = nCurDay
			SetTask(TASK_ID_LAST_GET_DATE, nLastGetTaskDate)
			SetTask(TASK_ID_HAVE_GOT_TODAY, 1)
		end
		Say("<color=green>武林盟特使<color>：好，少侠做准备去挑战这些武林前辈，证明自己的实力吧，他们会在每周五，周六和周日的<color=yellow>21:00<color>在各大门派出现，能否得到他们的青睐就看你的机缘了。", 0)
		WriteLogEx("Boss su mon","获取任务")
	else
		Say("<color=green>武林盟特使<color>：<color=yellow>每周五，周六和周日0时到晚上20时<color>，可以在我这里报名，现在已经过了时间。如果少侠没有报名只能等下次再来了，武林前辈们都是在<color=yellow>21:00<color>出现在各大门派的。", 0)
	end
end;

-- 获得武林前辈的位置说明
function get_bossweizhi_info()
	Talk(1, "", "<color=green>武林盟特使<color>：\n少林派的<color=yellow>玄真<color>长老常在<color=yellow>少林的172,202<color>附近。\n武当派的<color=yellow>青书<color>大侠常在<color=yellow>武当的197,211<color>附近。\n峨嵋的<color=yellow>慧明<color>师太常在<color=yellow>峨嵋的209,211<color>附近。\n丐帮的<color=yellow>黄正一<color>舵主常在<color=yellow>丐帮的185,202<color>附近。\n唐门的<color=yellow>唐喜<color>执事常在<color=yellow>唐门的196,187<color>附近。\n天波杨府的<color=yellow>杨延德<color>将军常在<color=yellow>天波杨府的209,206<color>附近。\n五毒的邪侠<color=yellow>古墨<color>常在<color=yellow>五毒的213,200<color>附近。")
end;

