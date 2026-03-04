--create date:07-04-19
--author:yanjun
--describe:守城令物品脚本
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnUse(nItemIdx)
	if GCZ_InBattle() == 0 then
		Talk(1,"","只有在攻城地区才能使用守城令。");
		return 0;
	end;
	if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_READY then
		Talk(1,"","目前还没有时间担任卫兵。只有在准备阶段才能接受卫兵的职位");
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	if nPlayerCamp ~= SHOU_ID then
		Talk(1,"","只有守门人才能使用守城令");
		return 0;
	end;
	local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
	if nDoorIdx ~= 0 then
		Talk(1,"","你已经是卫兵了"..tDoorName[nDoorIdx].."!");
		return 0;
	end;
	local selTab = {
				format(" 成为 "..tDoorName[1].."守卫/#use(%d,%d)",nItemIdx,1),
				format(" 成为 "..tDoorName[2].."守卫/#use(%d,%d)",nItemIdx,2),
				format(" 成为 "..tDoorName[3].."守卫/#use(%d,%d)",nItemIdx,3),
				"结束/nothing",
				}
	local nEnemyCamp = GONGSHOU_ID - nPlayerCamp;
	local szSEGuardName,szSSGuardName,szSWGuardName = GCZ_GetGuardName(SHOU_ID,0);
	Say(gf_FormatStringLength(tDoorName[1],12,0)..":"..gf_FormatStringLength(szSEGuardName,20).."\n"..gf_FormatStringLength(tDoorName[2],12,0)..":"..gf_FormatStringLength(szSSGuardName,20).."\n"..gf_FormatStringLength(tDoorName[3],12,0)..":"..gf_FormatStringLength(szSWGuardName,20).."\n\n上面的这些城,你们想成为哪座城的守卫?",getn(selTab),selTab);
end;

function use(nItemIdx,nDoorIdx)
	if GCZ_InBattle() == 0 then
		Talk(1,"","只有在攻城地区才能使用守城令。");
		return 0;
	end;
	if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_READY then
		Talk(1,"","目前还没有时间担任卫兵。只有在准备阶段才能接受卫兵的职位");
		return 0;
	end;
	local szGuardName = GCZ_GetGuardName(SHOU_ID,nDoorIdx);
	if szGuardName ~= "没有" then
		Talk(1,"","这城门已经安排了卫兵。请选另一个!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetTaskTemp(TEMP_GURAD_ID,nDoorIdx);
		SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),PlayerIndex);
		SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,SHOU_ID);
		GCZ_Msg2Camp(GetName().."利用守城令成为"..tDoorName[nDoorIdx].."守卫",SHOU_ID);		
		Talk(1,"","你成了守卫 <color=yellow>"..tDoorName[nDoorIdx].."<color>.责任太重了!");
	end;
end;