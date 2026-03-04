--藏剑使者
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\equip_shop\\equip_shop_talk.lua")
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\missions\\mission_task\\ttd_wjz_task.lua")

Include("\\script\\新藏剑山庄\\s6紫竹林\\entrynpc.lua")
Include("\\script\\新藏剑山庄\\s6紫竹林\\runtime_data_stat.lua")


g_NpcName = "<color=green>藏剑使者<color>:"

N_JOIN_ENERGY_NEED = 0
N_JOIN_TIANJIAOLING_NEED = 5
T_TIANJIAOLING = {2, 97, 236, "天骄令"}
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
    			local nCur,_ = ModifyEnergy(0, 1)
 --   			if nCur < N_JOIN_ENERGY_NEED then
 --   				MU_Msg2Team(format("[%s] 没有足够的精力 [%d] 点", GetName(), N_JOIN_ENERGY_NEED))
  --  				return 0
  --  			end
			end
		end
		if bDelete and bDelete == 1 then
    		for i = 1, GetTeamSize() do
    			PlayerIndex = GetTeamMember(i);
    			if PlayerIndex > 0 then
   -- 				ModifyEnergy(-1*N_JOIN_ENERGY_NEED, 1)
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
-- return 
 end
	if 1 == IsWanJianZhongMissionSystemOpen() then
		local strtab = {
   -- 		"开启普通关卡/entry_jingli",
			"开启关卡/#entry_tianjiaoling(0)",
--    		"每日任务/jt_talk_3",
--    		"每周任务/jt_talk_4",
 --   		"师门4套兑换/yes_open6",
    		"结束对话/do_nothing",
    		}
    	local szMsg = g_NpcName.." "
    	Say(szMsg,getn(strtab),strtab)
	else
		local strtab = {
    		"结束对话/do_nothing",
    		}
    	Say(g_NpcName..format("入口 %s未打开请打开它在来闯关", "万剑冢"),getn(strtab),strtab)
	end
	
end

function yes_open6()  --师门4套兑换
	show_equip_shop(6);
end;

function entry_jingli()
	jt_talk_1(0)
end
function entry_tianjiaoling(bSure)
	if not bSure or 0 == bSure then
		local tSay = {
				"同意/#entry_tianjiaoling(1)",
				"结束对话/nothing",
				}
			Say(format("需要消耗<color=red> %d 个 %s<color> ",N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4]),getn(tSay),tSay)
		return
	end
	jt_talk_1(1)
end

function nothing()
end

function jt_talk_1(bTianJiaolingMode)
	if GetTeamMember(0) ~= PlayerIndex then
		Talk(1, "",g_NpcName.."请组队来挑战关卡 <color=yellow>流派成员必须在2人以上<color>")
		return
	end
	if 1 ~= gf_team_check_gs(GetTeamID()) then
		Talk(1,"",g_NpcName.."请召唤您的朋友一起来闯关!");
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
			gf_TeamOperateEX(function () 
	--			SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(3)");	
			end);
		end
	end		
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
	
	if nResult == 0 then
		Talk(1, "", msg);
	end
	return nResult;
end

function jt_checkTeam(nMapID)
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
end


 
function jt_talk_3()
	local str1 = return_status(3);
	local str2 = return_status(5);
	Say(g_NpcName.."每天只能完成一次，完成后，如果没有收到奖励，则不会重置.\n    完成任务万剑冢: <color=green>500W 经验，英雄勋章 #2<color>;\n    完成付费翻牌任务1 次: <color=green>800W 经验，英雄勋章 #3<color>;",
		4,
		format("\n 通关 1 次 万剑冢 (%s)/wjz_daily_task",str1),
		format("\n 翻牌 1 次 (%s)/fanpai_daily_task",str2),
		"\n 返回/main",
		"结束对话/do_nothing")
end

function jt_talk_4()
	local str1 = return_status(4);
	local str2 = return_status(6);
	Say(g_NpcName.."每天只能完成一次, 完成后，如果你没有收到奖励，则不会重置.\n    完成普通翻牌7 次:获得 <color=green>900W 经验，英雄勋章 #4<color>;\n    完成付费翻牌任务15 次: 获得<color=green>5000W 经验，英雄勋章 #8<color>;",
		4,
		format("\n 通关 7 次 万剑冢 (%s)/wjz_week_task",str1),
		format("\n 翻牌 15 次/fanpai_week_task",str2),
		"\n 返回/main",
		"结束对话/do_nothing")
end

function do_nothing()
end

