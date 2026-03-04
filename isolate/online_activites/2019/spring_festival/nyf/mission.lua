Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\nyf\\head.lua")
Include("\\script\\lib\\floyd.lua")
Import("\\script\\lib\\npccmdhead.lua")
Include("\\settings\\static_script\\misc\\missionaward_head.lua");

thisFile = "\\script\\isolate\\online_activites\\2019\\spring_festival\\nyf\\mission.lua";

g_tmission_name = "C¬m TÊt Niªn"

stage0 = {
	name = "Giai ®o¹n chuÈn bÞ",
	maxsecond = 10 * 60,
	actionsType = "second",
	guage = {
		msg = "Giai ®o¹n chuÈn bÞ",
		time = 10 * 60,
		cyc = 0,
		id = 2,
	},
};

stage1 = {
	name = "Më TiÖc",
	maxsecond = 15 * 60, 
	actionsType = "second",
	guage = {
		msg = "Më TiÖc",
		time = 15 * 60,
		cyc = 0,
		id = 2,
	},
};

stage2 = {
	name = "KÕt Thóc Tèt §Ñp",
	maxsecond = 5, --1·ÖÖÓ
	actionsType = "second",
};

stage0 = inherit(cycPhase, stage0);
stage1 = inherit(cycPhase, stage1);
stage2 = inherit(cycPhase, stage2);

----------------------------------------------------------------------

function stage0.Init()
	local mapId = this.msPosition:getMapID();
	local npcIdx = CreateNpc("T« Thøc","Qu¶n gia Bang héi",mapId, 1667, 3221)
	SetNpcScript(npcIdx,"\\script\\isolate\\online_activites\\2019\\spring_festival\\nyf\\exitnpc.lua")
	
end

function finish()
	local tCurPhase = this.msPhases[1]:getCurPhase();
	tCurPhase:onFinish();
end

function stage0.onTimeout()
	finish()
end

function create_some_npc()
	local mapId = this.msPosition:getMapID();
	for i = 1, getn(tFireWorkNpc) do 
		local tPos = tFireWorkNpc[i]
		local npcIdx = CreateNpc("N¬i §Æt Ph¸o Hoa","N¬i §Æt Ph¸o Hoa",mapId, tPos[1], tPos[2])
		SetNpcLifeTime(npcIdx, 15 * 60)
		-- npc²»ÄÜ±»´òËÀ
		CastState2Npc(npcIdx, "state_specified_skill_effect",	6,  18*3600*48, 0, 2125); 
		CastState2Npc(npcIdx, "state_ignore_poison_damage",	    100,18*3600*48, 0, 2126);
	end
	local npcIdx = CreateNpc("YÕn tiÖc","YÕn tiÖc",mapId, 1671,3203)
	SetNpcScript(npcIdx,"\\script\\isolate\\online_activites\\2019\\spring_festival\\nyf\\desknpc.lua")
end

function stage1.Init()
	create_some_npc()
end
function stage1:onTimeout()
	finish()
end

function closeMission()
	CloseMission(tbMission.missionID);
	SendScript2VM("\\script\\isolate\\online_activites\\2019\\spring_festival\\god_fu.lua", "NYF2019_Close()");
end

function player_time_award()
	local nExp = 10000000
	local nPopur = 300
	Msg2Player(format("NhËn %d kinh nghiÖm, %d tu luyÖn", nExp, nPopur))
	ModifyExp(nExp);
	ModifyPopur(nPopur);
end

function time_award()
	this.msCamp:turnPlayer(0, player_time_award);
end

this = tbMission;


stage0.actions = {
	[1] = stage0.Init,
	-- [20] = stage0.finish,
}

stage0.cycActions = {
	-- [30] = {
	-- 	[0] = time_award,
	-- 	start = 1,
	-- },
};


stage1.actions = {
	[1] = stage1.Init,
};

stage1.cycActions = {
	[30] = {
		[0] = time_award,
		start = 1,
	},
};


stage2.actions = {
	[15] = closeMission, --Í¨¹Ø³É¹¦,ËÍ³ö¹Ø¿¨
};

tbMission.msOption.bSetPkFlag = 0; --Á·¹¦Ä£Ê½
tbMission.msOption.bSetPkCamp = 0;
tbMission.msOption.szInitDeahScript = thisFile;
tbMission.msPosition.entryPos = {
	{1646,3234},
}
tbMission.msPosition.exitPos = {200,1378,2896};

PhaseDriver = {
	timerID = 125, --¼ÆÊ±Æ÷ Î¨Ò»ID,²é¿´ÅäÖÃ±í CH
	maxsecond = 25 * 60 + 10,
	guage = {
		msg = "C¬m §Çu N¨m",
		time = 25 * 60 + 10,
		cyc = 0,
		id = 1,
	},
	phases= {
		stage0,
		stage1,
		-- stage2,
	},
};
PhaseDriver = gf_CopyInherit(phaseBase,PhaseDriver)

function PhaseDriver:onTimeout()
	closeMission()
end


tbMission.msPhases = {
	PhaseDriver,
}
