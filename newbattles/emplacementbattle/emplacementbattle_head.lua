Include("\\script\\newbattles\\emplacementbattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\emplacementbattle\\position.lua");

BATTLE_TYPE = EMPLACEMENT_ID;	--战场类型

ENTRANCE_POINT = 	--进入点
{
	[SONG_ID] = {MAPID_SONG,1617,3360},
	[LIAO_ID] = {MAPID_LIAO,1839,3365},
};

EMPLACEMENT_POS = {1725,2904};	--炮台坐标

tKillPlayerBonus = --杀死不同军衔玩家所对应的事件ID
{
	[1] = BP_EMPLACEMENT_KILL_SOLDIER,	--杀死士兵
	[2] = BP_EMPLACEMENT_KILL_LOOEY,	--杀死校尉
	[3] = BP_EMPLACEMENT_KILL_CAPTAIN,	--杀死都统
	[4] = BP_EMPLACEMENT_KILL_PIONEER,	--杀死先锋
	[5] = BP_EMPLACEMENT_KILL_GENERAL,	--杀死大将
	[6] = BP_EMPLACEMENT_KILL_MARSHAL,	--杀死元帅
};	

EMPLACEMENT_HURT_RANGE = 40;	--炮台炸膛伤害范围
EMPLACEMENT_HURT_PROBABILITY = 5;	--炮台炸膛概率，５％

DEATH_SCRIPT = "\\script\\newbattles\\emplacementbattle\\playerdeath.lua";

--根据NPC的名字来创建NPC
function Create_Npc(sNpcName,nNum)
	if nNum <= 0 then
		return 0;
	end;
	local tPos = {};
	local npcIndex = 0;
	local sModelName = "";
	if sNpcName == "土民" then
		tPos = tNative_Pos;
		sModelName = "土民";
	elseif sNpcName == "炮台守卫" then
		tPos = tGuard_Pos;
		sModelName = "炮台守卫";
	end;
	local nNpcCount = getn(tPos);
	local nPosIndex = 0;
	for i=1,nNum do
		nPosIndex = mod(i,nNpcCount+1);
		npcIndex = CreateNpc(sModelName,sNpcName,MAPID,tPos[nPosIndex][1],tPos[nPosIndex][2]);
		SetNpcDeathScript(npcIndex,"\\script\\newbattles\\emplacementbattle\\npc_death.lua");
	end;	
end;
--创建炮台
function Create_Emplacement(nCamp)
	local tbNpcName = 
				{
				[0] = "炮台",
				[1] = "炮台(宋)",
				[2] = "炮台(辽)"
				};
	local npcIndex = CreateNpc("废弃的火炮",tbNpcName[nCamp],MAPID,EMPLACEMENT_POS[1],EMPLACEMENT_POS[2]);
	SetCampToNpc(npcIndex,tCampNameP[nCamp]);	
	SetNpcDeathScript(npcIndex,"\\script\\newbattles\\emplacementbattle\\emplacement_death.lua");	
end;

function Create_Box()
	for i=1,getn(tBoxPos) do 
		local nNpcIndex = CreateNpc("战场宝箱","宝箱",MAPID,tBoxPos[i][1],tBoxPos[i][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\emplacementbattle\\box_death.lua");
	end;
end;
--在随机位置创建N个宝箱
function Create_Random_Pos_Box(nNum)
	for i=1,nNum do
		local nRanPos = random(1,getn(tBoxPos));
		local nNpcIndex = CreateNpc("战场宝箱","宝箱",MAPID,tBoxPos[nRanPos][1],tBoxPos[nRanPos][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\emplacementbattle\\box_death.lua");
	end;
	SetMissionV(MV_KILL_BOX_COUNT,0);
end;
function nothing()

end;