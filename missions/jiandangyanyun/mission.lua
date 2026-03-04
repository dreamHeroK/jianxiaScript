Include("\\script\\missions\\jiandangyanyun\\jdyyfunctions.lua");
Include("\\settings\\static_script\\missions\\base\\callfuture.lua");
Include("\\script\\lib\\npccmdhead.lua");
Include("\\script\\lib\\floyd.lua");
Include("\\script\\missions\\jiandangyanyun\\stage\\tstage01.lua");
Include("\\script\\missions\\jiandangyanyun\\stage\\tstage02.lua");
Include("\\script\\missions\\jiandangyanyun\\stage\\tstage03.lua");
Include("\\script\\missions\\jiandangyanyun\\stage\\tstage04.lua");
Include("\\script\\missions\\jiandangyanyun\\stage\\tstage05.lua");
Include("\\script\\missions\\jiandangyanyun\\stage\\tstage06.lua");

msSettings:LoadConfig();

tPhaseDriver.name = "PhaseDriver";
tPhaseDriver.phases = {tStage01, tStage02, tStage03, tStage04, tStage05, tStage06};

this.msOption.szInitDeahScript = thisFile;

this.msOption.bSetPkFlag = 0; --¡∑π¶ƒ£ Ω
this.msOption.bSetPkCamp = 0;
this.msPosition.entryPos = {1562, 3264};
-- if GetRelayGroup() == "112-6" then
-- 	this.msPosition.exitPos = {425,1754,3200};
-- else
this.msPosition.exitPos = {300,1798,3556};
-- end

this.msPhases[1] = inherit(this.msPhases[1], tPhaseDriver);

function JDYY_SetPKFlag(nPkFlag, nPkCamp)
	tJDYY.msOption.bSetPkFlag = nPkFlag;
	tJDYY.msOption.bSetPkCamp = nPkCamp;
end

this.msOption.OnPlayerLeave = function(self, nCamp)
	JDYY_ClearAllGodState();
	RemoveRevivals();
end

g_tmission_name=
{
	[1]	= "Ω£µ¥—Ã‘∆(∆’Õ®)",
	[2]	= "Ω£µ¥—Ã‘∆(”¢–€)",
}

function this:mission_name()
	return g_tmission_name[GetMissionV(this.mv_02)]
end


function this:mission_stage()
	return GetMissionS(this.MS_STAGE)
end

