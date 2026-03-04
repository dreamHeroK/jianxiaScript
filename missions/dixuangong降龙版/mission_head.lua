Include("\\settings\\static_script\\missions\\base\\mission_head.lua");
Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\missions\\dixuangong\\dxg_award.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\missions\\dixuangong\\mission.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\settings\\static_script\\cheat\\event\\event_init.lua");

MV_BOSS_COUNT 	= CUSTOM_MV_BEGIN + 1;
MV_XUANJU_COUNT = CUSTOM_MV_BEGIN + 2;
MV_SP_BOSS_LV	= CUSTOM_MV_BEGIN + 3;
MV_SP_DAYE		= CUSTOM_MV_BEGIN + 4;
MV_SP_LOOT_ID	= CUSTOM_MV_BEGIN + 5;
MV_L1_SPE_FLAG	= CUSTOM_MV_BEGIN + 6;
MV_KILLED_NPC	= CUSTOM_MV_BEGIN + 7;
MV_STEP_XX_RUN	= CUSTOM_MV_BEGIN + 8;
MV_LIVED_RUNNER = CUSTOM_MV_BEGIN + 9;
MV_L2_SCORE		= CUSTOM_MV_BEGIN + 10;
MV_S2_GGG_FLAG	= CUSTOM_MV_BEGIN + 11;

MV_LOOT_ID_2	= CUSTOM_MV_BEGIN + 12;
MV_DAYE_2   	= CUSTOM_MV_BEGIN + 13;
MV_LAO_ER_2 	= CUSTOM_MV_BEGIN + 14;

XUANYINYU = {2,95,1500, "玄阴玉"}
DIXUANJINLING = {2,95,674, "地玄金令"}
T_NEED_TIANJIAOLING = 450

--记录开过精力宝箱
MV_IS_OPENED_BOX_BEGIN = CUSTOM_MV_BEGIN + 15;
MV_IS_OPENED_BOX_END = CUSTOM_MV_BEGIN + 22;

MV_DXG_ROUTE_CNT = CUSTOM_MV_BEGIN + 23;--流派个数
MV_DXG_STAGE_CNT = CUSTOM_MV_BEGIN + 24--第几关

DXG_EXP_EXT_ADD_RATE = min(VNG_CFG_DXG_EXP_EXT_ADD_RATE or 0, 2)

function setCurStage(nStage)
	SetMissionV(MV_DXG_STAGE_CNT, nStage)
end
T_ROUTE_CNT_EXP_ADD_RATE = {
	0,0,0,0,0.2,0.4,0.6,1
}
function getRouteCount()
	local tRoute = {}
	local nRouteCnt = 0
	local OldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			local nRoute = GetPlayerRoute();
			if not tRoute[nRoute] then
				tRoute[nRoute] = 1
				nRouteCnt = nRouteCnt + 1
			end
		end
	end
	PlayerIndex = OldPlayerIndex
	return nRouteCnt
end

--每关经验奖励
T_LS_AWARD_EXP_STAGE = {
	[1] = 1496375,
	[2] = 1596375,
	[3] = 1696375,
	[5] = 1796375,
	[6] = 1896375,
	[7] = 1996375,
	[8] = 11196375,
}

function giveStageExpAward(nStage)
	if not nStage then
		nStage = GetMissionV(MV_DXG_STAGE_CNT)
	end
	local ExpAddRate = (1 + GetVipCardParam() + T_ROUTE_CNT_EXP_ADD_RATE[GetMissionV(MV_DXG_ROUTE_CNT)])*(1+DXG_EXP_EXT_ADD_RATE)
	local nExp = T_LS_AWARD_EXP_STAGE[nStage] or 0;
	if nExp > 0 then
		nExp = nExp * ExpAddRate
		gf_Modify("Exp", floor(nExp));
	end
	EventAddMaterial(1); -- Event
end

function giveStageDaiBiAward(nStage)
	MissionAward_FixAward(nStage,dxg_all_award_tb);
end

N_JOIN_ENERGY_NEED = 20
N_JOIN_TIANJIAOLING_NEED = 5
N_CALL_BOSS_TIANJIAOLING_NEED = 2
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
--		AddRuntimeStat(1,1,bTianJiaolingMode,1)
--	end
--	if 1 == bTianJiaolingMode then
--		if GetTeamMember(0) == PlayerIndex then
--			if GetItemCount(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3]) < N_JOIN_TIANJIAOLING_NEED then
--				Msg2Player(format("你没有足够的%s",T_TIANJIAOLING[4]))
--				return 0
--			end
--			if bDelete and bDelete == 1 then
--				--删除物品
--				if 1 ~= DelItem(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED) then
--					return 0
--				end
--				Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED})
--				--AddRuntimeStat(1,13,0,1)
--			end
--		else
--			return 0
--		end
--	else
--		local OldPlayerIndex = PlayerIndex;
--		for i = 1, GetTeamSize() do
--			PlayerIndex = GetTeamMember(i);
--			if PlayerIndex > 0 then
--				local nCur,_ = ModifyEnergy(0, 1)
--				if nCur < N_JOIN_ENERGY_NEED then
--					MU_Msg2Team(format("[%s] 精力不足[%d]点", GetName(), N_JOIN_ENERGY_NEED))
--					return 0
--				end
--			end
--		end
--		if bDelete and bDelete == 1 then
--			for i = 1, GetTeamSize() do
--				PlayerIndex = GetTeamMember(i);
--				if PlayerIndex > 0 then
--					ModifyEnergy(-1*N_JOIN_ENERGY_NEED, 1)
--				end
--			end
--		end
--		PlayerIndex = OldPlayerIndex
--	end
	return 1
end


function _stat_when_ib_consume(nConsume)
	SetTask(TASKID_DXG_SCORE, GetTask(TASKID_DXG_SCORE) + nConsume, TASK_ACCESS_CODE_DXG_MISSION);
	
	local nNeedTianjiao = GetTask(TASKID_DXG_SCORE)
	if nNeedTianjiao >= T_NEED_TIANJIAOLING then
		local nR = random(1,100);
		local nNum = 0
		if nR <= 40 then
			nNum = 1;
		elseif nR > 40 and nR <= 80 then
			nNum = 2;
		else
			nNum = 3;
		end;
		gf_AddItemEx({DIXUANJINLING[1],DIXUANJINLING[2],DIXUANJINLING[3],1}, DIXUANJINLING[4], nNum)
		gf_AddItemEx({XUANYINYU[1],XUANYINYU[2],XUANYINYU[3],1}, XUANYINYU[4], nNum)
		local szNotice = format("恭喜%s从%s中获得了[%s]×%d", GetName(), "地玄宫", DIXUANJINLING[4], nNum)
		Msg2Global(szNotice);
		local szNotice1 = format("恭喜%s从%s中获得了[%s]×%d", GetName(), "地玄宫", XUANYINYU[4], nNum)
		Msg2Global(szNotice1);
		SetTask(TASKID_DXG_SCORE, 0, TASK_ACCESS_CODE_DXG_MISSION)
	end
	AddRuntimeStat(1,13,0,nConsume);
end

function dxg_CreateTable()
	local tRequire = {};
	for i = 1,8 do
		tinsert(tRequire,{2,97,236,2});
	end
	return tRequire;
end

function dxg_OpenUi(nStage)
	local szFunc = format("dxg_CallBack%d", nStage)
	MA_Mission_OpenUI(MISSION_ID,0, "\\script\\missions\\dixuangong\\mission_head.lua", szFunc, dxg_CreateTable());
	gf_TeamOperateEX(vaf_award_api, "tDXGJinBox") --2XU活动
end

function dxg_CallBack1(nId)
	dxg_CallBack_Stage(1, nId);
end

function dxg_CallBack2(nId)
	dxg_CallBack_Stage(2, nId);
end

function dxg_CallBack3(nId)
	dxg_CallBack_Stage(3, nId);
end

function dxg_CallBack4(nId)
	dxg_CallBack_Stage(4, nId);
end

function dxg_CallBack5(nId)
	dxg_CallBack_Stage(5, nId);
end

function dxg_CallBack6(nId)
	dxg_CallBack_Stage(6, nId);
end

function dxg_CallBack7(nId)
	dxg_CallBack_Stage(7, nId);
end

function dxg_CallBack8(nId)
	dxg_CallBack_Stage(8, nId);
end

function dxg_CallBack_Stage(nStage,nId)
	local m = GetWorldPos();
	if m < 65537 then
		SendScript2Client('Open([[ma]])');
		return 0;
	end
	local nRet = MissionAward_RandAward(nStage, nId, dxg_all_award_tb, nil);
	if nRet == 1 then
		if nId < 8 then
			--_stat_when_open_free_card()
		else
			_stat_when_ib_consume(2)	
  		end
	end
	return 1
end