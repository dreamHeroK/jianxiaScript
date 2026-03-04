Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")

Include("\\script\\missions\\cangjianshanzhuang\\runtime_data_stat.lua")

tbNormalAwardHard= 
{
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,3000000,1},
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,3500000,1},
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,4000000,1},
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,5000000,1},
		},
	},
}

tYouZhiSan = {
    { {"¤ GiÊy DÇu", {0,120,247}, {1,100} }, 2500},
    { {"¤ GiÊy DÇu", {0,120,248}, {1,100} }, 2500},
    { {"¤ GiÊy DÇu", {0,120,249}, {1,100} }, 2500},
    { {"¤ GiÊy DÇu", {0,120,250}, {1,100} }, 2500},
}
tShuoYi = {
    { {"¸o T¬i", {0,120,231}, {1,100} }, 2500},
    { {"¸o T¬i", {0,120,232}, {1,100} }, 2500},
    { {"¸o T¬i", {0,120,233}, {1,100} }, 2500},
    { {"¸o T¬i", {0,120,234}, {1,100} }, 2500},
}
function MA_GiveYouZhiSan(tPara, szMsgTitle)
	return _MA_GiveRandItem(tYouZhiSan, tPara, szMsgTitle, 1)
end
function MA_GiveShuoYi(tPara, szMsgTitle)
	return _MA_GiveRandItem(tShuoYi, tPara, szMsgTitle, 1)
end

_t_free_award_no_stage =
{
	n_other_group_rate = 10000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
	n_equip_group_rate = 0,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
	n_daibi_group_rate = 0,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
	t_daibi_group =
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg, {nNeedRoom, nNeedWeight}}
        --{{"×ÏÏ¼ÃØ¼®",{0,107,65,1, 4}, 720, bGblMsg}, 150},
        --t_item_para = {{function, {nCount, nBind, nExpireDays, bGblMsg, {nNeedRoom, nNeedWeight}}}, rate}
        --{{MissionAward_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,1}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,2}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,3}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,4}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,5}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,6}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,7}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,8}, nil,nil, {1, 100}}, 1000},
--        { {"¹ÅÁéÊ¯", {2,1,30368,9}, nil,nil, {1, 100}}, 800},
--        { {"¹ÅÁéÊ¯", {2,1,30368,10}, nil,nil, {1, 100}}, 500},
--        { {"¹ÅÁéÊ¯", {2,1,30368,15}, nil,nil, {1, 100}}, 300},
--        { {"¹ÅÁéÊ¯", {2,1,30368,20}, nil,nil, {1, 100}}, 200},
--        { {"¹ÅÁéÊ¯", {2,1,30368,30}, nil,nil, {1, 100}}, 100},
--        { {"¹ÅÁéÊ¯", {2,1,30368,40}, nil,nil, {1, 100}}, 100},
	},
	--------------------------------------------
	t_other_group = --ÔÓÎï×é
	{
        { {"§iÓm tÝch lòy khiªu chiÕn", {2,1,30961,1,4}, nil,nil, {1, 100}}, 8000},
        { {"§iÓm tÝch lòy khiªu chiÕn", {2,1,30961,2,4}, nil,nil, {1, 100}}, 1000},
        { {"§iÓm tÝch lòy khiªu chiÕn", {2,1,30961,5,4}, nil,nil, {1, 100}}, 500},
        --{ {"Ê¥µ®Â¹", {0,105,35,1,4,-1,-1,-1,-1,-1,-1}, 30,1, {1, 100}}, 1000},
        {{MA_GiveYouZhiSan, {1, 1, 30, 1}}, 250},
        {{MA_GiveShuoYi, {1, 1, 30, 1}}, 250},
	},
};
_t_free_award_stage =
{
--	[1] =
--		{
--			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
--			n_daibi_group_rate = 3000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
--        	t_equip_group = --×°±¸×é
--        	{
--        		----tPara = {nCount, nBind, nExpireDays, bGblMsg}
--        		{{MA_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
--        	},
--		},
--	[2] =
--		{
--			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
--			n_daibi_group_rate = 4000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
--        	t_equip_group = --×°±¸×é
--        	{
--        		{{MA_GiveFactionEquip4, {1, nil, nil, 0, {1, 300}}}, 9000},
--        		{{MA_GiveLevel1WenShi, {1, nil, nil, 0, {1, 100}}}, 1000},
--        	},
--		},
--	[3] =
--		{
--			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
--			n_daibi_group_rate = 5000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
--        	t_equip_group = --×°±¸×é
--        	{
--        		{{MA_GiveFactionEquip4, {1, nil, nil, 0, {1, 300}}}, 6000},
--        		{{MA_GiveLevel1WenShi, {1, nil, nil, 0, {1, 100}}}, 1000},
--        		{{MA_GiveFactionEquip5, {1, nil, nil, 0, {1, 300}}}, 3000},
--        	},
--		},
--	[4] =
--		{
--			n_equip_group_rate = 1000,--Ëæ»úµ½×°±¸×éµÄ¸ÅÂÊ
--			n_daibi_group_rate = 5000,--Ëæ»úµ½´ú±Ò×éµÄ¸ÅÂÊ
--        	t_equip_group = --×°±¸×é
--        	{
--        		{{MA_GiveFactionEquip5, {1, nil, nil, 0, {1, 300}}}, 6000},
--        		{{MA_GiveLevel1WenShi, {1, nil, nil, 0, {1, 100}}}, 2000},
--        		{{MA_GiveLevel2WenShi, {1, nil, nil, 0, {1, 100}}}, 500},
--        		{{MA_GiveTongTianEquip, {1, nil, nil, 0, {1, 300}}}, 1500},
--        	},
--		},
	[4] = {},
}

_t_fix_award_stage =
{
	[1] =
		{
        	--{MA_GiveExp, {3000000}},
		},
	[2] =
		{
			--{MA_GiveExp, {3500000}},
		},
	[3] =
		{
			--{MA_GiveExp, {4000000}},
		},
	[4] =
		{
			--{MA_GiveExp, {4500000}},
		},
}

_t_ib_award_no_stage =
{
	t_cost = --ÏûºÄ
	{
		--{"×ÏÏ¼ÃØ¼®",{0,107,65,1, 4}},
		{"Thiªn Kiªu LÖnh",{2, 97, 236,1},_stat_when_ib_consume},
		
	},
	t_ib_award =--ib½±Àø
	{
        { {"§iÓm tÝch lòy khiªu chiÕn", {2,1,30961,2,4}, nil,nil, {1, 100}}, 3200},
        { {"§iÓm tÝch lòy khiªu chiÕn", {2,1,30961,3,4}, nil,nil, {1, 100}}, 2700},
        { {"§iÓm tÝch lòy khiªu chiÕn", {2,1,30961,4,4}, nil,nil, {1, 100}}, 2200},
        { {"§iÓm tÝch lòy khiªu chiÕn", {2,1,30961,5,4}, nil,nil, {1, 100}}, 1900},
	},
}

t_award_hard = 
{
	--------------------------------------------
	t_free_award = 
	{
		sz_award_title = "Khu lËt thÎ Khiªu ChiÕn V¹n KiÕm Tròng (MiÔn phÝ)",
		--¼¸´ÎÃ»ÓÐµÃµ½×°±¸Ê±±Ø³ö×°±¸
		t_equip_round = {},
		n_max_daibi_perday = 30,--Ò»Ìì×î¶à»ñµÃ¶àÉÙ´ú±Ò
		t_stage =
		{
--			[1] = inherit(_t_free_award_no_stage, _t_free_award_stage[1]),
--			[2] = inherit(_t_free_award_no_stage, _t_free_award_stage[2]),
--			[3] = inherit(_t_free_award_no_stage, _t_free_award_stage[3]),
			[4] = inherit(_t_free_award_no_stage, _t_free_award_stage[4]),
		},
	},
	
	t_fix_award = 
	{
		sz_award_title = "PhÇn th­ëng cè ®Þnh Khiªu ChiÕn V¹n KiÕm Tròng",
		t_stage = _t_fix_award_stage,
	},
	--------------------------------------------
	t_ib_award = 
	{
		sz_award_title = "Khu lËt thÎ Khiªu ChiÕn V¹n KiÕm Tròng (Thu phÝ)",
		t_stage = 
		{
--			[1] = _t_ib_award_no_stage,
--			[2] = _t_ib_award_no_stage,
--			[3] = _t_ib_award_no_stage,
			[4] = _t_ib_award_no_stage,
		},
	},
}

_t_free_award_no_stage = nil
_t_free_award_stage = nil
_t_fix_award_stage = nil
_t_ib_award_no_stage = nil
