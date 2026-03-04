Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua");
Import("\\script\\lib\\define.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")

tbMission = {
	name = "C琺 T蕋 Ni猲",
	missionID = 91, --唯一ID,查看配置表
	realMapID = 8911,
	dynamicMap = 1, -- 动态地图
	

--	timerTriggerID = 101,
--	costomerID = 101,
--以下为missionV变量
	mv1 = 1,  
	mv2 = 2,
	mv3 = 3,
	mv4 = 4,
	mv5 = 5,
	mv6 = 6,
--以下为missionS变量	
	
}
tbMission = gf_CopyInherit(missionHead, tbMission);
tbMission = gf_CopyInherit(missionBase, tbMission);

tFireWorkNpc = {
	{1630,3203},	
	{1643,3205},	
	{1653,3204},	
	{1671,3186},	
	{1681,3194},	
	{1686,3216},	
	{1686,3231},
}
	

	
-- entryPos = {
-- 	{1543,3297},
-- 	{1625,3300},
-- 	{1542,3458},
-- 	{1625,3470},
-- },
-- tExitPos = 
-- {
-- 	[100] = {100, 1379, 2858},
-- 	[200] = {200, 1151, 2850},
-- 	[300] = {300, 1975, 3552},
-- },