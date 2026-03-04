-- ===================================================================
-- Name		:	business_link_head.lua
-- Desc		:	新商会任务脚本，调整了任务形式和奖励模式
-- Date		:	Sep 1st, 2006
-- Creator	:	Tony(Jizheng)
-- ===================================================================
-- 表格文件类的支持以及地图跳转的支持
Include("\\script\\task\\random\\task_gotoworld.lua");
-- 辉煌之夜头文件
Include("\\script\\shinynight_head.lua");
--2006年圣诞节活动奖励支持
Include("\\script\\server_allaward.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\online\\zgc_temp_fun.lua")
Include("\\script\\online_activites\\award.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\ipbonus\\ipbonus.lua")
Include("\\script\\vng\\nhiemvulamgiau\\nhiemvulamgiau.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")	
Include("\\script\\class\\clause3.lua");
-- 任务变量ID的定义
LAST_WEEKEND_DATE	= 353
LAST_DAY_DATE		= 354
CURWEEK_DONE_TIMES	= 355
CURDAY_DONE_TIMES	= 356

--=====================================================================
tbCheck_Award = {
	[1] = {10, 10, 1},
	[2] = {6, 15, 2},
	[3] = {9, 20, 3},
	[4] = {12, 20, 4},
}
-- 默认入口函数
function business_entrance()
	--if IsSHRWstemOpen() ~= 1 then
	--	Talk(1,"","当前尚未开启");  --没用开了就不能商会任务
	--	return 
	--end

	--等级检测	
	local nDate = tonumber(date("%Y%m%d"))
--====================== 商会任务 ==================	
	if CFG_NhiemVuLamGiau == 1 then
		local nType = check_type()
		local nDayCanDoTimes = tbCheck_Award[nType][1]
		local nHaveDoneCurDay = GetTask(CURDAY_DONE_TIMES)
		nDayCanDoTimes = nDayCanDoTimes - nHaveDoneCurDay
		-- 获取是否正在做一个任务
		local nTaskState = GetChainTaskStatus(11)
		-- 获取当前做的任务的种类
		local nTaskCurType = GetTaskType(11)
		local strTalkTab = {}
		tinsert(strTalkTab,"<color=green>商会老板<color>：承蒙皇上大恩，敞号有幸一直帮助国家收集各种物资。如今朝廷有令，暂停物资收集，改为新的形式的任务委托在下发布，同时大幅提高了奖励，少使可有兴趣接下一做？现在商会任务每天可以做<color=yellow>"..nDayCanDoTimes.."次<color>！")
		tinsert(strTalkTab,"<color=green>商会老板<color>：上一个任务完成了吗？记住每天只能完成<color=green>"..nDayCanDoTimes.."次<color>任务。<color=red>提示：取消一次，则会在任务总数中扣除一次。<color>")
		tinsert(strTalkTab,"为朝廷出力,在所不辞/accept_new_task")
		tinsert(strTalkTab,"\n暂时没有兴趣做这任务/exit_dialog")
		tinsert(strTalkTab,"我已经完成了任务/hand_up_task")
		tinsert(strTalkTab,"\n暂时没有兴趣做这任务/exit_dialog")
		tinsert(strTalkTab,"这任务太难了,我想取消/cancel_cur_task")
		tinsert(strTalkTab,"详细介绍新的商会任务吧/intro_new_task")
		tinsert(strTalkTab,"查看本日我完成商会任务的情况/query_cur_week_info")
		tinsert(strTalkTab,"送我去任务地点/goto_mission_pos")
		-- 正在任务中
		if (nTaskState == 1) then
			if (nTaskCurType == 2) then
				Say(strTalkTab[2], 5, strTalkTab[5], strTalkTab[10], strTalkTab[7], strTalkTab[9], strTalkTab[6])
			else
				Say(strTalkTab[2], 4, strTalkTab[5], strTalkTab[9], strTalkTab[6], strTalkTab[7])
			end
		-- 没有开始做或者已经做完了上一个了
		else
			Say(strTalkTab[1], 4, strTalkTab[3], strTalkTab[9], strTalkTab[8], strTalkTab[4])
		end
	end
end;

-- 退出对话的默认对话
function exit_dialog()
	Say("<color=green>商会老板<color>：侠之大者，为国为民。少侠不仅仅要专注个人成就，为国出力，为民除害也是很重要的啊！", 0)
end;

-- 介绍新的商会任务的对话
function intro_new_task()
	Say("<color=green>商会老板<color>：当今圣上英明，早在开战之前就收集了足够多的战略物资，才有了几个大胜的保障啊！为了感谢江湖侠士们的大力协助，圣上特命朝廷拿出战利品犒赏大家，只要完成一些传信和清除各地危害百姓的猛兽或者匪帮，就能得到丰厚的报偿。不过机会有限，每人每日只有一百次机会，大家可要抓住机会啊。若是今日无法完成，第二日也不会再保留前日功绩，而是重新开始计数!", 0)
end;

--可以接任务的时间段
--8：00-23：30
--16：00-17：00
--21：00-22：00
function check_accept_task_time()
	local nTime = tonumber(date("%H%M"));
	if (nTime >= 0800 and nTime <= 2300) then
--		(nTime >= 1600 and nTime <= 1700) or 
--		(nTime >= 2100 and nTime <= 2200) then
		return 1;
	else
		return 0;
	end;
end;

-- 接取一个新任务
function accept_new_task()

	if check_accept_task_time() == 0 then
		Talk(1,"","<color=green>商会老板<color>：最近生意甚为繁忙，人手实在是不够，忙不过来啊，现在只在每日的<color=red>8点到18点<color>我这里才做各位的生意，要来请看好时间啊！");
		return 0;
	end;
	local nReput, nFaction = 0,0
	nReput = 5
	nFaction = 10	

	if GetLevel() < 10  or GetPlayerRoute() == 0 then
		Say("<color=green>商会老板<color>：级别<color=yellow>达到10级，加入了门派，再回来接任务也不算晚.", 0)
		return
	end
	local nDate = tonumber(date("%y%m%d"))
	local nLastGetDate = floor(GetTask(TSK_CHECK_BAOHAP) / 100)	
	if nLastGetDate ~= nDate then
		SetTask(TSK_CHECK_BAOHAP, nDate * 100)
	 end

	 
	local bCanAccept = can_accept_task()
	if (bCanAccept == 1) then		-- 判断是否能够接任务
		SelectRandomTask(11)
		SetTask(TSK_CHECK_BAOHAP, GetTask(TSK_CHECK_BAOHAP) + 1)
		
		local myText = ""
		myText = GetInfo(11, 2)

		-- 获取当前做的任务的种类
		local nTaskCurType = GetTaskType(11)
		gf_WriteLogEx("商会任务", "tham gia")
		if (nTaskCurType == 2) then
			Say("<color=green>商会老板<color>："..myText.."\n需要把你带到任务现场吗？",
				2,
				"好的,带我过去吧/goto_mission_pos",
				"不用了，现在不想去/exit_dialog")
		else
			Say("<color=green>商会老板<color>："..myText.."\n", 0)
		end
	else
		Say("<color=green>商会老板<color>：您今天已经完成了所有任务，明天再来吧。", 0)
	end
end;


-- 送玩家去任务地点
function goto_mission_pos()
	-- 获取该任务的地图 ID
	local nMapIndex = tonumber(GetCurTaskLinkMapIndex(11))
	if (nMapIndex ~= 0 and nMapIndex ~= nil) then
		gotoWorld(nMapIndex)
	end
end;


-- 判断是否能够接任务
-- 现在改为，每天上限6次，没有累加，过一天就清空一天的数据 - Oct 28, 2006 Jeep tag
function can_accept_task()
	local nRet = 0
	-- 更新日期信息
	refresh_time_records()
	
	--local nWeekDay = tonumber(date("%w"))
	--if (nWeekDay == 0) then
	--	nWeekDay = 7
	--end
	
	-- 本周还能做多少次
	--local nWeekCanDoTimes = nWeekDay * 20
	--local nHaveDoneCurWeek = GetTask(CURWEEK_DONE_TIMES)
	--nWeekCanDoTimes = nWeekCanDoTimes - nHaveDoneCurWeek
	
	-- 今天还能做多少次
	local nType = check_type()
	local nDayCanDoTimes = tbCheck_Award[nType][1]
	local nHaveDoneCurDay = GetTask(CURDAY_DONE_TIMES)
	nDayCanDoTimes = nDayCanDoTimes - nHaveDoneCurDay
	
	--if (nWeekCanDoTimes < nDayCanDoTimes) then
	--	nDayCanDoTimes = nWeekCanDoTimes
	--end
	
	if (nDayCanDoTimes > 0) then
		nRet = 1
	end
	
	local nCurrTime = {date("%y"), date("%m"), date("%d")}
	local nCurDay = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])
	
	-- 如果跨回到以前的服务器，就做不了商会任务
	if (nCurDay < GetTask(LAST_DAY_DATE)) then
		nRet = 0
	end
	
	return nRet
end;

-- 提交完成了的任务
function hand_up_task()
	local nTaskFinish = QueryTaskFinish(11)
	-- 更新日期信息
	refresh_time_records()
	local nType = check_type()	
	-- 奖励倍率
	--local nCount = prize_muti_by_time()
	--local multiple = 1		-- 暂时不鸟辉煌之夜的影响
	local nCount = 0		-- 也没有每天的双倍限制了
	local multiple = get_reward_multiple(SYS_COC)
	-- 奖励类型
	local nPrizeType = 1	-- 金钱

	-- 已经完成了任务
	if (nTaskFinish == 1) then

		-- 通知程序，完成了任务
		FinishTaskStep(11, nPrizeType, nCount * multiple) 
--		gf_ModifyYinQuan(tbCheck_Award[nType][2]) -- 获得银券奖励
		-- 更新当天和本周已经完成的任务
		ModifyReputation(5,0)	--5点声望
		SetTask(336,GetTask(336)+10);	--师门贡献度10
		Msg2Player("获得5点声望,10点师门贡献度")
		tAllAward[21]:giveClause();
		local nMoney = 2*10000
		gf_Modify("Money",nMoney);
		local nCurDayDoneTimes = GetTask(CURDAY_DONE_TIMES)
		local nCurWeekDoneTimes = GetTask(CURWEEK_DONE_TIMES)
		SetTask(CURDAY_DONE_TIMES, nCurDayDoneTimes + 1)
		SetTask(CURWEEK_DONE_TIMES, nCurWeekDoneTimes + 1)

		local nLastLoginIp,nCurrentLoginIp = GetLoginIP();	
		local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
		local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
		local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);
		local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
		local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
		local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);
		
		gf_WriteLogEx("商会任务", "完成1次任务", 1, "获得任务奖励 "..tbCheck_Award[nType][3])
		if GetTask(CURDAY_DONE_TIMES)  == 6 then
			gf_WriteLogEx("商会任务", "完成6次任务", 1, "获得任务奖励")
		end
		--------------------------
		-- 师门任务 （商会）
		local nChance, nMaxChance = CustomDataRead("mp_shanghui")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_shanghui", "dd", nChance, nMaxChance)
				Msg2Player("你已经完成任务："..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
	else
		Say("<color=green>商会老板<color>：您尚未完成我分配的任务，继续努力!", 0)
	end
end;

function prize_muti_by_time()
	local nRet = 100
	local nCurrTime = {date("%w"), date("%H")}
	local nWeekday = tonumber(nCurrTime[1])
	local nHours = tonumber(nCurrTime[2])
	
	if (nWeekday == 0 or nWeekday == 6) then	-- 周末
		if (nHours == 18 or nHours == 19 or nHours == 20 or nHours == 21) then
			nRet = 200
		end
	else										-- 平时
		if (nHours == 20 or nHours == 21) then	
			nRet = 200
		end									
	end
	
	return nRet
end;

-- 取消正在做的任务
function cancel_cur_task()
	Say("<color=green>商会老板<color>：<color=yellow>取消任务<color>将耗费一次领取任务奖励的机会并扣除<color=yellow>5点声望<color>，你确定要取消此次任务吗？",
		2,
		"决定取消任务/confirm_cancel_task",
		"\n我再考虑考虑/exit_dialog")
end;

-- 确认取消正在做的任务
--function confirm_cancel_task()
--	-- 通知程序取消当前任务
--	CleanTask(11)
--	-- 更新日期信息
--	refresh_time_records()
--	
--	-- 更新当天和本周已经完成的任务
--	local nCurDayDoneTimes = GetTask(CURDAY_DONE_TIMES)
--	local nCurWeekDoneTimes = GetTask(CURWEEK_DONE_TIMES)
--	SetTask(CURDAY_DONE_TIMES, nCurDayDoneTimes + 1)
--	SetTask(CURWEEK_DONE_TIMES, nCurWeekDoneTimes + 1)
--	
--	-- 提示玩家
--	Say("<color=green>商会老板<color>：你已经成功的取消了本次任务，但是也耗费了一次领取任务奖励的机会！", 0)
--end;

-- 玩家确认取消任务
function confirm_cancel_task()
	
	local nNum = GetTask(390);
	local nRound = 0;

	if GetReputation() >=5 then
		ModifyReputation(-5,0);
		
		if nNum<=10 then
			nRound=0;
		else
			if mod(nNum, 10) == 0 then
				nRound = floor(nNum/10) - 1;
			else
				nRound = floor(nNum/10);
			end;
		end;

		do_cancel_task();  -- 清空任务

		Say("<color=green>商会老板<color>：任务已经取消，你可以接取新任务！",0);
		Msg2Player("您因取消任务而失去了5点声望。");
		TaskTip("您因取消任务而失去了5点声望。");
	else
		Say("<color=green>商会老板<color>：您目前的<color=yellow>声望<color>太低了，无法取消此任务！",0);
		Msg2Player("声望太低，无法取消任务。");
		TaskTip("声望太低，无法取消任务。");
		return
	end;
	return
end

-- 确认取消正在做的任务
function do_cancel_task()
	-- 通知程序取消当前任务
	CleanTask(11);
	-- 更新日期信息
	refresh_time_records()
	
	-- 更新当天和本周已经完成的任务
	local nCurDayDoneTimes = GetTask(CURDAY_DONE_TIMES)
	local nCurWeekDoneTimes = GetTask(CURWEEK_DONE_TIMES)
	SetTask(CURDAY_DONE_TIMES, nCurDayDoneTimes + 1)
	SetTask(CURWEEK_DONE_TIMES, nCurWeekDoneTimes + 1)
	
end;

-- 查看本周我完成商会任务的情况
function query_cur_week_info()
	--local strDayDesc = {"一", "二", "三", "四", "五", "六", "日"}
	
	-- 先更新数据
	refresh_time_records()
	
	--local nWeekDay = tonumber(date("%w"))
	--if (nWeekDay == 0) then
	--	nWeekDay = 7
	--end
	
	-- 本周还能做多少次
	--local nWeekCanDoTimes = nWeekDay * 20
	--local nHaveDoneCurWeek = GetTask(CURWEEK_DONE_TIMES)
	--nWeekCanDoTimes = nWeekCanDoTimes - nHaveDoneCurWeek
	
	-- 今天还能做多少次
	local nType = check_type()
	local nDayCanDoTimes = tbCheck_Award[nType][1]
	local nHaveDoneCurDay = GetTask(CURDAY_DONE_TIMES)
	nDayCanDoTimes = nDayCanDoTimes - nHaveDoneCurDay
	--if (nWeekCanDoTimes < nDayCanDoTimes) then
	--	nDayCanDoTimes = nWeekCanDoTimes
	--end
	
	Say("<color=green>商会老板<color>：今天已经完成了<color=yellow>"..nHaveDoneCurDay.."<color>次任务，还能做<color=yellow>"..nDayCanDoTimes.."<color>次商会任务！ ", 0)
end;

-- 刷新日期信息
function refresh_time_records()
	local nCurrTime = {date("%y"), date("%m"), date("%d"), date("%w")}
	local nCurDay = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])
	--local nCurWeekDay = tonumber(nCurrTime[4])
	
	-- 更新当天的日期
	if (nCurDay > GetTask(LAST_DAY_DATE)) then
		SetTask(LAST_DAY_DATE, nCurDay)		-- 更新上天的日期
		SetTask(CURDAY_DONE_TIMES, 0)		-- 更新本天做了的任务次数
	end
	
	-- 更新本周的信息
	--if (nCurDay > GetTask(LAST_WEEKEND_DATE)) then
	--	local nNextWeekEnd = refresh_last_week_end()
	--	SetTask(LAST_WEEKEND_DATE, nNextWeekEnd)		-- 更新下个周末的时间
	--	SetTask(CURWEEK_DONE_TIMES, 0)					-- 更新本周做了的任务次数
	--end
end;

-- 更新下个周末的时间
function refresh_last_week_end()
	local nCurrTime = {date("%y"), date("%m"), date("%d"), date("%w")}
	local nCurDate = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])		-- 当前的日期
	local nCurYear = tonumber(nCurrTime[1])			-- 当前年份
	local nCurMonth = tonumber(nCurrTime[2])		-- 当前月份
	local nCurDay = tonumber(nCurrTime[3])			-- 当前天
	local nCurWeekDay = tonumber(nCurrTime[4])		-- 当前周几
	
	-- 周日就直接返回当天日期
	if (nCurWeekDay == 0) then
		return nCurDate
	end
	
	local nPassDay = 31									-- 其它月份31天的处理
	if (nCurMonth == 2) then							-- 2月份的处理， 28天的处理
		nPassDay = 28
		if (nCurYear == 8 or nCurYear == 12) then		-- 闰年
			nPassDay = 29
		end
	elseif (nCurMonth == 4 or nCurMonth == 6 or
			nCurMonth == 9 or nCurMonth == 11) then		-- 4、6、9、11月的处理，30天的处理
		nPassDay = 30
	end
	
	-- 需要加的天数
	local nShouldPlus = 7 - nCurWeekDay
	nCurDay = nCurDay + nShouldPlus
	
	if (nCurDay > nPassDay) then
		nCurDay = nCurDay - nPassDay
		nCurMonth = nCurMonth + 1
		if (nCurMonth > 12) then
			nCurMonth = 1
			nCurYear = nCurYear + 1
		end
	end
	
	nCurDate = nCurYear * 10000 + nCurMonth * 100 + nCurDay
	return nCurDate
end;


function check_type()
	local nLev = GetLevel()
	local nType = 1
--	if nLev >= 73 and nLev <= 80 then
--		nType = 1
--	elseif nLev >= 81 and nLev <= 85 then
--		nType = 2
--	elseif nLev >= 86 and nLev <= 92 then
--		nType = 3
--	elseif nLev >= 93 and nLev <= 99 then
--		nType = 4
--	else
--		nType = 1
--	end 
	return nType
end















