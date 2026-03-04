Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\missions\\dixuangong\\mission.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

T_DXG_GOLD_BoxScript = {
	"\\script\\missions\\dixuangong\\npc\\box_gold1.lua",
	"\\script\\missions\\dixuangong\\npc\\box_gold2.lua",
}

T_GOLD_BOX_IDX = {}
function remove_box_gold()
	for i,v in T_GOLD_BOX_IDX do
		if GetNpcName(i) == "黄金宝箱" then
			SetNpcLifeTime(i, 0);
		end
	end
	T_GOLD_BOX_IDX = {}
end

function create_dxg_box_gold(nNpcIdx, nBoxId)
	if not T_DXG_GOLD_BoxScript[nBoxId] then
		return
	end
	local m, x, y = GetNpcWorldPos(nNpcIdx);
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("箱子钱", "黄金宝箱", m, x2, y2);
	if npc and npc > 0 then
		T_GOLD_BOX_IDX[npc] = 1
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_DXG_GOLD_BoxScript[nBoxId]);
	else
		print("create dixuangong jinbaoxiang fail")
	end
end

function box_gold_create_ib_card_require()
	local tRequire = {};
	for i = 1,8 do
		tinsert(tRequire,{2, 97, 236,2});
	end
	return tRequire;
end

function on_open_dxg_box_gold_card_stage1(nId)
	on_open_dxg_gold_box_card(1,nId)
end
function on_open_dxg_box_gold_card_stage2(nId)
	on_open_dxg_gold_box_card(2,nId)
end

function _stat_when_ib_consume(nConsume)
	SetTask(TASKID_DXG_SCORE, GetTask(TASKID_DXG_SCORE) + nConsume, TASK_ACCESS_CODE_DXG_MISSION);
	AddRuntimeStat(1,13,0,nConsume);
end

function on_open_dxg_gold_box_card(nStage, nId)
	local m = GetWorldPos();
	if m < 65537 then
		SendScript2Client('Open([[ma]])');
		return 0;
	end
	local nRet = MissionAward_RandAward(nStage, nId, t_dxg_card_award, nil);
	
	if nRet == 1 then
		if nId < 8 then
		--_stat_when_open_free_card()
	else
		--_stat_when_ib_consume(1)	
  	end
	end
end

function on_open_dxg_box_gold(nStage)
	local szFunc = format("on_open_dxg_box_gold_card_stage%d", nStage)
	MA_Mission_OpenUI(MISSION_ID,0, T_DXG_GOLD_BoxScript[nStage], szFunc, box_gold_create_ib_card_require());
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");
	gf_TeamOperateEX(vaf_award_api, "tDXGJinBox") --2XU活动
	FireEvent("event_mission_box_award", "dixuangong", "gold", nStage)
end

_t_free_award_no_stage =
{
	n_other_group_rate = 10000,--随机到代币组的概率
	t_daibi_group =
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg, {nNeedRoom, nNeedWeight}}
        --{{"紫霞秘籍",{0,107,65,1, 4}, 720, bGblMsg}, 150},
        --t_item_para = {{function, {nCount, nBind, nExpireDays, bGblMsg, {nNeedRoom, nNeedWeight}}}, rate}
        --{{MissionAward_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
	},
	--------------------------------------------
	t_equip_group = --杂物组
	{
	},
};
_t_free_award_stage =
{
	[1] =
		{
			n_equip_group_rate = 0,--随机到装备组的概率
			n_daibi_group_rate = 0,--随机到代币组的概率
        	t_other_group = --装备组
        	{
        		----tPara = {nCount, nBind, nExpireDays, bGblMsg}
                { {"赤铁精", {2,1,2652,1,4}, 7,nil, {1, 100}}, 600},
                { {"月华之精", {2,1,3219,1,4}, 7,nil, {1, 100}}, 600},
                { {"八卦牌", {2,95,550,1,4}, 7,nil, {1, 100}}, 600},
                { {"紫金八卦牌", {2,95,551,1,4}, 7,nil, {1, 100}}, 600},
        	},
		},
	[2] =
		{
			n_equip_group_rate = 0,--随机到装备组的概率
			n_daibi_group_rate = 0,--随机到代币组的概率
        	t_other_group = --装备组
        	{
                { {"赤铁精", {2,1,2652,1,4}, 7,nil, {1, 100}}, 600},
                { {"月华之精", {2,1,3219,1,4}, 7,nil, {1, 100}}, 600},
                { {"八卦牌", {2,95,550,1,4}, 7,nil, {1, 100}}, 600},
                { {"紫金八卦牌", {2,95,551,1,4}, 7,nil, {1, 100}}, 600},
        	},
		},
}

_t_fix_award_stage =
{
}

_t_ib_award_no_stage1 =
{
	t_cost = --消耗
	{
		--{"紫霞秘籍",{0,107,65,1, 4}},
		{"天骄令",{2, 97, 236,2},_stat_when_ib_consume},
		
	},
	t_ib_award =--ib奖励
	{
        { {"赤铁精", {2,1,2652,1,4}, 7,nil, {1, 100}}, 600},
        { {"月华之精", {2,1,3219,1,4}, 7,nil, {1, 100}}, 600},
        { {"八卦牌", {2,95,550,1,4}, 7,nil, {1, 100}}, 600},
        { {"紫金八卦牌", {2,95,551,1,4}, 7,nil, {1, 100}}, 600},
	},
}

_t_ib_award_no_stage2 =
{
	t_cost = --消耗
	{
		--{"紫霞秘籍",{0,107,65,1, 4}},
		{"天骄令",{2, 97, 236,2},_stat_when_ib_consume},
		
	},
	t_ib_award =--ib奖励
	{
                { {"经验丹", {2,1,30313,1,4}, 7,nil, {1, 100}}, 600},	
                { {"赤铁精", {2,1,2652,1,4}, 7,nil, {1, 100}}, 600},
                { {"月华之精", {2,1,3219,1,4}, 7,nil, {1, 100}}, 600},
                { {"八卦牌", {2,95,550,1,4}, 7,nil, {1, 100}}, 600},
                { {"紫金八卦牌", {2,95,551,1,4}, 7,nil, {1, 100}}, 600},
	},
}

t_dxg_card_award = 
{
	--------------------------------------------
	t_free_award = 
	{
		sz_award_title = "地玄宫免费卡牌",
		--几次没有得到装备时必出装备
		t_equip_round = {},
		n_max_daibi_perday = 30,--一天最多获得多少代币
		t_stage =
		{
			[1] = inherit(_t_free_award_no_stage, _t_free_award_stage[1]),
			[2] = inherit(_t_free_award_no_stage, _t_free_award_stage[2]),
		},
	},
	
	t_fix_award = 
	{
		sz_award_title = "地玄宫固定奖励",
		t_stage = _t_fix_award_stage,
	},
	--------------------------------------------
	t_ib_award = 
	{
		sz_award_title = "地玄宫收费卡牌",
		t_stage = 
		{
			[1] = _t_ib_award_no_stage1,
			[2] = _t_ib_award_no_stage2,
		},
	},
}

_t_free_award_no_stage = nil
_t_free_award_stage = nil
_t_fix_award_stage = nil
_t_ib_award_no_stage1 = nil
_t_ib_award_no_stage2 = nil
