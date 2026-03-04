Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex, 30);
	local npcIndex,npcModel,npcName = GetTriggeringUnit();
		local nRand = random(1,100);
	if nRand <= 100 then
			Msg2SubWorld("恭喜:"..GetName().." 最后一击杀获得 [皓月碎片] X 500,[耀阳碎片] X 100,[洪荒碎片] X 50");   --世界BOSS最后一击奖励
			Msg2Player("你获得了 极品材料");
			AddItem(2,95,740,500)
			AddItem(2,95,741,100)
			AddItem(2,95,1506,50)
		end
	if npcName == "上古神兽白虎" then
		--local npcIndex = CreateNpc("北绿林令","北绿林令",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--生存时间：５分钟
		-- 得到当前的npc坐标
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0

		-- call出来10个随机散落的箱子
		for i = 1, 20 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("高手的包裹", "上古神兽白虎的包裹", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo1.lua")
		end		
	elseif npcName == "红印教主" then
		--local npcIndex = CreateNpc("逐影枪","逐影枪",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--生存时间：５分钟	
		-- 得到当前的npc坐标
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call出来10个随机散落的箱子
		for i = 1, 20 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("高手的包裹", "红印教主的包裹", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo1.lua")
		end		
	elseif npcName == "火神祝融" then
	
		--local npcIndex = CreateNpc("绝情石","绝情石",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--生存时间：５分钟	
		-- 得到当前的npc坐标
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call出来10个随机散落的箱子
		for i = 1, 20 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("高手的包裹", "火神祝融的包裹", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo1.lua")
		end	
	 end
end