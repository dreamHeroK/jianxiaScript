--技能: 五行战印幽冥

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,5},{20,5}}},
	{"skill_display_persist_time",{{1,5},{20,5}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
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
	{magic="state_baoji_point_add",
	damage_factor_z={{1,1000},{2,1100},{3,1200},{4,1300},{5,1400},{6,1500},{7,1600},{8,1700},{9,1800},{10,1900},{11,2000},{20,2000}},
	},
	{magic="state_baoji_damage_point_add",
	damage_factor_z={{1,2000},{2,2000},{3,2000},{4,2000},{5,2000},{6,2000},{7,2000},{8,2000},{9,2000},{10,2000},{11,2000},{20,2000}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
