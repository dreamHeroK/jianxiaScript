--技能: 化蝶

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_cast_interval",{{1,64800},{2,59400},{3,48600},{4,43200},{5,37800},{6,32400},{7,27000},{8,21600},{9,16200},{10,5400}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_love_degree",{{1,500},{10,5000}}},
	{"cost_goods_id",{{1,66108},{10,66108}}},
	{"cost_goods_num",{{1,1},{2,1},{3,2},{4,2},{5,2},{6,3},{7,5},{8,8},{9,9},{10,10}}},
	{"cost_mana_percent",{{1,30},{10,30}}},
	},
	
	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"skill_missle_num",{{1,5},{2,10},{9,80},{10,100}}},
	{"skill_missle_waittime",{{1,60},{2,55},{3,45},{9,15},{10,5}}},
	},

	--魔法属性

	--属性值:	普通攻击力 * X + (1 + 技能等级 * Y) * (力量 * A + 根骨 * B + 身法 * C + 内功 * D + 洞察 * E)
	--			+ 武器外功攻击点 * F + Z
	--			(其中,A,B,C,D,E,F,X,Y,Z为伤害因素.除Z外,其余各伤害因素为百分比数.)

	--成功几率:	(属性值 * A + (自身等级 - 对方等级) * B + 技能等级 * C) * D + X
	--			(其中,A,B,C,D,X为几率因素.除X外,其余各几率因素为百分比数.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--技能等级相关伤害魔法属性
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	{magic="imme_revival",
	},
	{magic="imme_life_percent_add",
	damage_factor_z={{1,5},{2,10},{9,80},{10,100}},
	},
	{magic="imme_mana_percent_add",
	damage_factor_z={{1,5},{2,10},{9,80},{10,100}},
	},
	},
}
