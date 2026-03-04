Include("\\script\\missions\\tong_activity\\head.lua")
Include("\\script\\missions\\tong_activity\\activity_function.lua")
Include("\\script\\missions\\tong_activity\\cfg\\pos_cfg.lua")
Include("\\script\\missions\\tong_activity\\stage\\tstage00.lua")
Include("\\script\\missions\\tong_activity\\stage\\tstage01.lua")
Include("\\script\\missions\\tong_activity\\stage\\tstage02.lua")


function firePhases:onTimeout()
	local fevent = function(tArg)
		FireEvent("event_mission_stage_finish", "tong_activity", 3)
	end;
	mf_OperateAllPlayer(this.missionID,fevent,{},0);

	Msg2MSAll(this.missionID, "HÕt giê, ho¹t ®éng kÕt thóc!");
	confirmClose();
end

function goto_next_stage()
	local tCurPhase = this.msPhases[1]:getCurPhase();
	if tCurPhase then
		tCurPhase:onTimeout();
	end		
end

--function clear_history_values()
--	local tCurPhase = this.msPhases[1]:getCurPhase();
--	if tCurPhase.nStageId == 0 then
--		SetTask(TASKID_TONG_GET_ACTIVITY_AWARD, 0);
--		SetTask(TASKID_TONG_ACTIVITY_SERIES_KIND, 0);
--	end
--end

function do_set_player_state()
	--clear_history_values();
	ResetToNpcDamage();
	CleanInteractive();
	UseDummy(0,1);	--Çå³ıÌæÉí·ûĞ§¹û
	InteractiveEnable(0);	--¹Ø±Õ½»»¥	±ØĞëÔÚNewWorldÖ®ºóÖ´ĞĞ²ÅÓĞĞ§
	SetDeathPunish(0)
	---LeaveTeam();	--Àë¿ª¶ÓÎé
	---SetCreateTeam(1);
	SetPKFlag(2,1)
	ForbidChangePK(1);	--½ûÖ¹¸Ä±äPK×´Ì¬
	UseScrollEnable(0)  --ÄÜ·ñÊ¹ÓÃ»Ø³Ç·û
	SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊĞÖØÉúµã
	ForbitTrade(1);	--½ûÖ¹½»Ò×
	StallEnable(0);	--½ûÖ¹°ÚÌ¯(ÏÂÏßºó»á±»Çåµô)
	--SetPlayerRestrictions(0,3);	--ÏŞÖÆÎïÆ·Ê¹ÓÃ
	RemvoeTempEffect();	--Çå³ıËùÓĞÁÙÊ±×´Ì¬£¬ÈçÁ÷Ë®£¬ÔÎ£¬»ìÂÒµÈ
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	local nKind = GetTask(TASKID_TONG_ACTIVITY_SERIES_KIND);
	if nKind == 0 then
		nKind = 1;
	end
	for k, v in tSkillIds do
		if k ~= nKind then
			RemoveSkill(v); --±ÜÃâ³öÏÖ¶à¸ö¼¼ÄÜ£¬Ö»±£ÁôÀúÊ·Ñ¡Ôñ¹ıµÄ¼¼ÄÜ
		end
	end	
	LimitSkill(tSkillIds[nKind]); --Ö»ÄÜÊ¹ÓÃ¸Ã¼¼ÄÜ
	SetTaskTemp(TEMP_TASKID_SEND_TONG_MSG_TIME, 0);
end

tbTongActivity.msOption.OnPlayerJoin = function(self, nCamp)
	do_set_player_state();
	--DesaltPlayer(1, 10);
end

tbTongActivity.msOption.OnPlayerLeave = function(self, nCamp)
	do_leave();
	--DesaltPlayer(0, 0);
end


this = tbTongActivity;
tbTongActivity.msPosition.entryPos = {
	tPos_PlayerEnter[1],
};
tbTongActivity.msPosition.exitPos = tPos_Entrance[1];

tbTongActivity.msOption.bSetPkFlag = 0; --Á·¹¦Ä£Ê½
tbTongActivity.msOption.bSetPkCamp = 0;
--tbTongActivity.msOption.bForbitTeam = 1;
--tbTongActivity.msOption.bLeaveTeam = 1;
tbTongActivity.msOption.bForbitSuperSkill = 1;
tbTongActivity.msOption.szInitDeahScript = thisFile;
firePhases.phases = {tStage00, tStage01, tStage02};
firePhases.maxsecond = tStage00.maxsecond + tStage01.maxsecond + tStage02.maxsecond + 5;
tbTongActivity.msPhases[1] = firePhases;
