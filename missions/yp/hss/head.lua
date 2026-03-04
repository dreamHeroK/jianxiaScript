Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")

thisFile = "\\script\\missions\\yp\\hss\\mission.lua";

tbTBHSS = { 
	name = "女真黄龙府",
--	timerID = 79,
	missionID = 80,
	realMapID = 5076,
	dynamicMap = 0,
	
	timerTriggerID = 1542,
	costomerID = 1542*2,
	tMapTrigger = {3014,3015,3016,3017},
	--以下为missionV变量
	mv1 = 1, --1-10藏宝图点的位置
	mv2 = 2,
	mv3 = 3,
	mv4 = 4,
	mv5 = 5,
	mv6 = 6,
	mv7 = 7,
	mv8 = 8,
	mv9 = 9,
	mv10 = 10,
	mv11 = 11, --保护势力开关
	mv12 = 12,   --烤火时间段
	mv13 = 13,   --烤火时间日期
}
tbTBHSS = gf_CopyInherit(missionHead, tbTBHSS)

firePhases = {
	timerID = 114,
	frequency = 18*2,
	maxsecond = 14*24*3600, --7天？
};
firePhases = gf_CopyInherit(phaseBase,firePhases)