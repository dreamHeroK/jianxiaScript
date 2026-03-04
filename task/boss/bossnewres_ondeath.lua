Include("\\script\\lib\\globalfunctions.lua");

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex,0)
	SetNpcScript(npcIndex,"");
	local szLogTitle = "TNC Boss The Gioi"
	gf_EventGiveCustomAward(1, 5000000, 0, szLogTitle)
	local _npcIndex,npcModel,npcName = GetTriggeringUnit()
	
	if npcName == "北绿林盟主" then
		local npcIndex = CreateNpc("北绿林令","北绿林令",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);
	elseif npcName == "枪神赢天" then
		local npcIndex = CreateNpc("逐影枪","逐影枪",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60)
	elseif npcName == "冷香菱" then
		local npcIndex = CreateNpc("绝情石","绝情石",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60)
	end
	
	local nRand = random(1, 10000)
	if nRand <= 9693 then
		gf_AddItemEx2({2, 2, 7, 1}, "陨铁碎片", szLogTitle, "获得")
	elseif nRand <= 9993 then
		gf_AddItemEx2({2, 1, 30071, 1}, "人参", szLogTitle, "获得")
	else
		gf_AddItemEx2({2, 1, 30130, 1}, "非烟石", szLogTitle, "获得")
	end
end