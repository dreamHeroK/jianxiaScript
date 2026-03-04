--filename:旗子.lua
--create date:2021-04-11
--author:
--describe:旗帜脚本
Include("\\script\\online\\capture_flag\\head.lua")

function main()
	SetDeathPunish(0)	--确保无死亡惩罚
	if GetLevel() < 70 then	--小于7０级不能参加
		Talk(1,"","只有<color=red>70<color>级以上的玩家才可抢夺镖旗，少侠还需努力哦！")
		return 0
	end
	if GetPlayerRoute() == 0 then	--没加入门派者不能参加
		Talk(1,"","只有加入门派的侠士才可抢夺镖旗。")
		return 0
	end
	if GetTask(TASK_FLAG_HANDUP) ~= GetCurDate() then
		SetTask(TASK_FLAG_HANDUP,0)	--新的一天，已夺旗标记清0
	end
	if GetTask(TASK_FLAG_HANDUP) ~= 0 then
		Talk(1,"","大侠今日已经上缴过镖旗，不能再次抢夺，明天再来吧！")
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		Talk(1,"","您已经抢到了镖旗，先去找夺镖教头上缴镖旗吧！")
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 0 then
		SetDeathScript("\\script\\online\\capture_flag\\playerdeath.lua")
		npcIndex = GetTriggeringUnit()
		SetNpcLifeTime(npcIndex,0)
		SummonNpc("镖旗战斗","镖旗")
		AddTitle(3,3)
		SetCurTitle(3,3)
		Msg2Player("你已经抢到了镖旗，快去找夺镖教头上缴吧！")
		mapID,mapX,mapY = GetWorldPos()
		SetTaskTemp(MAP_ID,mapID)	--记录得到旗子时玩家的座标
		SetTaskTemp(MAP_X,mapX)
		SetTaskTemp(MAP_Y,mapY)
		SetTaskTemp(TASK_FLAG_FOLLOW,1)
		local t = CreateTrigger(1, 200, 4200)
		ContinueTimer(t)
	end
end
