Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")

_t_free_award_no_stage =
{
	n_other_group_rate = 10000,--随机到代币组的概率
	t_daibi_group =
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg}
		{ {"游侠令", {2,111,180,50}, nil,nil,{1, 100} }, 1000},
		{ {"游侠令", {2,111,180,52}, nil,nil,{1, 100} }, 1000},
		{ {"游侠令", {2,111,180,56}, nil,nil,{1, 100} }, 800},
		{ {"游侠令", {2,111,180,58}, nil,nil,{1, 100} }, 500},
		{ {"游侠令", {2,111,180,50}, nil,nil,{1, 100} }, 300},
		{ {"游侠令", {2,111,180,52}, nil,nil,{1, 100} }, 200},
		{ {"游侠令", {2,111,180,60}, nil,nil,{1, 100} }, 100},
		{ {"游侠令", {2,111,180,70}, nil,nil,{1, 100} }, 100},
	},
	--------------------------------------------
	t_other_group = --杂物组
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg}
		{ {"游侠令", {2,111,180,52}, nil,nil,{1, 100} }, 1000},
		{ {"游侠令", {2,111,180,54}, nil,nil,{1, 100} }, 1000},
		{ {"游侠令", {2,111,180,55}, nil,nil,{1, 100} }, 800},
		{ {"游侠令", {2,111,180,50}, nil,nil,{1, 100} }, 300},
		{ {"游侠令", {2,111,180,52}, nil,nil,{1, 100} }, 200},
		{ {"游侠令", {2,111,180,50}, nil,nil,{1, 100} }, 300},
		{ {"游侠令", {2,111,180,52}, nil,nil,{1, 100} }, 200},
		{ {"游侠令", {2,111,180,50}, nil,nil,{1, 100} }, 100},
		{ {"游侠令", {2,111,180,60}, nil,nil,{1, 100} }, 100},
	},
};

_t_free_award_stage =
{
	[1] =
		{
			n_equip_group_rate = 1000,--随机到装备组的概率
			n_daibi_group_rate = 3000,--随机到代币组的概率
			t_equip_group = --装备组
			{
        			{{MA_GiveLevel1WenShi, {1, nil, nil, 0}}, 5000},
			},
		},
	[2] =
		{
			n_equip_group_rate = 1000,--随机到装备组的概率
			n_daibi_group_rate = 4000,--随机到代币组的概率
			t_equip_group = --装备组
			{
        			{{MA_GiveJiuZhouEquip, {1, nil, nil, 0}}, 5000},
			},
		},
	[3] =
		{
			n_equip_group_rate = 2000,--随机到装备组的概率
			n_daibi_group_rate = 4000,--随机到代币组的概率
			t_equip_group = --装备组
			{
        			{{MA_GiveLevel1WenShi, {1, nil, nil, 0}}, 5000},
			},
		},
	[4] =
		{
			n_equip_group_rate = 1000,--随机到装备组的概率
			n_daibi_group_rate = 4000,--随机到代币组的概率
			t_equip_group = --装备组
			{
        			{{MA_GiveJiuZhouEquip, {1, nil, nil, 0}}, 3500},
			},
		},
	[5] =
		{
			n_equip_group_rate = 1000,--随机到装备组的概率
			n_daibi_group_rate = 4000,--随机到代币组的概率
			t_equip_group = --装备组
			{
			},
		},
	[6] =
		{
			n_equip_group_rate = 1000,--随机到装备组的概率
			n_daibi_group_rate = 4000,--随机到代币组的概率
			t_equip_group = --装备组
			{
        			{{MA_GiveLevel1WenShi, {1, nil, nil, 0}}, 5000},
			},
		},
	[7] =
		{
			n_equip_group_rate = 1000,--随机到装备组的概率
			n_daibi_group_rate = 4000,--随机到代币组的概率
			t_equip_group = --装备组
			{
        			{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 3000},
			},
		},
	[8] =
		{
			n_equip_group_rate = 1000,--随机到装备组的概率
			n_daibi_group_rate = 4000,--随机到代币组的概率
			t_equip_group = --装备组
			{
        			{{MA_GiveJiuZhouEquip, {1, nil, nil, 0}}, 1500},
			},
		},
}

_t_fix_award_stage =
{
	[1] =
		{
			{MA_GiveYinQuan, {15}},
			{MA_GivePop, {11, 15}},
			{MA_GiveFriendliness, {15}},
		},
	[2] =
		{
			{MA_GiveYinQuan, {20}},
			{MA_GivePop, {11, 20}},
			{MA_GiveFriendliness, {20}},
		},
	[3] =
		{
			{MA_GiveYinQuan, {25}},
			{MA_GivePop, {11, 25}},
			{MA_GiveFriendliness, {25}},
		},
	[4] =
		{
			{MA_GiveYinQuan, {30}},
			{MA_GivePop, {11, 30}},
			{MA_GiveFriendliness, {30}},
		},
	[5] =
		{
			{MA_GiveYinQuan, {35}},
			{MA_GivePop, {11, 35}},
			{MA_GiveFriendliness, {35}},
		},
	[6] =
		{
			{MA_GiveYinQuan, {45}},
			{MA_GivePop, {11, 45}},
			{MA_GiveFriendliness, {45}},
		},
	[7] =
		{
			{MA_GiveYinQuan, {55}},
			{MA_GivePop, {11, 55}},
			{MA_GiveSoul, {20}},
			{MA_GiveFriendliness, {55}},
		},
	[8] =
		{
			{MA_GiveYinQuan, {85}},
			{MA_GivePop, {11, 100}},
			{MA_GiveFriendliness, {85}},
		},
}

_t_ib_award_no_stage =
{
	t_cost = --消耗
	{
		{"天骄令",{2,97,236,2}, _stat_when_ib_consume},	
	},
	t_ib_award =--ib奖励
	{
		{{"八宝粽子",{2,1,1125,1},nil,nil,{1, 100} },500},
		{{"地玄金令",{2,95,674,1},nil,msg,{1, 100}, {3142,16}},50},
		{{"玄阴玉",{2,95,1500,1},nil,msg,{1, 100}, {3142,16}},45},
		{{"金钱袋",{2,95,662,1},nil,nil, {1, 100}},2000},
		{{"师门秘函",{2,1,1020,1},nil,nil,{1, 100} },755},
		{{"九转回魂丹",{1,0,32,1},nil,nil,{1, 100} },500},
		{{"神器",{2,95,55,1},nil,nil,{1, 100} },1000},
		{ {"皓月碎片", {2,95,740,25}, nil,nil,{1, 100} }, 500},
		{{"五色彩染",{2,201,13,1},nil,nil,{1, 100} },3200},
		{{"五华聚元散",{1,0,261,1},nil,nil,{1, 100} },1000},
		{{"七华聚元散",{1,0,267,1},nil,nil,{1, 100} },1000},
		{{"沾衣谱",{0,107,66,1},nil,nil,{1, 100} },800},
		{ {"皓月碎片", {2,95,740,15}, nil,nil,{1, 100} }, 1000},
        	{{MA_GiveHaoYueEquip, {1, nil, nil, 0}}, 1000},
        	{{MA_GiveLevel1WenShi, {1, nil, nil, 0}}, 800},
        	{{MA_GiveJiuZhouEquip, {1, nil, nil, 0}}, 200},
	},
}

dxg_all_award_tb = 
{
	--------------------------------------------
	t_free_award = 
	{
		sz_award_title = "地玄宫代币奖励",
		--几次没有得到装备时必出装备
		t_equip_round = {},
		n_max_daibi_perday = 0,--一天最多获得多少代币
		t_stage =
		{
			[1] = inherit(_t_free_award_no_stage, _t_free_award_stage[1]),
			[2] = inherit(_t_free_award_no_stage, _t_free_award_stage[2]),
			[3] = inherit(_t_free_award_no_stage, _t_free_award_stage[3]),
			[4] = inherit(_t_free_award_no_stage, _t_free_award_stage[4]),
			[5] = inherit(_t_free_award_no_stage, _t_free_award_stage[5]),
			[6] = inherit(_t_free_award_no_stage, _t_free_award_stage[6]),
			[7] = inherit(_t_free_award_no_stage, _t_free_award_stage[7]),
			[8] = inherit(_t_free_award_no_stage, _t_free_award_stage[8]),
		},
	},
	---------------------------------------------
	t_fix_award = 
	{
		sz_award_title = "地玄宫固定奖励",
		t_stage = _t_fix_award_stage,
	},
	--------------------------------------------
	t_ib_award = 
	{
		sz_award_title = "地玄宫翻盘奖励",
		t_equip_round = {},
		t_stage = 
		{
			[1] = inherit(_t_ib_award_no_stage, _t_free_award_stage[1]),
			[2] = inherit(_t_ib_award_no_stage, _t_free_award_stage[2]),
			[3] = inherit(_t_ib_award_no_stage, _t_free_award_stage[3]),
			[4] = inherit(_t_ib_award_no_stage, _t_free_award_stage[4]),
			[5] = inherit(_t_ib_award_no_stage, _t_free_award_stage[5]),
			[6] = inherit(_t_ib_award_no_stage, _t_free_award_stage[6]),
			[7] = inherit(_t_ib_award_no_stage, _t_free_award_stage[7]),
			[8] = inherit(_t_ib_award_no_stage, _t_free_award_stage[8]),
		},
	},
}

_t_free_award_no_stage = nil
_t_free_award_stage = nil
_t_fix_award_stage = nil
_t_ib_award_no_stage = nil

