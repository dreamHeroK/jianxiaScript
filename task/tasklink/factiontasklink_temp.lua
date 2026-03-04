-----------------------------------------------------------------------
-- 剑侠情缘 II 师门任务
-- 2006/05/16
-- Created by Tony(Jizheng)
-----------------------------------------------------------------------

-- 表格文件类的支持以及地图跳转的支持
Include("\\script\\task\\random\\task_gotoworld.lua");
-- 辉煌之夜头文件
Include("\\script\\shinynight_head.lua");
Include("\\script\\lib\\lingshi_head.lua");
--2006年圣诞节活动奖励支持
Include("\\script\\online\\zgc_temp_fun.lua")
--2009年6月7月活动
Include("\\script\\online\\viet_event\\200907\\event_head.lua");
--越南09年7月活动开关头文件
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");
Include("\\script\\lib\\writelog.lua");
--2009年8月活动
Include("\\script\\online\\viet_event\\200908\\viet0908_head.lua");
--2009年9月活动
Include("\\script\\online\\viet_event\\200909\\event_head.lua");
--2009年11月活动
Include("\\script\\online\\viet_event\\200911\\event_head.lua");
--2009年12月活动
Include("\\script\\online\\viet_event\\200912\\event_head.lua");

--从2010年开始越南师门任务得奖励统一在下面包含这个文件里面实现，然后在本文件里面调用，不用每次都修改这个文件
Include("\\script\\online_activites\\award.lua");--for Give_Faction_Award()
Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\vng\\award\\feature_award.lua");

--========================================================================

TT_COLLECT_ITEM = 1				-- 收集一定物品并且要求上交，来源是打怪掉落
TT_KILL_MONSTER = 2				-- 杀死一定数量的特定怪物
TT_UPGRAGE_ATTR = 3				-- 升级一定数值的特定属性（比如经验，声望，等级，PK值等等）
TT_SHOWOFF_ITEM = 4				-- 收集物品，但是来源就是商店
TT_SEND_MAIL = 5				-- 与某NPC对话

-- 任务变量记录表 -----------------------------------------------------------------------------
TASKVALUE_CUR_DATE_ID = 333			-- 当前师门任务处于的时间日期 YYYYMMDD，用于清除334变量数值
TASKVALUE_FACTION_CONTRI_CUR_DAY_ID = 334	-- 当天获得的师门贡献度存放的任务变量
TASKVALUE_DIFFICULT_LEVEL_ID = 335	-- 当前选择的师门任务的难度等级
TASKVALUE_FACTION_CONTRI_ID = 336	-- 师门贡献度存放的任务变量

-- 337 - 340 师门任务链用的任务变量
-- 341 - 344 商会任务链的任务变量

LAST_USE_DATE = 85			-- 师门令书上次使用的日期
MULTI_COUNT = 86			-- 当前加成倍数

TASKVALUE_FACTION_EVENT_ID = 345	-- 师门任务大事件的任务ID存放的任务变量
TASKVALUE_CUR_DAY_TIMES_ID = 346	-- 今天做了几次师门任务的纪录
-- 347 已经被用，师门任务需要杀怪的数量

TASKVALUE_LAST_CARD_CONTRIBUTE_ID = 348			-- 上次领取师门令牌时候的师门贡献度数值记录的任务变量
TASKVALUE_LAST_GET_EVENT_DATE_ID = 349			-- 上次领取师门大事件的时间段开始日期
TASKVALUE_GET_EVENT_TIMES_ID = 350				-- 本时间段内已经尝试领取师门大事件的次数
TASKVALUE_LAST_GET_EVENT_PRIZE_DATE_ID = 351	-- 上次领取师门大事件奖励的时间段开始日期
TASKVALUE_GET_EVENT_PRIZE_TIMES_ID = 352		-- 本时间段内已经尝试领取师门大事件奖励的次数

-- 任务变量记录表 end--------------------------------------------------------------------------

TASK_ID_SHAOLIN_SUJIA = 1		-- 少林俗家，三个难度就是 1 2 3
TASK_ID_SHAOLIN_CHANSENG = 4	-- 少林禅僧，三个难度就是 4 5 6
TASK_ID_SHAOLIN_WUSENG = 7		-- 少林武僧，三个难度就是 7 8 9

TASK_ID_DEFAULT_ROUTE = 10		-- 取消任务或者其他的只需要和商会任务区别开使用的任务链ID

TASK_ID_WUDANG_DAOJIA = 12		-- 武当道家，三个难度就是 12 13 14
TASK_ID_WUDANG_SUJIA = 15		-- 武当俗家，三个难度就是 15 16 17

TASK_ID_EMEI_FOJIA = 18			-- 峨嵋佛家，三个难度就是 18 19 20
TASK_ID_EMEI_SUJIA = 21			-- 峨嵋俗家，三个难度就是 21 22 23

TASK_ID_TANGMEN = 24			-- 唐门,三个难度就是 24 25 26

TASK_ID_GAIBANG_JINGYI = 27		-- 丐帮净衣, 三个难度就是 27 28 29
TASK_ID_GAIBANG_WUYI = 30		-- 丐帮污衣, 三个难度就是 30 31 32

TASK_ID_YANGMEN_QIANGQI = 33	-- 杨门枪骑, 三个难度就是 33 34 35
TASK_ID_YANGMEN_GONGQI = 36		-- 杨门弓骑, 三个难度就是 36 37 38

TASK_ID_WUDU_XIEXIA = 39		-- 五毒邪侠, 三个难度就是 39 40 41
TASK_ID_WUDU_GUSHI = 42			-- 五毒蛊师, 三个难度就是 42 43 44

TASK_ID_KUNLUN_TIANSHI = 45		-- 昆仑天师, 三个难度就是 45 46 47

TASK_ID_CUIYAN_WUXIAN = 48		-- 翠烟舞仙, 三个难度就是 48 49 50
TASK_ID_CUIYAN_LINGNV = 51		-- 翠烟灵女, 三个难度就是 51 52 53

TASK_ID_MINGJIAO_SHENGZHAN = 54		-- 明教圣战, 三个难度就是 54 55 56
TASK_ID_MINGJIAO_XUEREN = 57		-- 明教血人, 三个难度就是 57 58 59
TASK_ID_MINGJIAO_ZHENBING = 60		-- 明教阵兵, 三个难度就是 60 61 62

--========================================================================


-- 师门任务的入口，nFactionRouteNo代表上面的玩家流派，选任务用的。
function task_main_entrance(nFactionRouteNo)
	if GetReputation() < 5 then
		Msg2Player("为了获得情侣任务,必须获得5点或更高的声望!")
		return
	end
	local nTaskState = GetChainTaskStatus(nFactionRouteNo)
	-- 当前等级的声望限制
	local nFactionReputationLimit = 0;
	local nLevel = GetLevel()
	local nCurContriEEE = GetTask(TASKVALUE_FACTION_CONTRI_ID)	-- 当前师门贡献度
	local nCreateTime = GetCreateTime()
	
	-- 1150732800 是2006年6月20日，这个时间以前建立的角色都可以领取补偿
	if (nCreateTime < 1150732800) then
		if (nLevel < 60) then
			nFactionReputationLimit = 0
		elseif (nLevel < 70) then
			nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
			nFactionReputationLimit = floor(nFactionReputationLimit / 3)
		elseif (nLevel < 80) then
			nFactionReputationLimit = 1000
		else
			nFactionReputationLimit = 1500
		end
	end
	gf_WriteLogEx("Nhiem vu Su Mon", "tham gia")
	-- 还没有接过任务
	if (nTaskState == 0) then		
		if ((nCurContriEEE == 0) and (nFactionReputationLimit > 0) and GetTask(TASKVALUE_DIFFICULT_LEVEL_ID) == 0) then	-- 第一次接任务
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nFactionReputationLimit)
			SetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID, nFactionReputationLimit)
			Msg2Player("根据等级，第一次完成任务的奖励"..nFactionReputationLimit.."点")
		end
		get_new_task(nFactionRouteNo)
		
	-- 已经接到任务但是还没有完成		
	elseif (nTaskState == 1) then	
		process_cur_task(nFactionRouteNo)
		
	-- 已经完成了上次接到的任务
	elseif (nTaskState == 2) then	
		get_next_task(nFactionRouteNo)
	end
end;



-- 玩家选择退出对话
function cancel_dialog()
end;



-- 选择了一个任务给玩家，已经加到身上了，玩家可以选择是做还是不做
function get_one_task(task_link_id)

	--		          年	       月	       日	       时	       分	       秒
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- 现在的日期
	local nLastTaskDate = GetTask(TASKVALUE_CUR_DATE_ID)					-- 上次接任务的日期
	
	if (nLastTaskDate < nCurDate) then
		SetTask(TASKVALUE_CUR_DATE_ID, nCurDate)			-- 设置新的日期
		SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)		-- 清空当天获得的师门贡献度
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 0)				-- 清空当天做了的师门任务次数
	end
	-- Modify by Trungbt
	local tbCheckType = {3, 6, 9, 12, 14, 17, 20, 23, 26, 29, 32, 35, 38, 41, 44}
	--Msg2Player("Gia tri check ID:  "..task_link_id)
	for i = 1, getn(tbCheckType) do
		if task_link_id == tbCheckType[i] then
			SetTask(TSK_CSD_ALLOW, 1)
			break
		end

	end
	------------------------

	-- 检查今天次数够了没有，够5次就不让继续做了 - Jeep tag 现在不检查了
	local nCurDayTimes = GetTask(TASKVALUE_CUR_DAY_TIMES_ID)
	if (nCurDayTimes >= 20) then
		Say("每日最多20次，你还是明日再来吧！", 0)
		return
	end

	-- 否则...
	-- 选取一个本流派的随机任务，并且返回任务类型
	local nTaskType = SelectRandomTask(task_link_id)
	SetTask(TASKVALUE_DIFFICULT_LEVEL_ID, task_link_id)
	
	-- 现在师门任务就是杀怪
	if (nTaskType == TT_KILL_MONSTER) then
		strAnswer = {"弟子同意!/confirm_accept_task",
					 "\n弟子还是很虚弱的,要练习一段时间!/cancel_task"}

		-- 随机选择一个发任务的话，哈哈，策划填表会有蛮痛苦呀！ Amen.	
		local nSel = random(1, 3)
		local strTaskInfo = GetInfo(task_link_id, nSel)
		local strAnswer = {
			"弟子同意!/confirm_accept_task",
			"\n弟子还是很虚弱的,要练习一段时间!/cancel_task",
		}
		Say(strTaskInfo, getn(strAnswer), strAnswer);
	end
end;



-- 确认接受师傅分配的任务，并且选择是否直接去任务所在地
function confirm_accept_task()
	local nMapIndex = tonumber(GetCurTaskLinkMapIndex(TASK_ID_DEFAULT_ROUTE));
	-- 在地图表中能够得到要去的地图
	if ((nMapIndex ~= 0) and (nMapIndex ~= nil)) then
		Say("您接到了师门的任务,您想去那里吗?",
			2,
			"师父带我去做任务的地方吧!/#gotoWorld("..nMapIndex..")",
			"\n不用了,我一会儿自己去!/cancel_dialog");
	else
		TaskTip("您获得1个师门任务!");
	end
	Msg2Player("您获得1个师门任务!");
end;



-- 玩家确认要取消分配给自己的任务，进行扣除声望和清除任务的操作
function confirm_cancel_task()
	-- 师门贡献度足够扣就让他取消
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	if (nCurFactionContribute >= 5) then			
		-- 因为所有师门任务都是公用一段任务变量记录的
		-- 所以这里只要不是商会任务的11就可以了
		CleanTask(TASK_ID_DEFAULT_ROUTE)
		SetTask(TASKVALUE_FACTION_CONTRI_ID, nCurFactionContribute - 5)
		Say("任务已取消，您可以接新任务了.", 0);
		Msg2Player("您由于取消任务而失去5点师门声望.");
		TaskTip("您由于取消任务而失去5点师门声望.");
		SetTask(TSK_CSD_ALLOW,0)	-- Modify by Trungbt	
	-- 师门贡献度不够扣
	else
		CleanTask(TASK_ID_DEFAULT_ROUTE)
		SetTask(TASKVALUE_FACTION_CONTRI_ID, 0)
		Say("任务已取消，您可以接新任务了.", 0);
		Msg2Player("由于您取消了任务,师门贡献度降为0.");
	end
end;



-- 玩家要求取消分配给自己的任务，师傅会教育他是否愿意，因为会损失师门贡献度的
function cancel_task()
	Say("<color=yellow>取消任务<color>会影响<color=yellow>师门贡献度<color>,您确定要取消此任务吗?",
		2,
		"实在太难了,取消任务!/confirm_cancel_task",
		"\n算了,我还是保留任务!/cancel_dialog");
end;

-- 玩家在执行任务中要求取消任务，师傅会给他再确认一次
function cancel_processing_task()
	Say("<color=yellow>取消任务<color>会影响<color=yellow>师门贡献度<color>,您确定要取消此任务吗?",
		2,
		"实在太难了,取消任务!!/confirm_cancel_task",
		"\n算了,我还是保留任务!/cancel_dialog");
end;

-- 第一次接任务，玩家选择要做什么难度的任务
function get_new_task(nFactionRouteNo)
	task_link_id_low = nFactionRouteNo;
	task_link_id_middle = nFactionRouteNo + 1;
	task_link_id_high = nFactionRouteNo + 2;
	
	strTalk = {"很好!",
--			   "\n 初级师门任务（奖励经验和贡献度）/#get_one_task("..task_link_id_low..")",
--			   "\n 中级师门任务/#get_one_task("..task_link_id_middle..")",
			   "\n 师门任务/#get_one_task("..task_link_id_high..")",
			   "\n 我很忙,晚点再来做任务!/cancel_dialog"}
	
	-- 按玩家的等级，能接到的任务的难度等级也有不同
	local nCurPlayerLevel = GetLevel()
--	if (nCurPlayerLevel < 30) then
--		Say(strTalk[1], 2, strTalk[2], strTalk[5]);
--	elseif (nCurPlayerLevel < 60) then
--		Say(strTalk[1], 3, strTalk[2], strTalk[3], strTalk[5]);
--	else
--		Say(strTalk[1], 4, strTalk[2], strTalk[3], strTalk[4], strTalk[5]);
    Say(strTalk[1], 2, strTalk[2],strTalk[3]) 
--	end
end;



-- 正在执行任务的时候和师傅对话
function process_cur_task(nFactionRouteNo)
		-- 获取该任务的地图 ID
		local nMapIndex = tonumber(GetCurTaskLinkMapIndex(TASK_ID_DEFAULT_ROUTE));
		
		local strTalk = {"你完成了我交给你的任务了吗?",
						 "我交给你的任务,您去了哪里?",
						 "◆ 查看已完成的任务数/faction_event_finish",
						 "◆ 任务完成/confirm_finish_task",
						 "◆ 不能承担此任务,取消任务/cancel_faction_event",
						 "◆ 不能承担此任务,取消任务/cancel_processing_task",
						 "\n请再给我一些时间,这还没有完成/cancel_dialog"}
	
		if (GetTask(TASKVALUE_FACTION_EVENT_ID) == 0) then
			Say(strTalk[1], 3, strTalk[4], strTalk[6], strTalk[7]);
		else
			Say(strTalk[2], 5, strTalk[4], strTalk[5], strTalk[6], strTalk[7]);
		end
end;



-- 师傅说你是否完成了任务，徒弟回答说已经完成了的
function confirm_finish_task()
	-- 察看是否已经完成了任务
	if GetReputation() < 5 then
		Msg2Player("必须获得5点或更高的贡献才能继续任务!")
		return
	end
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	local nCurTaskLinkID = GetTask(TASKVALUE_DIFFICULT_LEVEL_ID)	-- 当前难度等级
	local nTaskFinish = QueryTaskFinish(nCurTaskLinkID)
	local nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()	-- 当前等级的声望限制
	local nLevel = GetLevel();

	-- 辉煌之夜奖励翻倍的倍率
	local multiple = get_reward_multiple(SYS_MASTER_REPEATTASK)
	local nPerCent = floor(100 * multiple)				-- 奖励的百分比
	nBaseDayLimit = floor(nBaseDayLimit * multiple)
	nExtraDayLimit = floor(nExtraDayLimit * multiple)

	-- Modify by Trungbt
--	if GetTask(TSK_CSD_ALLOW) == 1 then
--		local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)
--		if nCSD_SuMon < 300 and GetTask(TSK_CSD) == 1 then
--			SetTask(TSK_CSD_COUNT_A, GetTask(TSK_CSD_COUNT_A) + 1)
--		end
--		SetTask(TSK_CSD_ALLOW, 0)
--	end
--	HoanThanhNhiemVuSuMon()
	------------------------------------

	local bExtra = 0;
	local nDayReputationLimit = nBaseDayLimit

	-- 检查玩家是否是高级任务难度	
	if ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA + 2) or
		(nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG + 2) or
		(nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG + 2) or
		(nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA + 2) or
		(nCurTaskLinkID == TASK_ID_WUDANG_SUJIA + 2) or
		(nCurTaskLinkID == TASK_ID_EMEI_FOJIA + 2) or
		(nCurTaskLinkID == TASK_ID_EMEI_SUJIA + 2) or
		(nCurTaskLinkID == TASK_ID_TANGMEN + 2) or
		(nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI + 2) or
		(nCurTaskLinkID == TASK_ID_GAIBANG_WUYI + 2) or
		(nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI + 2) or
		(nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI + 2) or
		(nCurTaskLinkID == TASK_ID_WUDU_XIEXIA + 2) or
		(nCurTaskLinkID == TASK_ID_WUDU_GUSHI + 2) or
		(nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI + 2) or
		(nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN + 2) or
		(nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV + 2) or
		(nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN + 2) or
		(nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN + 2) or
		(nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING + 2)) then
		
		bExtra = 1
		nDayReputationLimit = nExtraDayLimit
	end

	--记录今天的时间，用来确认今天是否还可以领取师门贡献度
	--		          年	       月	       日	       时	       分	       秒
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- 现在的日期
	local nLastTaskDate = GetTask(TASKVALUE_CUR_DATE_ID)					-- 上次接任务的日期
	
	if (nLastTaskDate < nCurDate) then
		SetTask(TASKVALUE_CUR_DATE_ID, nCurDate)			-- 设置新的日期
		SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)		-- 清空当天获得的师门贡献度
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 0)				-- 清空当天做了的师门任务次数
	end

	if (nTaskFinish == 1) then
		local nCurDayTimes = GetTask(TASKVALUE_CUR_DAY_TIMES_ID) + 1
		if nCurDayTimes == 5 then	--第5次完成奖灵石配方
			local nPFLevel = 0;
			if nLevel < 30 then
				nPFLevel = 1
			elseif nLevel < 40 then
				nPFLevel = random(1,2);
			elseif nLevel < 50 then
				nPFLevel = random(1,3);
			elseif nLevel < 60 then
				nPFLevel = random(1,4);
			elseif nLevel < 80 then
				nPFLevel = random(1,5);
			elseif nLevel <= 100 then
				nPFLevel = random(2,5);
			end;
            if GetAntiEnthrallmentStatus() == 0 then
    			if nPFLevel ~= 0 then
    				lspf_AddPeiFangInBottle(nPFLevel,1);
    				Msg2Player("获得1"..nPFLevel.."灵石配方,已赋予精神高峰");
                end;
			end;
		end;		
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, nCurDayTimes)	-- 更新今天已经做了的任务次数
--		if get_chrims_state() == 1 then
--			if nCurDayTimes == 1 or nCurDayTimes == 2 then
--				local nRand1 = random(getn(tStrewTask)-9,getn(tStrewTask));
--				local nRand2 = random(getn(tStrewTask)-9,getn(tStrewTask));
--				AddItem(tStrewTask[nRand1][3],tStrewTask[nRand1][4],tStrewTask[nRand1][5],tStrewTask[nRand1][1]);
--				AddItem(tStrewTask[nRand2][3],tStrewTask[nRand2][4],tStrewTask[nRand2][5],tStrewTask[nRand2][1]);
--				Msg2Player("您获得了"..tStrewTask[nRand1][2].."贺卡"..tStrewTask[nRand1][1].."张");	
--				Msg2Player("您获得了"..tStrewTask[nRand2][2].."贺卡"..tStrewTask[nRand2][1].."张");
--			end
--		end	
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, nCurDayTimes)	-- 更新今天已经做了的任务次数
	        local nFactionNum = GetTask(VET_201009_00_TASK_NUM_FACTION)
                if ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG) or
		    (nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA) or
                    (nCurTaskLinkID == TASK_ID_WUDANG_SUJIA) or
		    (nCurTaskLinkID == TASK_ID_EMEI_FOJIA) or
		    (nCurTaskLinkID == TASK_ID_EMEI_SUJIA) or
		    (nCurTaskLinkID == TASK_ID_TANGMEN) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_WUYI) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI) or
		    (nCurTaskLinkID == TASK_ID_WUDU_XIEXIA) or
		    (nCurTaskLinkID == TASK_ID_WUDU_GUSHI) or
		    (nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN ) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING )) then
                    if mod(nFactionNum,10) == 0 then
                        nFactionNum = nFactionNum + 1
                    end
		elseif ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG + 1) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG + 1) or
		    (nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA + 1) or
                    (nCurTaskLinkID == TASK_ID_WUDANG_SUJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_EMEI_FOJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_EMEI_SUJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_TANGMEN + 1) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI + 1) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_WUYI + 1) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI + 1) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI + 1) or
		    (nCurTaskLinkID == TASK_ID_WUDU_XIEXIA + 1) or
		    (nCurTaskLinkID == TASK_ID_WUDU_GUSHI + 1) or
		    		    (nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI+1) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN+1 ) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV+1 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN+1 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN+1 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING+1 )) then
                    if mod(floor(nFactionNum/10),10) == 0 then
                        nFactionNum = nFactionNum + 10
                    end
                elseif ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG + 2) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG + 2) or
		    (nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA + 2) or
                    (nCurTaskLinkID == TASK_ID_WUDANG_SUJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_EMEI_FOJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_EMEI_SUJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_TANGMEN + 2) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI + 2) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_WUYI + 2) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI + 2) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI + 2) or
		    (nCurTaskLinkID == TASK_ID_WUDU_XIEXIA + 2) or
		    (nCurTaskLinkID == TASK_ID_WUDU_GUSHI + 2) or
		    (nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI+2) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN+2 ) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV+2 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN+2 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN+2 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING+2 )) then
                    if mod(floor(nFactionNum/100),10) == 0 then
                        nFactionNum = nFactionNum + 100
                    end
	        end
                --每次活动给奖励都调用此函数，不再像以前一样每次活动都写一个函数来给奖励
                SetTask(VET_201009_00_TASK_NUM_FACTION,nFactionNum)
                Give_Faction_Award();--from "\script\online_activites\award.lua"
		
		
        if GetAntiEnthrallmentStatus() == 0 then
            FinishTaskStep(nCurTaskLinkID, 0, nPerCent)			-- 结束当前任务并且发奖
        elseif GetAntiEnthrallmentStatus() == 1 then
            FinishTaskStep(nCurTaskLinkID, 0, floor(nPerCent/2))			-- 3小时防沉迷状态给一半奖励
        else
            --5小时防沉迷状态不给奖励
        end
		-- 师徒任务 （师门）
		local nChance, nMaxChance = CustomDataRead("mp_shimen")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_shimen", "dd", nChance, nMaxChance)
				Msg2Player("任务-完成情况-:"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
		-- 针对限制要对获得的声望进行处理
		-- 增加后的师门贡献度
		local nFactionContributeAfter = GetTask(TASKVALUE_FACTION_CONTRI_ID)
		-- 今天已经获得的师门贡献度
		local nCurDayGainReputation = GetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID)
		
		-- 这次增加的师门贡献度
		local nAddedThisTimeContribute = nFactionContributeAfter - nCurFactionContribute
		
		-- 超过了当天能获得的声望点数，扣回去
		if (nCurDayGainReputation > nDayReputationLimit) then
			local nShouldBeMinus = nCurDayGainReputation - nDayReputationLimit
			-- 如果是做了高级任务再回来做低级任务，那么只减这次做的任务得到的师门贡献度。
			if (nFactionContributeAfter - nShouldBeMinus < nCurFactionContribute) then
				nShouldBeMinus = nFactionContributeAfter - nCurFactionContribute
			end
			SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, nCurDayGainReputation - nShouldBeMinus)
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nFactionContributeAfter - nShouldBeMinus)
			nAddedThisTimeContribute = nAddedThisTimeContribute - nShouldBeMinus
			if (bExtra == 1) then
				Msg2Player("今天您不能再获得师门贡献度,如果是做了高级任务再回来做低级任务，那么只减这次做的任务得到的师门贡献度!")
			else
				Msg2Player("今天您不能再获得师门贡献度,如果是做了高级任务再回来做低级任务，那么只减这次做的任务得到的师门贡献度!")
			end
		end
		
		nFactionContributeAfter = GetTask(TASKVALUE_FACTION_CONTRI_ID)	-- 处理后的师门贡献度
		if (nFactionContributeAfter < 0) then
			SetTask(TASKVALUE_FACTION_CONTRI_ID, 0)
			nFactionContributeAfter = 0
		end
		
		-- 超过了本等级能获得的最多师门贡献度，扣回去
		if (nFactionContributeAfter > nFactionReputationLimit) then
			local nShouldBeMinuss = nFactionContributeAfter - nFactionReputationLimit
			SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, nCurDayGainReputation - nShouldBeMinuss)
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nFactionReputationLimit)
			nAddedThisTimeContribute = nAddedThisTimeContribute - nShouldBeMinuss
			Msg2Player("超过了本等级能获得的最多师门贡献度，扣回去.")
		end
		if GetReputation() >= 5 then
			ModifyReputation(-5, 0)
		else
			ModifyReputation(0 - GetReputation(), 0)
		end
		
		if (GetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID) < 0) then
			SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)
		end
		
		-- 师门任务其他奖励：
		other_faction_prize();
		
		-- 判断是否可以接到师门的武林大事件任务，要没接到且条件满足
		local bHaveOwnFactionEvent = GetTask(TASKVALUE_FACTION_EVENT_ID)
		if ((bHaveOwnFactionEvent == 0) and (check_faction_event_condition() == 1)) then
			if (StartFactionEvent() == 1) then
				local nSel = random(1, 4)
				local strTaskInfo = QueryFactionEventInfo(nSel)
				Say(strTaskInfo, 0);
			else
				Say("继续努力！", 0)
			end
		else
			Say("继续努力！", 0)
		end
		
		if (nAddedThisTimeContribute < 0) then
			nAddedThisTimeContribute = 0
		end

-- ===================师门令书加成计算===================================================		
		local nLastLingshuDate = GetTask(LAST_USE_DATE)			-- 师门令书上次使用的日期
		local nMultiCount = GetTask(MULTI_COUNT)				-- 当前加成倍数
		if (nLastLingshuDate == nCurDate) then
			local nStillShouldPlus = nAddedThisTimeContribute * (nMultiCount - 1)
			local nNowFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
			nNowFactionContribute = nNowFactionContribute + nStillShouldPlus
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nNowFactionContribute)
			nAddedThisTimeContribute = nAddedThisTimeContribute + nStillShouldPlus
		else
			SetTask(MULTI_COUNT, 1)
		end
-- ===================师门令书加成计算================================================end
		
		Msg2Player("这次的任务获得"..nAddedThisTimeContribute.."师门贡献!")
	else
		Say("如此简单的任务你无法完成,真太差劲了!", 0)
		--if (nCurFactionContribute > 0) then
		--	SetTask(TASKVALUE_FACTION_CONTRI_ID, nCurFactionContribute - 1)
		--end
	end
end;


-- 处于完成了上个任务的情况下，询问玩家是否继续做
function get_next_task(nFactionRouteNo)
	local nCurDifficulty = GetTask(TASKVALUE_DIFFICULT_LEVEL_ID)
	local strTalk = {"很好,您想做更多吗?还是想尝试更困难的任务?",
					 "◆ 弟子同意!/#get_one_task("..nCurDifficulty..")",
					 "◆ 这个任务已经完成,请检查/faction_event_finish",
					 "◆ 这任务在下不能承担,取消任务/cancel_faction_event",
					 "◆ 我要接取更困难的任务/#get_new_task("..nFactionRouteNo..")",
					 "◆ 我想查询师门贡献度/query_faction_contribute",
					 "\n结束对话./cancel_dialog"}
	
	if (GetTask(TASKVALUE_FACTION_EVENT_ID) == 0) then
		Say(strTalk[1], 4, strTalk[2], strTalk[5], strTalk[6], strTalk[7])
	else
		Say(strTalk[1], 6, strTalk[2], strTalk[3], strTalk[4], strTalk[5], strTalk[6], strTalk[7]);
	end		 
end;

-- 查询玩家当前的师门贡献度
function query_faction_contribute()
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	-- 当前等级的声望限制
	local nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	Say("您当前的师门贡献度是<color=yellow>"..nCurFactionContribute.."<color>,您当前级别获得的最大贡献点为<color=yellow>"..nFactionReputationLimit.."<color>点,按F3打开人物信息界面查看当前师门贡献度.", 0)
end;

-- 检查玩家是否已经完成了武林大事件任务
function faction_event_finish()
	local bFinished = FinishFactionEvent()	-- 检查是否完成了师门大事件
	if (bFinished == 1) then
		--加入空间负重判断
		if get_free_room(1) ~= 1 then
			return 0;
		end
		local nBefore = GetTask(TASKVALUE_FACTION_CONTRI_ID)
		faction_event_prize()
		local nAfter = GetTask(TASKVALUE_FACTION_CONTRI_ID)
		local nAdded = nAfter - nBefore
		
		Say("干得好!您刚收到<color=yellow>"..nAdded.."<color>师门贡献度", 0)
	else
		Say("我给您的任务尚未完成", 0)
	end
end;

-- 判断是否可以接到武林大事件
function check_faction_event_condition()
	--玩家从50级可以接到该任务
--	local nLevel = GetLevel()
--	if (nLevel < 50) then
		return 0
--	end
	
	--记录今天的时间
	--		          年	       月	       日	       时	       分	       秒
--	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
--	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- 现在的日期
	-- 上次领取师门大事件的时间段开始日期
--	local nLastGetEventDate = GetTask(TASKVALUE_LAST_GET_EVENT_DATE_ID)
	-- 本时间段内已经尝试领取师门大事件的次数
--	local nCurGetEventTimes = GetTask(TASKVALUE_GET_EVENT_TIMES_ID)
	
--	if ((nCurDate - nLastGetEventDate) > 7) then
--		SetTask(TASKVALUE_GET_EVENT_TIMES_ID, 0)
--		SetTask(TASKVALUE_LAST_GET_EVENT_DATE_ID, nCurDate)
--		if ((nCurGetEventTimes >= 10) and (nCurGetEventTimes < 40)) then	-- 上个阶段已经做了10次还没有领到
--			return 1
--		end
--	end
	
	-- 本周已经接到过了
--	if (nCurGetEventTimes >= 40) then
--		return 0
--	end
	
	--接受大事件任务的概率为恒定值,概率为3%,一周只能接受一次任务.(采用伪随机)
--	local nRate = random(0, 100)
--	if (nRate < 3) then
--		SetTask(TASKVALUE_GET_EVENT_TIMES_ID, 40)
--		return 1
--	else
--		SetTask(TASKVALUE_GET_EVENT_TIMES_ID, nCurGetEventTimes + 1)
--		return 0
--	end
end;

-- 师门任务完成以后的其他奖励
function other_faction_prize()
-- 每50点贡献度 师门令牌 一个

	-- 今天做了几次师门任务了
	local nCurDayTimes = GetTask(TASKVALUE_CUR_DAY_TIMES_ID)  
	-- 距离上次领师门令牌增加了多少师门贡献度
	local nLastGetCard = GetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID)
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	if nCurFactionContribute < nLastGetCard then	--如果当前值小于上次获得令牌时的值
		SetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID,nCurFactionContribute);
		nLastGetCard = nCurFactionContribute;
	end;
	local nContributeAdded = nCurFactionContribute - nLastGetCard
	
	if (nContributeAdded >= 50) then
		if GetAntiEnthrallmentStatus() == 0 then
			send_a_faction_card()	-- 给一个师门令牌
			SetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID, (nLastGetCard + 50))
			local nRoute = GetPlayerRoute();
			if nRoute >= 23 then
				Msg2Player("您的师门贡献达到50点");
			else
				Msg2Player("每50点贡献度获得师门令牌一个!")
			end
		end
	end
	
	-- 当天第一次完成师门任务
	if (nCurDayTimes == 1 or nCurDayTimes == 6) then
		local nCurLevelOfExpPrize = GetLevel()
		local nExpPrize = 0
		if (nCurFactionContribute <= 3000) then
			nExpPrize = floor(nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize * 0.4)
		else
			nExpPrize = nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize
		end
		if GetAntiEnthrallmentStatus() == 1 then
			nExpPrize = floor(nExpPrize/2)
		elseif GetAntiEnthrallmentStatus() == 2 then
			nExpPrize = 0
		end		
		ModifyExp(nExpPrize)
		Msg2Player("完成和尚任务，得到"..nExpPrize.."经验!")
		WriteLogEx(VIET_0911_LOG_TITLE,"完成师门任务次数"..nCurDayTimes)
	end
	
	--09年11月活动给额外奖励
	
	if  nCurDayTimes == 10 then--10次的时候
		local nCurLevelOfExpPrize = GetLevel()
		local nExpPrize = 0
		if (nCurFactionContribute <= 3000) then
			nExpPrize = floor(nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize * 0.4)			
		else
			nExpPrize = nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize
		end
		nExpPrize = nExpPrize + floor(nExpPrize/3)
		if GetAntiEnthrallmentStatus() == 1 then
			nExpPrize = floor(nExpPrize/2)
		elseif GetAntiEnthrallmentStatus() == 2 then
			nExpPrize = 0
		end	
		ModifyExp(nExpPrize)
		send_a_faction_card()	-- 给一个师门令牌
		Msg2Player("今天是第"..nCurDayTimes.."次完成师门任务，获得额外的经验"..nExpPrize.."点!")
		WriteLogEx(VIET_0911_LOG_TITLE,"完成师门任务次数"..nCurDayTimes)
	else
		local nCurLevelOfExpPrize = GetLevel()
		local nExpPrize = 0
		if (nCurFactionContribute <= 3000) then
			nExpPrize = floor(nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize * 0.4)			
		else
			nExpPrize = nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize
		end
		nExpPrize = floor(nExpPrize/7)
		if GetAntiEnthrallmentStatus() == 1 then
			nExpPrize = floor(nExpPrize/2)
		elseif GetAntiEnthrallmentStatus() == 2 then
			nExpPrize = 0
		end	
		ModifyExp(nExpPrize)
		Msg2Player("今天是"..nCurDayTimes.."次完成任务，获得额外的经验"..nExpPrize.."点!")
		WriteLogEx(VIET_0911_LOG_TITLE,"完成师门任务次数"..nCurDayTimes)
	end

end;

-- 师门大事件完成以后的奖励
function faction_event_prize()
	-- 给玩家经验奖励，数值是玩家等级的三次方
	local nPlayerLevelOfExp = GetLevel()
	local nShouldGiveExp = nPlayerLevelOfExp * nPlayerLevelOfExp * nPlayerLevelOfExp
	ModifyExp(nShouldGiveExp)
	Msg2Player("完成师门大事件您会获得"..nShouldGiveExp.."经验!")
	
	-- 是否获得了门派秘籍
	local bGetSuperMisteryBook = 0

	--记录今天的时间
	--		          年	       月	       日	       时	       分	       秒
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- 现在的日期
	local nLastTaskDate = GetTask(TASKVALUE_CUR_DATE_ID)					-- 上次接任务的日期
	
	if (nLastTaskDate < nCurDate) then
		SetTask(TASKVALUE_CUR_DATE_ID, nCurDate)			-- 设置新的日期
		SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)		-- 清空当天获得的师门贡献度
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 0)				-- 清空当天做了的师门任务次数
	end
	
	-- 上次领取师门大事件奖励的时间段开始日期
	local nLastGetSuperPrizeDate = GetTask(TASKVALUE_LAST_GET_EVENT_PRIZE_DATE_ID)
	-- 本时间段内已经尝试领取师门大事件奖励的次数
	local nCurGetSuperPrizeTimes = GetTask(TASKVALUE_GET_EVENT_PRIZE_TIMES_ID)
		
	-- 门派45级秘籍,获得概率12.5%,两个月(8周,不是物理月)一个人可以获得1本.(采用伪随机)
	if ((nCurDate - nLastGetSuperPrizeDate) >= 56) then	-- 28天以后了
		SetTask(TASKVALUE_GET_EVENT_PRIZE_TIMES_ID, 0)
		SetTask(TASKVALUE_LAST_GET_EVENT_PRIZE_DATE_ID, nCurDate)
	end
	
	local nLottos = random(0, 1000);
	if (nCurGetSuperPrizeTimes == 7) then		-- 前七次都没有领到，这次一定发
		really_get_a_super_mistery_book()
		bGetSuperMisteryBook = 1
	elseif (nCurGetSuperPrizeTimes < 7) then	-- 随机12.5%的几率可能拿到师门秘籍
		if (nLottos < 125) then
			really_get_a_super_mistery_book()
			bGetSuperMisteryBook = 1
		end
	end
	
	-- 天霞,紫霞,粘衣,修罗,五鬼,补金,补石共为87.5%,每次只可能获得一本秘籍.
	-- 要在没有获得门派秘籍的情况下拿到
	if (bGetSuperMisteryBook == 0) then
		if nLottos <= 800 then
			local nBookID = random(1, 7)
			if (nBookID == 1) then
				AddItem(0, 107, 64, 1)		-- 天霞
			elseif (nBookID == 2) then
				AddItem(0, 107, 65, 1)		-- 紫霞
			elseif (nBookID == 3) then
				AddItem(0, 107, 66, 1)		-- 粘衣
			elseif (nBookID == 4) then
				AddItem(0, 107, 60, 1)		-- 修罗
			elseif (nBookID == 5) then
				AddItem(0, 107, 63, 1)		-- 五鬼
			elseif (nBookID == 6) then
				AddItem(0, 107, 61, 1)		-- 补金
			else
				AddItem(0, 107, 62, 1)		-- 补石
			end
		else
		 local	tMijiName = {
							{"四灵战意谱",0,107,159},
							{"四灵天衣谱",0,107,160},
							{"四灵紫衣谱",0,107,161}
						};	
		 local nRandtb = random(1,3);
		 AddItem(tMijiName[nRandtb][2],tMijiName[nRandtb][3],tMijiName[nRandtb][4],1);		
		end
	end
	
	-- 师门声望奖励，奖励50点
	-- 当前等级的声望限制
	local nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	-- 当前的师门声望 和 今天已经获得的师门声望
	local nFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	local nCurDayGainReputation = GetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID)
	
	local nShouldAdd = 50
	nCurDayGainReputation = nShouldAdd + nCurDayGainReputation
	if (nCurDayGainReputation > nExtraDayLimit) then
		nShouldAdd = nShouldAdd - (nCurDayGainReputation - nExtraDayLimit)
		nCurDayGainReputation = nExtraDayLimit
	end
	
	SetTask(TASKVALUE_FACTION_CONTRI_ID, (nFactionContribute + nShouldAdd))
	SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, nCurDayGainReputation)
	--SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 5)	-- 设置今天不用继续接师门任务了
	
	-- 滚动公告
	local strPlayerName = GetName()
	local strNews = "[师门任务]: 恭喜"..strPlayerName.."完成今天所有的师门任务，以资鼓励。"
--	AddGlobalNews(strNews)
end;

-- 真正搞到手了一本师门45级秘籍
function really_get_a_super_mistery_book()
	SetTask(TASKVALUE_GET_EVENT_PRIZE_TIMES_ID, 4)
	
	local nFactionRoute = GetPlayerRoute()	-- 获得玩家的流派数据
	local nRate = random(0, 1)				-- 哪一本秘籍
	
	if (nFactionRoute == 2) then			-- 少林俗家
		AddItem(0, 107, (1 + nRate), 1)		-- 金刚伏魔经 or 金刚伏魔心法
	elseif (nFactionRoute == 3) then		-- 少林禅宗
		AddItem(0, 107, (5 + nRate), 1)		-- 无尘秘籍 or 无尘心法
	elseif (nFactionRoute == 4) then		-- 少林武宗
		AddItem(0, 107, (3 + nRate), 1)		-- 潜龙秘籍 or 潜龙心法
		
	elseif (nFactionRoute == 6) then		-- 唐门
		AddItem(0, 107, (7 + nRate), 1)		-- 天罗秘籍 or 天罗心法
		
	elseif (nFactionRoute == 8) then		-- 峨嵋佛家
		AddItem(0, 107, (9 + nRate), 1)		-- 如意秘籍 or 如意心法
	elseif (nFactionRoute == 9) then		-- 峨嵋俗家
		AddItem(0, 107, (11 + nRate), 1)	-- 碧海谱 or 碧海心法
		
	elseif (nFactionRoute == 11) then		-- 丐帮净衣
		AddItem(0, 107, (13 + nRate), 1)	-- 混沌秘籍 or 混沌心法
	elseif (nFactionRoute == 12) then		-- 丐帮污衣
		AddItem(0, 107, (15 + nRate), 1)	-- 揆天秘籍 or 揆天心法
		
	elseif (nFactionRoute == 14) then		-- 武当道家
		AddItem(0, 107, (17 + nRate), 1)	-- 幻影秘籍 or 幻影心法
	elseif (nFactionRoute == 15) then		-- 武当俗家
		AddItem(0, 107, (19 + nRate), 1)	-- 君子秘籍 or 君子心法
		
	elseif (nFactionRoute == 17) then		-- 杨门枪骑
		AddItem(0, 107, (21 + nRate), 1)	-- 镇军秘籍 or 镇军心法
	elseif (nFactionRoute == 18) then		-- 杨门弓骑
		AddItem(0, 107, (23 + nRate), 1)	-- 穿云秘籍 or 穿云心法
		
	elseif (nFactionRoute == 20) then		-- 五毒邪侠
		AddItem(0, 107, (25 + nRate), 1)	-- 幽冥鬼录 or 幽冥心法
	elseif (nFactionRoute == 21) then		-- 五毒蛊师
		AddItem(0, 107, (27 + nRate), 1)	-- 灵蛊秘籍 or 灵蛊心法
	elseif (nFactionRoute == 23) then		-- 昆仑天师
		AddItem(0, 107, (180 + nRate), 1)	-- 灵蛊秘籍 or 灵蛊心法
	elseif (nFactionRoute == 25) then		-- 明教圣战
		AddItem(0, 107, (182 + nRate), 1)	-- 灵蛊秘籍 or 灵蛊心法
	elseif (nFactionRoute == 26) then		-- 明教阵兵
		AddItem(0, 107, (184 + nRate), 1)	-- 灵蛊秘籍 or 灵蛊心法
	elseif (nFactionRoute == 27) then		-- 明教血人
		AddItem(0, 107, (186 + nRate), 1)	-- 灵蛊秘籍 or 灵蛊心法
	elseif (nFactionRoute == 29) then		-- 翠烟舞仙
		AddItem(0, 107, (188 + nRate), 1)	-- 灵蛊秘籍 or 灵蛊心法
	elseif (nFactionRoute == 30) then		-- 翠烟灵女
		AddItem(0, 107, (190 + nRate), 1)	-- 灵蛊秘籍 or 灵蛊心法
	end
	
	Msg2Player("您获得1本初级秘籍")
end;

--给予师门高级秘籍，新门派要加
function get_advanced_faction_book()
	local tGaojiMiji = {
				[0] = {{"金刚般若经",0,107,166},{"无尘菩提经",0,107,168},{"潜龙寂灭经",0,107,167},{"天罗连珠录",0,107,169},{"如意金顶秘籍",0,107,170},{"碧海绝音谱",0,107,171},{"混沌镇岳秘籍",0,107,172},{"揆天游龙秘籍",0,107,173},{"幻影迷踪秘籍",0,107,174},{"君子截风秘籍",0,107,175},{"镇军飞龙枪谱",0,107,176},{"穿云落虹秘籍",0,107,177},{"幽冥封魔录",0,107,178},{"灵蛊幻邪录",0,107,179}},
				[1] = {{"金刚般若经",0,107,166},{"无尘菩提经",0,107,168},{"潜龙寂灭经",0,107,167}},
				[2] = {{"金刚般若经",0,107,166}},
				[3] = {{"无尘菩提经",0,107,168}},
				[4] = {{"潜龙寂灭经",0,107,167}},
				[5] = {{"天罗连珠录",0,107,169}},
				[6] = {{"天罗连珠录",0,107,169}},
				[7] = {{"如意金顶秘籍",0,107,170},{"碧海绝音谱",0,107,171}},
				[8] = {{"如意金顶秘籍",0,107,170}},
				[9] = {{"碧海绝音谱",0,107,171}},
				[10] = {{"混沌镇岳秘籍",0,107,172},{"揆天游龙秘籍",0,107,173}},
				[11] = {{"混沌镇岳秘籍",0,107,172}},
				[12] = {{"揆天游龙秘籍",0,107,173}},
				[13] = {{"幻影迷踪秘籍",0,107,174},{"君子截风秘籍",0,107,175}},
				[14] = {{"幻影迷踪秘籍",0,107,174}},
				[15] = {{"君子截风秘籍",0,107,175}},
				[16] = {{"镇军飞龙枪谱",0,107,176},{"穿云落虹秘籍",0,107,177}},
				[17] = {{"镇军飞龙枪谱",0,107,176}},
				[18] = {{"穿云落虹秘籍",0,107,177}},
				[19] = {{"幽冥封魔录",0,107,178},{"灵蛊幻邪录",0,107,179}},
				[20] = {{"幽冥封魔录",0,107,178}},
				[21] = {{"灵蛊幻邪录",0,107,179}},
				[22] = {{"九天风雷诀",0,107,198}},
				[23] = {{"九天风雷诀",0,107,198}},
				[24] = {{"回锋斩日秘籍",0,107,199},{"负旗行阵秘籍",0,107,200},{"凝血封魂秘籍",0,107,201}},
				[25] = {{"回锋斩日秘籍",0,107,199}},
				[26] = {{"负旗行阵秘籍",0,107,200}},
				[27] = {{"凝血封魂秘籍",0,107,201}},
				[28] = {{"红尘醉梦谱",0,107,202},{"风花千叶谱",0,107,203}},
				[29] = {{"红尘醉梦谱",0,107,202}},
				[30] = {{"风花千叶谱",0,107,203}},
			};
	local nFactionRoute = GetPlayerRoute()	-- 获得玩家的流派数据
	local nRandom = random(1,getn(tGaojiMiji[nFactionRoute]));
	local nAdd_flag = AddItem(tGaojiMiji[nFactionRoute][nRandom][2],tGaojiMiji[nFactionRoute][nRandom][3],tGaojiMiji[nFactionRoute][nRandom][4],1);
	if nAdd_flag == 1 then
		Msg2Player("你得到一本"..tGaojiMiji[nFactionRoute][nRandom][2]);
		WriteLog("[师门任务]: "..GetName().."完成师门任务获得1本"..tGaojiMiji[nFactionRoute][nRandom][1]);
	else
		WriteLog("[师门任务]: "..GetName().."完成师门任务未能获得1本"..tGaojiMiji[nFactionRoute][nRandom][1].."标记: "..nAdd_flag);
	end	
end


-- 给一个师门令牌，按门派给的
function send_a_faction_card()
	local nFaction = GetPlayerFaction()		-- 得到玩家是哪个门派的

	if (nFaction == 1) then			-- 少林
		AddItem(2, 0, 205, 1)		-- 少林师门令牌
	elseif (nFaction == 2) then		-- 武当
		AddItem(2, 0, 206, 1)		-- 武当师门令牌
	elseif (nFaction == 3) then		-- 峨嵋
		AddItem(2, 0, 207, 1)		-- 峨嵋师门令牌
	elseif (nFaction == 4) then		-- 丐帮
		AddItem(2, 0, 208, 1)		-- 丐帮师门令牌
	elseif (nFaction == 5) then		-- 唐门
		AddItem(2, 0, 209, 1)		-- 唐门师门令牌
	elseif (nFaction == 6) then		-- 杨门
		AddItem(2, 0, 350, 1)		-- 杨门师门令牌
	elseif (nFaction == 7) then		-- 五毒
		AddItem(2, 0, 390, 1)		-- 五毒师门令牌
	elseif (nFaction == 8) then		-- 昆仑
		AddItem(2,0,787, 1)		-- 昆仑师门令牌
	elseif (nFaction == 9) then		-- 明教
		AddItem(2,0,788, 1)		-- 明教师门令牌
	elseif (nFaction == 10) then		-- 翠烟
		AddItem(2,0,789, 1)		-- 翠烟师门令牌
	end
end;

function cancel_faction_event()
	Say("为了拥有宗派的奥秘.你需要完成师门任务.您要继续吗?",
		2,
		"我想取消这个任务/confirm_cancel_faction_event",
		"\n结束对话!/cancel_dialog")
end;

function confirm_cancel_faction_event()
	SetTask(TASKVALUE_FACTION_EVENT_ID, 0)
	Say("我已经取消了任务,如果您想再做一次,则必须重新接取任务!", 0)
end;

function get_free_room(goods_num)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=red>背包<color>不够！!")
		return 0
	else 
		return 1
	end
end



