--脚本功能：剑网2越南-2011年六月资料片-合成道具调用统一界面
--功能设计：大熊
--功能开发：村长
--功能测试：小熊
--开发时间：2011-5-5
--修改记录：
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\lib\\globalfunctions.lua");
nTaskTempId_Item_HashCode = 249
SClew = "<color=green>公告<color>:"
tEquipSeriesName = {
    "精刻","天义","九州","皓月","曜阳"
}
tEquipPosName = {
    "头部","上衣","下装","武器","饰品"
}
--===装备发放禁止表
tReleaseForbiddenList = {
    tMetiral = {
        ["皓月玄金"] = 1,
        ["五行玄金"] = 1,
        ["曜阳九玄"] = 1,
    },
    tEquip = {
        --皓月：全屏屏蔽
        [4] ={1,2,3,4,5},
        --曜阳：全屏屏蔽
        [5] = {1,2,3,4,5},
    },
}
tMetiralInfo = {
    ["星痕碎片"] = {
        {2,1,30299},
        "参与【天门阵】活动可获得",
    },
    ["五行玄石"] = {
        {2,1,30302},
        "参与【梁山闯关】可获得",
    },
    ["天义精铁"] = {
        {2,1,30300},
        "由【星痕碎片】升级获得",
    },
    ["五行玄铁"] = {
        {2,1,30303},
        "由【五行玄石】升级获得",
    },
    ["天罡令"] = {
        {2,95,204},
        "来源：【梁山闯关】",
    },
    ["皓月玄金"] = {
        {2,1,30301},
        "由【天义精铁】升级获得",
    },
    ["五行玄金"] = {
        {2,1,30304},
        "由【五行玄铁】升级获得",
    },
    ["曜阳九玄"] = {
        {2,1,30298},
        "合成材料：【天罡令】（梁山闯关）、【皓月玄金】、【五行玄金】",
    },
}

tItemSynthInfo = {
	["天义精铁"] = {
		{
			{"星痕碎片",2},
			{"金币",2},
		},
		2
	},
	["五行玄铁"] = {
		{
			{"五行玄石",2},
			{"金币",2},
		},
		2
	},
	["皓月玄金"] = {
		{
			{"天义精铁",3},
			{"金币",6},
		},
		6
	},
	["五行玄金"] = {
		{
			{"五行玄铁",3},
			{"金币",6},
		},
		6
	},
	["曜阳九玄"] = {
		{
			{"天罡令",3},
			{"五行玄金",99},
			{"皓月玄金",99},
		},
		2
	},
}

tArmIdInfo = {
	[1] = {
		[1] = {
			{
                {"精刻-九阳日冠",0,103,3033}, {"精刻-九阴月冠",0,103,3036},
            },{
                {"精刻-九阳日冠",0,103,3039}, {"精刻-九阴月冠",0,103,3042},
            },{
                {"精刻-九阳日冠",0,103,3045}, {"精刻-九阴月冠",0,103,3048},
            },{
                {"精刻-九阳日冠",0,103,3051}, {"精刻-九阴月冠",0,103,3054},
			},
		},
		[2] = {
			{
                {"天义-九阳日冠",0,103,3034}, {"天义-九阴月冠",0,103,3037}
            },{
                {"天义-九阳日冠",0,103,3040}, {"天义-九阴月冠",0,103,3043}
            },{
                {"天义-九阳日冠",0,103,3046}, {"天义-九阴月冠",0,103,3049}
            },{
                {"天义-九阳日冠",0,103,3052}, {"天义-九阴月冠",0,103,3055}
			},
		},
		[3] = {
			{
                {"龙腾四海冠",0,103,3056}, {"凤舞九天冠",0,103,3060}
            },{
                {"龙腾四海冠",0,103,3057}, {"凤舞九天冠",0,103,3061}
            },{
                {"龙腾四海冠",0,103,3058}, {"凤舞九天冠",0,103,3062}
            },{
                {"龙腾四海冠",0,103,3059}, {"凤舞九天冠",0,103,3063}
			},
		},
		[4] = {
[2] =  {{"皓月-渡厄尊极帽",0,103,3064},   {"皓月-渡厄尊极帽",0,103,3065}},
[3] =  {{"皓月-度厄尊极帽",0,103,3068},   {"皓月-度厄尊极帽",0,103,3069}},
[4] =  {{"皓月-渡劫尊极帽",0,103,3066},   {"皓月-渡劫尊极帽",0,103,3067}},
[6] =  {{"皓月-万劫圣体冠",0,103,3070},   {"皓月-万劫圣体冠",0,103,3071},{"皓月-万劫圣体冠",0,103,3072},{"皓月-万劫圣体冠",0,103,3073}},
[8] =  {nil,                nil,                {"皓月-佛韵圣极簪",0,103,3074},{"皓月-佛韵圣极簪",0,103,3075}},
[9] =  {nil,                nil,                {"皓月-佛尘圣极簪",0,103,3076},{"皓月-佛尘圣极簪",0,103,3077}},
[11] = {{"皓月-逐凤天盖巾",0,103,3078},   {"皓月-逐凤天盖巾",0,103,3079},{"皓月-逐凤天盖巾",0,103,3080},{"皓月-逐凤天盖巾",0,103,3081}},
[12] = {{"皓月-游龙地乞巾",0,103,3082},   {"皓月-游龙地乞巾",0,103,3083},{"皓月-游龙地乞巾",0,103,3084},{"皓月-游龙地乞巾",0,103,3085}},
[14] = {{"皓月-无极天尊冠",0,103,3086},   {"皓月-无极天尊冠",0,103,3087},{"皓月-无极天尊冠",0,103,3088},{"皓月-无极天尊冠",0,103,3089}},
[15] = {{"皓月-碧罗天尊冠",0,103,3090},   {"皓月-碧罗天尊冠",0,103,3091},{"皓月-碧罗天尊冠",0,103,3092},{"皓月-碧罗天尊冠",0,103,3093}},
[17] = {{"皓月-撼天斗魂盔",0,103,3094},   {"皓月-撼天斗魂盔",0,103,3095},{"皓月-撼天斗魂盔",0,103,3096},{"皓月-撼天斗魂盔",0,103,3097}},
[18] = {{"皓月-定天神武盔",0,103,3098},   {"皓月-定天神武盔",0,103,3099},{"皓月-定天神武盔",0,103,3100},{"皓月-定天神武盔",0,103,3101}},
[20] = {{"皓月-鬼宿死神巾",0,103,3102},   {"皓月-鬼宿死神巾",0,103,3103},{"皓月-鬼宿死神巾",0,103,3104},{"皓月-鬼宿死神巾",0,103,3105}},
[21] = {{"皓月-巫骨毒王巾",0,103,3106},   {"皓月-巫骨毒王巾",0,103,3107},{"皓月-巫骨毒王巾",0,103,3108},{"皓月-巫骨毒王巾",0,103,3109}},
[23] = {{"皓月-不动真仙冠",0,103,3110},   {"皓月-不动真仙冠",0,103,3111},nil,nil},
[29] = {nil,nil,{"皓月-紫云仙子簪",0,103,3124},{"皓月-紫云仙子簪",0,103,3125}},
[30] = {nil,nil,{"皓月-飞虹仙子簪",0,103,3126},{"皓月-飞虹仙子簪",0,103,3127}},
		},
		[5] = {
[2] =  {{"曜阳-渡厄尊极帽",0,103,3128},   {"曜阳-渡厄尊极帽",0,103,3129}},
[3] =  {{"曜阳-度厄尊极帽",0,103,3132},   {"曜阳-度厄尊极帽",0,103,3133}},
[4] =  {{"曜阳-渡劫尊极帽",0,103,3130},   {"曜阳-渡劫尊极帽",0,103,3131}},
[6] =  {{"曜阳-万劫圣体冠",0,103,3134},   {"曜阳-万劫圣体冠",0,103,3135},{"曜阳-万劫圣体冠",0,103,3136},{"曜阳-万劫圣体冠",0,103,3137}},
[8] =  {nil,                nil,                {"曜阳-佛韵圣极簪",0,103,3138},{"曜阳-佛韵圣极簪",0,103,3139}},
[9] =  {nil,                nil,                {"曜阳-佛尘圣极簪",0,103,3140},{"曜阳-佛尘圣极簪",0,103,3141}},
[11] = {{"曜阳-逐凤天盖巾",0,103,3142},   {"曜阳-逐凤天盖巾",0,103,3143},{"曜阳-逐凤天盖巾",0,103,3144},{"曜阳-逐凤天盖巾",0,103,3145}},
[12] = {{"曜阳-游龙地乞巾",0,103,3146},   {"曜阳-游龙地乞巾",0,103,3147},{"曜阳-游龙地乞巾",0,103,3148},{"曜阳-游龙地乞巾",0,103,3149}},
[14] = {{"曜阳-无极天尊冠",0,103,3150},   {"曜阳-无极天尊冠",0,103,3151},{"曜阳-无极天尊冠",0,103,3152},{"曜阳-无极天尊冠",0,103,3153}},
[15] = {{"曜阳-碧罗天尊冠",0,103,3154},   {"曜阳-碧罗天尊冠",0,103,3155},{"曜阳-碧罗天尊冠",0,103,3156},{"曜阳-碧罗天尊冠",0,103,3157}},
[17] = {{"曜阳-撼天斗魂盔",0,103,3158},   {"曜阳-撼天斗魂盔",0,103,3159},{"曜阳-撼天斗魂盔",0,103,3160},{"曜阳-撼天斗魂盔",0,103,3161}},
[18] = {{"曜阳-定天神武盔",0,103,3162},   {"曜阳-定天神武盔",0,103,3163},{"曜阳-定天神武盔",0,103,3164},{"曜阳-定天神武盔",0,103,3165}},
[20] = {{"曜阳-鬼宿死神巾",0,103,3166},   {"曜阳-鬼宿死神巾",0,103,3167},{"曜阳-鬼宿死神巾",0,103,3168},{"曜阳-鬼宿死神巾",0,103,3169}},
[21] = {{"曜阳-巫骨毒王巾",0,103,3170},   {"曜阳-巫骨毒王巾",0,103,3171},{"曜阳-巫骨毒王巾",0,103,3172},{"曜阳-巫骨毒王巾",0,103,3173}},
[23] = {{"曜阳-不动真仙冠",0,103,3174},   {"曜阳-不动真仙冠",0,103,3175},nil,nil},
[29] = {nil,nil,{"曜阳-紫云仙子簪",0,103,3188},{"曜阳-紫云仙子簪",0,103,3189}},
[30] = {nil,nil,{"曜阳-飞虹仙子簪",0,103,3190},{"曜阳-飞虹仙子簪",0,103,3191}},
		},
	},
	[2] ={
		[1] = {
			{
		{"精刻-九阳火衣",0,100,3033},{"精刻-九阴水衣",0,100,3036}
		},{
	    {"精刻-九阳火衣",0,100,3039},{"精刻-九阴水衣",0,100,3042}
		},{
	    {"精刻-九阳火衣",0,100,3045},{"精刻-九阴水衣",0,100,3048}
		},{
		{"精刻-九阳火衣",0,100,3051},{"精刻-九阴水衣",0,100,3054}
			},
		},
		[2] = {
			{
	    {"天义-九阳火衣",0,100,3034},{"天义-九阴水衣",0,100,3037}
		},{
	    {"天义-九阳火衣",0,100,3040},{"天义-九阴水衣",0,100,3043}
		},{
	    {"天义-九阳火衣",0,100,3046},{"天义-九阴水衣",0,100,3049}
		},{
	    {"天义-九阳火衣",0,100,3052},{"天义-九阴水衣",0,100,3055}
			},
		},
		[3] = {
			{
	    {"龙腾四海衣",0,100,3056},{"凤舞九天衣",0,100,3060},
		},{
	    {"龙腾四海衣",0,100,3057},{"凤舞九天衣",0,100,3061},
		},{
	    {"龙腾四海衣",0,100,3058},{"凤舞九天衣",0,100,3062},
		},{
	    {"龙腾四海衣",0,100,3059},{"凤舞九天衣",0,100,3063},
			},
		},
[4] = {
    [2] =     {{"皓月-渡厄尊极袍",0,100,3064},    {"皓月-渡厄尊极袍",0,100,3065}},
    [3] =     {{"皓月-度厄尊极袍",0,100,3068},    {"皓月-度厄尊极袍",0,100,3069}},
    [4] =     {{"皓月-渡劫尊极袍",0,100,3066},    {"皓月-渡劫尊极袍",0,100,3067}},
    [6] =     {{"皓月-万劫圣体衣",0,100,3070},    {"皓月-万劫圣体衣",0,100,3071},{"皓月-万劫圣体衣",0,100,3072},{"皓月-万劫圣体衣",0,100,3073}},
    [8] =     {nil,                                nil,                            {"皓月-佛韵圣极衣",0,100,3074},{"皓月-佛韵圣极衣",0,100,3075}},
    [9] =     {nil,                                nil,                            {"皓月-佛尘圣极衣",0,100,3076},{"皓月-佛尘圣极衣",0,100,3077}},
    [11] =     {{"皓月-逐凤天盖衣",0,100,3078},    {"皓月-逐凤天盖衣",0,100,3079},{"皓月-逐凤天盖衣",0,100,3080},{"皓月-逐凤天盖衣",0,100,3081}},
    [12] =     {{"皓月-游龙地乞衣",0,100,3082},    {"皓月-游龙地乞衣",0,100,3083},{"皓月-游龙地乞衣",0,100,3084},{"皓月-游龙地乞衣",0,100,3085}},
    [14] =     {{"皓月-无极天尊袍",0,100,3086},    {"皓月-无极天尊袍",0,100,3087},{"皓月-无极天尊袍",0,100,3088},{"皓月-无极天尊袍",0,100,3089}},
    [15] =     {{"皓月-碧罗天尊袍",0,100,3090},    {"皓月-碧罗天尊袍",0,100,3091},{"皓月-碧罗天尊袍",0,100,3092},{"皓月-碧罗天尊袍",0,100,3093}},
    [17] =     {{"皓月-撼天斗魂甲",0,100,3094},    {"皓月-撼天斗魂甲",0,100,3095},{"皓月-撼天斗魂甲",0,100,3096},{"皓月-撼天斗魂甲",0,100,3097}},
    [18] =     {{"皓月-定天神武甲",0,100,3098},    {"皓月-定天神武甲",0,100,3099},{"皓月-定天神武甲",0,100,3100},{"皓月-定天神武甲",0,100,3101}},
    [20] =     {{"皓月-鬼宿死神衣",0,100,3102},    {"皓月-鬼宿死神衣",0,100,3103},{"皓月-鬼宿死神衣",0,100,3104},{"皓月-鬼宿死神衣",0,100,3105}},
    [21] =     {{"皓月-巫骨毒王衣",0,100,3106},    {"皓月-巫骨毒王衣",0,100,3107},{"皓月-巫骨毒王衣",0,100,3108},{"皓月-巫骨毒王衣",0,100,3109}},
    [23] =     {{"皓月-不动真仙袍",0,100,3110}, {"皓月-不动真仙袍",0,100,3111},nil,nil},
    [29] =     {nil,nil,{"皓月-紫云仙子衣",0,100,3124},{"皓月-紫云仙子衣",    0,100,3125}},
    [30] =     {nil,nil,{"皓月-飞虹仙子衣",0,100,3126},{"皓月-飞虹仙子衣",    0,100,3127}},
},
[5] = {
    [2] =     {{"曜阳-渡厄尊极袍",0,100,3128},    {"曜阳-渡厄尊极袍",0,100,3129}},
    [3] =     {{"曜阳-度厄尊极袍",0,100,3132},    {"曜阳-度厄尊极袍",0,100,3133}},
    [4] =     {{"曜阳-渡劫尊极袍",0,100,3130},    {"曜阳-渡劫尊极袍",0,100,3131}},
    [6] =     {{"曜阳-万劫圣体衣",0,100,3134},    {"曜阳-万劫圣体衣",0,100,3135},{"曜阳-万劫圣体衣",0,100,3136},{"曜阳-万劫圣体衣",0,100,3137}},
    [8] =     {nil,                                nil,                            {"曜阳-佛韵圣极衣",0,100,3138},{"曜阳-佛韵圣极衣",0,100,3139}},
    [9] =     {nil,                                nil,                            {"曜阳-佛尘圣极衣",0,100,3140},{"曜阳-佛尘圣极衣",0,100,3141}},
    [11] =     {{"曜阳-逐凤天盖衣",0,100,3142},    {"曜阳-逐凤天盖衣",0,100,3143},{"曜阳-逐凤天盖衣",0,100,3144},{"曜阳-逐凤天盖衣",0,100,3145}},
    [12] =     {{"曜阳-游龙地乞衣",0,100,3146},    {"曜阳-游龙地乞衣",0,100,3147},{"曜阳-游龙地乞衣",0,100,3148},{"曜阳-游龙地乞衣",0,100,3149}},
    [14] =     {{"曜阳-无极天尊袍",0,100,3150},    {"曜阳-无极天尊袍",0,100,3151},{"曜阳-无极天尊袍",0,100,3152},{"曜阳-无极天尊袍",0,100,3153}},
    [15] =     {{"曜阳-碧罗天尊袍",0,100,3154},    {"曜阳-碧罗天尊袍",0,100,3155},{"曜阳-碧罗天尊袍",0,100,3156},{"曜阳-碧罗天尊袍",0,100,3157}},
    [17] =     {{"曜阳-撼天斗魂甲",0,100,3158},    {"曜阳-撼天斗魂甲",0,100,3159},{"曜阳-撼天斗魂甲",0,100,3160},{"曜阳-撼天斗魂甲",0,100,3161}},
    [18] =     {{"曜阳-定天神武甲",0,100,3162},    {"曜阳-定天神武甲",0,100,3163},{"曜阳-定天神武甲",0,100,3164},{"曜阳-定天神武甲",0,100,3165}},
    [20] =     {{"曜阳-鬼宿死神衣",0,100,3166},    {"曜阳-鬼宿死神衣",0,100,3167},{"曜阳-鬼宿死神衣",0,100,3168},{"曜阳-鬼宿死神衣",0,100,3169}},
    [21] =     {{"曜阳-巫骨毒王衣",0,100,3170},    {"曜阳-巫骨毒王衣",0,100,3171},{"曜阳-巫骨毒王衣",0,100,3172},{"曜阳-巫骨毒王衣",0,100,3173}},
    [23] =     {{"曜阳-不动真仙袍",0,100,3174}, {"曜阳-不动真仙袍",0,100,3175},nil,nil},
    [29] =     {nil,nil,{"曜阳-紫云仙子衣",0,100,3188},{"曜阳-紫云仙子衣",    0,100,3189}},
    [30] =     {nil,nil,{"曜阳-飞虹仙子衣",0,100,3190},{"曜阳-飞虹仙子衣",    0,100,3191}},
},

	[3] ={
		[1] = {
			{
            {"精刻-九阳龙装",0,101,3033}, {"精刻-九阴凤装",0,101,3036},
        },{
            {"精刻-九阳龙装",0,101,3039}, {"精刻-九阴凤装",0,101,3042},
        },{
            {"精刻-九阳龙装",0,101,3045}, {"精刻-九阴凤装",0,101,3048},
        },{
            {"精刻-九阳龙装",0,101,3051}, {"精刻-九阴凤装",0,101,3054}
			},
		},
		[2] = {
			{
            {"天义-九阳龙装",0,101,3034}, {"天义-九阴凤装",0,101,3037},
        },{
            {"天义-九阳龙装",0,101,3040}, {"天义-九阴凤装",0,101,3043},
        },{
            {"天义-九阳龙装",0,101,3046}, {"天义-九阴凤装",0,101,3049},
        },{
            {"天义-九阳龙装",0,101,3052}, {"天义-九阴凤装",0,101,3055},
			},
		},
		[3] = {
			{
            {"龙腾四海装",0,101,3056}, {"凤舞九天装",0,101,3060},
        },{
            {"龙腾四海装",0,101,3057}, {"凤舞九天装",0,101,3061},
        },{
            {"龙腾四海装",0,101,3058}, {"凤舞九天装",0,101,3062},
        },{
            {"龙腾四海装",0,101,3059}, {"凤舞九天装",0,101,3063},
			},
		},
		[4] = {
    [2] =     {{"皓月-渡厄尊极装",0,101,3064},    {"皓月-渡厄尊极装",0,101,3065}},
    [3] =     {{"皓月-度厄尊极装",0,101,3068},    {"皓月-度厄尊极装",0,101,3069}},
    [4] =     {{"皓月-渡劫尊极装",0,101,3066},    {"皓月-渡劫尊极装",0,101,3067}},
    [6] =     {{"皓月-万劫圣体装",0,101,3070},    {"皓月-万劫圣体装",0,101,3071},{"皓月-万劫圣体装",0,101,3072},{"皓月-万劫圣体装",0,101,3073}},
    [8] =     {nil,                                nil,                            {"皓月-佛韵圣极裤",0,101,3074},{"皓月-佛韵圣极裤",0,101,3075}},
    [9] =     {nil,                                nil,                            {"皓月-佛尘圣极裤",0,101,3076},{"皓月-佛尘圣极裤",0,101,3077}},
    [11] =     {{"皓月-逐凤天盖装",0,101,3078},    {"皓月-逐凤天盖装",0,101,3079},{"皓月-逐凤天盖装",0,101,3080},{"皓月-逐凤天盖装",0,101,3081}},
    [12] =     {{"皓月-游龙地乞装",0,101,3082},    {"皓月-游龙地乞装",0,101,3083},{"皓月-游龙地乞装",0,101,3084},{"皓月-游龙地乞装",0,101,3085}},
    [14] =     {{"皓月-无极天尊装",0,101,3086},    {"皓月-无极天尊装",0,101,3087},{"皓月-无极天尊装",0,101,3088},{"皓月-无极天尊装",0,101,3089}},
    [15] =     {{"皓月-碧罗天尊装",0,101,3090},    {"皓月-碧罗天尊装",0,101,3091},{"皓月-碧罗天尊装",0,101,3092},{"皓月-碧罗天尊装",0,101,3093}},
    [17] =     {{"皓月-撼天斗魂装",0,101,3094},    {"皓月-撼天斗魂装",0,101,3095},{"皓月-撼天斗魂装",0,101,3096},{"皓月-撼天斗魂装",0,101,3097}},
    [18] =     {{"皓月-定天神武装",0,101,3098},    {"皓月-定天神武装",0,101,3099},{"皓月-定天神武装",0,101,3100},{"皓月-定天神武装",0,101,3101}},
    [20] =     {{"皓月-鬼宿死神装",0,101,3102},    {"皓月-鬼宿死神装",0,101,3103},{"皓月-鬼宿死神装",0,101,3104},{"皓月-鬼宿死神装",0,101,3105}},
    [21] =     {{"皓月-巫骨毒王装",0,101,3106},    {"皓月-巫骨毒王装",0,101,3107},{"皓月-巫骨毒王装",0,101,3108},{"皓月-巫骨毒王装",0,101,3109}},
    [23] =     {{"皓月-不动真仙装",0,101,3110}, {"皓月-不动真仙装",0,101,3111},nil,nil},
    [29] =     {nil,nil,{"皓月-紫云仙子裤",0,101,3124},{"皓月-紫云仙子裤",    0,101,3125}},
    [30] =     {nil,nil,{"皓月-飞虹仙子",0,101,3126},{"皓月-飞虹仙子",    0,101,3127}},
		},
		[5] = {
    [2] =     {{"曜阳-渡厄尊极装",0,101,3128},    {"曜阳-渡厄尊极装",0,101,3129}},
    [3] =     {{"曜阳-度厄尊极装",0,101,3132},    {"曜阳-度厄尊极装",0,101,3133}},
    [4] =     {{"曜阳-渡劫尊极装",0,101,3130},    {"曜阳-渡劫尊极装",0,101,3131}},
    [6] =     {{"曜阳-万劫圣体装",0,101,3134},    {"曜阳-万劫圣体装",0,101,3135},{"曜阳-万劫圣体装",0,101,3136},{"曜阳-万劫圣体装",0,101,3137}},
    [8] =     {nil,                                nil,                            {"曜阳-佛韵圣极裤",0,101,3138},{"曜阳-佛韵圣极裤",0,101,3139}},
    [9] =     {nil,                                nil,                            {"曜阳-佛尘圣极裤",0,101,3140},{"曜阳-佛尘圣极裤",0,101,3141}},
    [11] =     {{"曜阳-逐凤天盖装",0,101,3142},    {"曜阳-逐凤天盖装",0,101,3143},{"曜阳-逐凤天盖装",0,101,3144},{"曜阳-逐凤天盖装",0,101,3145}},
    [12] =     {{"曜阳-游龙地乞装",0,101,3146},    {"曜阳-游龙地乞装",0,101,3147},{"曜阳-游龙地乞装",0,101,3148},{"曜阳-游龙地乞装",0,101,3149}},
    [14] =     {{"曜阳-无极天尊装",0,101,3150},    {"曜阳-无极天尊装",0,101,3151},{"曜阳-无极天尊装",0,101,3152},{"曜阳-无极天尊装",0,101,3153}},
    [15] =     {{"曜阳-碧罗天尊装",0,101,3154},    {"曜阳-碧罗天尊装",0,101,3155},{"曜阳-碧罗天尊装",0,101,3156},{"曜阳-碧罗天尊装",0,101,3157}},
    [17] =     {{"曜阳-撼天斗魂装",0,101,3158},    {"曜阳-撼天斗魂装",0,101,3159},{"曜阳-撼天斗魂装",0,101,3160},{"曜阳-撼天斗魂装",0,101,3161}},
    [18] =     {{"曜阳-定天神武装",0,101,3162},    {"曜阳-定天神武装",0,101,3163},{"曜阳-定天神武装",0,101,3164},{"曜阳-定天神武装",0,101,3165}},
    [20] =     {{"曜阳-鬼宿死神装",0,101,3166},    {"曜阳-鬼宿死神装",0,101,3167},{"曜阳-鬼宿死神装",0,101,3168},{"曜阳-鬼宿死神装",0,101,3169}},
    [21] =     {{"曜阳-巫骨毒王装",0,101,3170},    {"曜阳-巫骨毒王装",0,101,3171},{"曜阳-巫骨毒王装",0,101,3172},{"曜阳-巫骨毒王装",0,101,3173}},
    [23] =     {{"曜阳-不动真仙装",0,101,3174}, {"曜阳-不动真仙装",0,101,3175},nil,nil},
    [29] =     {nil,nil,{"曜阳-紫云仙子裤",0,101,3188},{"曜阳-紫云仙子裤",    0,101,3189}},
    [30] =     {nil,nil,{"曜阳-飞虹仙子",0,101,3190},{"曜阳-飞虹仙子",    0,101,3191}},
		},
	},
}
tRingIdInfo = {
	[1] = {
        {"精刻-玄石金玉(力量饰品)",0,102,3121},
        {"精刻-翡翠木带(身法饰品)",0,102,3124},
        {"精刻-月华水佩(内功饰品)",0,102,3127},
        {"精刻-九阴火戒(敏捷饰品)",0,102,3130},
        {"精刻-凝玉土环(筋骨饰品)",0,102,3133},
    },
    [2] = {
        {"天义-玄石金玉(力量饰品)",0,102,3122},
        {"天义-翡翠木带(身法饰品)",0,102,3125},
        {"天义-月华水佩(内功饰品)",0,102,3128},
        {"天义-九阴火戒(敏捷饰品)",0,102,3131},
        {"天义-凝玉土环(筋骨饰品)",0,102,3134},
    },
    [3] = {
        [2] = {
            {"九州-凝玉土环",0,102,3135},
            {"九州-玄石金玉",0,102,3136},
        },
        [3] = {
            {"九州-凝玉土环",0,102,3137},
            {"九州-月华水佩",0,102,3138},
        },
        [4] = {
            {"九州-月华水佩",0,102,3139},
            {"九州-翡翠木带",0,102,3140},
        },
        [6] = {
            {"九州-翡翠木带",0,102,3141},
            {"九州-玄石金玉",0,102,3142},
        },
        [8] = {
            {"九州-凝玉土环",0,102,3143},
            {"九州-月华水佩",0,102,3144},
        },
        [9] = {
            {"九州-翡翠木带",0,102,3145},
            {"九州-月华水佩",0,102,3146},
        },
        [11] = {
            {"九州-凝玉土环",0,102,3147},
            {"九州-玄石金玉",0,102,3148},
        },
        [12] = {
            {"九州-翡翠木带",0,102,3149},
            {"九州-九幽火戒",0,102,3150},
        },
        [14] = {
            {"九州-月华水佩",0,102,3151},
            {"九州-九幽火戒",0,102,3152},
        },
        [15] = {
            {"九州-九幽火戒",0,102,3153},
            {"九州-翡翠木带",0,102,3154},
        },
        [17] = {
            {"九州-凝玉土环",0,102,3155},
            {"九州-玄石金玉",0,102,3156},
        },
        [18] = {
            {"九州-翡翠木带",0,102,3157},
            {"九州-玄石金玉",0,102,3158},
        },
        [20] = {
            {"九州-翡翠木带",0,102,3159},
            {"九州-月华水佩",0,102,3160},
        },
        [21] = {
            {"九州-九幽火戒",0,102,3161},
            {"九州-月华水佩",0,102,3162},
        },
        [23] = {
            {"九州-月华水佩",0,102,3163},
            {"九州-九幽火戒",0,102,3164},
        },
        [29] = {
            {"九州-翡翠木带",0,102,3171},
            {"九州-玄石金玉",0,102,3172},
        },
        [30] = {
            {"九州-凝玉土环",0,102,3173},
            {"九州-九幽火戒",0,102,3174},
        },
    },
	[4] = {
    {"皓月-玉麟宝戒(力量饰品)",0,102,3175},
    {"皓月-紫蛟玉佩(身法饰品)",0,102,3177},
    {"皓月-云鹤令牌(内功饰品)",0,102,3179},
    {"皓月-朱雀赤环(敏捷饰品)",0,102,3181},
    {"皓月-碧珪项链(筋骨饰品)",0,102,3183},
},
[5] = {
    {"曜阳-玉麟宝戒(力量饰品)",0,102,3176},
    {"曜阳-紫蛟玉佩(身法饰品)",0,102,3178},
    {"曜阳-云鹤令牌(内功饰品)",0,102,3180},
    {"曜阳-朱雀赤环(敏捷饰品)",0,102,3182},
    {"曜阳-碧珪项链(筋骨饰品)",0,102,3184},
	},
}
tWeaponIdInfo = {
    [1] = {
        [2]={"精刻-琉璃戒刀",0,3,8892},
        [3]={"精刻-惊雷禅杖",0,8,8909},
        [4]={"精刻-雷音囊柩",0,0,8874},
        [6]={"精刻-阴阳穿影",0,1,8879},
        [8]={"精刻-紫寒阴剑",0,2,8884},
        [9]={"精刻-九环贝琴",0,10,8918},
        [11]={"精刻-龟麟壶柩",0,0,8875},
        [12]={"精刻-镇傲棍",0,5,8900},
        [14]={"精刻-纯风剑",0,2,8885},
        [15]={"精刻-星斗转笔",0,9,8913},
        [17]={"精刻-斧钺阵枪",0,6,8903},
        [18]={"精刻-追命弓",0,4,8897},
        [20]={"精刻-涉骨血刀",0,7,8906},
        [21]={"精刻-炼魂血爪",0,11,8922},
        [23]={"精刻-御天锋剑", 0, 2, 8886},
        [29]={"精刻-玲珑刺", 0, 13, 8930},
        [30]={"精刻-九霄箫", 0, 12, 8927},
    },
    [2] = {
        [2]={"天义-琉璃戒刀",0,3,8894},
        [3]={"天义-惊雷禅杖",0,8,8910},
        [4]={"天义-雷音囊柩",0,0,8876},
        [6]={"天义-阴阳穿影",0,1,8880},
        [8]={"天义-紫寒阴剑",0,2,8887},
        [9]={"天义-九环贝琴",0,10,8919},
        [11]={"天义-龟麟壶柩",0,0,8877},
        [12]={"天义-镇傲棍",0,5,8901},
        [14]={"天义-纯风剑",0,2,8888},
        [15]={"天义-星斗转笔",0,9,8915},
        [17]={"天义-斧钺阵枪",0,6,8904},
        [18]={"天义-追命弓",0,4,8898},
        [20]={"天义-涉骨血刀",0,7,8907},
        [21]={"天义-炼魂血爪",0,11,8924},
        [23]={"天义-御天锋剑", 0, 2, 8889},
        [29]={"天义-玲珑刺", 0, 13, 8931},
        [30]={"天义-九霄箫", 0, 12, 8928},
    },
    [3] = {
        [2]={"九州-琉璃戒刀",0,3,8932},
        [3]={"九州-惊雷禅杖",0,8,8934},
        [4]={"九州-雷音囊柩",0,0,8933},
        [6]={"九州-阴阳穿影",0,1,8935},
        [8]={"九州-紫寒阴剑",0,2,8936},
        [9]={"九州-九环贝琴",0,10,8937},
        [11]={"九州-龟麟壶柩",0,0,8938},
        [12]={"九州-镇傲棍",0,5,8939},
        [14]={"九州-纯风剑",0,2,8940},
        [15]={"九州-星斗转笔",0,9,8941},
        [17]={"九州-斧钺阵枪",0,6,8942},
        [18]={"九州-追命弓",0,4,8943},
        [20]={"九州-涉骨血刀",0,7,8944},
        [21]={"九州-炼魂血爪",0,11,8945},
        [23]={"九州-御天锋剑", 0, 2, 8946},
        [29]={"九州-玲珑刺", 0, 13, 8950},
        [30]={"九州-九霄箫", 0, 12, 8951},
    },
    [4] = {
        [2]={"皓月-渡厄尊极佛刀",0,3,8972,1},
        [3]={"皓月-渡劫尊极佛柩",0,0,8973,1},
        [4]={"皓月-度厄尊极佛杖",0,8,8974,1},
        [6]={"皓月-万劫圣体针",0,1,8975,1},
        [8]={"皓月-佛韵圣极莲剑",0,2,8976,1},
        [9]={"皓月-佛尘圣极琴",0,10,8977,1},
        [11]={"皓月-逐凤天盖壶",0,0,8978,1},
        [12]={"皓月-游龙地乞棍",0,5,8979,1},
        [14]={"皓月-无极天尊宿剑",0,2,8980,1},
        [15]={"皓月-碧罗天尊笔",0,9,8981,1},
        [17]={"皓月-撼天斗魂枪",0,6,8982,1},
        [18]={"皓月-定天神武弓",0,4,8983,1},
        [20]={"皓月-鬼宿死神刀",0,7,8984,1},
        [21]={"皓月-巫骨毒王爪",0,11,8985,1},
        [23]={"皓月-不动真仙剑", 0, 2, 8986},
        [29]={"皓月-紫云仙子扇", 0, 13, 8990},
        [30]={"皓月-飞虹仙子幽兰箫", 0, 12, 8991},
    },
    [5] = {
        [2]={"曜阳-渡厄尊极佛刀",0,3,8992},
        [3]={"曜阳-渡劫尊极佛柩",0,0,8993},
        [4]={"曜阳-度厄尊极佛杖",0,8,8994},
        [6]={"曜阳-万劫圣体针",0,1,8995},
        [8]={"曜阳-佛韵圣极莲剑",0,2,8996},
        [9]={"曜阳-佛尘圣极琴",0,10,8997},
        [11]={"曜阳-逐凤天盖壶",0,0,8998},
        [12]={"曜阳-游龙地乞棍",0,5,8999},
        [14]={"曜阳-无极天尊宿剑",0,2,9000},
        [15]={"曜阳-碧罗天尊笔",0,9,9001},
        [17]={"曜阳-撼天斗魂枪",0,6,9002},
        [18]={"曜阳-定天神武弓",0,4,9003},
        [20]={"曜阳-鬼宿死神刀",0,7,9004},
        [21]={"曜阳-巫骨毒王爪",0,11,9005},
        [23]={"曜阳-不动真仙剑", 0, 2, 9006},
        [29]={"曜阳-紫云仙子扇", 0, 13, 9010},
        [30]={"曜阳-飞虹仙子幽兰箫", 0, 12, 9011},
    },
}

--装备总表
tQuipMainInfo = {
	tArmIdInfo[1],tArmIdInfo[2],tArmIdInfo[3],tWeaponIdInfo,tRingIdInfo
}
--兑换装备规则表
tEquipSynthInfo = {
	[1] = {		--星刻
		--头
		[1] = {
			--装备表
			tEquipInfo = tArmIdInfo[1][1],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"星纹碎片",300},
				{"精金",300},
			}
		},
		--衣服
		[2] = {
			--装备表
			tEquipInfo = tArmIdInfo[2][1],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"星纹碎片",360},
				{"精金",200},
			}
		},
		--下装
		[3] = {
			--装备表
			tEquipInfo = tArmIdInfo[3][1],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"星纹碎片",180},
				{"精金",100},
			}
		},
		--武器
		[4] = {
			--装备表
			tEquipInfo = tWeaponIdInfo[1],
			tTableStructure = {"Route"},
			--消耗表
			tEquipConsum = {
				{"星纹碎片",420},
				{"五行玄石",420},
				{"精金",400},
			}
		},
		--首饰
		[5] = {
			--装备表
			tEquipInfo = tRingIdInfo[1],
			--消耗表
			tEquipConsum = {
				{"五行玄石",420},
				{"精金",200},
			}
		},
	},
	[2] = {		--天仪
		--头
		[1] = {
			--装备表
			tEquipInfo = tArmIdInfo[1][2],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"天义精铁",480},
				{"精金",300},
			}
		},
		--衣服
		[2] = {
			--装备表
			tEquipInfo = tArmIdInfo[2][2],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"天义精铁",360},
				{"精金",200},
			}
		},
		--下装
		[3] = {
			--装备表
			tEquipInfo = tArmIdInfo[3][2],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"天义精铁",180},
				{"精金",100},
			}
		},
		--武器
		[4] = {
			--装备表
			tEquipInfo = tWeaponIdInfo[2],
			tTableStructure = {"Route"},
			--消耗表
			tEquipConsum = {
				{"五行玄铁",420},
				{"天义精铁",420},
				{"精金",400},
			}
		},
		--首饰
		[5] = {
			--装备表
			tEquipInfo = tRingIdInfo[2],
			--消耗表
			tEquipConsum = {
				{"五行玄铁",420},
				{"精金",200},
			}
		},
	},
	[3] = {		--九州
		--头
		[1] = {
			--装备表
			tEquipInfo = tArmIdInfo[1][4],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"天罡令",4},
				{"精金",200},
			},
		},
		--衣服
		[2] = {
			--装备表
			tEquipInfo = tArmIdInfo[2][4],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"天罡令",3},
				{"精金",150},
			},
		},
		--下装
		[3] = {
			--装备表
			tEquipInfo = tArmIdInfo[3][4],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"天罡令",2},
				{"精金",100},
			},
		},
		--武器
		[4] = {
			--装备表
			tEquipInfo = tWeaponIdInfo[4],
			tTableStructure = {"Route"},
			--消耗表
			tEquipConsum = {
				{"天罡令",6},
				{"精金",300},
			},
		},
		--首饰
		[5] = {
			--装备表
			tEquipInfo = tRingIdInfo[4],
			--表结构
			tTableStructure = {"Route"},
			--消耗表
			tEquipConsum = {
				{"天罡令",3},
				{"精金",150},
			},
		},
	},
	[4] = {		--皓月
		--头
		[1] = {
			--装备表
			tEquipInfo = tArmIdInfo[1][3],
			--表结构
			tTableStructure = {"Route","Body"},
			--消耗表
			tEquipConsum = {
				{"皓月玄金",480},
				{"精金",300},
			},
		},
		--衣服
		[2] = {
			--装备表
			tEquipInfo = tArmIdInfo[2][3],
			--表结构
			tTableStructure = {"Route","Body"},
			--消耗表
			tEquipConsum = {
				{"皓月玄金",360},
				{"精金",200},
			},
		},
		--下装
		[3] = {
			--装备表
			tEquipInfo = tArmIdInfo[3][3],
			--表结构
			tTableStructure = {"Route","Body"},
			--消耗表
			tEquipConsum = {
				{"皓月玄金",180},
				{"精金",100},
			},
		},
		--武器
		[4] = {
			--装备表
			tEquipInfo = tWeaponIdInfo[3],
			tTableStructure = {"Route"},
			--消耗表
			tEquipConsum = {
				{"皓月玄金",420},
				{"五行玄金",420},
				{"精金",400},
			},
		},
		--首饰
		[5] = {
			--装备表
			tEquipInfo = tRingIdInfo[3],
			--消耗表
			tEquipConsum = {
				{"五行玄金",420},
				{"精金",200},
			},
		},
	},
	[5] = {		--耀阳
		--头
		[1] = {
			--装备表
			tEquipInfo = tArmIdInfo[1][5],
			--表结构
			tTableStructure = {"Route","Body"},
			--消耗表
			tEquipConsum = {
				{"曜阳九玄",4},
				{"精金",400},
			},
		},
		--衣服
		[2] = {
			--装备表
			tEquipInfo = tArmIdInfo[2][5],
			--表结构
			tTableStructure = {"Route","Body"},
			--消耗表
			tEquipConsum = {
				{"曜阳九玄",3},
				{"精金",300},
			},
		},
		--下装
		[3] = {
			--装备表
			tEquipInfo = tArmIdInfo[3][5],
			--表结构
			tTableStructure = {"Route","Body"},
			--消耗表
			tEquipConsum = {
				{"曜阳九玄",2},
				{"精金",200},
			},
		},
		--武器
		[4] = {
			--装备表
			tEquipInfo = tWeaponIdInfo[5],
			tTableStructure = {"Route"},
			--消耗表
			tEquipConsum = {
				{"曜阳九玄",6},
				{"精金",600},
			},
		},
		--首饰
		[5] = {
			--装备表
			tEquipInfo = tRingIdInfo[5],
			--消耗表
			tEquipConsum = {
				{"曜阳九玄",3},
				{"精金",300},
			},
		},
	},
}
--=============根据装备发放阶段配置的材料和装备屏蔽表
function release_fobidden()
	--装备屏蔽
	for nEquipSeq,tEquipPosSeq in tReleaseForbiddenList["tEquip"] do
		tremove(tEquipSeriesName,nEquipSeq)
		tremove(tEquipSynthInfo,nEquipSeq)
		for _,nEquipPosSeq in tEquipPosSeq do
			tremove(tQuipMainInfo[nEquipSeq],nEquipPosSeq)
		end
	end
	--道具屏蔽

end
release_fobidden()
--=================
function OnUse(nItemIndex)
	local sItemName= get_item_info(nItemIndex)
	Say(SClew.."<color=green>"..sItemName.."<color>"..tMetiralInfo[sItemName][2]..format(",大侠想要使用<color=green>%s<color>做什么?",sItemName),
		5,
		"我要进行装备合成/#equip_chg_main("..nItemIndex..")",
		"我要查看装备合成配方/equip_chg_rule",
		"我要进行道具升级/#dia_metiral_chg_main("..nItemIndex..")",
		"我要查看道具升级配方/metiral_chg_rule",
		"退出/nothing"
	)
end
--装备兑换总表
function equip_chg_main(nItemIndex)
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",SClew.."未加入门派的玩家无法进行装备转换")-- 检查玩家是否已加入门派
		return
	end
	local tSay = {SClew.."请选择您想要转换的目标装备："}
	--直接列出来
	for nEuiqpSerial = 1,getn(tEquipSynthInfo) do
		for nEuipPos = 1,getn(tEquipSynthInfo[nEuiqpSerial]) do
			local bChkFlag = metiral_take_chk(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum)
			local bChkDetailFlag = 0
			for i = 1,getn(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum) do
				local sItemName= get_item_info(nItemIndex)
				if sItemName == tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum[i][1] then
					bChkDetailFlag = 1
					break
				end
			end
			if bChkFlag == 1 and bChkDetailFlag == 1 then
				local tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)
				if type(tEquipInfo[1]) =="string" then
					tinsert(tSay,"我要转换"..tEquipInfo[1].."/#equip_chg_dtm("..nEuiqpSerial..","..nEuipPos..")")
				else
					for i = 1,getn(tEquipInfo) do
						tinsert(tSay,"我要转换"..tEquipInfo[i][1].."/#equip_chg_dtm("..nEuiqpSerial..","..nEuipPos..","..i..")")
					end
				end
			end
		end
	end
	if getn(tSay) == 1 then
		tSay = {SClew.."材料或金钱不足! "}
		tinsert(tSay,"我要查看装备合成配方/equip_chg_rule")
	end
	tinsert(tSay,"退出/nothing")
	SelectSay(tSay)
end
function equip_chg_dtm(...)
	local nEuiqpSerial,nEuipPos,nDetailSeq = arg[1],arg[2],arg[3]
	local tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)
	if nDetailSeq then
		tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)[nDetailSeq]
	end
	local tSay = {}
	tSay[1] = SClew..format("合成<color=green>%s<color>需要以下材料：",tEquipInfo[1])
	--材料判断
	local nChkFlag,tChkResult = metiral_take_chk(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum)
	if nChkFlag ~= 1 then
		equip_chg_view(sItemName)
	else
		for i = 1,getn(tChkResult) do
			tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
		end
		tSay[1] = tSay[1].."\n确定要进行合成吗?"
		if  arg[3] then
			tinsert(tSay,"确定合成/#equip_chg_deal("..nEuiqpSerial..","..nEuipPos..","..nDetailSeq..")")
		else
			tinsert(tSay,"确定合成/#equip_chg_deal("..nEuiqpSerial..","..nEuipPos..")")
		end
		tinsert(tSay,"退出/nothing")
		SelectSay(tSay)
	end
end
--装备兑换转换
function equip_chg_deal(...)
	local nEuiqpSerial,nEuipPos,nDetailSeq = arg[1],arg[2],arg[3]
	local tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)
	if nDetailSeq then
		tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)[nDetailSeq]
	end
	item_chg_main(tEquipInfo[1],tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum,{tEquipInfo[2],tEquipInfo[3],tEquipInfo[4]})
end
--查看装备合成配方
function equip_chg_rule(...)
	local tSay = {SClew.."请选择要查看的装备系列："}
	for i = 1,getn(tEquipSeriesName) do
		tinsert(tSay,format("查看%s系列装备/#equip_series_sel(%d)",tEquipSeriesName[i],i))
	end
	tinsert(tSay,"退出/nothing")
	SelectSay(tSay)
end
--继续查看合成配方
function equip_series_sel(nEuiqpSerial)
	local tSay = {SClew..format("请选择%s系列的装备部位：",tEquipSeriesName[nEuiqpSerial])}
	for i = 1,getn(tEquipPosName) do
		tinsert(tSay,format("查看%s%s/#equip_chg_view(%d,%d)",tEquipSeriesName[nEuiqpSerial],tEquipPosName[i],nEuiqpSerial,i))
	end
	tinsert(tSay,"退出/nothing")
	SelectSay(tSay)
end
function equip_chg_view(nEuiqpSerial,nEuipPos)
	tSay = {SClew..format("%s%s的合成需要以下材料：",tEquipSeriesName[nEuiqpSerial],tEquipPosName[nEuipPos])}
	local nChkFlag,tChkResult = metiral_take_chk(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum)
	for i = 1,getn(tChkResult) do
		tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
	end
	tinsert(tSay,"退出/nothing")
	SelectSay(tSay)
end
--获取装备名称
function get_equip_info(tEquipInfo,tTableStructure,nStructureSeq)
	if tTableStructure == nil then
		return tEquipInfo
	end
	nStructureSeq = nStructureSeq or 1
	local sStructure = tTableStructure[nStructureSeq]
	if sStructure == "Route" then
		sStructure = GetPlayerRoute()
	elseif sStructure == "Sex" then
		sStructure = GetSex()
	elseif sStructure == "Body" then
		sStructure = GetBody()
	end
	if nStructureSeq == getn(tTableStructure) then
		return tEquipInfo[sStructure]
	else
		return get_equip_info(tEquipInfo[sStructure],tTableStructure,(nStructureSeq + 1))
	end
end
--===================道具升级处理
--道具升级处理
function dia_metiral_chg_main(nItemIndex)
	--背包空间判断
	if gf_Judge_Room_Weight(3, 1) ~= 1 then
		return 0;
	end
	local tSay = {SClew.."请选择需要升级的道具."}
	local sMetrialName= get_item_info(nItemIndex)
	for sItemName,tIntemInfo in tItemSynthInfo do
		for i = 1,getn(tIntemInfo[1]) do
			if sMetrialName == tIntemInfo[1][i][1] and (tReleaseForbiddenList["tMetiral"][sItemName] ~= 1 )then
				tinsert(tSay,format("我需要升级%s/#say_metiral_chg_sel(\"%s\")",sItemName,sItemName))
			end
		end
	end
	if sMetrialName == "星纹碎片" then
		tinsert(tSay,"我需要升级皓月玄金/haonguyethk")
	elseif sMetrialName == "五行玄石" then
		tinsert(tSay,"我需要升级五行玄金/nguhanhhk")
	end
	
	if getn(tSay) == 1 then
		Talk(1,"",SClew.."<color=green>"..sMetrialName.."<color>暂时不能升级!")
		return
	else
		tinsert(tSay,"退出/nothing")
		SelectSay(tSay)
	end
end
function say_metiral_chg_sel(sItemName)
	--材料判断
	local nChgNum = metiral_chg_num(sItemName)
	if nChgNum == 1 then
		metiral_chg_dtm(sItemName,nChgNum)
	elseif nChgNum > 1 then
		SetTaskTemp(nTaskTempId_Item_HashCode,Hash(sItemName))
		AskClientForNumber("metiral_chg_num_enter",1,nChgNum,format("转换%s数量",sItemName))
	else
		metiral_chg_view(sItemName)
	end
end
--材料数量输入
function metiral_chg_num_enter(nChgNum)
	if nChgNum <= 0 then return end
	local sItemName = get_hash_itemname(tItemSynthInfo)
	if sItemName == nil then
		return
	else
		metiral_chg_dtm(sItemName,nChgNum)
	end
end
--材料升级确认展开
function metiral_chg_dtm(sItemName,nChgNum)
	nChgNum = nChgNum or 1
	local tSay = {}
	if nChgNum == 1 then
		tSay[1] = SClew..format("升级<color=green>%s<color>需要以下材料:",sItemName)
	else
		tSay[1] = SClew..format("升级<color=green>%s<color>x<color=green>%d<color>需要以下材料:",sItemName,nChgNum)
	end
	--材料判断
	local nChgNumChk = metiral_chg_num(sItemName)
	local nChkFlag,tChkResult = metiral_take_chk(tItemSynthInfo[sItemName][1],nChgNum)
	if nChgNum > nChgNumChk or nChkFlag ~= 1 then
		metiral_chg_view(sItemName,nChgNum)
	else
		for i = 1,getn(tChkResult) do
			tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
		end
		tSay[1] = tSay[1].."\n确定要进行转换吗?"
		tinsert(tSay,"确定/#metiral_chg_main(\""..sItemName.."\","..nChgNum..")")
		tinsert(tSay,"退出/nothing")
		SelectSay(tSay)
	end
end
--材料兑换转换
function metiral_chg_main(sItemName,nChgNum)
	item_chg_main(sItemName,tItemSynthInfo[sItemName][1],tMetiralInfo[sItemName][1],nChgNum)
end
--兑换确认处理
function item_chg_main(sItemName,tConsumInfo,tPrizeInfo,nChgNum)
	nChgNum = nChgNum or 1
	local nChkFlag,tChkResult = metiral_take_chk(tConsumInfo,nChgNum)
	if nChkFlag ~= 1 then
		return
	else
		--背包空间判断
		if gf_Judge_Room_Weight(3, 1) ~= 1 then
			return 0;
		end
		--物品删除判断
		for i = 1,getn(tConsumInfo) do
			if tConsumInfo[i][1] == "精金" then
				if Pay(tConsumInfo[i][2]*10000*nChgNum) ~= 1 then
					return
				end
			else
				if DelItem(tMetiralInfo[tConsumInfo[i][1]][1][1],tMetiralInfo[tConsumInfo[i][1]][1][2],tMetiralInfo[tConsumInfo[i][1]][1][3],(tConsumInfo[i][2]*nChgNum)) ~= 1 then
					return
				end
			end
		end
		--物品增加处理
		if tPrizeInfo[1] == 2 then
			local bAddFlag = AddItem(tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],nChgNum)
		else
			local bAddFlag = AddItem(tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],nChgNum,1,-1,-1,-1,-1,-1,-1)
		end
	end
end
--===道具升级规则
function metiral_chg_rule()
	local tSay = {SClew.."请选择要查看的道具."}
	for sItemName,tIntemInfo in tItemSynthInfo do
		if (tReleaseForbiddenList["tMetiral"][sItemName] ~= 1 ) then
			tinsert(tSay,format("我要查看升级%s的材料/#metiral_chg_view(\"%s\")",sItemName,sItemName))
		end
	end
	tinsert(tSay,"退出/nothing")
	SelectSay(tSay)
end
--道具升级方法查看
function metiral_chg_view(sItemName,nChgNum)
	nChgNum = nChgNum or 1
	local sItemStory = SClew.."<color=green>"..sItemName.."<color>"
	if tMetiralInfo[sItemName][2] ~= nil and tMetiralInfo[sItemName][2] ~= "" then
		sItemStory = sItemStory..tMetiralInfo[sItemName][2]..","
	end
	local tSay = {sItemStory.."每个升级材料需要如下:"}
	--材料检测
	local nChkFlag,tChkResult = metiral_take_chk(tItemSynthInfo[sItemName][1],nChgNum)
	if nChkFlag == 1 then
		tinsert(tSay,"\n 我要升级"..sItemName.."/#say_metiral_chg_sel(\""..sItemName.."\")")
	end
	for i = 1,getn(tChkResult) do
		tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
		if tItemSynthInfo[sItemName][1][i][1] ~= nil and tItemSynthInfo[tItemSynthInfo[sItemName][1][i][1]] ~= nil then
			tinsert(tSay,"我要查看"..tItemSynthInfo[sItemName][1][i][1].."升级方法/#metiral_chg_view(\""..tItemSynthInfo[sItemName][1][i][1].."\")")
		end
	end
	tinsert(tSay,"返回/metiral_chg_rule")
	tinsert(tSay,"退出/nothing")
	SelectSay(tSay)
end
--材料足够检测
function metiral_take_chk(tConsumInfo,nChgNum)
	nChgNum = nChgNum or 1
	local nChkFlag = 1
	local tChkResult = {}
	for i = 1,getn(tConsumInfo) do
		local sMertiralName = tConsumInfo[i][1]
		if sMertiralName == "精金" then
			if floor(GetCash()/10000) < (tConsumInfo[i][2] * nChgNum) then
				nChkFlag = 0
				tinsert(tChkResult,{0,"<color=red>"..(tConsumInfo[i][2]*nChgNum)..sMertiralName.."<color>"})
			else
				tinsert(tChkResult,{1,"<color=green>"..(tConsumInfo[i][2]*nChgNum)..sMertiralName.."<color>"})
			end
		else
			if GetItemCount(tMetiralInfo[sMertiralName][1][1],tMetiralInfo[sMertiralName][1][2],tMetiralInfo[sMertiralName][1][3]) < (tConsumInfo[i][2] * nChgNum) then
				nChkFlag = 0
				tinsert(tChkResult,{0,"<color=red>"..sMertiralName.."x"..(tConsumInfo[i][2] * nChgNum).."<color>"})
			else
				tinsert(tChkResult,{1,"<color=green>"..sMertiralName.."x"..(tConsumInfo[i][2] * nChgNum).."<color>"})
			end
		end
	end
	return nChkFlag,tChkResult
end
--材料可兑换数量检测
function metiral_chg_num(sItemName)
	local nChgNum = 999999
	for i = 1,getn(tItemSynthInfo[sItemName][1]) do
		local sMertiralName = tItemSynthInfo[sItemName][1][i][1]
		if sMertiralName == "精金" then
			nChgNum = min(nChgNum,floor((GetCash()/10000)/tItemSynthInfo[sItemName][1][i][2]))
		else
			nChgNum = min(nChgNum,floor(GetItemCount(tMetiralInfo[sMertiralName][1][1],tMetiralInfo[sMertiralName][1][2],tMetiralInfo[sMertiralName][1][3]) /tItemSynthInfo[sItemName][1][i][2]))
		end
		if nChgNum == 0 then
			break
		end
	end
	return nChgNum
end
--获取hash码对应的物品名
function get_hash_itemname(tItemInfo)
	local nHashCode = GetTaskTemp(nTaskTempId_Item_HashCode)
	if nHashCode == 0 then
		return
	else
		for sItemName,_ in tItemInfo do
			if Hash(sItemName) == nHashCode then
				return sItemName
			end
		end
		return
	end
end
function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end
function nothing()
end

-- фi 皓月玄金
function haonguyethk()
		AskClientForNumber("ConfirmNumHNHK", 1, 100, "皓月")
end

function ConfirmNumHNHK(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    local ntotal = 100000 * nCount
   if GetItemCount(2,1,30300) < (3 * nCount ) or GetCash() < ntotal then
        Talk(1, "", "您没有足够的条件兑换"..nCount.." 皓月玄金");
        return 0;
   elseif  DelItem(2,1,30300, 3 * nCount) == 1 and Pay(ntotal) == 1 then 
        gf_AddItemEx2({2,1,	30301, nCount}, "皓月玄金", "NANG CAP ITEM", "兑换皓月玄金成功", 0, 1)
    end
end

-- фi 五行玄金
function nguhanhhk()
		AskClientForNumber("ConfirmNumNHHK", 1, 100, "五行")
end

function ConfirmNumNHHK(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    local ntotal = 100000 * nCount
   if GetItemCount(2,1,30303) < (3 * nCount ) or GetCash() < ntotal then
        Talk(1, "", "您没有足够的条件兑换"..nCount.." 五行玄金");
        return 0;
   elseif  DelItem(2,1,30303, 3 * nCount) == 1 and Pay(ntotal) == 1 then 
        gf_AddItemEx2({2,1,	30304, nCount}, "五行玄金", "NANG CAP ITEM", "兑换五行玄金成功", 0, 1)
    end
    
end