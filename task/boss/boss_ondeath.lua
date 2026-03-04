Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex, 30);
	local npcIndex,npcModel,npcName = GetTriggeringUnit();
	if npcName == "北绿林盟主" then
		local npcIndex = CreateNpc("北绿林令","北绿林令",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--生存时间：５分钟
		-- 得到当前的npc坐标
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0

		-- call出来10个随机散落的箱子
		for i = 1, 50 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("高手的包裹", "北绿林盟主的包裹", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo.lua")
		end		
	elseif npcName == "枪神赢天" then
		local npcIndex = CreateNpc("逐影枪","逐影枪",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--生存时间：５分钟	
		-- 得到当前的npc坐标
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call出来10个随机散落的箱子
		for i = 1, 50 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("高手的包裹", "枪神赢天的包裹", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo.lua")
		end		
	elseif npcName == "冷香菱" then
	local nTeamSize = GetTeamSize()
	if nTeamSize >= 2 then
		local nOldPlayerIdx = PlayerIndex
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if GetTask(TRANSLIFE_MISSION_ID) == 35 and GetTask(TRANSLIFE_TASK_5_2) < 1 then 
				SetTask(TRANSLIFE_TASK_5_2,1)
			end
			if GetTask(TRANSLIFE_TASK_5_2) == 1 then
				TaskTip("Ho祅 th祅h y猽 c莡 c馻 Nh?Ho祅g T?祅 T?Thu薾 ti猽 di謙 h錸 ma L穘h Hng L╪g  ")
			end
		end
		PlayerIndex = nOldPlayerIdx
	else
		if GetTask(TRANSLIFE_MISSION_ID) == 35 and GetTask(TRANSLIFE_TASK_5_2) < 1 then 
				SetTask(TRANSLIFE_TASK_5_2,1)
		end
		if GetTask(TRANSLIFE_TASK_5_2) == 1 then
				TaskTip("Ho祅 th祅h y猽 c莡 c馻 Nh?Ho祅g T?祅 T?Thu薾 ti猽 di謙 h錸 ma L穘h Hng L╪g  ")
		end
	end
		
		local npcIndex = CreateNpc("绝情石","绝情石",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--生存时间：５分钟	
		-- 得到当前的npc坐标
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call出来10个随机散落的箱子
		for i = 1, 50 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("高手的包裹", "冷香菱的包裹", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo.lua")
		end			
	else
		Talk(1,"","B筺 nh譶 xung quanh v蒼 kh玭g ph竧 hi謓 g?");
	end;
end