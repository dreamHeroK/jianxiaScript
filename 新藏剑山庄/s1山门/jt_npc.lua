--藏剑使者
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\equip_shop\\equip_shop_talk.lua")
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\missions\\mission_task\\ttd_wjz_task.lua")

Include("\\script\\新藏剑山庄\\s1山门\\entrynpc.lua")
Include("\\script\\新藏剑山庄\\s1山门\\runtime_data_stat.lua")


g_NpcName = "<color=green>藏剑使者<color>:"

N_JOIN_ENERGY_NEED = 0
N_JOIN_TIANJIAOLING_NEED = 20
T_TIANJIAOLING = {2, 0, 31, "藏剑英雄帖"}
-- MU_Msg2Team from cangjian
function MU_Msg2Team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end
function join_consume(bTianJiaolingMode, bDelete)
--	if 1 == bDelete then
--		AddRuntimeStat(4,1,bTianJiaolingMode,1)
--	end
	if 1 == bTianJiaolingMode then
		if GetTeamMember(0) == PlayerIndex then
    		if GetItemCount(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3]) < N_JOIN_TIANJIAOLING_NEED then
    			Msg2Player(format("没有足够的 %s",T_TIANJIAOLING[4]))
    			return 0
    		end
    		if bDelete and bDelete == 1 then
        		--删除物品
        		if 1 ~= DelItem(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED) then
        			return 0
        		end
     --   		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED})
        		_stat_when_ib_consume(N_JOIN_TIANJIAOLING_NEED)
    		end
    	else
    		return 0
		end
	else
		local OldPlayerIndex = PlayerIndex;
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex > 0 then
  --  			local nCur,_ = ModifyEnergy(0, 1)
   -- 			if nCur < N_JOIN_ENERGY_NEED then
   -- 				MU_Msg2Team(format("[%s] 没有足够的精力 [%d] 点", GetName(), N_JOIN_ENERGY_NEED))
   -- 				return 0
   -- 			end
			end
		end
		if bDelete and bDelete == 1 then
    		for i = 1, GetTeamSize() do
    			PlayerIndex = GetTeamMember(i);
    			if PlayerIndex > 0 then
    --				ModifyEnergy(-1*N_JOIN_ENERGY_NEED, 1)
    			end
    		end
		end
		PlayerIndex = OldPlayerIndex
	end
	return 1
end

function main() 
local nTime = tonumber(date("%H%M"));
 if (not ((0010 <= nTime  and nTime < 1800) or (1800 <= nTime and nTime < 2340))) then	--
 Talk(1, "","23点40至0点10分系统维护，请稍后进入！")
 return 
 end
 
 	local tMaps = gf_GetDataTable(GetSameMaps(4011));
	local nCount = getn(tMaps);
	if nCount >= 20 then
		Talk(1, "","当前挑战队伍过多请稍等");
		return
	end 
	if 1 == IsCJstemOpen() then
		local strtab = {
--		    "◆ 关于藏剑山庄/nothing",
		    "◆ 我要率众闯关/entry_jingli",
--			"◆ 直接进入剑冢/#entry_tianjiaoling(0)",
		    "\n◆ 藏剑兑换商店/#show_equip_shop(4003)",			
		    "\n◆ 皓月装备商店/#show_equip_shop(3101)",
		    "\n◆ 耀阳装备商店/#show_equip_shop(3102)",
		    "\n◆结束对话/do_nothing",
    		}
    	local szMsg = g_NpcName.."老夫奉庄主之命，特来此恭迎天下英雄，请问有何事需要老夫效劳。"
    	Say(szMsg,getn(strtab),strtab)
	end
	
end

function yes_open6()  --师门4套兑换
	show_equip_shop(6);
end;

function CalcYingXiongTie()
	local nNeedCount = 0
	-- 单机不需要英雄帖
	-- local nOldIndex = PlayerIndex
	-- for i=1, GetTeamSize() do
	-- 	PlayerIndex = GetTeamMember(i)
	-- 		if (GetTask(1821) >= 1) then --已经进入过一次
	-- 			nNeedCount = nNeedCount + 1
	-- 		end
	-- end
	-- PlayerIndex = nOldIndex
	return nNeedCount
end



function entry_jingli()
	local nItemCount = GetItemCount(2,0,31)
	local nNeedCount = CalcYingXiongTie()

	if (nItemCount >= nNeedCount) then
	    jt_talk_1(0)
		DelItem(2,0,31,nNeedCount)--扣帖子
	else
	Talk(1,"",g_NpcName.."需要有<color=red>"..nNeedCount.."张英雄贴<color>");
	end


	
end
function entry_tianjiaoling(bSure)
	if not bSure or 0 == bSure then
		local tSay = {
				"同意/#entry_tianjiaoling(1)",
				"结束对话/nothing",
				}
			Say(format("需要消耗<color=red>%d个%s<color> ",N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4]),getn(tSay),tSay)
		return
	end
	jt_talk_2(1)
end

function nothing()
end

function jt_talk_1(bTianJiaolingMode)
	if GetTeamMember(0) ~= PlayerIndex then
		Talk(1, "",g_NpcName.."请组队来")
		return
	end
	if 1 ~= gf_team_check_gs(GetTeamID()) then
		Talk(1,"",g_NpcName.."请组队来");
		return 0;
	end	
	if jt_check() == 1 and join_consume(bTianJiaolingMode, 0) == 1 then
		local nCurMapID = GetWorldPos();
		local nRet = join_consume(bTianJiaolingMode, 1)
		if 1 == nRet then
			local nMapID = tbJZMY:Create();
			mf_SetMissionV(tbJZMY.missionID,tbJZMY.mv19,nCurMapID,nMapID);
			tbJZMY:TeamEnter(nMapID,1);
			gf_WriteLogEx("wanjianzhong mission", format("team enter mission member count is %d", GetTeamSize()));	
			_stat_when_open_mission(bTianJiaolingMode)
			_op_on_team(_stat_on_player_when_open_misson)
			--cdkey活动

            gf_TeamOperateEX(tyt_daily);--进入次数					
		end
	end		
end
function tyt_daily()--普通进入
local ntimes = GetTask(1821) --普通藏剑 
local ntimes2 = ntimes+1
SetTask(1821, ntimes+1);---进入次数	
--if ntimes == 0 then--
--Msg2Player("第一次进入不扣帖子")
--else
--DelItem(2,0,31,1)--扣帖子
--end

Msg2Player("当前进入次数:"..ntimes2.."")
end

function jt_talk_2(bTianJiaolingMode)--直接飞剑冢
	if GetTeamMember(0) ~= PlayerIndex then
		Talk(1, "",g_NpcName.."请组队来")
		return
	end
	if 1 ~= gf_team_check_gs(GetTeamID()) then
		Talk(1,"",g_NpcName.."请组队来");
		return 0;
	end	
	if jt_check2() == 1 and join_consume(bTianJiaolingMode, 0) == 1 then
		local nCurMapID = GetWorldPos();
		local nRet = join_consume(bTianJiaolingMode, 1)
		if 1 == nRet then		
		SendScript2VM("\\script\\新藏剑山庄\\s7剑冢\\jt_npc.lua", "entry_jingli()");
	--		local nMapID = tbJZMY:Create();
	--		mf_SetMissionV(tbJZMY.missionID,tbJZMY.mv19,nCurMapID,nMapID);
	--		tbJZMY:TeamEnter(nMapID,1);
	--		gf_WriteLogEx("wanjianzhong mission", format("team enter mission member count is %d", GetTeamSize()));	
	--		_stat_when_open_mission(bTianJiaolingMode)
	--		_op_on_team(_stat_on_player_when_open_misson)
	--		--cdkey活动
	--		gf_TeamOperateEX(function () 
	--			SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(3)");	
	--		end);
	gf_TeamOperateEX(tyt_daily2);--进入次数2
		end
	end		
end
function tyt_daily2()
local ntimes = GetTask(1820) --藏剑 
local ntimes2 = ntimes+1
SetTask(1820, ntimes+1);---进入次数	
Msg2Player("当前进入次数:"..ntimes2.."")
end


tState = {}
function jt_check()
---等级≥lv80
---已入门派
---组队进入，组队成员2人
---流派数≥1
--队伍所有玩家都至少拥有1个通天顶钥石(通天顶钥石可在我这里换取)
--do return 1 end

	tState.lv = {};
	tState.route = {};
	tState.noRoute = {};
	tState.noTickets = {};
	tState.count = 0;
	tState.diffMap = {};
	tState.Times = {};
	
	local nMapID = GetWorldPos();
	gf_TeamOperateEX(jt_checkTeam,nMapID);

	local msg = "";
	local nResult = 1;
	if getn(tState.lv) ~= 0 then
		nResult = 0;
		msg = msg .. "<color=red>等级不足<color>";
		for i = 1, getn(tState.lv) do
			msg = msg .. tState.lv[i] .. "  ";
		end
	end
	local nRouteCount = 0;
	for i = 1, getn(tState.route) do
		if tState.route[i] and tState.route[i] > 0 then
			nRouteCount = nRouteCount + 1;
		end
	end
	if nRouteCount < 1 then   --流派
		nResult = 0;
		msg = msg .. "\n<color=red>流派不足1<color>\n";   
	end
	if getn(tState.noRoute) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>有白名玩家<color>";
		for i = 1, getn(tState.noRoute) do
			msg = msg .. tState.noRoute[i] .. " ";
		end
	end
	if tState.count < 1 then    --队伍人数
		nResult = 0;
		msg = msg .. "<color=red>队伍人数不足1<color>\n";
	end
	if getn(tState.diffMap) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>成员不在此地图中<color>";
		for i = 1, getn(tState.diffMap) do
			msg = msg .. tState.diffMap[i] .. " ";
		end
	end
	if getn(tState.Times) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>以下成员进入次数大于5次<color>";
		for i = 1, getn(tState.Times) do
			msg = msg .. tState.Times[i] .. " ";
		end
	end	
	
--	if getn(tState.noTickets) ~= 0 then
--		nResult = 0;
--		msg = msg .. "\n<color=red>以下成员背包内藏剑帖不足1张<color>";
--		for i = 1, getn(tState.noTickets) do
--			msg = msg .. tState.noTickets[i] .. " ";
--		end
--	end		
	
	
	
	if nResult == 0 then
		Talk(1, "", msg);
	end
	return nResult;
end

function jt_checkTeam(nMapID)
local nTalkValue = GetTask(1821) --普通藏剑进入
local nHave = GetItemCount(2,0,31)--获取藏剑帖

	if GetLevel() < 70 then
		tinsert(tState.lv, GetName());
	end
	local nRoute = GetPlayerRoute();
	tState.route[nRoute] = (tState.route[nRoute] or 0) + 1;
	if gf_CheckPlayerRoute() ~= 1 then
		tinsert(tState.noRoute, GetName());
	end
	tState.count = (tState.count or 0) + 1;
	local m = GetWorldPos();
	if m ~= nMapID then
		tinsert(tState.diffMap, GetName());
	end
	if nTalkValue >=  999 then 
		tinsert(tState.Times, GetName());
	end	
	
--	if nHave < 1 then 
--		tinsert(tState.noTickets, GetName());
---	end		
	
end


 function jt_check2()
	tState.lv = {};
	tState.route = {};
	tState.noRoute = {};
	tState.noTickets = {};
	tState.count = 0;
	tState.diffMap = {};
	tState.Times = {};	
	local nMapID = GetWorldPos();
	gf_TeamOperateEX(jt_checkTeam2,nMapID);
	local msg = "";
	local nResult = 1;
	if getn(tState.lv) ~= 0 then
		nResult = 0;
		msg = msg .. "<color=red>等级不足<color>";
		for i = 1, getn(tState.lv) do
			msg = msg .. tState.lv[i] .. "  ";
		end
	end
	local nRouteCount = 0;
	for i = 1, getn(tState.route) do
		if tState.route[i] and tState.route[i] > 0 then
			nRouteCount = nRouteCount + 1;
		end
	end
	if nRouteCount < 1 then   --流派
		nResult = 0;
		msg = msg .. "\n<color=red>流派不足1<color>\n";   
	end
	if getn(tState.noRoute) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>有白名玩家<color>";
		for i = 1, getn(tState.noRoute) do
			msg = msg .. tState.noRoute[i] .. " ";
		end
	end
	if tState.count < 1 then    --队伍人数
		nResult = 0;
		msg = msg .. "<color=red>队伍人数不足1<color>\n";
	end
	if getn(tState.diffMap) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>成员不在此地图中<color>";
		for i = 1, getn(tState.diffMap) do
			msg = msg .. tState.diffMap[i] .. " ";
		end
	end
	if getn(tState.Times) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>以下成员进入次数大于2次<color>";
		for i = 1, getn(tState.Times) do
			msg = msg .. tState.Times[i] .. " ";
		end
	end	
	
	if nResult == 0 then
		Talk(1, "", msg);
	end
	return nResult;
end


function jt_checkTeam2(nMapID)
local nTalkValue = GetTask(1820) --太一 
	if GetLevel() < 70 then
		tinsert(tState.lv, GetName());
	end
	local nRoute = GetPlayerRoute();
	tState.route[nRoute] = (tState.route[nRoute] or 0) + 1;
	if gf_CheckPlayerRoute() ~= 1 then
		tinsert(tState.noRoute, GetName());
	end
	tState.count = (tState.count or 0) + 1;
	local m = GetWorldPos();
	if m ~= nMapID then
		tinsert(tState.diffMap, GetName());
	end
	if nTalkValue >=  2 then 
		tinsert(tState.Times, GetName());
	end	
	
end



function do_nothing()
end

