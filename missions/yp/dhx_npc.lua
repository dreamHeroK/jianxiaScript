--段和玄
Include("\\script\\missions\\yp\\tls\\head.lua")
Include("\\script\\missions\\yp\\hss\\head.lua")
Include("\\script\\missions\\yp\\mm\\head.lua")
Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\tmp_task_id_def.lua")
Include("\\script\\missions\\yp\\vn\\shengwang_award.lua")

tNpcName = {
	{"<color=green>速达康真<color>：","一入吾教即为圣徒，千秋万载,永垂圣史。"},
	{"<color=green>完颜洪图<color>：","我等女真部族饱受凌辱，此番定将一雪前耻。"},
	{"<color=green>李继星<color>： ","我西夏地域辽阔，物产丰富。自从大侠在西域帮助我们以来，整个国立都获得了极大提高，这次对于进攻辽国的巢穴，我们自然不会有所亏待！"},	
};
g_szThisFile = "\\script\\missions\\yp\\dhx_npc.lua";
g_nMaxCount = 15;

function main()
	local nMapID = GetWorldPos()
	local nType = 0;
--	if g_nDebugVersion == 1 then
		local strNpcName = GetNpcName(GetTargetNpc());
		if strNpcName == "速达康真" then
			SetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP,1);
			nType = 1;
		elseif strNpcName == "李继星" then
			SetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP,3);
			nType = 3;		
		elseif strNpcName == "完颜洪图" then
			SetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP,2);
			nType = 2;			
		end
--	else
--		for i = 1, getn(tMainMapID) do
--			if tMainMapID[i][1] == nMapID then
--				SetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP,i);
--				nType = i;
--				break;
--			end
--		end
--	end
	if GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP) == 0 then
		return 0;
	end
	local g_NpcName = tNpcName[nType][1];
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 0 and nCamp ~= nType then
		Talk(1,"",g_NpcName.."你既然已经加入其他势力，却又来找我做什么！莫不是别有所图？");
		return 0;
	end	
	local strtab = {
		"我要加入"..tMainMapID[nType][2].."/dhx_talk_1",
		"我要脱离"..tMainMapID[nType][2].."/dhx_talk_2",
		"好的，我随便转转/nothing",
	}
	if nType == nCamp then
		tremove(strtab,1)
		tinsert(strtab,1,"前往"..tMainMapID[nType][3].."/dhx_talk_3")
	end	
	Say(g_NpcName..tNpcName[nType][2],
		getn(strtab),
		strtab)
end

function dhx_talk_1()
	local nType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	local g_NpcName = tNpcName[nType][1];
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nLv = GetLevel();
	local nCheckRoute = gf_CheckPlayerRoute();
	if nLv < 80 or nCheckRoute ~= 1 then
		Talk(1,"",g_NpcName.."达到80级并加入流派才能加入势力！");
		return 0;
	end
	if nCamp ~= 0 and nCamp ~= nType then
		Talk(1,"",g_NpcName.."你既然已经加入其他势力，却又来找我做什么！莫不是别有所图？");
		return 0;
	elseif nCamp == nType then
		Talk(1,"",g_NpcName.."您加入了我方势力，好好努力吧！");
		return 0;		
	end
	if GetGlbValue(GLV_YP_FLASHTIME) == 0 or (GetGlbValue(GLV_YP_FLASHTIME)-GetTime()) > 60 then
		local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
		tbPVPCharm:reflash();
		tbPVPCharm:apply(g_szThisFile,"dhx_talk_1_1");
	else
		local g_nCharmA = GetGlbValue(GLV_YP_CHARM_ONE);
		local g_nCharmB = GetGlbValue(GLV_YP_CHARM_TWO);
		local g_nCharmC = GetGlbValue(GLV_YP_CHARM_THREE);
		local g_nPlayersA = GetGlbValue(GLV_YP_PLAYER_ONE);
		local g_nPlayersB = GetGlbValue(GLV_YP_PLAYER_TWO);
		local g_nPlayersC = GetGlbValue(GLV_YP_PLAYER_THREE);
		Say(g_NpcName..format("如你所知，对抗辽国的周边势力共有三股。其中拜火圣灵城人气值：<color=yellow>%d<color>，人数：<color=yellow>%d<color>；女真黄龙府人气值：<color=yellow>%d<color>，人数：<color=yellow>%d<color>，西夏兴庆人气值：<color=yellow>%d<color>，人数 <color=yellow>%d<color>。您真的确定要计入我们吗？<color=red>加入我们后7天才被允许离开！<color>",g_nCharmA,g_nPlayersA,g_nCharmB,g_nPlayersB,g_nCharmC,g_nPlayersC),
			2,
			"\n我会拯救世界的/dhx_talk_1_2",
			"\n容我三思/nothing")
	end
end

function dhx_talk_1_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	local nType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	local g_NpcName = tNpcName[nType][1];
	
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	local nTotal,g_nCharmA,g_nCharmB,g_nCharmC = tbPVPCharm[0][2],tbPVPCharm[0][3],tbPVPCharm[0][4],tbPVPCharm[0][5];
	local g_nPlayersA,g_nPlayersB,g_nPlayersC = tbPVPCharm[0][6],tbPVPCharm[0][7],tbPVPCharm[0][8];
		local g_nCharmA = tbPVPCharm[0][3] or 1000;
		local g_nCharmB = tbPVPCharm[0][4] or 1000;
		local g_nCharmC = tbPVPCharm[0][5] or 1000;
		local g_nPlayersA = tbPVPCharm[0][6] or 0;
		local g_nPlayersB = tbPVPCharm[0][7] or 0;
		local g_nPlayersC = tbPVPCharm[0][8] or 0;
		SetGlbValue(GLV_YP_CHARM_ONE,g_nCharmA);
		SetGlbValue(GLV_YP_CHARM_TWO,g_nCharmB);
		SetGlbValue(GLV_YP_CHARM_THREE,g_nCharmC);
		SetGlbValue(GLV_YP_PLAYER_ONE,g_nPlayersA);
		SetGlbValue(GLV_YP_PLAYER_TWO,g_nPlayersB);
		SetGlbValue(GLV_YP_PLAYER_THREE,g_nPlayersC);
	Say(g_NpcName..format("如你所知，对抗辽国的周边势力共有三股。其中拜火圣灵城人气值：<color=yellow>%d<color>，人数：<color=yellow>%d<color>；女真黄龙府人气值：<color=yellow>%d<color>，人数：<color=yellow>%d<color>，西夏兴庆人气值：<color=yellow>%d<color>，人数 <color=yellow>%d<color>。您真的确定要计入我们吗？<color=red>加入我们后7天才被允许离开！<color>",g_nCharmA,g_nPlayersA,g_nCharmB,g_nPlayersB,g_nCharmC,g_nPlayersC),
		2,
		"\n我会拯救世界的/dhx_talk_1_2",
		"\n容我三思/nothing")	
end

function dhx_talk_1_2()
	local nCampType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	local g_NpcName = tNpcName[nCampType][1];
	local g_nPlayersA = GetGlbValue(GLV_YP_PLAYER_ONE);
	local g_nPlayersB = GetGlbValue(GLV_YP_PLAYER_TWO);
	local g_nPlayersC = GetGlbValue(GLV_YP_PLAYER_THREE);	
	local tPlayers = {g_nPlayersA,g_nPlayersB,g_nPlayersC};
	local nMax,nMin,nCount = yp_checkCampNum(g_nPlayersA,g_nPlayersB,g_nPlayersC);
	if nCount >= g_nMaxCount and tPlayers[nCampType] == nMax then 
		Talk(1,"",g_NpcName.."您无法加入我们的势力，现在我方的人数已经超过盟友"..g_nMaxCount.."人！");
		return 0;
	end
	if nCampType == 1 then
		SetGlbValue(GLV_YP_PLAYER_ONE,GetGlbValue(GLV_YP_PLAYER_ONE)+1);
	elseif nCampType == 2 then
		SetGlbValue(GLV_YP_PLAYER_TWO,GetGlbValue(GLV_YP_PLAYER_TWO)+1);
	elseif nCampType == 3 then
		SetGlbValue(GLV_YP_PLAYER_THREE,GetGlbValue(GLV_YP_PLAYER_THREE)+1);
	else
		return 0;
	end	
	SetTask(TASK_FIELD_PVP_CAMP,nCampType);
	SetTask(TASK_FIELD_PVP_JOIN_TIME,GetTime());
	--OpenPop(nCampType)
	if GetGlbValue(GLV_YP_FLASHTIME) == 0 or (GetGlbValue(GLV_YP_FLASHTIME)-GetTime()) > 60 then
		local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
		tbPVPCharm:reflash();
		tbPVPCharm:apply(g_szThisFile,"dhx_talk_1_3");
	else
		Talk(1,"",format("%s成功代表武林盟加入%s对抗辽国的势力。",g_NpcName,tMainMapID[nCampType][2]));
	end
--	ds_PVP:AddStatValue(1,nCampType,1);
end

function dhx_talk_2()
	local nCampType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	local g_NpcName = tNpcName[nCampType][1];	
	Say(g_NpcName.."现在正需借助大侠之力荡平辽国的最佳时机，你确定要脱离吗？离开势力将会清除你的贡献值及势力声望。",
		2,
		"\n确定/dhx_talk_2_confirm",
		"\n结束对话/nothing")
end

function dhx_talk_2_confirm()
	local nCampType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	local g_NpcName = tNpcName[nCampType][1];
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCampType ~= nCamp then
		Talk(1,"",g_NpcName.."大侠还没有加入我方势力！");
		return 0;
	end
	local nCurTime = GetTime() - GetTask(TASK_FIELD_PVP_JOIN_TIME);
	if nCurTime < 1*24*3600 then
		Talk(1,"",g_NpcName..format("大侠的行事不定的行为令本势力众位人士颇为不爽，还是等<color=yellow>%s<color>之后再来吧。一面大家发怒，仓面失控。",Get_Time_String(1*24*3600-nCurTime,"dhms")))
	else
		SetTask(TASK_FIELD_PVP_CAMP,0);
		-------------------------------
		SetTask(TASK_FIELD_PVP_GXD,0);  --贡献度
--		SetTask(TASK_FIELD_PVP_COUNT,0); --pvp点数
		SetTask(TASK_FIELD_PVP_STEAL_BOOK,0);
		SetTask(TASK_FIELD_PVP_STEAL_STEP,0);
		SetTask(TASK_FIELD_PVP_STEALED,0);
		SetTask(TASK_FIELD_PVP_STEAL_MAP,0);
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_TASK,0);
		SetTask(TASK_FIELD_PVP_SEED_NUM,0);
		SetTask(TASK_FIELD_PVP_SEED_TIME,0);
		SetTask(TASK_FIELD_PVP_SEED_STEAL,0);
		SetTask(TASK_FIELD_PVP_SEED_SUR,0);
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME1,0);
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME2,0);
		SetTask(TASK_FIELD_PVP_CAR_TB,0);
		SetTask(TASK_FIELD_PVP_TREASURE,0);
--		ClearAllPop()
		ClearPop(nCamp) --清除当前势力声望
		for i = 61,84 do --声望任务清除
			ClearGTask(i);
		end
		-------------------------------
		Talk(1,"",g_NpcName.."在过去的几天里，非常感谢您的帮助，我们将记住这种恩典。它将稍后返回。")
--		ds_PVP:AddStatValue(1,19,1);
		local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
		tbPVPCharm:reflash();
		tbPVPCharm:apply(g_szThisFile,"dhx_talk_2_1");
	end	
end

function dhx_talk_2_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	local a1,a2,a3,a4 = tbPVPCharm[0][2],tbPVPCharm[0][3],tbPVPCharm[0][4],tbPVPCharm[0][5];
	local a,b,c = tbPVPCharm[0][6],tbPVPCharm[0][7],tbPVPCharm[0][8];
	local nCampType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	if nCampType == 1 and a ~= nil and a ~= 0 then
		a = a-1;
	end
	if nCampType == 2 and b ~= nil and b ~= 0 then
		b = b-1;
	end
	if nCampType == 3 and c ~= nil and c ~= 0 then
		c = c-1;
	else
		return 0;
	end
	tbPVPCharm["Charm"] = {"ddddddd",a1,a2,a3,a4,a,b,c};
end

function dhx_talk_3()
	local nCampType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local g_NpcName = tNpcName[nCampType][1];
	if nCampType == 0 then
		return 0;
	end
	if nCamp ~= 0 and nCampType ~= nCamp then
		Talk(1,"",g_NpcName.."你已经加入其他势力，你去那边看看。");
		return 0;
	end
	if GetPKValue() >= 10 then
		Talk(1,"",g_NpcName.."你的PK值太高，不能进入势力地图。");
		return 0;
	end
	if GetTeamSize() ~= 0 then
		Talk(1,"",g_NpcName.."大侠请离开队伍再进入！");
		return 0;
	end
	if nCampType == 1 then
		dhx_enter_1(nCampType);
	elseif nCampType == 2 then
		dhx_enter_2(nCampType);
	elseif nCampType == 3 then
		dhx_enter_3(nCampType);
	end	
end

function dhx_talk_1_3(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local nCampType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	local g_NpcName = tNpcName[nCampType][1];	
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	local g_nCharmA = GetGlbValue(GLV_YP_CHARM_ONE);
	local g_nCharmB = GetGlbValue(GLV_YP_CHARM_TWO);
	local g_nCharmC = GetGlbValue(GLV_YP_CHARM_THREE);
	local g_nPlayersA = GetGlbValue(GLV_YP_PLAYER_ONE);
	local g_nPlayersB = GetGlbValue(GLV_YP_PLAYER_TWO);
	local g_nPlayersC = GetGlbValue(GLV_YP_PLAYER_THREE);
	tbPVPCharm["Charm"] = {"ddddddd",g_nCharmA+g_nCharmB+g_nCharmC,g_nCharmA,g_nCharmB,g_nCharmC,g_nPlayersA,g_nPlayersB,g_nPlayersC};
	SetGlbValue(GLV_YP_FLASHTIME,GetTime());
	Talk(1,"",format("%s成功代表武林盟加入%s对抗辽国的势力。",g_NpcName,tMainMapID[nCampType][2]));
end

function dhx_addCharm(nType,nAddNum)
--	if GetGlbValue(GLV_YP_FLASHTIME) == 0 or (GetGlbValue(GLV_YP_FLASHTIME)-GetTime()) > 60 then
		g_nType = nType;
		g_nAddNum = nAddNum;
		local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
		tbPVPCharm:reflash();
		tbPVPCharm:apply(g_szThisFile,"dhx_addCharm_1");
--	else
--		if nType == 1 then
--			SetGlbValue(GLV_YP_CHARM_ONE,GetGlbValue(GLV_YP_CHARM_ONE)+nAddNum);
--		elseif nType == 2 then
--			SetGlbValue(GLV_YP_CHARM_TWO,GetGlbValue(GLV_YP_CHARM_TWO)+nAddNum);
--		elseif nType == 3 then
--			SetGlbValue(GLV_YP_CHARM_THREE,GetGlbValue(GLV_YP_CHARM_THREE)+nAddNum);
--		end
--	end
--	if nAddNum > 0 then
--		Msg2SubWorld(tMainMapID[nType][2].."势力人气值增加"..nAddNum.."点！");
--	elseif nAddNum < 0 then
--		Msg2SubWorld(tMainMapID[nType][2].."势力人气值减少"..nAddNum.."点！");
--	end	
end

function dhx_addCharm_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	local nTotal,a,b,c = tbPVPCharm[0][2],tbPVPCharm[0][3],tbPVPCharm[0][4],tbPVPCharm[0][5];
	local d,e,f = tbPVPCharm[0][6],tbPVPCharm[0][7],tbPVPCharm[0][8];
--	local a1,b1,c1 = GetGlbValue(GLV_YP_CHARM_ONE),GetGlbValue(GLV_YP_CHARM_TWO),GetGlbValue(GLV_YP_CHARM_THREE);
--	local d1,e1,f1 = GetGlbValue(GLV_YP_PLAYER_ONE),GetGlbValue(GLV_YP_PLAYER_TWO),GetGlbValue(GLV_YP_PLAYER_THREE)
--	SetGlbValue(GLV_YP_FLASHTIME,GetTime());
	nTotal = a + b + c + g_nAddNum;
	if g_nType == 1 then
		a = a + g_nAddNum;
		if a < nTotal*0.1 then
			mf_SetMissionV(tbSLY.missionID,tbSLY.mv11,1,tbSLY.realMapID);
		end
	elseif g_nType == 2 then
		b = b + g_nAddNum;
		if b < nTotal*0.1 then
			mf_SetMissionV(tbTBHSS.missionID,tbTBHSS.mv11,1,tbTBHSS.realMapID);
		end		
	elseif g_nType == 3 then
		c = c + g_nAddNum;
		if c < nTotal*0.1 then
			mf_SetMissionV(tbXXMM.missionID,tbXXMM.mv11,1,tbXXMM.realMapID);
		end
	else
		return 0;
	end
	tbPVPCharm["Charm"] = {"ddddddd",nTotal,a,b,c,d,e,f};
end

function dhx_addCharm2(nType,nAddNum)
--	if GetGlbValue(GLV_YP_FLASHTIME) == 0 or (GetGlbValue(GLV_YP_FLASHTIME)-GetTime()) > 60 then
		g_nType2 = nType;
		g_nAddNum2 = nAddNum;
		local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
		tbPVPCharm:reflash();
		tbPVPCharm:apply(g_szThisFile,"dhx_addCharm_2");
end

function dhx_addCharm_2(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	local nTotal,a,b,c = tbPVPCharm[0][2],tbPVPCharm[0][3],tbPVPCharm[0][4],tbPVPCharm[0][5];
	local d,e,f = tbPVPCharm[0][6],tbPVPCharm[0][7],tbPVPCharm[0][8];
	nTotal = a + b + c + g_nAddNum2;
	if g_nType2 == 1 then
		a = a + g_nAddNum2;
		if a < nTotal*0.1 then
			mf_SetMissionV(tbSLY.missionID,tbSLY.mv11,1,tbSLY.realMapID);
		end
	elseif g_nType2 == 2 then
		b = b + g_nAddNum2;
		if b < nTotal*0.1 then
			mf_SetMissionV(tbTBHSS.missionID,tbTBHSS.mv11,1,tbTBHSS.realMapID);
		end		
	elseif g_nType2 == 3 then
		c = c + g_nAddNum2;
		if c < nTotal*0.1 then
			mf_SetMissionV(tbXXMM.missionID,tbXXMM.mv11,1,tbXXMM.realMapID);
		end
	else
		return 0;
	end
	tbPVPCharm["Charm"] = {"ddddddd",nTotal,a,b,c,d,e,f};
end

function dhx_writeData()
	if GetGlbValue(GLV_YP_PLAYER_ONE) == 0 then
		return 0;
	end
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	tbPVPCharm:reflash();
	tbPVPCharm:apply(g_szThisFile,"dhx_writeData_CallBack");	
end

function dhx_writeData_CallBack(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	local nDate = tonumber(date("%d"));
	local a1,a2,a3,a4 = tbPVPCharm[0][2],tbPVPCharm[0][3],tbPVPCharm[0][4],tbPVPCharm[0][5];
	local a,b,c = tbPVPCharm[0][6],tbPVPCharm[0][7],tbPVPCharm[0][8];
	if nDate == 1 then --每个月1号刷新
		a1,a2,a3,a4 = 3000,1000,1000,1000;
		Msg2MSGroup("武林盟势力数据更新！");
	end 
	tbPVPCharm["Charm"] = {"ddddddd",a1,a2,a3,a4,max(GetGlbValue(GLV_YP_PLAYER_ONE),a),max(GetGlbValue(GLV_YP_PLAYER_TWO),b),max(GetGlbValue(GLV_YP_PLAYER_THREE),c)};
end

function dhx_enter_1(nType)
	SetPlayerScript("\\script\\missions\\yp\\tls\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\tls\\entrynpc.lua","enter()");
end

function dhx_enter_2(nType)
	SetPlayerScript("\\script\\missions\\yp\\hss\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\hss\\entrynpc.lua","enter()");
end

function dhx_enter_3(nType)
	SetPlayerScript("\\script\\missions\\yp\\mm\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\mm\\entrynpc.lua","enter()");
end


function yp_checkCampNum(a,b,c)
	local nMax = 0;
	local nMin = 0;
	local nCount = 0;
	if a > b then
		nMax = a;
		nMin = b;
	else
		nMax = b;
		nMin = a;
	end
	nCount = abs(a-b);
	if nMax > c then
		nCount = max(nCount,nMax-c);
		nMin = min(nMin,c);
	else
		nMax = c;
		nCount = max(nCount,c-nMin);
	end
	return nMax,nMin,nCount
end
