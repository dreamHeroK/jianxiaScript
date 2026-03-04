-- =============================================================
-- FileName : huiming.lua
-- Desc     : 慧明的脚本，峨嵋掉箱子
-- Date     : Dec 20 2006
-- Creator  : Tony(Jizheng)
-- =============================================================

function OnDeath(nNpcIndex)

	-- 得到当前的npc坐标
	local nMapID, nWx, nWy = GetWorldPos()
	local nAddX = 0
	local nAddY = 0
	local nTargetNpc = 0
	
	-- call出来10个随机散落的箱子
	for i = 1, 10 do
		nAddX = random(-15, 15)
		nAddY = random(-15, 15)
		
		nTargetNpc = CreateNpc("高手的包裹", "慧明的包裹", nMapID, nWx + nAddX, nWy + nAddY)
		SetNpcLifeTime(nTargetNpc, 300)
		AddUnitStates(nTargetNpc, 6, 3)
		SetNpcScript(nTargetNpc, "\\script\\task\\faction_boss\\boss_baoguo.lua")
	end
	
	-- 消失自己
	SetNpcLifeTime(nNpcIndex, 0)
	SetNpcScript(nNpcIndex, "")
end;