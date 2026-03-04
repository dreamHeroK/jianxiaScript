--杀倭寇地图的trap和倭寇地图NPC所用脚本，用于初始化之类的一系列工作

Include("\\script\\task\\weekend\\task_head.lua");

function main()
	Say("<color=green>前线将领<color>：大侠可以跟其他侠客一起组队消灭倭寇",3,"消灭"..MAXNUM_KILLWK.."名倭寇/start_wk", "我要离开此地(杀敌数不会清0)/leave_map", "没事了/end_say")
	--Talk(1,"start_wk", "<color=green>前线将领<color>：请尽可能快的在半个小时的时间内消灭50名倭寇吧！");
end;

function leave_map()
	Say("<color=green>前线将领<color>：大侠确定要离开此地吗？",2, "是的，我要离开/do_leave_map", "不是，我还要继续消灭倭寇/end_say")
	--Talk(1,"start_wk", "<color=green>前线将领<color>：请尽可能快的在半个小时的时间内消灭50名倭寇吧！");
end;

function do_leave_map()
	NewWorld(GetTask(TASK_POSITION), GetTask(TASK_POSITION + 1), GetTask(TASK_POSITION + 2))
end

function start_wk()
--	if GetTask(TASK_GQ_KILLWK_START) ~= 1 then
--		return
--	end;

	if GetTask(TASK_GQ_KILLWK_START) == 2 then
		Talk(1,"", "<color=green>前线将领<color>：大侠还等什么，杀吧！");
		return
	end
	SetPKFlag(0,0)--关闭PK开关
	ForbidChangePK(1);  --禁止pk
	SetFightState(1);
	SetLogoutRV(1);

	--计算是杀什么档次的倭寇
	local szKey = "wk_";
	local nLevel = GetLevel();
	if nLevel > 0 and nLevel <= 27 then
		szKey = szKey..20;
	elseif nLevel > 27 and nLevel <= 37 then
		szKey = szKey..30;
	elseif nLevel > 37 and nLevel <= 47 then
		szKey = szKey..(40 + GetTask(TASK_WHICH_MAP));
	elseif nLevel > 47 and nLevel <= 57 then
		szKey = szKey..(50 + GetTask(TASK_WHICH_MAP));
	elseif nLevel > 57 and nLevel <= 99 then
		szKey = szKey..(60 + GetTask(TASK_WHICH_MAP));
	end;
	--初始化杀怪计数
	CreateTrigger(0, kill_trigger_table[szKey][1], kill_trigger_table[szKey][2]);
	--计时
	CreateTrigger(1, time_trigger_table["wk"][1], time_trigger_table["wk"][2]);
	ContinueTimer(GetTrigger(time_trigger_table["wk"][2]));
	--rect
	CreateTrigger(2, rect_wk_table[szKey][1], rect_wk_table[szKey][2]);
	--log
	CreateTrigger(3, log_wk_table[1], log_wk_table[2]);
	SetLogType(GetTrigger(log_wk_table[2]), 1);
	SetTask(TASK_GQ_KILLWK_FLAG, 0);
	--初始化计数
	if GetTask(TASK_GQ_KILLWK_START) == 3 then 
		Msg2Player("大侠继续杀敌吧");
		SetTask(TASK_GQ_KILLWK_START, 2);	--已经设置过状态
	else
		SetTask(TASK_GQ_KILLWK, 0);
		Msg2Player("大侠开始杀敌吧");	
		SetTask(TASK_GQ_KILLWK_START, 2);	--已经设置过状态
	end
end;

function end_say()

end;