--filename:playerdeath.lua
--create date:2021-04-11
--author:
--describe:玩家死亡脚本
Include("\\script\\online\\capture_flag\\head.lua")

function OnDeath(Launcher)
	SetDeathPunish(1)	--确保有死亡惩罚（死了之后肯定回城，即肯定触发离开地图的脚本）
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		KillFollower()
		SetTaskTemp(TASK_FLAG_FOLLOW,0)
		RemoveTitle(3,3)
		RemoveTrigger(GetTrigger(4200))
		local npcFlag = CreateNpc("镖旗对话","镖旗",GetWorldPos())
		SetNpcScript(npcFlag,"\\script\\online\\capture_flag\\旗子.lua")
		SetDeathScript("")	
	end
end

