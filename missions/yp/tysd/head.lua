Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")

thisFile = "\\script\\missions\\yp\\tysd\\mission.lua";

tbTYSD = { 
	name = "天阴圣地",
	missionID = 82,
	realMapID = 6400,
	dynamicMap = 0,
	
	--以下为missionV变量
}
tbTYSD = gf_CopyInherit(missionHead, tbTYSD)

firePhases = {
	timerID = 116,
	frequency = 18*2,
	maxsecond = 14*24*3600, --7天？
};
firePhases = gf_CopyInherit(phaseBase,firePhases)