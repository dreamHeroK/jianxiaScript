--天门阵开启npc
--by vivi
--2009-07-16

Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua")
Include("\\script\\lib\\message.lua")
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\online_activites\\award.lua")
Include("\\script\\online\\award_head.lua")
Include("\\settings\\static_script\\global\\merit.lua")
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\missions\\tianmenzhen\\runtime_data_stat.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\system_switch_config.lua")
g_szThisFile = "\\script\\missions\\tianmenzhen\\tmz_npc.lua";

function main()
	if IsTMZstemOpen() ~= 1 then
		Talk(1,"","当前尚未开启");
		return 
	end

local nTime = tonumber(date("%H%M"));
 if (not ((0010 <= nTime  and nTime < 1800) or (1800 <= nTime and nTime < 2340))) then	--
 Talk(1, "","23点40至0点10分系统维护，请稍后进入！")
 return 
 end

	local selTab = {};
	local szTitle = format("大宋江山为外族觊觎，七次男儿焉能苟活于世。众位军士务必人人尽力、努力向前！这位少侠不知找我何事？", g_NpcName)
	tinsert(selTab, format("单人报名参与天门阵演武/tmz_single_join"));
	tinsert(selTab, format("组队报名参与天门阵演武/tmz_team_join"));
	tinsert(selTab, format("领取上回参与天门阵演武奖励/tmz_get_award"));
--	if GLB_TMZ_BiWuCheck() == 1 then
--		tinsert(selTab, format("查看跨服天门阵演武/tmz_about_tong"));
--	end
	tinsert(selTab, format("打开天门阵军需商店/open_equip_shop_no"));
	tinsert(selTab, format("天门阵演武介绍/tmz_about_detail"));
	tinsert(selTab,"结束对话/gf_DoNothing");
	Say(szTitle, getn(selTab), selTab)
end

function open_equip_shop_no()
	local tSel = {
		"天门积分兑换/#show_equip_shop(2)",
	}
	Say(g_NpcName.."少侠天门阵演武的积分是<color=yellow>"..GetTask(TASKID_TMZ_AWARD_MARK).."/"..MAX_MARK.."<color>。大侠想兑换什么了?", getn(tSel), tSel)
end

function tmz_single_join()
	if tmz_check_time(1) ~= 1 then
		return 0
	end
	--加入等级限制
	local nLv = GetLevel();
	if nLv < PLAY_NEED_LV then
		Talk(1,"",g_NpcName.."此演武非比寻常, 刀剑无眼都难免伤亡，等级达到 <color=yellow>80<color>级再来找我参加吧！");
		return 0
	end
	--入流派才给进
	local nCheckRoute = gf_CheckPlayerRoute()
	if nCheckRoute == 0 then
		Talk(1,"",g_NpcName.."您尚未加入流派，无法参加。");
		return 0;
	end
	--加入是否领取了上一场战场的奖励
	if GetTask(TASKID_TMZ_PLAY_RESULT) > 0 then
		Talk(1,"",g_NpcName.."您仍未领取上一次参与的奖励，请先获取奖励。");
		return 0;
	end 
	if GetTeamSize() > 1 then
		Talk(1,"",g_NpcName.."组队后队长来找我参加演武。");
		return 0;
	end
	
	if GetPKValue() >= 10 then
		Talk(1,"",g_NpcName.."杀气太重 (PK>10), 如果你参加天门阵演武，会自杀的, 建议冷静下来，再来找我加入！");
		return 0;
	end
	
	-- 每天进入限制
	if GetTask(TASKID_TMZ_PLAY_NUM) >= TMZ_DAILY_JOIN_LIMIT then
		Talk(1,"",g_NpcName..format("每人每天只能参加<color=green>%d<color>次天门阵之战，请明天再来。",TMZ_DAILY_JOIN_LIMIT));
		return 0;
	end
	
	if GetCash() < 80000 then
		Talk(1,"","大侠并没有8金！")
		return
	end
	
	local nWaiting = 0;
	if GetTime() - GetTask(TASKID_TMZ_JOIN_TIME) < 5*60 then
		nWaiting = 1; --整装状态
	end
	local nCurMapId = TMZ_GetSuitMap(1,nWaiting);
	local nCityMapId = GetWorldPos()
	if nCurMapId ~= 0 then
		local nCurN = mf_GetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,nCurMapId);
		if mf_GetPlayerCount(MISSION_ID,CampOne_ID,nCurMapId) <= mf_GetPlayerCount(MISSION_ID,CampTwo_ID,nCurMapId) then
			mf_JoinMission(MISSION_ID,CampOne_ID,nCurMapId);
			SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
			TMZ_Write_TableData(nCurN,CampOne_ID,0,0,0);
		else
			mf_JoinMission(MISSION_ID,CampTwo_ID,nCurMapId);
			SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
			TMZ_Write_TableData(nCurN,CampTwo_ID,0,0,0);
		end
	else --没有合适的，新开一个
		local nRoomID,nRoomIdx,nRoomCount = TMZ_FindIdleRoom();
		if nRoomID == 0 then
			Talk(1,"",g_NpcName.."所有地图都已满，请稍后再回来。");
			return 0;
		end;
		if mf_OpenMission(MISSION_ID,nRoomID) == 1 then
			local ShowTable = {
				name = TMZ_ShowData.name,
				title = TMZ_ShowData.title,
				szFormat = TMZ_ShowData.szFormat,
				data = {},			
				szMsg = format("地图阵营人员分布比例：<color=yellow>%s[%d]<color>: <color=pink>[%d]%s<color>",tCampName[1],0,0,tCampName[2]),
			};
			initTopScore(ShowTable);
			TMZ_ShowData.CurN = TMZ_ShowData.CurN + 1;
			TMZ_ShowData[TMZ_ShowData.CurN] = ShowTable;
			TMZ_SaveData();
			mf_SetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,TMZ_ShowData.CurN,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_LOAD,1,nRoomID);	
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_ID,nRoomID,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_INDEX,nRoomIdx,nRoomID);
			mf_JoinMission(MISSION_ID,CampOne_ID,nRoomID);
			SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
			TMZ_Write_TableData(TMZ_ShowData.CurN,CampOne_ID,0,0,0);
			
			_stat_on_misson_open()
		end
	end
	Pay(80000)
	_stat_when_join(1)
	
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(3)");	
	end);
end

function tmz_check_time(bNotify)
	--每周一到周五 、周日开放
	local today = Date();
	local wDay = today:week();
	local nTime = tonumber(date("%H%M"));
	
	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		if GetTask(701) > 0 then
			Talk(1,"",g_NpcName.."你尚未参与本周的军衔评定，请前往汴京赵延年参与宋方本周的军衔评定并更新了军衔后再来找我吧！");
			return 0;	
		end
		if GetTask(701) < 0 then
			Talk(1,"",g_NpcName.."你尚未参与本周的军衔评定，请前往汴京萧远楼参与辽方本周的军衔评定并更新了军衔后再来找我吧！");
			return 0;	
		end
	end
--	if wDay == 1 or wDay == 2 or wDay == 3 or wDay == 4 or wDay == 5  then
--		if (not ((1200 <= nTime and nTime < 1400) or (1800 <= nTime and nTime < 2400))) then
--			if bNotify and 1==bNotify then
--				Talk(1,"",g_NpcName.."演武尚未准备完毕，少侠请在12:00-14:00、18:00-23:59再来。");
--			end
--			return 0;	
--		end
--	elseif wDay == 0 then

		if  (not ((1400 <= nTime and nTime < 2400))) then
			if bNotify and 1==bNotify then
				Talk(1,"",g_NpcName.."演武尚未准备完毕，少侠请在14:00-23:40再来。");
			end
			return 0;				
		end

--	else
--		if bNotify and 1==bNotify then
--			Talk(1,"",g_NpcName.."演武尚未准备完毕，少侠请周一至周五、周日再来。");
--		end
--		return 0;
--	end
	return 1
end

function tmz_team_join()
	if tmz_check_time(1) ~= 1 then
		return 0
	end
	local nTeamNumber = GetTeamSize();
	local sCapTainName = GetCaptainName();
	if nTeamNumber < 1 or nTeamNumber > 3 then
		Talk(1,"",g_NpcName.."天门阵演武只能是单人参加或者组队"..PLAYER_NEED_NUM.."人参加！");
		return 0;
	end
	if GetName() ~= sCapTainName then
		Talk(1,"",g_NpcName.."组队参加必须是队长来报道");
		return 0;
	end
	if tmz_AreaCheck() == 0 then
		Talk(1,"",g_NpcName.."队伍中有人并未在此区域");
		return 0;
	end
	if tmz_LvCheck() == 0 then
		Talk(1,"",g_NpcName.."队伍中有人并未达到70级");
		return 0;
	end
	if tmz_AwardCheck() == 0 then
		Talk(1,"",g_NpcName.."队伍中有人并未领取上场演武战的奖励");
		return 0;
	end
	if tmz_TeamRouteCheck() == 0 then
		Talk(1,"",g_NpcName.."队伍中有人并未加入流派");
		return 0;
	end
	if tmz_TeamCashCheck() == 0 then
		tmz_TeamTalk(g_NpcName)
		return 0
	end
	
	if tmz_PkValueCheck() == 0 then
		Talk(1,"",g_NpcName.."队伍中有人杀气太重 (PK>10), 无法参加演武");
		return 0;		
	end
	-- 每天进入限制
	if tmz_CheckJoinLimitCount() == 0 then
		Talk(1,"",g_NpcName..format("队伍中有人已经参加演武<color=green>%d<color>次，无法参加演武了",TMZ_DAILY_JOIN_LIMIT));
		return 0;
	end
	local nWaiting = 0;
	if tmz_ZhengZhuangCheck() == 0 then
		nWaiting = 1;
	end
	local nCurMapId = TMZ_GetSuitMap(nTeamNumber,nWaiting);
	local nOldIndex = PlayerIndex; 
	local nCityMapId = GetWorldPos()
	if nCurMapId ~= 0 then
		local nCurN = mf_GetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,nCurMapId);
		if mf_GetPlayerCount(MISSION_ID,CampOne_ID,nCurMapId) <= mf_GetPlayerCount(MISSION_ID,CampTwo_ID,nCurMapId)then
			for i=1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i); 
				mf_JoinMission(MISSION_ID,CampOne_ID,nCurMapId);
				SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
				TMZ_Write_TableData(nCurN,CampOne_ID,0,0,0);
			end
			PlayerIndex = nOldIndex;
		else
			for i=1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);						
				mf_JoinMission(MISSION_ID,CampTwo_ID,nCurMapId);
				SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
				TMZ_Write_TableData(nCurN,CampTwo_ID,0,0,0);
			end
			PlayerIndex = nOldIndex;
		end
	else --没有合适的，新开一个
		local nRoomID,nRoomIdx,nRoomCount = TMZ_FindIdleRoom();
		if nRoomID == 0 then
			Talk(1,"",g_NpcName.."所有地图都已满，请稍后再回来。");
			return 0;
		end;
		if mf_OpenMission(MISSION_ID,nRoomID) == 1 then
			local ShowTable = {
				name = TMZ_ShowData.name,
				title = TMZ_ShowData.title,
				szFormat = TMZ_ShowData.szFormat,
				data = {},			
				szMsg = format("地图阵营人员分布比例：<color=yellow>%s[%d]<color>: <color=pink>[%d]%s<color>",tCampName[1],0,0,tCampName[2]),
			};
			initTopScore(ShowTable);
			TMZ_ShowData.CurN = TMZ_ShowData.CurN + 1;
			TMZ_ShowData[TMZ_ShowData.CurN] = ShowTable;
			TMZ_SaveData();
			mf_SetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,TMZ_ShowData.CurN,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_LOAD,1,nRoomID);	
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_ID,nRoomID,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_INDEX,nRoomIdx,nRoomID);
			for i=1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);							
				mf_JoinMission(MISSION_ID,CampOne_ID,nRoomID);
				SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
				TMZ_Write_TableData(TMZ_ShowData.CurN,CampOne_ID,0,0,0);
			end
			PlayerIndex = nOldIndex;
			
			_stat_on_misson_open()
		end
	end	
	tmz_TeamPay()
	_stat_when_join(GetTeamSize() or 2)
	
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(3)");	
	end);
end

-- 在进入前判断所有队员是否在同一个城里
function tmz_AreaCheck()
	local nTeamSize = 0
	local nMapid = GetWorldPos()	--随便取一个队员的worldpos
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetWorldPos() == nMapid then
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if GetTeamSize() == nTeamSize then
		return 1, nTeamSize
	else
		return 0, nTeamSize
	end
end

function tmz_LvCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nLv = GetLevel();
		if nLv < PLAY_NEED_LV then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;
end

function tmz_AwardCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetTask(TASKID_TMZ_PLAY_RESULT) > 0 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

function tmz_ZhengZhuangCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetTime() - GetTask(TASKID_TMZ_JOIN_TIME) < 5*60 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

function tmz_TeamRouteCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nCheckRoute = gf_CheckPlayerRoute();
		if nCheckRoute == 0 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

function  tmz_TeamCashCheck()
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nCash = GetCash()
		if nCash < 80000 then
			return 0
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

 function tmz_TeamTalk(g_NpcName)
 	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		Talk(1,"",g_NpcName.."队伍中有人资金不足8金");
	end
	PlayerIndex = nOldIndex;
 end

function  tmz_TeamPay()
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		Pay(80000)
	end
	PlayerIndex = nOldIndex;
end


function tmz_PkValueCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nPk = GetPKValue();
		if nPk >= 10 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;			
end

function tmz_TongMemberCheck()
	local nOldIndex = PlayerIndex;
	local strTongName = "";
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if i == 1 then
			strTongName = GetTongName();
		else
			if strTongName ~= GetTongName() then
				PlayerIndex = nOldIndex;
				return 0;
			end
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	 
end

function tmz_CheckJoinLimitCount()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetTask(TASKID_TMZ_PLAY_NUM) >= TMZ_DAILY_JOIN_LIMIT then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

--奖励的全额经验
function tmz_Award_Base_Exp()
	local nExp = 0;
	local nLv = GetLevel();
	local tExpType = {{75,80,85,90,100},{nLv^3/3,(100+(nLv-75)*20)*10000/3,(280+(nLv-80)*24)*10000/3,(400+(nLv-85)*28)*10000/3,5120000/3}};
	for i = 1,getn(tExpType[1]) do
		if nLv < tExpType[1][i] then
			nExp = tExpType[2][i];
			break;
		end
	end
	return nExp
end

--经验衰减系数1
function tmz_Award_Exp_Arg()
	local nExpArg = 0;
	local nNum = GetTask(TASKID_TMZ_PLAY_NUM)+1;
	if nNum <= 8 then
		nExpArg = 1-(1/512)*(nNum-4)^2;
	else
		nExpArg = 0.5;
	end
	return nExpArg;
end

--积分衰减系数1
function tmz_Award_Mark_Arg()
	local tNumArg = {{9,8,7,6,5,4,3,2,1},{0,0.2,0.3,0.6,0.6,0.8,1,0.8,0.7}};
	local nMarkArg = 0;
	local nNum = GetTask(TASKID_TMZ_PLAY_NUM)+1;
	for i = 1,getn(tNumArg[1]) do
		if nNum >= tNumArg[1][i] then
			nMarkArg = tNumArg[2][i];
			break;
		end
	end
	return nMarkArg;
end

function tmz_get_award()
	
	--先判断是否参加了上一场对阵，再判断是否为有效参与
	if GetTask(TASKID_TMZ_PLAY_RESULT) <= 0 then
		Talk(1,"",g_NpcName.."您尚未参加上一场的天门阵演武");
		return 0;
	end

	local nActivePoint = 0;
	local nActiveLevel = 1;
	nActivePoint, nActiveLevel = tmz_get_active_point();
	local sTalk = format("少侠参加了天门阵演武，获得%s, 可以领取%s的奖励。", tbAcvtiveDesc[nActiveLevel][2], tbAcvtiveDesc[nActiveLevel][1]);
	Say(g_NpcName..sTalk,
		2,
		format("%s/#tmz_confirm_award(0)","我要领取奖励"),
		"暂时不领取/gf_DoNothing")
end

function tmz_confirm_award(nType)
	if GetTask(TASKID_TMZ_PLAY_RESULT) <= 0 then
		Talk(1,"",g_NpcName.."您尚未参加上一场的天门阵演武");
		return 0;
	end

	nType = nType or 0;
	local tbNeedItem = tAwardItem[nType]	
		if type(tbNeedItem[1]) == "string" then
			if GetItemCount(tbNeedItem[2],tbNeedItem[3],tbNeedItem[4]) < tbNeedItem[5] then
				Talk(1,"",g_NpcName.."您的"..tbNeedItem[1].."不足。");
				return 0;
			end
		end
	local nNeedRoom = 0;
	local nNeedWeight = 0;
	local nActivePoint = 0;
	local nActiveLevel = 1;
	nActivePoint, nActiveLevel = tmz_get_active_point();
	local tbActive = tbAcvtiveLossAward[nActiveLevel];
	local tbNormal = tbNormalAward[nType];
	
	local bIsWin = 0--获胜标记
	if (GetTask(TASKID_TMZ_PLAY_RESULT) == 2) then
		tbActive = tbAcvtiveWinAward[nActiveLevel];
		bIsWin = 1--获胜标记
	end
	
	if (tbActive == nil or tbNormal == nil) then
		return 0;
	end
	
	nNeedRoom = tbNormal.nBagLimit;
	nNeedRoom = nNeedRoom + tbActive.nBagLimit;
	nNeedWeight = tbNormal.nWeightLimit;
	nNeedWeight = nNeedWeight + tbActive.nWeightLimit;
	if gf_Judge_Room_Weight(nNeedRoom+4,nNeedWeight,g_NpcName) ~= 1 then --+4预留给活动奖励的空间
		return 0;
	end
		if type(tbNeedItem[1]) == "string" then
			if DelItem(tbNeedItem[2],tbNeedItem[3],tbNeedItem[4],tbNeedItem[5]) ~= 1 then
				return 0;
			end
		end
	
	local tAddRate = {
		nExpAddRate = (1 + TMZ_EXP_EXT_RATE)*(1 + GetVipCardParam()),
		nJunGongAddRate = (1 + TMZ_JUNGONG_EXT_RATE),
	}
	if bIsWin == 0 then--负方不给军功加成
		tAddRate.nJunGongAddRate = 1
	end
--	gf_EventGiveAllAward(tbNormal.tbAward,"天门阵演武",format("获得奖励 type: %d nActivePoint: %d",nType,nActivePoint),tAddRate);
--	gf_EventGiveAllAward(tbActive.tbAward,"天门阵演武",format("获得奖励 type: %d nActivePoint: %d",nType,nActivePoint),tAddRate);
	if(nActiveLevel == 6) then
		Msg2Global(format("%s 在天门阵演武上展现了非凡的实力, 以一己之力, 表达了对国家的忠诚！",GetName()));
	end
	if bIsWin == 1 then
--		_MissionAward_RandAward(g_tWinExtraAward, "获得了天门阵演武的胜利方专属奖励")--胜方专属奖励
--		gf_EventGiveAllAward(g_tWinExtraAward2[nType].tbAward,"天门阵演武",format("获得%s参与奖励","胜利方"),tAddRate);
 --       gf_ModifyExp(14400000);
        SetTask(369, GetTask(369) + 400)--天门积分	 
		SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 7));
	else
--		gf_EventGiveAllAward(g_tLoseExtraAward2[nType].tbAward,"天门阵演武",format("获得%s参与奖励","战败方"),tAddRate);
  --      gf_ModifyExp(14400000);
       SetTask(369, GetTask(369) + 100)--天门积分
		SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 7));
	end
	local nCheckTMT = GetTask(368)
	local nCampBase = 1
	local nExp_TMT = 20000000
	
	if nCheckTMT < 2 then
		nExp_TMT = 5000000		         
	end 
	ModifyExp(nExp_TMT)
	CalcBattleRank()
	UpdateBattleMaxRank()
	SetTask(TASKID_TMZ_PLAY_RESULT,0);

	tmz_clear_task_id();
	aw_tmz_award(nType);	
	_stat_when_award(nType, nActiveLevel)
	--武林功勋
	merit_TianMenZhen(bIsWin, nType);
end

function tmz_about_detail()
	local strtab = {
		"◆ 演武的进入条件/tmz_about_detail_1",
		"◆ 占旗点数、击杀、助攻、排名规则/tmz_about_detail_2",
		"◆ 活跃度/tmz_about_detail_5",
		"◆ 奖励兑换/tmz_about_detail_3",
		"◆ 附加奖励/tmz_about_detail_4",
		"◆ 返回/main"
	};
	Say(g_NpcName.."这演武场正式仿制辽军之前所布下的天门阵。阵中门门相应、互为生克，可谓精妙至极。我已令军士操练数月有余，却也只略通阵中玄机。",
		getn(strtab),
		strtab);
end

function tmz_about_detail_1()
	Talk(1,"tmz_about_detail",g_NpcName.."少侠要参加演武必须得组上3人或者单人进入。请注意，队员必须领取了上次演武的奖励后才能参加下一场的演武");
end

function tmz_about_detail_2()
	Talk(1,"tmz_about_detail",g_NpcName.."1, 少侠单人或者组队成员将<color=yellow>随机传送<color>到竞技场中的某个位置。当参加的两方阵营人数大于或等于<color=yellow>"..PLAYER_NEED_NUM.."<color>时战斗即将开始。 \n  2, 进入阵旗之战时, 每过15秒，您身边增加一次阵旗时间。 当阵旗时间达到"..APPEAR_FLAG_POINT.."分<color>, 可以立即攻击<color=yellow>大阵旗<color> (旗主), 杀是对方可以直接接收大量的阵旗时间。 \n  3, 任何一方阵营的战阵达到<color=yellow>"..OVER_GAME_POINT.."<color>分时立即结束战斗。 少侠将根据您自己的表现获得奖励。\n  4, 比赛中表现不佳的成员将从竞技场中被踢出。");
end

function tmz_about_detail_3()
	Talk(1,"tmz_about_detail_3_2",g_NpcName..format("\n    1.	天门阵演武奖励组成：\n   1. 天门阵奖励演武是参与时的综合奖励和积分的组合，接受奖励时将同时获得。\n 2. 每位玩家每天只能参加<color=green>%d<color>次天门阵演武",TMZ_DAILY_AWARD_LIMIT))
end

function tmz_about_detail_3_2()
	Talk(1,"tmz_about_detail_3_3",g_NpcName..format("\n    2.	参加奖励： \n    只需加入并战斗直到比赛结束就能获得奖励，此奖励可与道具<color=yellow>%s<color>一起使用, 可以重复多次, 非常吸引人。","军功章"));
end

function tmz_about_detail_3_3()
	Talk(1,"tmz_about_detail",g_NpcName..format("\n    3.	 积分奖励--积分：\n    积分是衡量玩家可以获得奖励物品数量的基础，积分是基于<color=yellow>被击杀数<color>, <color=yellow>击杀总数<color>, <color=yellow>占领旗子的次数<color>, <color=yellow>消灭怪物的数量<color>, <color=yellow>获胜<color>演武表现越好, 积分越高, 奖励就越有吸引力, 同时不能使用 <color=yellow>%s<color>重复奖励","军功章"))
end

function tmz_about_detail_4()
	Talk(1,"tmz_about_detail",g_NpcName.."每天12：00-14：00和18：00-20：00, 玩家报名参加比赛并获得经验和奖励将成倍增加。该效果不适用于"..tAwardItem[1][1].." 和"..tAwardItem[2][1].."累积。")
end

function tmz_about_detail_5()
	Talk(1,"tmz_about_detail",g_NpcName.."当玩家获得1点活跃点数即视为有活跃：\n击杀3名玩家获得2点活跃\n对阵伤害输出200000或者有效治疗100000获得1点活跃\n对阵破坏1个阵眼获得2点活跃\n对阵破坏1个阵旗获得4点活跃\n对阵击杀6个NPC获得1点活跃\n当活跃度不足,不计入排名,不获得任何奖励")
end

function tmz_clear_daily_task()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASKID_TMZ_PLAY_DATE) < nDate then
		SetTask(TASKID_TMZ_PLAY_DATE,nDate);
		SetTask(TASKID_TMZ_PLAY_NUM,0);
		SetTask(TASKID_TMZ_GET_HUFU_NUM,0);
		SetTask(TASKID_TMZ_GET_RANK_FLAG,0);
		SetTask(TASKID_TMZ_PLAY_RESULT,0);
	end
end
