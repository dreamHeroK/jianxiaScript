--技能: 驭尸术

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,28800},{16,28800}}},
	{"skill_display_persist_time",{{1,28800},{16,28800}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,10},{6,20},{16,30}}},
	{"cost_spirit",{{1,300},{16,300}}}
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
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	{magic="imme_npc_corpse_revival",
	probability_factor_b={{1,20},{16,20}},
	probability_factor_x={{1,100},{16,100}},
	},
	{magic="imme_summon_life_add",
	damage_factor_a={{1,600},{6,600},{16,700}},
	damage_factor_c={{1,1000},{6,1000},{16,1100}},
	damage_factor_z={{1,150},{6,400},{16,1400}},
	},
	{magic="imme_summon_attack_add",
	damage_factor_a={{1,240},{6,240},{16,280}},
	damage_factor_c={{1,330},{6,330},{16,400}},
	damage_factor_z={{1,300},{6,600},{16,700}},
	damage_factor_f={{1,75},{16,75}},
	},
	{magic="imme_summon_attack_rate_add",
	damage_factor_a={{1,150},{6,150},{16,180}},
	damage_factor_c={{1,180},{6,180},{16,220}},
	damage_factor_z={{1,150},{6,225},{16,725}},
	},
	{magic="imme_summon_dodge_add",
	damage_factor_a={{1,120},{6,120},{16,140}},
	damage_factor_c={{1,160},{6,160},{16,200}},
	damage_factor_z={{1,100},{6,300},{16,500}},
	},
	{magic="imme_summon_physical_defence_add",
	damage_factor_a={{1,15},{16,15}},
	damage_factor_c={{1,25},{16,25}},
	damage_factor_z={{1,50},{6,100},{16,100}},
	},
	{magic="imme_summon_magic_defence_add",
	damage_factor_a={{1,15},{16,15}},
	damage_factor_c={{1,25},{16,25}},
	damage_factor_z={{1,50},{6,100},{16,100}},
	},
	},
}
