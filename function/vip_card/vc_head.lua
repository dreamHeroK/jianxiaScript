Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\vip_card\\vc_define.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\date.lua")
Import("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\date.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\function\\vip_card\\config.lua")
Include("\\script\\function\\vip_card\\mission_task.lua")

--function fix_bug_20160601()
--	--临时旧的22号双子卡 换成新的
--	local nTask = 3236
--	local nIndex = GetTask(nTask)
--	if nIndex == 22 then
--		SetTask(nTask, 6, 26)
--	end
--end

function vc_IsVipCardOpen()
	return IsActivatedVipCard(VC_CURRENT_ID);
end

function vc_GetMainTitle()
--	fix_bug_20160601()
	local szTitle = "新服vip回馈"
	local nRemainTime = GetVipCardRemainTime();
	local nState = -1;
	if nRemainTime > 0 then
		local nCurID = GetVipCardIndex();
		local nDays = GetVipCardTime(nCurID);
		local nTime = GetVipCardActivateTime();
		local nY, nM, nD = GmTime(nTime);
		local nStartTime = nY.."."..nM.."."..nD;
		nY, nM, nD = GmTime(nTime + nDays * 24 * 3600);
		local nEndTime = nY.."."..nM.."."..nD;
		szTitle = szTitle.."("..""..nStartTime.."~"..nEndTime..""..")";
		nState = 1;
	elseif vc_HaveValueAward() ~= 0 then
		szTitle = szTitle.."(".."尚未领取VIP奖励"..")";
		nState = 2;
	else
		szTitle = szTitle.."(".."未激活"..")";
		nState = 0;
	end
	szTitle = szTitle..format("/#vc_MainFunction(%d)", nState);
	return szTitle
end

function vc_MainFunction(nState)
	local nKind = tonumber(nState)
	if 0 == nKind then
		vc_Activating();
	elseif 1 == nKind then
		vc_JoinFunction();
	elseif 2 == nKind then
		vc_GetValueAward();
	end
end

function vc_Activating()
	if IsActivatedVipCard(VC_CURRENT_ID) ~= 1 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID)).."T輓h n╪g t筸 ng");
		return
	end
	if is_in_valid_date(1) ~= 1 then
		return 0
	end

	local szCardName = GetVipCardName(VC_CURRENT_ID)
	local tSay = {
		format("我要激活%s/vc_ActivatingNow", szCardName),
		format("查看%s奖励/vc_LookForAward", szCardName),
		"查看新服VIP回馈需要什么条件/vc_LookForCondition",
		"结束对话/nothing"
	}
	local szTitle = format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID))..format("Ngi ch璦 k輈h ho箃 %s.Ngi ch琲 c蕄 80 tr? l猲 c? th? mua th? VIP v? l﹎ v? ti課 h祅h k輈h ho箃.", szCardName)
	szTitle = format("%s %s", szTitle, format("Th阨 gian k輈h ho箃 th? VIP n祔 %s~%s", show_date(CUR_VIP_CARD_START_DATE), show_date(CUR_VIP_CARD_END_DATE)))
	Say(szTitle, getn(tSay), tSay);
end

function vc_ActivatingNow(bTag)
	if is_in_valid_date(1) ~= 1 then
		return 0
	end
	
	local szCardName = GetVipCardName(VC_CURRENT_ID);
	local nRemainTime = GetVipCardRemainTime();
	if not bTag and nRemainTime > 0 then
		Say(format("<color=green>%s<color>：", GetVipCardName(VC_CURRENT_ID))..format("% 会失效，确认要激活吗？", GetVipCardName(GetVipCardIndex())), 2, "\n仍然激活/#vc_ActivatingNow(1)", "\n稍后再来/nothing");
		return 0;
	end
	if vc_HaveValueAward() ~= 0 then
		Talk(1,"",format("您没有%s无法领取%s奖励。", GetVipCardName(GetVipCardIndex()), szCardName));
		return 0;
	end
	if GetLevel() < 80 and gf_GetPlayerRebornCount() <= 0 then
		Talk(1,"",format("激活%s需要角色等级%d级。", szCardName, 80));
		return 0;
	end
	if is_in_valid_date(1) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	local nRet = ActivatingVipCard(VC_CURRENT_ID);
	if nRet ~= 1 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID))..format("Trong t骾 kh玭g c? %s, k輈h ho箃 th蕋 b筰", szCardName))
		return 0;
	end
	RemoveTitle(99, 1)
	AddTitle(99, 1)
	SetTitleTime(99, 1, GetTime() + 30 * 24 * 3600)
	SetCurTitle(99, 1)
	SetTask(TASKID_VC_VALUE_FLAG, 0, TASK_ACCESS_CODE_VIP_CARD);
	clear_ib_award_tasks()
	vc_DailyTaskReset();
	local nRet, nIndex = AddItem(0,200,40,1,4) --给神行宝典
	if nRet == 1 then
		SetItemExpireTime(nIndex, 30 * 24 * 3600)
	end
	Msg2Player(msg);
	local msg = format("%s  k輈h ho箃 th祅h c玭g", szCardName);
	Talk(1,"vc_JoinFunction",format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID))..msg);
end

function vc_LookForAward()
	local szCardName = GetVipCardName(VC_CURRENT_ID)
	local tSay = {};
	tSay.msg = format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID))..format("Ngi ch琲 k輈h ho箃 %s, s? nh薾 頲 ph莕 thng sau:\nKhi k輈h ho箃 s? nh薾 頲 1 Th莕 H祅h B秓 觧, ph莕 thng c馻 Lng S琻, мa Huy襫 Cung, V筺 Ki誱 Tr騨g, chi課 trng l韓 nh?, Thi猲 M玭 Tr薾, Chi課 Trng Li猲 Server s? 頲 c閚g th猰\nPh莕 thng  c鑞g hi課: H籲g ng祔 ho祅 th祅h nhi謒 v? V? L﹎ Treo Thng s? nh薾 頲  c鑞g hi課, t  c鑞g hi課 nh蕋 nh s? nh薾 頲 Hu﹏ Chng Anh H飊g v? L玦 H? Tinh Ph竎h", szCardName).."\nTh? 6, th? 7 v? ch? nh藅, sau khi ho祅 th祅h nhi謒 v? h籲g ng祔, s? lng EXP v? v祅g nh薾 頲 u t╪g 1.5 l莕";
	tSay.sel = {
		{"Ra kh醝", "nothing"},
	};
	temp_Talk(tSay);
end

function vc_JoinFunction()
	local tMsg = {
		[0] = "Ch璦 nh薾", 
		[1] = "Х nh薾",
	}
	local msg = tMsg[gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31)] or tMsg[1];
	local tSay = {
		format("Xem ph莕 thng %s/vc_LookForAward", GetVipCardName(GetVipCardIndex())),
		"Nhi謒 v? h玬 nay/vc_DailyTask",
		format("Nh薾 甶觤 tinh l鵦 (%s)/vc_DailyEnergy", msg),
		"Ph莕 thng  c鑞g hi課/vc_GetValueAward",
		"Nh薾 уng T? Chi Nguy謓/vc_GetItemTjzy",
		"Nh薾 thng ti猽 hao Thi猲 Ki猽 L謓h/ib_award_talk_main",
		"\n r髏 lui/nothing"
	}
	local nCurID = GetVipCardIndex();
	if nCurID ~= VC_CURRENT_ID then
		local nDate = tonumber(date("%Y%m%d"))
		DebugOutput("nDate =", nDate)
		if nDate >= CUR_VIP_CARD_START_DATE and nDate <= CUR_VIP_CARD_END_DATE then
			tinsert(tSay, 1, format("k輈h ho箃 %s/vc_Activating", GetVipCardName(VC_CURRENT_ID)));
		end
	end
	local _,_,_,nDays = GetVipCardTime(nCurID);
	local nTime = GetVipCardActivateTime();
	local nY, nM, nD = GmTime(nTime);
	local nStartTime = nD.."/"..nM.."/"..nY;
	nY, nM, nD = GmTime(nTime + nDays * 24 * 3600);
	local nEndTime = nD.."/"..nM.."/"..nY;
	Say(format("<color=green>%s:<color> ", GetVipCardName(GetVipCardIndex()))..format("Х k輈h ho箃 th祅h c玭g %s, h筺 s? d鬾g %s n %s", GetVipCardName(GetVipCardIndex()), nStartTime, nEndTime), getn(tSay), tSay)
end

function vc_GetValueAward()
	local tMsg = {
		[1] = "已领取",
		[2] = "未领取",
		[3] = "未完成",
	}
	local tSay = {};
	local nIndex = 0;
	local nValue = GetVipCardValue();
	local nCardIndex = GetVipCardIndex();
	local tAward = VC_VALUE_AWARD[VC_VALUE_AWARD_INDEX[nCardIndex]];
	if not tAward then return 0; end
	for i = 1, getn(tAward) do
		if gf_GetTaskBit(TASKID_VC_VALUE_FLAG, i) == 1 then
			nIndex = 1;
		else
			if nValue >= tAward[i][1] then
				nIndex = 2;
			else
				nIndex = 3;
			end		
		end
		if tAward[i][2] == 1 then
			tinsert(tSay, format("%d %s*%d(%s)/#vc_GetValueAwardFinish(%d, %d)", tAward[i][1], tAward[i][4], tAward[i][3][4], tMsg[nIndex], nIndex, i));
		elseif tAward[i][2] == 2 then
			tinsert(tSay, format("%d %d%s(%s)/#vc_GetValueAwardFinish(%d, %d)", tAward[i][1], tAward[i][3], tAward[i][4], tMsg[nIndex], nIndex, i));
		elseif tAward[i][2] == 3 then
			tinsert(tSay, format("%d %s(%s)/#vc_GetValueAwardFinish(%d, %d)", tAward[i][1], tAward[i][4], tMsg[nIndex], nIndex, i));
		end
	end
	tinsert(tSay, "Ra kh醝/nothing");
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("ч c鑞g hi謓 hi謓 t筰 l? <color=green>%d<color>. M鏸 m鑓 c鑞g hi課 ch? 頲 nh薾 thng 1 l莕. Sau khi d飊g th? th竛g m韎 s? kh玭g th? nh薾 ph莕 thng  c鑞g hi課 c馻 th? th竛g c?. H穣 nh薾 k辮 th阨", nValue), getn(tSay), tSay)
end

function vc_GetItemTjzy()
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	local task = GetTask(TASKID_VC_RECORD_WEEK);
	if task ~= 0 then
		Talk(1,"","Tu莕 n祔 c竎 h?  nh薾, h裯 g苝 l筰 tu莕 sau!");
		return 0;
	end
	SetTask(TASKID_VC_RECORD_WEEK, 1, TASK_ACCESS_CODE_VIP_CARD);
	gf_AddItemEx2({2, 1, 30913, 7}, "уng T? Chi Nguy謓", GetVipCardName(GetVipCardIndex()), "Nh薾 уng T? Chi Nguy謓", 0, 1)
end

function vc_GetValueAwardFinish(nTag, nIndex)
	if 1 == nTag then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."B筺  nh薾 ph莕 thng n祔 r錳 ");
		return
	end
	if 3 == nTag then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."Ch璦 t  c鑞g hi課, kh玭g th? nh薾 ph莕 thng n祔");
		return
	end
	local nCardIndex = GetVipCardIndex();
	local tAward = VC_VALUE_AWARD[VC_VALUE_AWARD_INDEX[nCardIndex]];
	if not tAward then return 0; end
	local tCell = tAward[nIndex]
	if not tCell then
		return
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return
	end
	gf_SetTaskBit(TASKID_VC_VALUE_FLAG, nIndex, 1, TASK_ACCESS_CODE_VIP_CARD);
	if tCell[2] == 1 then
		gf_AddItemEx2(tCell[3], tCell[4], GetVipCardName(GetVipCardIndex()), "Ph莕 thng  c鑞g hi課", 0, 1);
	elseif tCell[2] == 2 then
		gf_Modify("Exp", tCell[3]);
	elseif tCell[2] == 3 then
		dostring(tCell[3]);
	end
end

--判断贡献奖励是否为领取
function vc_HaveValueAward()
	local nValue = GetVipCardValue();
	local nCardIndex = GetVipCardIndex();
	if not nCardIndex or nCardIndex < 1 or nCardIndex > getn(VC_VALUE_AWARD_INDEX) then
		return 0;
	end
	local tAward = VC_VALUE_AWARD[VC_VALUE_AWARD_INDEX[nCardIndex]];
	if not tAward then return 0; end
	for i = 1, getn(tAward) do
		if nValue >= tAward[i][1] then
			if gf_GetTaskBit(TASKID_VC_VALUE_FLAG, i) ~= 1 then
				return 1;
			end
		end
	end
	return 0;
end

function vc_DailyTaskReset()
	SetTask(TASKID_VC_DAILY_TASK_FLAG, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_AUTO_FINISH_TIMES, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_DAILY_TASK_1, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_DAILY_TASK_2, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_DAILY_TASK_3, 0, TASK_ACCESS_CODE_VIP_CARD);
end

function vc_WeeklyTaskReset()
	SetTask(TASKID_VC_RECORD_WEEK, 0, TASK_ACCESS_CODE_VIP_CARD);
end

function vc_GetServerIndex(tCell)
	local today = Date();
	local wDay = today:week();
	if wDay == 0 then wDay = 7 end
	if not tCell.Content then
		return 1;
	end
	return mod(wDay, getn(tCell.Content)) + 1;
end

function vc_GetContentIndex(tCell, bGenerate)
	local nContentIndex = gf_GetTaskByte(tCell.TaskIndex, tCell.ByteIndex);
	if bGenerate then
		if nContentIndex <= 0 or nContentIndex > getn(tCell.Content) then
			if tCell.RandType == 1 then
				nContentIndex = vc_GetServerIndex(tCell);
			elseif tCell.RandType == 2 then
				nContentIndex = random(getn(tCell.Content));
			end
			gf_SetTaskByte(tCell.TaskIndex, tCell.ByteIndex, nContentIndex, TASK_ACCESS_CODE_VIP_CARD);
		end
	end
	return nContentIndex;
end

function vc_DailyTask()
	local tSay = {}
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[VC_DAILY_TASK_INDEX[nCardIndex]];
	if not tTaskTable then  return 0; end
	for i = 1, getn(tTaskTable) do
		local tCell = tTaskTable[i];
		DebugOutput("tCell =", tCell);
		local nFinishTimes = gf_GetTaskByte(tCell.Task, tCell.Byte);
		DebugOutput("nFinishTimes =", nFinishTimes);
		local cIndex = vc_GetContentIndex(tCell, 1);
		DebugOutput("cIndex =", cIndex);
		tinsert(tSay, format("%s(%d/%d)/#vc_DailyTaskDetail(%d, %d)", tCell.Content[cIndex][1], 
			min(nFinishTimes, tCell.Content[cIndex][2]), tCell.Content[cIndex][2], i, cIndex));
	end
	tinsert(tSay, "Ra kh醝/nothing")
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."Nhi謒 v? V? L﹎ Treo Thng kh玭g c莕 nh薾, ch? c莕 trong ng祔 ho祅 th祅h 甶襲 ki謓 s? c? th? ho祅 th祅h, nh璶g ph莕 thng ph秈 t? nh薾. C? th? n閜 Thi猲 Ki猽 L謓h  t? ng ho祅 th祅h nhi謒 v?, m鏸 l莕 t? ng ho祅 th祅h th? s? lng Thi猲 Ki猽 L謓h ti猽 hao ng祔 c祅g nhi襲.", getn(tSay), tSay)
end

function vc_DailyTaskDetail(nIndex, cIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[VC_DAILY_TASK_INDEX[nCardIndex]];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	local nFinishTimes = gf_GetTaskByte(tCell.Task, tCell.Byte); 
	local tSub = tCell.Content[cIndex];
	if not tSub then return end
	local tSay = {}
	local msg = format("<color=yellow>[%s*%d]<color>", tSub[1], tSub[2])..tSub[3];
	local bIsFinish = gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex);
	if bIsFinish ~= 0 then
		msg = msg.."<color=green>(Х ho祅 th祅h m鬰 n祔)<color>"
	else
		if nFinishTimes <= 0 then
			tinsert(tSay, format("\nNh薾 nhi謒 v?/#vc_DailyTaskDetail_GetTask(%d)", nIndex));
			tinsert(tSay, format("\nT? ng ho祅 th祅h/#vc_DailyTaskDetail_AotoFinish(%d)", nIndex));
		elseif nFinishTimes >= tSub[2] then
			tinsert(tSay, format("\n Nh薾 ph莕 thng/#vc_DailyTaskDetail_GetTaskAward(%d)", nIndex));
		end
	end
	tinsert(tSay, "\n r髏 lui/nothing");
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..msg, getn(tSay), tSay);
end

function vc_DailyTaskDetail_GetTask(nIndex)
	DebugOutput("vc_DailyTaskDetail_GetTask", nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[VC_DAILY_TASK_INDEX[nCardIndex]];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	local cIndex = vc_GetContentIndex(tCell);
	local tSub = tCell.Content[cIndex];
	if not tSub then return end
	Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("Mau 甶 ho祅 th祅h nhi謒 v? h籲g ng祔 <color=green>%s<color>!", tSub[1]));
end

function vc_DailyTaskDetail_GetTaskAward(nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[VC_DAILY_TASK_INDEX[nCardIndex]];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex) ~= 0 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."M鬰 n祔  ho祅 th祅h (M鏸 ng祔 ch? 頲 ho祅 th祅h 1 l莕");
		return
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return
	end
	gf_SetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex, 1, TASK_ACCESS_CODE_VIP_CARD);
	dostring(tCell.Award);
end

function vc_DailyTaskDetail_AotoFinish(nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[VC_DAILY_TASK_INDEX[nCardIndex]];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex) ~= 0 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."M鬰 n祔  ho祅 th祅h (M鏸 ng祔 ch? 頲 ho祅 th祅h 1 l莕");
		return
	end
	local nAutoFinishTimes = GetTask(TASKID_VC_AUTO_FINISH_TIMES);
	local nCostNum = (nAutoFinishTimes * 2 + 1) * tCell.AutoFinish[4];
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("H玬 nay  d飊g <color=red>%d<color> l莕 t? ng ho祅 th祅h, l莕 n祔 c莕 ti猽 hao <color=yellow>%s<color>*%d", 
		nAutoFinishTimes, tCell.AutoFinish[5], nCostNum), 2, 
		format("\nX竎 nh薾/#vc_DailyTaskDetail_AotoFinish_Ensure(%d, %d, %d, %d, %d)", tCell.AutoFinish[1], tCell.AutoFinish[2], 
			tCell.AutoFinish[3], nCostNum, nIndex), "\n r髏 lui/nothing");
end

function vc_DailyTaskDetail_AotoFinish_Ensure(nG, nD, nP, nNum, nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[VC_DAILY_TASK_INDEX[nCardIndex]];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	DebugOutput("vc_GetContentIndex(tCell) =", vc_GetContentIndex(tCell))
	local tSub = tCell.Content[vc_GetContentIndex(tCell)];
	if not tSub then return end
	if DelItem(tCell.AutoFinish[1], tCell.AutoFinish[2], tCell.AutoFinish[3], nNum) ~= 1 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("S? lng %s trong t骾 kh玭g  %d c竔", tCell.AutoFinish[5], nNum));
		return
	end
	FireEvent("event_ib_cost", tCell.AutoFinish[1], tCell.AutoFinish[2], tCell.AutoFinish[3], nNum)
--	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {tCell.AutoFinish[1], tCell.AutoFinish[2], tCell.AutoFinish[3], nNum})
	SetTask(TASKID_VC_AUTO_FINISH_TIMES, GetTask(TASKID_VC_AUTO_FINISH_TIMES) + 1, TASK_ACCESS_CODE_VIP_CARD);
	gf_SetTaskByte(tCell.Task, tCell.Byte, tSub[2], TASK_ACCESS_CODE_VIP_CARD);
	vc_DailyTaskDetail_GetTaskAward(nIndex);
end

function vc_DailyEnergy()
	local nRet = gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31);
	local tMsg = {
		[0] = "Ch璦 nh薾", 
		[1] = "Х nh薾",
	}
	local msg = tMsg[nRet];
	local tMsg2 = {
		[0] = "ng",
		[1] = "уng ?",
	}
	local tFunc = {
		[0] = "vc_DailyEnergy_do",
		[1] = "nothing",
	}
	local tSay = {
		format("%s/%s", tMsg2[nRet], tFunc[nRet]),
		"\n r髏 lui/nothing",
	}
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("H玬 nay c? th? nh薾 tr鵦 ti誴 %d 甶觤 tinh l鵦, ngi h玬 nay %s", 120, msg), getn(tSay), tSay);
end

function vc_DailyEnergy_do()
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31) ~= 0 then
		return 0;
	end
	local nCur, nMax = ModifyEnergy(0,1);
	local nCanGive = nMax - nCur;
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("Hi謓 t筰 nh薾 頲 %d 甶觤 tinh l鵦, ng ? nh薾 kh玭g?", min(nCanGive, 120)), 2, "\nX竎 nh薾/vc_DailyEnergy_do_ensure", "\n h駓 b?/nothing");
end

function vc_DailyEnergy_do_ensure()
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31) ~= 0 then
		return 0;
	end
	local nCur, nMax = ModifyEnergy(0,1);
	local nCanGive = nMax - nCur;
	ModifyEnergy(min(nCanGive, 120), 1);
	gf_SetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31, 1, TASK_ACCESS_CODE_VIP_CARD);
	return 1;
end

--随机3-4星徽章
function vc_Rand_3_4_JS_badge()
	local tAward = {
		{1, 88000, "Huy Chng Ng鋍 Ch?", {0, 153, 3, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Huy Chng Kim Ch? ng? h祅h", {0, 153, 4, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Huy Chng M閏 Ch? ng? h祅h", {0, 153, 5, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Huy Chng Th駓 Ch? ng? h祅h", {0, 153, 6, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Huy Chng H醓 Ch? ng? h祅h", {0, 153, 7, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Huy Chng Th? Ch? ng? h祅h", {0, 153, 8, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1900, "Huy Chng  Ch? ng? h祅h", {0, 153, 9, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 35, "Huy Chng Du Hi謕", {0, 153, 26, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 35, "Huy Chng Thi誸 Huy誸", {0, 153, 27, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 30, "Huy Chng V﹏ Du", {0, 153, 28, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, GetVipCardName(GetVipCardIndex()), "Huy chng 3-4 sao ng蓇 nhi猲")
end

--随机3-4星挂衣
function vc_Rand_3_4_JS_cape()
	local tAward = {
		{1, 88000, "竜 Cho祅g H醓 V﹏", {0, 152, 3, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "竜 Cho祅g Ng? H祅h Kim Ch?", {0, 152, 4, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "竜 Cho祅g Ng? H祅h M閏 Ch?", {0, 152, 5, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "竜 Cho祅g Ng? H祅h Th駓 Ch?", {0, 152, 6, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "竜 Cho祅g Ng? H祅h H醓 Ch?", {0, 152, 7, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "竜 Cho祅g Ng? H祅h Th? Ch?", {0, 152, 8, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1900, "竜 Cho祅g Ng? H祅h  Ch?", {0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 35, "竜 Cho祅g Du Hi謕", {0, 152, 26, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 35, "竜 Cho祅g Thi誸 Huy誸", {0, 152, 27, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 30, "竜 Cho祅g V﹏ Du", {0, 152, 28, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, GetVipCardName(GetVipCardIndex()), "竜 cho祅g 3-4 sao ng蓇 nhi猲")
end

--随机3-4星鞋
function vc_Rand_3_4_JS_foot()
	local tAward = {
		{1, 88000, "B? Ch? Cao уng Ngoa", {0, 154, 3, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Chi課 H礽 Kim Ch? ng? h祅h", {0, 154, 4, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Chi課 H礽 M閏 Ch? ng? h祅h", {0, 154, 5, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Chi課 H礽 Th駓 Ch? ng? h祅h", {0, 154, 6, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Chi課 H礽 H醓 Ch? ng? h祅h", {0, 154, 7, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Chi課 H礽 Th? Ch? ng? h祅h", {0, 154, 8, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1900, "Chi課 H礽  Ch? ng? h祅h", {0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 35, "Trng H礽 Du Hi謕", {0, 154, 26, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 35, "Chi課 H礽 Thi誸 Huy誸", {0, 154, 27, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 30, "Чo H礽 V﹏ Du", {0, 154, 28, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, GetVipCardName(GetVipCardIndex()), "Gi莥 3-4 sao ng蓇 nhi猲")
end

--随机2-4级宝石几率
function vc_Rand_2_4_Gem(nNum)
	nNum = nNum or 1;
	local tAward = {
		{1, 18, "Huy誸Tr輈hTh筩h Lv2", {2, 22, 102, 1, 4}, 0},
		{1, 18, "Nguy謙B筩hTh筩h Lv2", {2, 22, 202, 1, 4}, 0},
		{1, 18, "H? Ph竎h Th筩h C蕄 2", {2, 22, 302, 1, 4}, 0},
		{1, 18, "H綾 Di謚 Th筩h C蕄 2", {2, 22, 402, 1, 4}, 0},
		{1, 6, "Huy誸Tr輈hTh筩h Lv3", {2, 22, 103, 1, 4}, 0},
		{1, 6, "Nguy謙B筩hTh筩h Lv3", {2, 22, 203, 1, 4}, 0},
		{1, 6, "H? Ph竎h Th筩h C蕄 3", {2, 22, 303, 1, 4}, 0},
		{1, 6, "H綾 Di謚 Th筩h C蕄 3", {2, 22, 403, 1, 4}, 0},
		{1, 1, "Huy誸Tr輈hTh筩h Lv4", {2, 22, 104, 1, 4}, 1},
		{1, 1, "Nguy謙B筩hTh筩h Lv4", {2, 22, 204, 1, 4}, 1},
		{1, 1, "H? Ph竎h Th筩h C蕄 4", {2, 22, 304, 1, 4}, 1},  
		{1, 1, "H綾 Di謚 Th筩h C蕄 4", {2, 22, 404, 1, 4}, 1},
	}
	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	gf_AddItemEx2({tAward[nIndex][4][1], tAward[nIndex][4][2], tAward[nIndex][4][3], tonumber(nNum), tAward[nIndex][4][5]}, tAward[nIndex][3], "VipCard", "Ц qu? c蕄 2-4", 0, 1);
	if tAward[nIndex][5] == 1 then
		Msg2Global(format("[%s] trong Th? VIP V? L﹎ i 甶觤 c鑞g hi課 nh薾 頲 ph莕 thng %s*%d", GetName(), tAward[nIndex][3], tonumber(nNum)))
	end
end

--随机4级伙伴技能书
function vc_Rand_10_4_Gem(nNum)
	nNum = nNum or 1;
	local tAward = {
		{1, 9,"Ch﹏ kh? h? th? C蕄 4", {2, 150, 4,  1, 1}},
		{1, 7,"輈h Th? Di猲 Dng C蕄 4", {2, 150, 8,  1, 1}},
		{1, 7,"Cng Th﹏ B? Th? C蕄 4", {2, 150, 12, 1, 1}},
		{1, 7," Phong Th鵦 C鑤 C蕄 4", {2, 150, 16, 1, 1}},
		{1, 7,"Huy襫 V? V? Song C蕄 4", {2, 150, 20, 1, 1}},
		{1, 7,"V? H祅h V? Tng C蕄 4", {2, 150, 24, 1, 1}},
		{1, 7,"Kim Linh Ph? Th? C蕄 4", {2, 150, 28, 1, 1}},
		{1, 7,"M閏 Linh Ph? Th? C蕄 4", {2, 150, 32, 1, 1}},
		{1, 7,"Thu? Linh Ph? Th? C蕄 4", {2, 150, 36, 1, 1}},
		{1, 7,"Ho? Linh Ph? Th? C蕄 4", {2, 150, 40, 1, 1}},
		{1, 7,"Th? Linh Ph? Th? C蕄 4", {2, 150, 44, 1, 1}},
		{1, 6,"Ph? Kh玭g Tr秏 秐h C蕄 4", {2, 150, 48, 1, 1}},
		{1, 6,"S竧 thng gia n﹏g c蕄 4", {2, 150, 52, 1, 1}},
		{1, 3,"Khinh Linh T蕁 T藅  C蕄 4", {2, 150, 56, 1, 1}},
		{1, 6,"V? H譶h Chi C? C蕄 4", {2, 150, 60, 1, 1}},
	}
	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	gf_AddItemEx2({tAward[nIndex][4][1], tAward[nIndex][4][2], tAward[nIndex][4][3], tonumber(nNum), tAward[nIndex][4][5]}, tAward[nIndex][3], "VipCard", "S竎h K? N╪g уng H祅h c蕄 4", 0, 1);
end

--随机3-5级宝石几率
function vc_Rand_10_6_Gem(nNum)
	nNum = nNum or 1;
	local tAward = {
		{1, 18, "Huy誸Tr輈hTh筩h Lv3", {2, 22, 103, 1, 4}, 0},
		{1, 18, "Nguy謙B筩hTh筩h Lv3", {2, 22, 203, 1, 4}, 0},
		{1, 18, "H? Ph竎h Th筩h C蕄 3", {2, 22, 303, 1, 4}, 0},
		{1, 18, "H綾 Di謚 Th筩h C蕄 3", {2, 22, 403, 1, 4}, 0},
		{1, 6,  "Huy誸Tr輈hTh筩h Lv4", {2, 22, 104, 1, 4}, 1},
		{1, 6,  "Nguy謙B筩hTh筩h Lv4", {2, 22, 204, 1, 4}, 1},
		{1, 6,  "H? Ph竎h Th筩h C蕄 4", {2, 22, 304, 1, 4}, 1},
		{1, 6,  "H綾 Di謚 Th筩h C蕄 4", {2, 22, 404, 1, 4}, 1},
		{1, 1,  "Huy誸Tr輈hTh筩h Lv5", {2, 22, 105, 1, 4}, 1},
		{1, 1,  "Nguy謙B筩hTh筩h Lv5", {2, 22, 205, 1, 4}, 1},
		{1, 1,  "H? Ph竎h Th筩h C蕄 5", {2, 22, 305, 1, 4}, 1},
		{1, 1,  "H綾 Di謚 Th筩h C蕄 5", {2, 22, 405, 1, 4}, 1},
	}
	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	gf_AddItemEx2({tAward[nIndex][4][1], tAward[nIndex][4][2], tAward[nIndex][4][3], tonumber(nNum), tAward[nIndex][4][5]}, tAward[nIndex][3], "VipCard", "Ц qu? c蕄 3-5", 0, 1);
	if tAward[nIndex][5] == 1 then
		Msg2Global(format("[%s] trong Th? VIP V? L﹎ i 甶觤 c鑞g hi課 nh薾 頲 ph莕 thng %s*%d", GetName(), tAward[nIndex][3], tonumber(nNum)))
	end
end

--随机5级蕴灵
function vc_Rand_10_8_Gem(nNum)
	nNum = nNum or 1;
	local tAward = {
		{1, 100, "H-Li謙 Nham-Lv5", {0, 148, 69, 1},},
		{1, 100, "H-Ph? Kh玭g-Lv5", {0, 148, 70, 1},},
		{1, 100, "H-T髖 Ki誱-Lv5", {0, 148, 71, 1},},
		{1, 100, "H-T藅 Phong-Lv5", {0, 148, 72, 1},},
		{1, 100, "H-T蕁 V?-Lv5", {0, 148, 73, 1},},
		{1, 100, "H-g T藀-Lv5", {0, 148, 74, 1},},
		{1, 100, "H-Linh T﹎-Lv5", {0, 148, 75, 1},},
		{1, 100, "H-Th莕 L鵦-Lv5", {0, 148, 76, 1},},
		{1, 100, "H-Ng璶g Th莕-Lv5", {0, 148, 77, 1},},
		{1, 100, "H-V? Gian-Lv5", {0, 148, 78, 1},},
		{1, 100, "H-V? C鵦-Lv5", {0, 148, 79, 1},},
		{1, 100, "H-Cu錸g Nh蒼-Lv5", {0, 148, 80, 1},},
		{1, 100, "H-L╪g Nhu?-Lv5", {0, 148, 81, 1},},
		{1, 100, "H-Linh Vi猲-Lv5", {0, 148, 82, 1},},
		{1, 100, "H-H秈 V薾-Lv5", {0, 148, 83, 1},},
		{1, 100, "H-H秈 T﹎-Lv5", {0, 148, 84, 1},},
		{1, 100, "C-Li謙 Nham-Lv5", {0, 149, 70, 1},},
		{1, 100, "C-Ph? Kh玭g-Lv5", {0, 149, 71, 1},},
		{1, 100, "C-T髖 Ki誱-Lv5", {0, 149, 72, 1},},
		{1, 100, "C-T藅 Phong-Lv5", {0, 149, 73, 1},},
		{1, 100, "C-T蕁 V?-Lv5", {0, 149, 74, 1},},
		{1, 100, "C-Qu竛 Th筩h-Lv5", {0, 149, 75, 1},},
		{1, 100, "C-N? Ng﹎-Lv5", {0, 149, 76, 1},},
		{1, 100, "C-Xuy猲 V﹏-Lv5", {0, 149, 77, 1},},
		{1, 100, "C-Th莕 L鵦-Lv5", {0, 149, 78, 1},},
		{1, 100, "C-Ng璶g Th莕-Lv5", {0, 149, 79, 1},},
		{1, 100, "C-V? Gian-Lv5", {0, 149, 80, 1},},
		{1, 100, "C-V? C鵦-Lv5", {0, 149, 81, 1},},
		{1, 100, "C-Cu錸g Nh蒼-Lv5", {0, 149, 82, 1},},
		{1, 100, "C-L╪g Nhu?-Lv5", {0, 149, 83, 1},},
		{1, 100, "C-Linh Vi猲-Lv5", {0, 149, 84, 1},},
		{1, 100, "C-H秈 V薾-Lv5", {0, 149, 85, 1},},
		{1, 100, "C-H秈 T﹎-Lv5", {0, 149, 86, 1},},
		{1, 100, "T-Li謙 Nham-Lv5", {0, 150, 69, 1},},
		{1, 100, "T-Ph? Kh玭g-Lv5", {0, 150, 70, 1},},
		{1, 100, "T-T髖 Ki誱-Lv5", {0, 150, 71, 1},},
		{1, 100, "T-T藅 Phong-Lv5", {0, 150, 72, 1},},
		{1, 100, "T-T蕁 V?-Lv5", {0, 150, 73, 1},},
		{1, 100, "T-V? Lng-Lv5", {0, 150, 74, 1},},
		{1, 100, "T-M鬰 Minh-Lv5", {0, 150, 75, 1},},
		{1, 100, "T-Th莕 L鵦-Lv5", {0, 150, 76, 1},},
		{1, 100, "T-Ng璶g Th莕-Lv5", {0, 150, 77, 1},},
		{1, 100, "T-V? Gian-Lv5", {0, 150, 78, 1},},
		{1, 100, "T-V? C鵦-Lv5", {0, 150, 79, 1},},
		{1, 100, "T-Cu錸g Nh蒼-Lv5", {0, 150, 80, 1},},
		{1, 100, "T-L╪g Nhu?-Lv5", {0, 150, 81, 1},},
		{1, 100, "T-Linh Vi猲-Lv5", {0, 150, 82, 1},},
		{1, 100, "T-H秈 V薾-Lv5", {0, 150, 83, 1},},
		{1, 100, "T-H秈 T﹎-Lv5", {0, 150, 84, 1},},
	}
	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	gf_AddItemEx2({tAward[nIndex][4][1], tAward[nIndex][4][2], tAward[nIndex][4][3], tonumber(nNum), tAward[nIndex][4][5] or 1, -1,-1,-1,-1,-1,-1}, tAward[nIndex][3], "VipCard", "U萵 Linh c蕄 5 (Ng蓇 nhi猲)", 0, 1);
end

--奖励------------------------------------------------------
--双子卡
function vc_AwardCopy()
	AddVipCardValue(20);
	Msg2Player(format("Nh薾 頲 %d 甶觤 [%s] c鑞g hi課", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardPlant()
	AddVipCardValue(20);
	Msg2Player(format("Nh薾 頲 %d 甶觤 [%s] c鑞g hi課", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardTmz()
	AddVipCardValue(20);
	Msg2Player(format("Nh薾 頲 %d 甶觤 [%s] c鑞g hi課", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardBattle()
	AddVipCardValue(20);
	Msg2Player(format("Nh薾 頲 %d 甶觤 [%s] c鑞g hi課", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardEquip()
	AddVipCardValue(20);
	Msg2Player(format("Nh薾 頲 %d 甶觤 [%s] c鑞g hi課", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

--巨蟹卡
--狮子卡
--处女卡
--天蝎卡
--射手卡
--摩羯卡
--水瓶卡
--双鱼卡
function vc_Award_2_1()
	AddVipCardValue(60);
	Msg2Player(format("Nh薾 頲 %d 甶觤 [%s] c鑞g hi課", 60, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
	gf_AddItemEx2({2, 1, 30499, 1}, "Hu﹏ chng anh h飊g", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

function vc_Award_2_2()
	AddVipCardValue(40);
	Msg2Player(format("Nh薾 頲 %d 甶觤 [%s] c鑞g hi課", 40, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
	gf_AddItemEx2({2, 1, 30499, 1}, "Hu﹏ chng anh h飊g", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

function vc_Award_2_3()
	AddVipCardValue(50);
	Msg2Player(format("Nh薾 頲 %d 甶觤 [%s] c鑞g hi課", 50, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
	gf_AddItemEx2({2, 1, 30499, 1}, "Hu﹏ chng anh h飊g", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

--白羊卡
--周五、六、日1.5倍
function _GetAwardScale()
	local nWeek = tonumber(date("%w"))
	if nWeek == 0 or nWeek == 5 or nWeek == 6 then
		return 1.5
	end
	return 1
end

function vc_Award_10_1()
	local nScale = _GetAwardScale();
	AddVipCardValue(60);
	Msg2Player(format("Nh薾 頲 %d 甶觤 [%s] c鑞g hi課", 60, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", floor(6000000*nScale));
	gf_Modify("Money", floor(300000*nScale));
	gf_AddItemEx2({2, 1, 30499, 1}, "Hu﹏ chng anh h飊g", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

function vc_Award_10_2()
	local nScale = _GetAwardScale();
	AddVipCardValue(40);
	Msg2Player(format("Nh薾 頲 %d 甶觤 [%s] c鑞g hi課", 40, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", floor(6000000*nScale));
	gf_Modify("Money", floor(100000*nScale));
	gf_AddItemEx2({2, 1, 30499, 1}, "Hu﹏ chng anh h飊g", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

function vc_Award_10_3()
	local nScale = _GetAwardScale();
	AddVipCardValue(50);
	Msg2Player(format("Nh薾 頲 %d 甶觤 [%s] c鑞g hi課", 50, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", floor(6000000*nScale));
	gf_Modify("Money", floor(50000*nScale));
	gf_AddItemEx2({2, 1, 30499, 1}, "Hu﹏ chng anh h飊g", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

--各功能实现接口---------------------------------------------
--VipCard ID，VC_DAILY_TASK子项索引，子子索引
function _vc_DailyTaskFinishOnce(nID, nIndex, cTag)
	--武林vip功能已关闭
	if IsActivatedVipCard(nID) ~= 1 then
		return
	end
	--当前激活的ID
	if GetVipCardIndex() ~= nID then
		return
	end
	--未激活武林vip功能
	if GetVipCardRemainTime() <= 0 then
		return
	end
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[VC_DAILY_TASK_INDEX[nCardIndex]];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	local cIndex = vc_GetContentIndex(tCell);
	if cTag ~= cIndex then
		return
	end
	local tSub = tCell.Content[cIndex];
	if not tSub then return end;
	local nFinishTimes = gf_GetTaskByte(tCell.Task, tCell.Byte); 
	if nFinishTimes >= tSub[2] then
		return
	end
	gf_SetTaskByte(tCell.Task, tCell.Byte, nFinishTimes + 1, TASK_ACCESS_CODE_VIP_CARD);
	Msg2Player(format("Ho祅 th祅h [%s] nhi謒 v? h籲g ng祔 %s %d/%d", GetVipCardName(nID), tSub[1], nFinishTimes + 1, tSub[2]))
end

--梁山通8关
function _vc_LS_Pass_8()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 1);
end

--地玄宫通7关
function _vc_DXG_Pass_7()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 2);
end

--万剑冢通4关
function _vc_WJZ_Pass_4()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 3);
end

--普通太一塔全通
function _vc_TYT_AllPass()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 4);
end

--天门阵取胜
function _vc_TMZ_Win()
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 3, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 1);
	end
end

--参与天门阵
function _vc_JoinOnceTMZ()
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 3, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 2);
	end
end

--参与雁门关大战场并领取奖励
function _vc_JoinBigbattle()
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 4, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 3);
	end
end

--参与任意小战场并领取奖励
function _vc_JoinSmallBattle()
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 4, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 4);
	end
end

--参加恩怨台并取得胜利
function _vc_JoinEytBattle_Win()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 2, 5);
end

--装备强化
function _vc_EnhanceOnce(bIsSucc, enhLevel)
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 5, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 1);
	end
end

--装备养成
function _vc_Equip_Evolution(bIsSucc)
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 5, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 2);
	end
end

--种植小般若树
function _vc_PlantSmallBanRuo()
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 2, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 3);
	end
end

--种植般若树
function _vc_PlantBigBanRuo()
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 2, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 4);
	end
end

--打开种子包
function _vc_OpenSeedBag()
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 2, 3);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 5);
	end
end