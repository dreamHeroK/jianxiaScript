Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\settings\\static_script\\lib\\itemfunctions.lua")
Include("\\script\\class\\clause3.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\missions\\liangshan\\daily_tasks.lua")
FILE_NAME = "\\script\\missions\\liangshan\\npc\\entrynpc_.lua";		
Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\online_activites\\task_values.lua"); -- KS Task Control
Include("\\script\\system_switch_config.lua")
function giveItem(self)
	ItemCreate:create(self[1])
end

--兑换规则
function exchange()
	local szTitle = format(_name().."选择要兑换的商店：")
	local strtab = {
			"◆ 梁山兑换/#show_equip_shop(4015)",
			"◆ 皓月兑换/#show_equip_shop(3101)",
			"◆ 耀阳兑换/#show_equip_shop(3102)",
			"◆ 我再考虑考虑/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

function main()
	if IsLSstemOpen() ~= 1 then
		Talk(1,"","当前尚未开启");
		return 
	end




--	增加梁山关卡指引任务面板取消处理
	if GetTask(2857) == 1 then
		SetTask(2857,0)
	end
	
local nTime = tonumber(date("%H%M"));
 if (not ((0010 <= nTime  and nTime < 1800) or (1800 <= nTime and nTime < 2340))) then	--
 Talk(1, "","23点40至0点10分梁山系统维护，请稍后进入！")
 return 
 end		
 temp_Talk(T);
 end


function _name()
	g_NpcName = g_NpcName or "<color=green>"..(GetNpcName(GetTargetNpc()) or "").."<color>：";
	return g_NpcName;
end

function join_consume(bTianJiaolingMode, bDelete)
	if 1 == bDelete then
		AddRuntimeStat(3,1,bTianJiaolingMode,1)
	end
	if 1 == bTianJiaolingMode then
		if GetTeamMember(0) == PlayerIndex then
    			if GetItemCount(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3]) < N_JOIN_TIANJIAOLING_NEED then
    				Msg2Player(format(LSMsgToPlayer[13],T_TIANJIAOLING[4]))
    				return 0
    			end
    			if bDelete and bDelete == 1 then
--        			删除物品
        			if 1 ~= DelItem(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED) then
        				return 0
        			end
--        			Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED})
        			AddRuntimeStat(3,10,0,N_JOIN_TIANJIAOLING_NEED)
    			end
    		else
    			return 0
		end
	else
		if GetTeamMember(0) == PlayerIndex then
    			local nCur,_ = ModifyEnergy(0, 1)
    			if nCur < N_JOIN_ENERGY_NEED then
    				Msg2Player(format("您的精力不足[%d]点，暂时不能进入", N_JOIN_ENERGY_NEED))
    				return 0
    			end
    			if bDelete and bDelete == 1 then
--        			扣除精力
    				ModifyEnergy(-1*N_JOIN_ENERGY_NEED, 1)
    			end
    		else
    			return 0
		end
	end
	return 1
end

function checkAll(bTianJiaolingMode)
--	do return 1,1,1 end
	
	local tLiupai = {};
	local bLiupai = 1;
	local bLevel = 1;
	local bEx = 1;
	local OldPlayerIndex = PlayerIndex;
	PlayerIndex = GetTeamMember(0)
	local nTown = GetWorldPos();
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetLevel() < NPlayerLevelMin then
			bLevel = 0;
		end
		if IsSleeping() == 1 then
			MU_Msg2Team(format(LSMsgToTeam[3],GetName()));
			bEx = 0;
		end
		if GetWorldPos() ~= nTown then
			MU_Msg2Team(format(LSMsgToTeam[4],GetName()))
			bEx = 0;
		end
		local nRoute = GetPlayerRoute()
		if gf_CheckPlayerRoute() ~= 1 then
			--print(LSMsgToTeam[5],GetName())
			MU_Msg2Team(format(LSMsgToTeam[5],GetName()))
			bEx = 0;
		end
		tLiupai[nRoute] = 1;
	end
	PlayerIndex = OldPlayerIndex;
	return bLiupai, bLevel, bEx;
end

function check(bTianJiaolingMode)
	local msg = LSLoginQuanli[1]
	local color = "";
	local ret = 1;
	if GetTeamSize() < NTeamMemberMin then
		color = "<color=red>";
		ret = 0;
	else
		color = "<color=green>"
	end
	msg = msg..color..format(LSLoginQuanli[2],NTeamMemberMin).."<color>"
	local _, bLevel, bEx = checkAll(bTianJiaolingMode);
	if bLevel ~= 1 then
		color = "<color=red>";
		ret = 0;
	else
		color = "<color=green>"
	end
	msg = msg..color..format(LSLoginQuanli[3],NPlayerLevelMin).."<color>"..LSLoginQuanli[4]
	if GetTeamMember(0) ~= PlayerIndex then
		color = "<color=red>";
		ret = 0;
	else--队长点击
		color = "<color=green>"
	end
	msg = msg..color..LSLoginQuanli[5]
	if bEx ~= 1 then
		ret = 0;
	end
	if 1 == ret then
		ret = join_consume(bTianJiaolingMode, 0)
	end
	return ret, msg;
end

function entry_jingli()
	local tMaps = gf_GetDataTable(GetSameMaps(g_RealMapId));
	local nCount = getn(tMaps);
	if nCount >= 11 then
		Talk(1, "", _name()..LSSysTalk[2]);
		return
	end
--此处添加队伍每日次数判断
if Task_Teamcheck() ==1 then
	entry(0, 0)
end
end
function entry_tianjiaoling()
	entry(1, 0)
end
----------------------------------------------新增检测机制-----------------------
tState = {}
function Task_Teamcheck()
	tState.count = 0;
	tState.diffMap = {};
    tState.Times = {};
	local nMapID = GetWorldPos();
	gf_TeamOperateEX(checkTeamtimes,nMapID);
	local msg = "";
	local nResult = 1;
	if getn(tState.diffMap) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>以下成员不在本地图：<color>";
		for i = 1, getn(tState.diffMap) do
			msg = msg .. tState.diffMap[i] .. " ";
		end
	end
	if getn(tState.Times) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>以下成员进入次数大于30次<color>";
		for i = 1, getn(tState.Times) do
			msg = msg .. tState.Times[i] .. " ";
		end
	end
	if nResult == 0 then
		Talk(1, "", msg);
	end
	return nResult;
end
function checkTeamtimes(nMapID)
local nTalkValue = GetTask(3476) --梁山
	tState.count = (tState.count or 0) + 1;
	local m = GetWorldPos();
	if m ~= nMapID then
		tinsert(tState.diffMap, GetName());
	end
	if nTalkValue >=  30 then 
		tinsert(tState.Times, GetName());
	end	
end
-------------------------------------------------------------------------------------------------




function entry(bTianJiaolingMode, bSure)
	local tMaps = gf_GetDataTable(GetSameMaps(g_RealMapId));
	local nCount = getn(tMaps);
	if nCount >= 40 then
		Talk(1, "", _name()..LSSysTalk[2]);
		return
	end
	if 1 == bTianJiaolingMode then
		if not bSure or bSure ~= 1 then
			local tSay = {
				"确定/#entry(1,1)",
				"我不上交了/nothing",
				}
			Say(format(NpcSayInfo[6][4][1],N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4]),getn(tSay),tSay)
			return
		end
	end
	local bRet, msg = check(bTianJiaolingMode);
	if bRet ~= 1 then
		Talk(1, "", _name()..msg);
		return
	end
	
	if join_consume(bTianJiaolingMode,1) ~= 1 then
		return
	end

	createMission(g_RealMapId,bTianJiaolingMode)
end

function createMission(nOrgMapId,bTianJiaolingMode)
	local nOldIndex = PlayerIndex;
	local nMapID,nMapIdx = DynamicLoadMap(nOrgMapId);
	if mf_OpenMission(MISSION_ID,nMapID) == 1 then
		mf_SetMissionV(MISSION_ID,MV_MAP_INDEX,nMapIdx,nMapID);
		mf_SetMissionV(MISSION_ID,MV_RETURN_MAP_ID, GetWorldPos(),nMapID);
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			mf_JoinMission(MISSION_ID,1,nMapID);
			local ntimes = GetTask(3476)
			local ntimes2 = ntimes+1
            SetTask(3476,ntimes+1);	      --进入次数 
            Msg2Player("当前进入次数:"..ntimes2.."")
			if GetName() == GetCaptainName() then
				WriteLogEx(LUONGSON_LOG_TITLE, "使用天骄令")
			end
			WriteLogEx(LUONGSON_LOG_TITLE, "天骄令")
			
			_stat_on_player_when_open_misson()--副本开启时的玩家数据统计
--			cdkey活动
--			SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(2)");	
		end
		PlayerIndex = nOldIndex;		
		if 1 == bTianJiaolingMode then
			SendScript2VM("\\script\\missions\\liangshan\\mission\\mission.lua", format("tStage_1:skip(1,%d)", nMapIdx))
		end
		
		_stat_when_open_mission(bTianJiaolingMode)--副本开启时的数据统计
	else
		FreeDynamicMap(nMapID, nMapIdx);
	end
end
