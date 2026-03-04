--create date:07-04-16
--author:yanjun
--describe:攻城先锋令物品脚本
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnUse(nItemIdx)
	if GCZ_InBattle() == 0 then
		Talk(1,"","只有在攻城区才能使用攻城先锋令.");
		return 0;
	end;
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_READY then
		Talk(1,"","仅在攻门阶段,才能使用攻城先锋令");
		return 0;
	end;
	if nState > MS_STATE_GONGMEN then
		Talk(1,"","城门已经完全崩溃了,无法继续使用 ");
		return 0;
	end;
	local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
	if nDoorIdx ~= 0 then
		Talk(1,"","你已经是卫兵了 "..tDoorName[nDoorIdx].."!");
		return 0;
	end;
	local selTab = {
				format("激战"..tDoorName[1].."守卫/#use(%d,%d)",nItemIdx,1),
				format("激战"..tDoorName[2].."守卫/#use(%d,%d)",nItemIdx,2),
				format("激战"..tDoorName[3].."守卫/#use(%d,%d)",nItemIdx,3),
				"取消/nothing",
				}
	local nEnemyCamp = GONGSHOU_ID - GCZ_GetPlayerCamp();
	local szGEGuardName,szGSGuardName,szGWGuardName = GCZ_GetGuardName(GONG_ID,0);
	local szSEGuardName,szSSGuardName,szSWGuardName = GCZ_GetGuardName(SHOU_ID,0);
	Say("             "..gf_FormatStringLength("侧攻",20)..gf_FormatStringLength("边手",20).."<enter>"..gf_FormatStringLength(tDoorName[1],12,0)..":"..gf_FormatStringLength(szGEGuardName,20)..gf_FormatStringLength(szSEGuardName,20).."<enter>"..gf_FormatStringLength(tDoorName[2],12,0)..":"..gf_FormatStringLength(szGSGuardName,20)..gf_FormatStringLength(szSSGuardName,20).."<enter>"..gf_FormatStringLength(tDoorName[3],12,0)..":"..gf_FormatStringLength(szGWGuardName,20)..gf_FormatStringLength(szSWGuardName,20).."\n\n以上是守城的情况,你们想挑战守卫成什么门?",getn(selTab),selTab);
end;

function use(nItemIdx,nDoorIdx)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_READY then
		Talk(1,"","攻门前期,才可用先封令攻城.");
		return 0;
	end;
	if nState > MS_STATE_GONGMEN then
		Talk(1,"","城门已经完全崩溃了,不能用了.");
		return 0;
	end;
	if GetMissionV(MV_DESTROY_EAST_DOOR+nDoorIdx-1) == 1  then
		Talk(1,"","这座城已经倒塌了");
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GONGSHOU_ID - nPlayerCamp;
	local szFriendName = GCZ_GetGuardName(nPlayerCamp,nDoorIdx);	--本方守卫名字
	local szEnemyName = GCZ_GetGuardName(nEnemyCamp,nDoorIdx);		--敌方守卫名字
	if szFriendName ~= "没有" and szEnemyName ~= "没有" then	--双方都派人了
		Talk(1,"","现在,这个城卫正在与人单打独斗,所以不能挑战这个科目的守门员。");
		return 0;
	end;	 
	if szFriendName ~= "没有" and szEnemyName == "没有" then	--目前城门被我方占领
		Talk(1,"","我们派了守门人来这城门,不能进行任何挑战.");
		return 0;
	end;
	local nOldPlayerIdx = PlayerIndex;
	local nEnemyIdx = GCZ_GetGuardPlayerIndex(nEnemyCamp,nDoorIdx);
	if nEnemyIdx > 0 then
		PlayerIndex = nEnemyIdx;
		if GetTaskTemp(TEMP_LOCK) ~= 0 then	--目标守卫被锁定
			Talk2SomeOne(nOldPlayerIdx,1,"","我们这边已经有人向卫兵发出挑战攻打这座城门了");
			PlayerIndex = nOldPlayerIdx;
			return 0;
		end;
		PlayerIndex = nOldPlayerIdx;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		if szFriendName == "没有" and szEnemyName == "没有" then	--目前城门没人占领
			Talk(1,"","现在这个城还没有卫兵,你直接成为这个城的卫兵!");
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nPlayerCamp-1,PlayerIndex);
			if nPlayerCamp == SHOU_ID then
				SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,SHOU_ID);
			else
				SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,ALL_ID);
			end;
			SetTaskTemp(TEMP_GURAD_ID,nDoorIdx);
			Msg2MSAll(MISSION_ID,tDoorName[nDoorIdx].."无人镇守,被"..GetName().."("..tCampNameZ[nPlayerCamp]..")轻易占据.");
			return 0;
		end
		if szFriendName == "没有" and szEnemyName ~= "没有" then	--目前城门被敌方占领
			PlayerIndex = nEnemyIdx;
			SetTaskTemp(TEMP_LOCK,1);	--锁定守卫
			Accept1v1(nOldPlayerIdx, GetName(nOldPlayerIdx).."向你挑战,倒计时 %d 秒﹜", 15, "\\script\\gongcheng\\item\\gongchengling_item.lua")
			PlayerIndex = nOldPlayerIdx; 
			Msg2Player("请允许单打独斗发送。请等待回复...");
		end;
	end;
end;

function OnAccept(nProposerIdx, nType)
	local nGuardIdx = PlayerIndex;
	SetTaskTemp(TEMP_LOCK,0);	--守卫解锁
	if nProposerIdx <= 0 then
		Talk(1,"","敌人已经离开战场");
		Msg2Player("敌人已经离开战场");
		return 0;
	end;
	local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
	if nType == 0 then	--选择取消或操作超时
		PlayerIndex = nProposerIdx;
		local nPlayerCamp = GCZ_GetPlayerCamp();
		SetTaskTemp(TEMP_GURAD_ID,nDoorIdx);
		Talk(1,"","这个门卫逃跑了,你成了新手。请试着守住这座城!");
		Msg2Player("这个门卫逃跑了,你成了新手。请试着守住这座城!");
		SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nPlayerCamp-1,PlayerIndex);
		local nEnemyCamp = GCZ_GetEnemyCamp();
		SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nEnemyCamp-1,0);
		GCZ_Msg2Camp(GetName().."成功利用先锋命令成为"..tDoorName[nDoorIdx].."守卫",nPlayerCamp);		
		PlayerIndex = nGuardIdx;
		nPlayerCamp = GCZ_GetPlayerCamp();
		Msg2Player("卫兵的城门被别人占领了");
		Talk(1,"","卫兵的城门被别人占领了")
		SetTaskTemp(TEMP_GURAD_ID,0);
		GCZ_Msg2Camp(tDoorName[nDoorIdx].."已经被敌占",nPlayerCamp);
		return 0;
	end;
	set_fight_state(GCZ_GetPlayerCamp(),nDoorIdx);
	PlayerIndex = nProposerIdx;
	SetTaskTemp(TEMP_CHALLENGER,1);	--设为挑战者
	set_fight_state(GCZ_GetPlayerCamp(),nDoorIdx);
	PlayerIndex = nGuardIdx;
	Msg2MSAll(MISSION_ID,"大侠"..GetName(nProposerIdx).."单打独斗的发起来 "..tDoorName[nDoorIdx].."守卫"..GetName(nGuardIdx)..".");
end;

function set_fight_state(nCamp,nDoorIdx)
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0);	--原地重生
	end;
	if GetTaskTemp(TEMP_AUDIENCE) ~= 0 then	--如果正在做观众
		DesaltPlayer(0);
		UseSkillEnable(1);--  (1可以使用武功，0禁止使用武功)
		SetTaskTemp(TEMP_AUDIENCE,0);
	end;	
	CreateTrigger(1,FIGHT_TIMER_ID,FIGHT_TRIGGER_ID);
	SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),15);
	ContinueTimer(GetTrigger(FIGHT_TRIGGER_ID));
	Restore();
	RestoreNeili();
	RemvoeTempEffect();	--清除所有临时状态
	ClearColdDown();	--清药CD
	CastState("imme_clear_skill_interval",-1,0);	--消除所有技能的冷却时间
	Say("下一个单打<color=yellow>30<color>秒就要开始了,快准备!",0);
	Msg2Player("下一个单打30秒就要开始了,快准备!");
	SetTaskTemp(TEMP_GURAD_ID,nDoorIdx);
	SetTaskTemp(TEMP_ARENA_FIGHTING,nCamp);
	SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_READY);
	SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nCamp-1,PlayerIndex);
	SetPos(tFightingPos[nDoorIdx][1],tFightingPos[nDoorIdx][2]);
end;