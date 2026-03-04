--date:2007-3-6
--author:yanjun
--describe:this script will be executed while player kill a npc monster!
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");

BOX_LIFE_TIME = 2*60*60;	--箱子生存时间2小时

function OnDeath(npcIndex)
	if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_STARTED then
		return 0;
	end;
	SetNpcLifeTime(npcIndex,0);
	SetNpcScript(npcIndex,"");
	local sNpcName = GetNpcName(npcIndex);
	if sNpcName == tNpcInfo[NPC_TYPE_XIANGZHU][2] then
		process_boss_xiangzhu_death(npcIndex);
	elseif sNpcName == tNpcInfo[NPC_TYPE_FUTANGZHU][2] then
		process_boss_futangzhu_death(npcIndex);
	elseif sNpcName == tNpcInfo[NPC_TYPE_LIDAZUI][2] then
		process_boss_lidazui_death(npcIndex);
	elseif sNpcName == tNpcInfo[NPC_TYPE_KILLER][2] then
		process_killer_death(npcIndex);
	else
		WriteLog("[杀手堂错误]: 包含死亡NPC名称的原始文件不正确，错误的名称是："..tostring(sNpcName));
	end;
end;

function process_boss_xiangzhu_death(nNpcIdx)
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	local nBoxNpcIdx = CreateNpc("箱子钱","香主遗留的宝箱",nMapID,nMapX,nMapY);
	SetNpcScript(nBoxNpcIdx,"\\script\\task\\killer_hall\\box_npc.lua");
	SetNpcLifeTime(nBoxNpcIdx,BOX_LIFE_TIME);	
	local nKillerIdx = 0;
	local sKillerModel,sKillerName,nLifeTime = tNpcInfo[NPC_TYPE_KILLER][1],tNpcInfo[NPC_TYPE_KILLER][2],tNpcInfo[NPC_TYPE_KILLER][3];
	for i=1,XIANGZHU_KILLER_COUNT do
		nKillerIdx = CreateNpc(sKillerModel,sKillerName,nMapID,nMapX,nMapY,-1,1,1,XIANGZHU_KILLER_COUNT*10)
		SetNpcDeathScript(nKillerIdx,"\\script\\task\\killer_hall\\npc_death.lua")
		SetNpcLifeTime(nKillerIdx,nLifeTime);
	end
end;

function process_boss_futangzhu_death(nNpcIdx)
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx)
	local nBoxNpcIdx = CreateNpc("箱子钱","副堂主遗留的宝箱",nMapID,nMapX,nMapY);
	SetNpcScript(nBoxNpcIdx,"\\script\\task\\killer_hall\\box_npc.lua");
	SetNpcLifeTime(nBoxNpcIdx,BOX_LIFE_TIME);
	local nKillerIdx = 0;
	local sKillerModel,sKillerName,nLifeTime = tNpcInfo[NPC_TYPE_KILLER][1],tNpcInfo[NPC_TYPE_KILLER][2],tNpcInfo[NPC_TYPE_KILLER][3];
	for i=1,FUTANGZHU_KILLER_COUNT do
		nKillerIdx = CreateNpc(sKillerModel,sKillerName,nMapID,nMapX,nMapY,-1,1,1,FUTANGZHU_KILLER_COUNT*10)
		SetNpcDeathScript(nKillerIdx,"\\script\\task\\killer_hall\\npc_death.lua")
		SetNpcLifeTime(nKillerIdx,nLifeTime);
	end
end;

function process_boss_lidazui_death(nNpcIdx)
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx)
	local nBoxNpcIdx = CreateNpc("箱子钱","李大嘴遗留的宝箱",nMapID,nMapX,nMapY);
	SetNpcScript(nBoxNpcIdx,"\\script\\task\\killer_hall\\box_npc.lua");
	SetNpcLifeTime(nBoxNpcIdx,BOX_LIFE_TIME);
	local nKillerIdx = 0;
	local sKillerModel,sKillerName,nLifeTime = tNpcInfo[NPC_TYPE_KILLER][1],tNpcInfo[NPC_TYPE_KILLER][2],tNpcInfo[NPC_TYPE_KILLER][3];
	for i=1,LIDAZUI_KILLER_COUNT do
		nKillerIdx = CreateNpc(sKillerModel,sKillerName,nMapID,nMapX,nMapY,-1,1,1,LIDAZUI_KILLER_COUNT*10)
		SetNpcDeathScript(nKillerIdx,"\\script\\task\\killer_hall\\npc_death.lua")
		SetNpcLifeTime(nKillerIdx,nLifeTime);
	end
end;

function process_killer_death(nNpcIdx)
	local nRand = random(1,100);
	ModifyExp(10000);
--	if nRand <= 3 then	--%5
--		KH_Add_Random_Mystic_Thing(1);	--神秘物品
--	end;
--	nRand = random(1,100);
--	if nRand <= 5 then	--%10
--		nRand = random(1,100);
--		if nRand <= 30 then
--			if AddItem(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4],1) == 1 then--秘籍碎片
--				Msg2Player("您获得了1个"..tItemInfo[2][1]);
--				WriteLog("[杀手堂]:"..GetName().."获得"..tItemInfo[2][1]);
--			end;
--		end
--	end;
end;