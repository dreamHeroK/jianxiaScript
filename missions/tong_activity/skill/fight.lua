--Import("\\script\\lib\\define.lua")
--Include("\\script\\lib\\floyd.lua")
--Import("\\script\\lib\\npccmdhead.lua")
--Import("\\script\\lib\\globalfunctions.lua")
--Include("\\script\\misc\\data_state\\state.lua")
Include("\\script\\missions\\tong_activity\\head.lua")

function OnSkill(nNpcIndex, nSkillID, nSkillLV)	
	SendScript2VM(thisFile, "change_boss_blood()");
end
