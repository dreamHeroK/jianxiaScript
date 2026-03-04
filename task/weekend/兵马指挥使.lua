--兵马指挥使
--created by lizhi
--2005-9-10 11:38

Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\weekend\\task_main.lua");
Include("\\script\\task\\weekend\\task_head.lua");

function main()
	local szTalk = {
		"<color=green>兵马指挥使<color>：倭寇突然大举进军我中原土地，我中原铮铮儿女，孰人可忍！"
	};
	local szSay = {
		"<color=green>兵马指挥使<color>：倭寇突然大举进军我中原土地，我中原铮铮儿女，孰人可忍！",
		"领取大宋密宝/GetCallBossItem"
	};
	if CheckTime(6) == 0 and CheckTime(0) == 0 then	--只有星期六，星期天才能完成运送货物的任务
		TalkEx("", szTalk);
		return
	end;

	if GetTask(TASK_GQ_DELIVER) ~= 0 then
		receive_goods();
		return
	end;
	
	if GetTask(TASK_GQ_KILLWK_START) == 1 then
		local szSay = {
			"<color=green>兵马指挥使<color>：感谢<sex>帮大宋运送物资！但是当前，倭寇不知不觉地向东海海滨派遣了部队，<sex>能帮我打败他们吗?",
			"上阵杀敌/kill_enemy",
			"暂时有事晚些再来/end_say"
		};
		SelectSay(szSay);
		return
	end;
	if QueryTimes() > 0 and (CheckTime(6) == 1 or CheckTime(5) == 1 or CheckTime(0) == 1)then
		SelectSay(szSay);
	else
		TalkEx("", szTalk);
	end;
end;
