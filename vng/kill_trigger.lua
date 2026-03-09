Include("\\script\\vng\\cs6\\cs6_mission_kill.lua")

function Vng_Kill_Trigger()
	-- 浠诲姟 杞?鐢?6
	if GetTask(TSK_CS6_TULINH) == 4 then
		CS6_Mission_Kill()
	end
	-- 任务 转生7
--	if gf_GetTaskByte(TSK_PHUCSINH2,1) == 1 then
--		CS7_Mission_Kill()
--	end
end