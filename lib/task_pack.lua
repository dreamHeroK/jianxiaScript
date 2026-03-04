
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 任务系统测试包裹文件
-- Edited by peres
-- 2005/05/07 PM 19:55

-- 等待晚上，迎接白天
-- 白天打扫，晚上祈祷
-- 你太烦嚣，寻找烦恼
-- 天涯海角，心血来潮
-- 有人在吗，有谁来找
-- 我说你好，你说打扰
-- 不晚不早，千里迢迢

-- ======================================================

-- 读入任务引擎头文件
Import("\\script\\lib\\task_main.lua");

MAIN_TITLE = "<color=green>Di y l? nh鱪g s? ki謓 b筺  tr秈 qua. H穣 ch鋘 s? ki謓 b筺 mu鑞 xem!<color>"
MAIN_EXIT = "Tho竧/pack_exit"
MAIN_BACK = "Quay l筰/main"

function main()

local i=0;
local aryTotalEvent = CTask:EnumTotalEvent();
local aryLiveEvent = {}
local nEventID = 0;
local strShowText = "";

	for i=1, getn(aryTotalEvent) do
		nEventID = aryTotalEvent[i][1];
		if aryTotalEvent[i][2]==1 then
			strShowText = CTask:GetEventText(nEventID).."/#showlist("..nEventID..")";
			rawset(aryLiveEvent,
					getn(aryLiveEvent)+1,
					strShowText);
		end;
	end;
	
	tinsert(aryLiveEvent,1,MAIN_TITLE);
	tinsert(aryLiveEvent,getn(aryLiveEvent)+1,MAIN_EXIT);
	
	CTask:SayEx(aryLiveEvent);
	
end;


function showlist(eventID)

local strMain = "Trong s? ki謓"..CTask:GetEventText(eventID)..", b筺 c? nh鱪g tr秈 nghi謒 nh? sau: <enter><enter>";
local aryTask = CTask:EnumEventTask(eventID)
local strTaskText = "";
local strShowText = "";

local strNever = "  <color=red>TaskUndefined046<color>";
local strNow = "  <color=green>TaskUndefined047<color>";
local strEnd = "  <color=yellow>TaskUndefined048<color>";

local strConnect = "";

local i=0;

	for i=1, getn(aryTask) do
		strTaskText = CTask:GetTaskTipText(aryTask[i][1]);
		
		if aryTask[i][2]==0 then strConnect = strNever end;
		if aryTask[i][2]==1 then strConnect = strNow end;
		if aryTask[i][2]==2 then strConnect = strEnd end;
		
		strShowText = strShowText..strTaskText..strConnect.."<enter>";
		
	end;
	
	Say(strMain..strShowText,2,MAIN_BACK,MAIN_EXIT);
	
end;


function pack_exit()

end;