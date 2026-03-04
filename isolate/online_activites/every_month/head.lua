--不经常修改的配置项写这里
Include("\\script\\isolate\\online_activites\\every_month\\config.lua")
ENABLE_EXTEND_EVENT = 1

tStaticConfig  =  {
    --tExpPrize = {1000000, 1000000, 1500000},
	tProductsMaxUse = {2000, 2000, 2000}, --产品最大使用次数
	tProductsExtAward = {200, 200, 200}, --使用次数达到这么多 随机给奖励组2
	nExtAwardBegin = 600,
	--tNormalRoomWeightCheck = {3, 100},
	--tFinalRoomWeightCheck = {5, 100},
	tProductPrize = {--使用产品奖励
		[1] = {"act_2xu_free", "act_2xu_free2"},
		[2] = {"act_2xu_free", "act_2xu_free2"},
		[3] = {"act_2xu_ib", "act_2xu_ib2"},
	},
	tExtraPrize = {
		[1] = {
			--room, 
			[200] = {3, 
					{
						{"Thi猲 Th筩h Tinh Th筩h", 2, 1, 1009, 1, 1, 7},
					},
				},
			[400] = {3,
					{
						{"Cng h鉧 quy觧 13", 2, 1, 30425, 1, 1, 7},
					},
				},
		},
		[2] = {
			--room, award
			[200] = {3, 
					{
						{"Thi猲 Th筩h Tinh Th筩h", 2, 1, 1009, 1, 1, 7},
					},
				},
			[400] = {3,
					{
						{"Cng h鉧 quy觧 13", 2, 1, 30425, 1, 1, 7},
					},
				},
		},
		[3] = {
			--room, 
			[200] = {3, 
					{
						{"Thi猲 Th筩h Tinh Th筩h", 2, 1, 1009, 1, 1, 7},
					},
				},
			[400] = {3,
					{
						{"Cng h鉧 quy觧 15", 2, 1, 30427, 1, 1, 7},
					},
				},
		},
	},
}

